# Exploratory pass for two analyses before any viz:
#  (A) palette archetypes : k-medoids on Jaccard distance over the 403x15 matrix
#  (B) subject -> palette  : keyword-tag titles, test paint over/under-representation
# Print only. Decide viz design from what this shows.

suppressPackageStartupMessages({
  library(DBI); library(RSQLite)
  library(dplyr); library(tidyr); library(purrr)
  library(cluster); library(proxy)
})

# run from the repo root: Rscript analysis/explore.R
here <- "."
con  <- dbConnect(SQLite(), file.path(here, "bob_ross.db"))
ep   <- dbGetQuery(con, "SELECT id, season, episode, title FROM episodes ORDER BY id;")
ec   <- dbGetQuery(con, "SELECT episode_id, color_id FROM episode_colors;")
cl   <- dbGetQuery(con, "SELECT id, name, hex FROM colors;")
dbDisconnect(con)

# ---- build 403 x 15 binary presence matrix (used colors only) ----
used_ids <- sort(unique(ec$color_id))
cl <- cl %>% filter(id %in% used_ids)
M <- matrix(0L, nrow = nrow(ep), ncol = nrow(cl),
            dimnames = list(ep$id, cl$name))
M[cbind(match(ec$episode_id, ep$id), match(ec$color_id, cl$id))] <- 1L
cat("matrix:", nrow(M), "episodes x", ncol(M), "paints\n")
cat("paint prevalence (share of episodes):\n")
print(round(sort(colMeans(M), decreasing = TRUE), 3))

# near-constant paints carry no clustering signal
cat("\n--- prevalence flags (near-constant = poor discriminators) ---\n")
pv <- colMeans(M)
print(names(pv)[pv > 0.95])

# =====================================================================
# (A) PALETTE ARCHETYPES
# =====================================================================
cat("\n=========== (A) ARCHETYPES ===========\n")
# Jaccard distance over episodes (asymmetric binary: shared presence matters)
D <- proxy::dist(M, method = "Jaccard")
sil <- sapply(2:7, function(k) {
  pm <- pam(D, k = k, diss = TRUE)
  pm$silinfo$avg.width
})
names(sil) <- 2:7
cat("avg silhouette width by k:\n"); print(round(sil, 3))

best_k <- as.integer(names(sil)[which.max(sil)])
cat("best k by silhouette:", best_k, "\n")

pm <- pam(D, k = best_k, diss = TRUE)
ep$cluster <- pm$clustering

# characterize each cluster: mean presence of each paint, vs overall
cat("\ncluster sizes:\n"); print(table(ep$cluster))
prof <- as.data.frame(M) %>% mutate(cluster = ep$cluster) %>%
  group_by(cluster) %>% summarise(across(everything(), mean), .groups = "drop")
overall <- colMeans(M)
cat("\nper-cluster paint presence minus overall (signature paints):\n")
for (k in seq_len(best_k)) {
  diff <- unlist(prof[prof$cluster == k, -1]) - overall
  diff <- sort(diff, decreasing = TRUE)
  cat(sprintf("\nCluster %d (n=%d):\n", k, sum(ep$cluster == k)))
  cat("  over: ", paste(sprintf("%s +%.2f", names(head(diff,4)), head(diff,4)), collapse=" | "), "\n")
  cat("  under:", paste(sprintf("%s %.2f", names(tail(diff,3)), tail(diff,3)), collapse=" | "), "\n")
}

# temporal confound check: cluster vs season
cat("\n--- cluster x season (are archetypes just eras?) ---\n")
print(table(cluster = ep$cluster, season = ep$season))
cat("\nmedian season per cluster:\n")
print(ep %>% group_by(cluster) %>% summarise(med_season = median(season),
        s_lo = min(season), s_hi = max(season), n = n()))

# =====================================================================
# (B) SUBJECT -> PALETTE
# =====================================================================
cat("\n\n=========== (B) SUBJECT -> PALETTE ===========\n")
subjects <- list(
  Mountain = "Mountain|Peak|Summit|Ridge",
  Winter   = "Winter|Snow|Frost|Frozen|Christmas|Wintry",
  Water    = "Lake|Sea|Ocean|River|Stream|Wave|Waterfall|Falls|Cove|Pond|Creek|Surf|Tide|Bay",
  Autumn   = "Autumn|Fall ",
  Forest   = "Forest|Wood|Tree|Grove|Pine|Aspen|Oak",
  Structure= "Cabin|Barn|House|Bridge|Mill|Church|Home|Lighthouse|Dock|Cottage|Farm",
  Meadow   = "Meadow|Field|Valley|Pasture|Prairie"
)
tag <- sapply(names(subjects), function(s) grepl(subjects[[s]], ep$title, ignore.case = TRUE))
colnames(tag) <- names(subjects)
cat("episodes per subject (multi-label, overlaps allowed):\n")
print(colSums(tag))
cat("episodes with no subject tag:", sum(rowSums(tag) == 0), "\n")

# for each subject x paint: lift = P(paint|subj)/P(paint), Fisher p, odds ratio
res <- list()
for (s in names(subjects)) {
  insub <- tag[, s] == 1
  if (sum(insub) < 12) next
  for (p in colnames(M)) {
    a <- sum(M[insub, p] == 1); b <- sum(insub) - a
    c <- sum(M[!insub, p] == 1); d <- sum(!insub) - c
    p_sub <- a / sum(insub); p_rest <- c / sum(!insub)
    lift  <- p_sub / mean(M[, p])
    ft <- fisher.test(matrix(c(a, b, c, d), 2))
    res[[length(res) + 1]] <- data.frame(
      subject = s, paint = p, n_sub = sum(insub),
      p_sub = round(p_sub, 3), p_rest = round(p_rest, 3),
      lift = round(lift, 2), OR = round(unname(ft$estimate), 2),
      p_val = ft$p.value)
  }
}
res <- bind_rows(res)
res$p_adj <- p.adjust(res$p_val, "BH")

cat("\nstrongest over-indexed (lift, BH p<0.10), excluding near-universal paints:\n")
res %>% filter(!paint %in% names(pv)[pv > 0.95], lift > 1) %>%
  arrange(p_adj) %>% head(20) %>% print(row.names = FALSE)

cat("\nstrongest under-indexed (avoided for subject, BH p<0.10):\n")
res %>% filter(!paint %in% names(pv)[pv > 0.95], lift < 1) %>%
  arrange(p_adj) %>% head(15) %>% print(row.names = FALSE)

saveRDS(list(M=M, ep=ep, cl=cl, tag=tag, res=res, pm=pm, sil=sil),
        file.path(here, "analysis", "explore.rds"))
cat("\nsaved analysis/explore.rds\n")
