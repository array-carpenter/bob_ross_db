# "Guessing snow from Bob Ross's palette": one explainable logistic feature.
# Rebuilt to Ray Carpenter spade brand: mint canvas, ALL-CAPS Newsreader title,
# Helvetica body, direct labels (no collisions), a dedicated paint-key band,
# full-width header rule + spade logo composited via magick.

suppressPackageStartupMessages({
  library(dplyr); library(ggplot2); library(patchwork); library(ragg)
})

# run from the repo root: Rscript viz/snow_from_palette.R
source("viz/_spade_brand.R")
spade_fonts()

here <- "."
S <- readRDS(file.path(here, "analysis", "snow_model.rds"))
ep <- S$ep; m1 <- S$m1

BG <- SPADE$BG; INK <- SPADE$INK; SUB <- SPADE$SUB; CAP <- SPADE$CAP
NAVY <- SPADE$NAVY; GRID <- SPADE$GRID; PANEL <- SPADE$PANEL; PANEL_BORD <- SPADE$PANEL_BORD

# ---- data: observed snow rate at each warm/green count + fitted curve ----
obs <- ep %>% group_by(warm_count) %>%
  summarise(n = n(), k = sum(snow), .groups = "drop") %>% mutate(rate = k / n)
gx    <- seq(0, 6, 0.02)
curve <- data.frame(warm_count = gx,
                    p = predict(m1, data.frame(warm_count = gx), type = "response"))

rule_md <- paste0(
  "<b style='font-size:15pt'>Two-paint rule (depth-2 tree)</b><br>",
  "<span style='font-size:13pt'>No Cadmium Yellow and no Sap Green on the<br>",
  "palette: 70% of those episodes are snow scenes.</span>")

# ============================ main panel ============================
main <- ggplot() +
  geom_line(data = curve, aes(warm_count, p), color = NAVY, linewidth = 1.5) +
  geom_point(data = obs, aes(warm_count, rate, size = n),
             shape = 21, fill = "white", color = NAVY, stroke = 1.4) +
  geom_text(data = obs, aes(warm_count, rate, label = sprintf("%.0f%%", 100*rate)),
            family = "helvetica", fontface = "bold", size = 4.6, color = INK,
            nudge_y = 0.085) +
  scale_size_area(max_size = 10, guide = "none") +
  ggtext::geom_richtext(aes(x = 3.15, y = 0.80, label = rule_md), hjust = 0, vjust = 1,
            family = "helvetica", color = INK, lineheight = 1.3,
            fill = PANEL, label.color = PANEL_BORD,
            label.padding = unit(c(8, 10, 8, 10), "pt"), label.r = unit(3, "pt")) +
  scale_x_continuous(breaks = 0:6, expand = expansion(add = c(0.35, 0.35))) +
  scale_y_continuous(labels = function(v) paste0(v*100, "%"),
                     breaks = seq(0, 1, 0.25), expand = expansion(add = c(0.04, 0.05))) +
  coord_cartesian(ylim = c(0, 1), clip = "off") +
  labs(x = "number of warm or green paints on the palette",
       y = "chance the painting is a snow scene") +
  theme_minimal(base_size = 15, base_family = "helvetica") +
  theme(
    plot.background  = element_rect(fill = BG, color = NA),
    panel.background = element_rect(fill = BG, color = NA),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = GRID, linewidth = 0.3),
    axis.title.x = element_text(size = 13.5, color = SUB, margin = margin(t = 9)),
    axis.title.y = element_text(size = 13.5, color = SUB, margin = margin(r = 9)),
    axis.text    = element_text(size = 12, color = SUB),
    plot.margin  = margin(4, 10, 2, 2)
  )

# ============================ paint-key band ============================
warm_paints <- tibble::tribble(
  ~name,            ~hex,
  "Sap Green",      "#507D2A",
  "Phthalo Green",  "#102E3C",
  "Cadmium Yellow", "#FFEC00",
  "Indian Yellow",  "#FFB800",
  "Yellow Ochre",   "#C79B00",
  "Bright Red",     "#DB0000") %>%
  mutate(x = seq_len(6))

chip_x <- seq(3.45, 10.05, length.out = 6)
key <- ggplot(warm_paints) +
  annotate("text", x = 0.2, y = 1, hjust = 0, label = "The Six Warm and Green Paints",
           family = "playfair", fontface = "plain", size = 4.4, color = INK) +
  geom_point(aes(chip_x[x], 1, fill = hex), shape = 22, size = 6.6, color = "#9aa6a7", stroke = 0.4) +
  geom_text(aes(chip_x[x], 0.30, label = name), family = "helvetica", size = 3.3, color = SUB) +
  scale_fill_identity() +
  scale_x_continuous(limits = c(0, 10.6), expand = c(0, 0)) +
  scale_y_continuous(limits = c(0, 1.5), expand = c(0, 0)) +
  theme_void() +
  theme(plot.background = element_rect(fill = BG, color = NA),
        plot.margin = margin(2, 10, 0, 2))

# ============================ compose ============================
p <- main / key +
  plot_layout(heights = c(1, 0.17)) +
  plot_annotation(
    title = "Guessing a Bob Ross Snow Scene From His Palette",
    subtitle = "The share of snow scenes falls as the count of warm and green paints rises.<br>Logistic model with one input: that count.",
    caption = paste0("Snow scene = title with Winter, Snow, Frost, Frozen, Christmas or Wintry (55 of 403 episodes). Cross-validated AUC 0.90 (stratified 5-fold).\n", CAPTION_FB),
    theme = theme(
      plot.background = element_rect(fill = BG, color = NA),
      plot.title    = element_text(family = "playfair", face = "plain", size = 30,
                                   color = INK, hjust = 0, margin = margin(b = 4)),
      plot.subtitle = ggtext::element_markdown(family = "helvetica", size = 14, color = SUB,
                                   margin = margin(b = 20)),
      plot.caption  = element_text(family = "helvetica", size = 11, color = CAP,
                                   hjust = 0, margin = margin(t = 12)),
      plot.margin   = margin(20, 26, 16, 22)
    ))

out <- file.path(here, "viz", "snow_from_palette.png")
ggsave(out, p, width = 12, height = 7.6, dpi = 300, bg = BG, device = ragg::agg_png)

# ---- header rule + logo via magick ----
img <- image_read(out); info <- image_info(img)
rule_y <- round(info$height * 0.150)
mL <- round(info$width * 0.018); mR <- round(info$width * 0.982)
img <- image_draw(img)
segments(mL, rule_y, mR, rule_y, col = SPADE$RULE, lwd = 2)
dev.off()
logo <- image_scale(image_trim(image_read(SPADE$LOGO)),
                    geometry_size_pixels(height = round(info$height * 0.072)))
li <- image_info(logo)
image_write(image_composite(img, logo, offset = sprintf("+%d+%d", info$width-li$width-28, 30)), out)
cat("wrote", out, "\n")
