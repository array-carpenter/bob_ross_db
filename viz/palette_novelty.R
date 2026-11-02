# Palette novelty across all 403 episodes.
# One dot per show: Jaccard distance to the closest palette Bob Ross had already
# used (0 = exact repeat). The line is a rolling season-length mean.

suppressPackageStartupMessages({
  library(dplyr); library(ggplot2); library(ggtext); library(ragg)
})

# run from the repo root: Rscript viz/palette_novelty.R
source("viz/_spade_brand.R")
spade_fonts()

here <- "."
ep <- readRDS(file.path(here, "analysis", "novelty.rds")) %>% filter(idx > 1)  # E1 is trivially "new"

ACCENT <- "#C8553D"
zero  <- ep %>% filter(nov == 0)
fresh <- ep %>% filter(nov > 0)

# season axis: label every fifth season at its midpoint
sbreaks <- c(1, seq(5, 25, 5), 31)
sx <- (sbreaks - 1) * 13 + 7

lady  <- ep %>% filter(title == "Contemplative Lady")
posy  <- ep %>% filter(title == "Pot O' Posies")

p <- ggplot() +
  # exact repeats sit on the floor
  geom_point(data = zero, aes(idx, nov), color = "#93abad", size = 1.3, alpha = 0.6) +
  geom_point(data = fresh, aes(idx, nov), color = SPADE$NAVY, size = 1.9, alpha = 0.55) +
  geom_line(data = ep %>% filter(!is.na(roll)), aes(idx, roll),
            color = SPADE$NAVY, linewidth = 1.4) +
  # season 7: Dark Sienna replaces Burnt Umber
  annotate("text", x = 116, y = 0.40, hjust = 0, family = "helvetica", size = 4.4,
           color = SPADE$INK, lineheight = 1.15,
           label = "Season 7: Dark Sienna replaces Burnt Umber;\n11 of 13 palettes are new") +
  annotate("curve", x = 113, y = 0.385, xend = 86, yend = 0.26, curvature = 0.25,
           color = SPADE$SUB, linewidth = 0.45,
           arrow = arrow(length = unit(0.16, "cm"), type = "closed")) +
  # two outliers
  annotate("point", x = lady$idx, y = lady$nov, shape = 21, size = 4.4,
           fill = NA, color = ACCENT, stroke = 1.1) +
  annotate("text", x = lady$idx + 10, y = lady$nov - 0.055, hjust = 0,
           family = "helvetica", size = 4.4, color = ACCENT, lineheight = 1.15,
           label = "\"Contemplative Lady\" (S16E6), a portrait:\nhighest novelty after the first episode (0.67)") +
  annotate("point", x = posy$idx, y = posy$nov, shape = 21, size = 4.4,
           fill = NA, color = ACCENT, stroke = 1.1) +
  annotate("text", x = posy$idx - 9, y = posy$nov + 0.045, hjust = 1,
           family = "helvetica", size = 4.4, color = ACCENT,
           label = "\"Pot O' Posies\" (S29E10)") +
  scale_x_continuous(breaks = sx, labels = sbreaks, expand = expansion(add = c(4, 4))) +
  scale_y_continuous(breaks = seq(0, 0.6, 0.2), limits = c(-0.015, 0.72),
                     expand = expansion(add = 0)) +
  coord_cartesian(clip = "off") +
  labs(title = "How New Each Bob Ross Palette Was, 1983-1994",
       subtitle = paste0(
         "Each dot is one episode. Novelty is the Jaccard distance from its paints to the closest earlier palette",
         "<br>(0 = exact repeat, 1 = no paints shared)."),
       x = "season", y = "palette novelty (0 = exact repeat)",
       caption = paste0("67% of the 403 episodes repeat an earlier palette exactly; 23 of the 26 in Seasons 30-31 do.\n", CAPTION_FB)) +
  theme_spade_mint(base_size = 16) +
  theme(
    panel.grid.minor   = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = SPADE$GRID, linewidth = 0.3),
    axis.title.x = element_text(size = 13.5, color = SPADE$SUB, margin = margin(t = 8)),
    axis.title.y = element_text(size = 13.5, color = SPADE$SUB, margin = margin(r = 9)),
    axis.text    = element_text(size = 12, color = SPADE$SUB)
  )

out <- file.path(here, "viz", "palette_novelty.png")
ggsave(out, p, width = 12.5, height = 7.8, dpi = 300, bg = SPADE$BG, device = ragg::agg_png)
spade_finish(out, rule_y_px = 360, logo_frac = 0.07, logo_y_px = 32)
cat("wrote", out, "\n")
