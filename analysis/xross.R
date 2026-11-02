# xROSS: expected palette. For each paint, a ridge logistic model gives the
# chance Bob Ross puts it on the palette from the episode's subjects
# (FiveThirtyEight tags), its season (natural spline) and guest/frame flags.
# All predictions are out of fold (stratified-free 5-fold, seed 42).
#
#   xross_p      per episode x paint: predicted probability
#   POE          paints over expected = actual count - sum of xross_p
#   xROSS score  geometric mean of the probability given to each actual
#                yes/no choice over the 14 modeled paints (1 = fully expected)
#
# Indian Red (1 episode) is too rare to model; it gets the base rate 1/403.
# run from the repo root: Rscript analysis/xross.R

suppressPackageStartupMessages({
  library(DBI); library(RSQLite); library(dplyr); library(tidyr); library(splines)
})
source("viz/_subjects.R")

con <- dbConnect(SQLite(), "bob_ross.db")
eps <- dbGetQuery(con, "SELECT id AS episode_id, season, episode, title FROM episodes ORDER BY season, episode")
raw_el <- dbGetQuery(con, "
  SELECT ee.episode_id, el.name FROM episode_elements ee JOIN elements el ON el.id = ee.element_id")
subj <- load_subjects(con)
paints <- load_paints(con)
dbDisconnect(con)

flags <- raw_el %>%
  filter(name %in% c("guest", "framed", "winter", "portrait")) %>%
  mutate(v = 1L) %>% distinct() %>%
  pivot_wider(names_from = name, values_from = v, values_fill = 0L)
X_subj <- subj %>% mutate(v = 1L) %>%
  pivot_wider(names_from = subject, values_from = v, values_fill = 0L)

d <- eps %>%
  left_join(X_subj, by = "episode_id") %>%
  left_join(flags, by = "episode_id") %>%
  mutate(across(-c(episode_id, season, episode, title), ~ coalesce(.x, 0L)))

feat <- setdiff(names(d), c("episode_id", "season", "episode", "title"))
S <- ns(d$season, df = 4)
X <- cbind(as.matrix(d[feat]), S)
colnames(X) <- c(feat, paste0("season_ns", 1:4))
X <- scale(X)
X[is.nan(X)] <- 0

Y <- paints %>% mutate(v = 1L) %>% distinct(episode_id, paint, v) %>%
  pivot_wider(names_from = paint, values_from = v, values_fill = 0L)
Y <- d %>% select(episode_id) %>% left_join(Y, by = "episode_id") %>%
  mutate(across(-episode_id, ~ coalesce(.x, 0L)))
paint_names <- setdiff(names(Y), "episode_id")

ridge_logit <- function(X, y, lambda) {
  Xi <- cbind(1, X)
  nll <- function(b) {
    eta <- Xi %*% b
    -sum(y * eta - log1p(exp(eta))) + lambda * sum(b[-1]^2)
  }
  gr <- function(b) {
    p <- plogis(Xi %*% b)
    g <- -crossprod(Xi, y - p)
    g[-1] <- g[-1] + 2 * lambda * b[-1]
    g
  }
  b0 <- c(qlogis(min(max(mean(y), 0.01), 0.99)), rep(0, ncol(X)))
  optim(b0, nll, gr, method = "BFGS", control = list(maxit = 500))$par
}
pred <- function(b, X) as.vector(plogis(cbind(1, X) %*% b))
ll <- function(y, p) { p <- pmin(pmax(p, 1e-6), 1 - 1e-6); mean(-(y * log(p) + (1 - y) * log(1 - p))) }

set.seed(42)
fold <- sample(rep(1:5, length.out = nrow(d)))
lambdas <- c(0.3, 1, 3, 10, 30)

oof <- matrix(NA_real_, nrow(d), length(paint_names), dimnames = list(NULL, paint_names))
base <- oof
chosen <- setNames(rep(NA_real_, length(paint_names)), paint_names)
for (pn in paint_names) {
  y <- Y[[pn]]
  if (sum(y) < 5) {
    oof[, pn] <- base[, pn] <- 1 / nrow(d)
    next
  }
  # pick lambda by inner CV on the whole set, then score out of fold
  cv_loss <- sapply(lambdas, function(l) {
    p <- numeric(length(y))
    for (k in 1:5) {
      tr <- fold != k
      p[!tr] <- pred(ridge_logit(X[tr, ], y[tr], l), X[!tr, ])
    }
    ll(y, p)
  })
  chosen[pn] <- lambdas[which.min(cv_loss)]
  for (k in 1:5) {
    tr <- fold != k
    oof[!tr, pn] <- pred(ridge_logit(X[tr, ], y[tr], chosen[pn]), X[!tr, ])
    # baseline: season spline only
    base[!tr, pn] <- pred(ridge_logit(X[tr, grep("season_ns", colnames(X))], y[tr], 1),
                          X[!tr, grep("season_ns", colnames(X))])
  }
}

Ym <- as.matrix(Y[paint_names])
modeled <- names(chosen)[!is.na(chosen)]
auc <- function(y, p) {
  r <- rank(p); n1 <- sum(y); n0 <- length(y) - n1
  (sum(r[y == 1]) - n1 * (n1 + 1) / 2) / (n1 * n0)
}
fit <- tibble(
  paint = modeled,
  episodes = colSums(Ym[, modeled]),
  lambda = chosen[modeled],
  auc = sapply(modeled, function(p) auc(Ym[, p], oof[, p])),
  auc_season_only = sapply(modeled, function(p) auc(Ym[, p], base[, p])),
  logloss = sapply(modeled, function(p) ll(Ym[, p], oof[, p])),
  logloss_season_only = sapply(modeled, function(p) ll(Ym[, p], base[, p])),
  logloss_constant = sapply(modeled, function(p) ll(Ym[, p], rep(mean(Ym[, p]), nrow(Ym))))
)

p_choice <- ifelse(Ym == 1, oof, 1 - oof)[, modeled]
episodes <- d %>% select(episode_id, season, episode, title) %>%
  mutate(paints = rowSums(Ym),
         x_paints = rowSums(oof),
         poe = paints - x_paints,
         xross = exp(rowMeans(log(pmax(p_choice, 1e-6)))),
         xross_season_only = exp(rowMeans(log(pmax(ifelse(Ym == 1, base, 1 - base)[, modeled], 1e-6)))),
         most_surprising = apply(abs(Ym[, modeled] - oof[, modeled]), 1, function(r) modeled[which.max(r)]))

long <- as_tibble(oof) %>% mutate(episode_id = d$episode_id) %>%
  pivot_longer(-episode_id, names_to = "paint", values_to = "xross_p") %>%
  left_join(as_tibble(Ym) %>% mutate(episode_id = d$episode_id) %>%
              pivot_longer(-episode_id, names_to = "paint", values_to = "used"),
            by = c("episode_id", "paint"))

saveRDS(list(fit = fit, episodes = episodes, long = long), "analysis/xross.rds")

options(width = 140)
cat("\nPer-paint fit (out of fold):\n")
print(fit %>% mutate(across(where(is.double), ~ round(.x, 3))) %>% arrange(desc(auc)))
cat(sprintf("\nMean log loss: full %.3f | season only %.3f | constant %.3f\n",
            mean(fit$logloss), mean(fit$logloss_season_only), mean(fit$logloss_constant)))
cat(sprintf("Mean xROSS: %.3f (season-only model %.3f)\n", mean(episodes$xross), mean(episodes$xross_season_only)))
cat("\nLeast expected palettes:\n")
print(episodes %>% arrange(xross) %>% head(10) %>% mutate(across(where(is.double), ~ round(.x, 3))))
cat("\nMost paints over expected / under expected:\n")
print(episodes %>% arrange(desc(poe)) %>% head(5) %>% mutate(across(where(is.double), ~ round(.x, 2))))
print(episodes %>% arrange(poe) %>% head(5) %>% mutate(across(where(is.double), ~ round(.x, 2))))
cat("\nxROSS by season:\n")
print(episodes %>% group_by(season) %>% summarise(xross = round(mean(xross), 3), poe = round(mean(poe), 2)) %>% as.data.frame())
