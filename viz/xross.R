# xROSS by episode: how predictable each palette was, from analysis/xross.R.
# One dot per episode; the line is the season mean.

suppressPackageStartupMessages({
  library(dplyr); library(ggplot2); library(ggtext); library(ragg)
})

# run from the repo root after Rscript analysis/xross.R: Rscript viz/xross.R
source("viz/_spade_brand.R")
spade_fonts()

x <- readRDS("analysis/xross.rds")
ep <- x$episodes %>% mutate(idx = row_number())
fit <- x$fit

ACCENT <- "#C8553D"
season_mean <- ep %>% group_by(season) %>%
  summarise(xs = min(idx), xe = max(idx), m = mean(xross), .groups = "drop")
low <- ep %>% arrange(xross) %>% head(3)
low$lab <- c("\"Contemplative Lady\" (S16E6):\none paint, Van Dyke Brown",
             "\"Enchanted Falls Oval\" (S25E2):\n5 paints, 11.2 expected",
             "\"Sunlight in the Shadows\" (S27E10)")
low$hj <- c(1, 1, 1)
low$dx <- c(-8, -8, -8)
low$dy <- c(0, -0.04, 0.05)

sbreaks <- c(1, seq(5, 25, 5), 31)
sx <- (sbreaks - 1) * 13 + 7

p <- ggplot(ep, aes(idx, xross)) +
  geom_point(color = SPADE$NAVY, size = 1.9, alpha = 0.5) +
  geom_segment(data = season_mean, aes(x = xs, xend = xe, y = m, yend = m),
               inherit.aes = FALSE, color = SPADE$NAVY, linewidth = 1.6) +
  geom_point(data = low, shape = 21, size = 4.4, fill = NA, color = ACCENT, stroke = 1.1) +
  geom_text(data = low, aes(x = idx + dx, y = xross + dy, label = lab, hjust = hj), family = "helvetica",
            size = 4.2, color = ACCENT, lineheight = 1.1, vjust = 0.5) +
  scale_x_continuous(breaks = sx, labels = sbreaks, expand = expansion(add = c(4, 4))) +
  scale_y_continuous(breaks = seq(0.2, 1, 0.2), limits = c(0.18, 1), expand = expansion(add = 0.01)) +
  coord_cartesian(clip = "off") +
  labs(title = "How Expected Each Bob Ross Palette Was, 1983-1994",
       subtitle = paste0(
         "Each dot is one episode. xROSS is the geometric mean of the probabilities a model gave Bob Ross's",
         "<br>14 paint choices, from the subjects and the season (1 = fully expected). The line is the season mean."),
       x = "season", y = "xROSS",
       caption = paste0(
         sprintf("Ridge logistic model per paint, out-of-fold (5-fold). Mean log loss %.3f vs %.3f for season only and %.3f for a constant. Indian Red (1 episode) not modeled.\n",
                 mean(fit$logloss), mean(fit$logloss_season_only), mean(fit$logloss_constant)),
         sub(")$", "", CAPTION_FB), "); subjects: FiveThirtyEight")) +
  theme_spade_mint(base_size = 16) +
  theme(
    panel.grid.minor   = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = SPADE$GRID, linewidth = 0.3),
    axis.title.x = element_text(size = 13.5, color = SPADE$SUB, margin = margin(t = 8)),
    axis.title.y = element_text(size = 13.5, color = SPADE$SUB, margin = margin(r = 9)),
    axis.text    = element_text(size = 12, color = SPADE$SUB)
  )

out <- "viz/xross.png"
ggsave(out, p, width = 12.5, height = 7.8, dpi = 300, bg = SPADE$BG, device = ragg::agg_png)
spade_finish(out, rule_y_px = 360, logo_frac = 0.07, logo_y_px = 32)
cat("wrote", out, "\n")
