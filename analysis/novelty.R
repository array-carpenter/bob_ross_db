# Palette Novelty Index: how new was each episode's paint loadout?
# For every episode in air order: Jaccard distance to the CLOSEST palette
# Bob Ross had already used. 1 = never-seen loadout, 0 = exact repeat.
# The series is an exploration/exploitation curve across 403 episodes.

suppressPackageStartupMessages({
  library(DBI); library(RSQLite); library(dplyr)
})

# run from the repo root: Rscript analysis/novelty.R
here <- "."
con  <- dbConnect(SQLite(), file.path(here, "bob_ross.db"))
ep   <- dbGetQuery(con, "SELECT id, season, episode, title FROM episodes ORDER BY season, episode;")
ec   <- dbGetQuery(con, "SELECT episode_id, color_id FROM episode_colors;")
dbDisconnect(con)

pal <- split(ec$color_id, ec$episode_id)
jac <- function(a, b) 1 - length(intersect(a, b)) / length(union(a, b))

n   <- nrow(ep)
nov <- numeric(n); nov[1] <- 1        # E1 has nothing to repeat
for (i in 2:n) {
  p <- pal[[as.character(ep$id[i])]]
  nov[i] <- min(vapply(ep$id[1:(i - 1)],
                       function(j) jac(p, pal[[as.character(j)]]), 0))
}
ep <- ep %>% mutate(idx = row_number(), nov = nov)

# centered 13-episode (one season) rolling mean
ep$roll <- as.numeric(stats::filter(ep$nov, rep(1/13, 13), sides = 2))

cat("mean novelty by season:\n")
print(ep %>% group_by(season) %>%
        summarise(mean_nov = round(mean(nov), 3),
                  exact_repeats = sum(nov == 0), .groups = "drop"), n = 31)

cat("\nexact-repeat share overall:", sprintf("%.0f%%", 100 * mean(ep$nov == 0)), "\n")
cat("exact-repeat share, seasons 30-31:",
    sprintf("%d of %d\n", sum(ep$nov == 0 & ep$season >= 30), sum(ep$season >= 30)))

cat("\nmost novel palettes after season 10:\n")
print(ep %>% filter(season > 10) %>% arrange(desc(nov)) %>% head(6) %>%
        select(season, episode, title, nov))

saveRDS(ep, file.path(here, "analysis", "novelty.rds"))
cat("\nsaved analysis/novelty.rds\n")
