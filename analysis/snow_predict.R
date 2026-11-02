# "Can a simple model guess a snow scene from Bob Ross's palette alone?"
# Target: is the episode a winter/snow painting (from its title)?
# Models kept deliberately simple + explainable:
#   M0  base rate (always "not snow")
#   M1  logistic on a single "warm/green paint count" (0-6)  <- the explainable star
#   M2  depth-2 decision tree (rpart) -> plain-English rule
#   M3  logistic on 3 hand-picked paints (sanity ceiling)
# Stratified 5-fold CV, AUC computed by hand (Mann-Whitney). seed=42.

suppressPackageStartupMessages({
  library(DBI); library(RSQLite); library(dplyr); library(rpart)
})
set.seed(42)
# run from the repo root: Rscript analysis/snow_predict.R
here <- "."
con  <- dbConnect(SQLite(), file.path(here, "bob_ross.db"))
ep   <- dbGetQuery(con, "SELECT id, season, episode, title FROM episodes ORDER BY id;")
ec   <- dbGetQuery(con, "SELECT episode_id, color_id FROM episode_colors;")
cl   <- dbGetQuery(con, "SELECT id, name, hex FROM colors WHERE id IN (SELECT DISTINCT color_id FROM episode_colors);")
dbDisconnect(con)

# ---- palette matrix + target ----
M <- matrix(0L, nrow(ep), nrow(cl), dimnames = list(NULL, cl$name))
M[cbind(match(ec$episode_id, ep$id), match(ec$color_id, cl$id))] <- 1L
P <- as.data.frame(M); names(P) <- make.names(names(P))
ep$snow <- as.integer(grepl("Winter|Snow|Frost|Frozen|Christmas|Wintry", ep$title, ignore.case = TRUE))
cat(sprintf("episodes: %d | snow scenes: %d (%.1f%%)\n", nrow(ep), sum(ep$snow), 100*mean(ep$snow)))
cat(sprintf("base-rate accuracy (always 'not snow'): %.1f%%\n\n", 100*(1 - mean(ep$snow))))

# ---- the explainable feature: warm/green paint count ----
warm <- c("Sap.Green","Phthalo.Green","Cadmium.Yellow","Indian.Yellow","Yellow.Ochre","Bright.Red")
P$warm_count <- rowSums(P[, warm])
dat <- cbind(snow = ep$snow, P)

cat("snow rate by warm/green paint count:\n")
print(dat %>% group_by(warm_count) %>%
        summarise(n = n(), snow_eps = sum(snow), .groups = "drop") %>%
        mutate(snow_rate = sprintf("%.0f%%", 100 * snow_eps / n)), n = 20)

# ---- AUC by hand (Mann-Whitney U) ----
auc <- function(y, p) {
  r <- rank(p); n1 <- sum(y==1); n0 <- sum(y==0)
  (sum(r[y==1]) - n1*(n1+1)/2) / (n1*n0)
}

# ---- stratified 5-fold CV harness ----
make_folds <- function(y, k=5) {
  idx <- integer(length(y))
  for (cls in c(0,1)) { w <- which(y==cls); idx[w] <- sample(rep(1:k, length.out=length(w))) }
  idx
}
folds <- make_folds(dat$snow, 5)

cv_oof <- function(fit_fun, predict_fun) {
  oof <- numeric(nrow(dat))
  for (f in 1:5) {
    tr <- dat[folds!=f, ]; te <- dat[folds==f, ]
    m  <- fit_fun(tr); oof[folds==f] <- predict_fun(m, te)
  }
  oof
}

models <- list(
  "M1: logistic on warm/green count" = list(
    fit = function(tr) glm(snow ~ warm_count, binomial, tr),
    pred = function(m, te) predict(m, te, type="response")),
  "M2: depth-2 decision tree" = list(
    fit = function(tr) rpart(snow ~ Sap.Green+Phthalo.Green+Cadmium.Yellow+Indian.Yellow+
                               Yellow.Ochre+Bright.Red+Prussian.Blue+Phthalo.Blue+Midnight.Black+
                               Dark.Sienna+Van.Dyke.Brown+Alizarin.Crimson+Burnt.Umber,
                             tr, method="class", maxdepth=2, cp=0),
    pred = function(m, te) predict(m, te)[, "1"]),
  "M3: logistic on 3 paints" = list(
    fit = function(tr) glm(snow ~ Sap.Green + Cadmium.Yellow + Phthalo.Green, binomial, tr),
    pred = function(m, te) predict(m, te, type="response"))
)

cat("\n=== cross-validated performance (5-fold, stratified) ===\n")
oof_store <- list()
for (nm in names(models)) {
  oof <- cv_oof(models[[nm]]$fit, models[[nm]]$pred)
  oof_store[[nm]] <- oof
  pred_cls <- as.integer(oof >= 0.5)
  acc  <- mean(pred_cls == dat$snow)
  tp <- sum(pred_cls==1 & dat$snow==1); fp <- sum(pred_cls==1 & dat$snow==0)
  fn <- sum(pred_cls==0 & dat$snow==1)
  prec <- ifelse(tp+fp>0, tp/(tp+fp), NA); rec <- tp/(tp+fn)
  cat(sprintf("%-36s AUC=%.3f  acc=%.1f%%  precision=%.2f  recall=%.2f\n",
              nm, auc(dat$snow, oof), 100*acc, prec, rec))
}

# ---- fit final models on full data for interpretation/viz ----
m1 <- glm(snow ~ warm_count, binomial, dat)
cat("\n--- M1 odds ratio (per extra warm/green paint) ---\n")
cat(sprintf("OR = %.2f  (each warm/green paint multiplies snow odds by this)\n", exp(coef(m1)["warm_count"])))

m2 <- rpart(snow ~ Sap.Green+Phthalo.Green+Cadmium.Yellow+Indian.Yellow+Yellow.Ochre+Bright.Red+
              Prussian.Blue+Phthalo.Blue+Midnight.Black+Dark.Sienna+Van.Dyke.Brown+
              Alizarin.Crimson+Burnt.Umber, dat, method="class", maxdepth=2, cp=0)
cat("\n--- M2 decision tree rules (plain English) ---\n")
print(m2)

# save per-episode OOF preds (honest, held-out) for the viz
ep$warm_count <- P$warm_count
ep$p_snow_cv  <- oof_store[["M1: logistic on warm/green count"]]
saveRDS(list(ep=ep, m1=m1, m2=m2, dat=dat, oof=oof_store, auc=auc), file.path(here,"analysis","snow_model.rds"))
cat("\nsaved analysis/snow_model.rds\n")
