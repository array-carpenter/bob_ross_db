# Paint Lifespans: when each oil joined and left Bob Ross's palette.
# One bar per paint, drawn in its real hex, from first to last appearance.
# Burnt Umber retires after Season 6; Dark Sienna takes its slot the next episode.

suppressPackageStartupMessages({
  library(DBI); library(RSQLite)
  library(dplyr); library(ggplot2)
  library(showtext); library(sysfonts); library(ragg)
})

# run from the repo root: Rscript viz/paint_lifespans.R
here   <- "."
db     <- file.path(here, "bob_ross.db")
outdir <- file.path(here, "viz"); dir.create(outdir, showWarnings = FALSE)

title_family <- "title"; body_family <- "body"
ok <- tryCatch({ font_add_google("Caveat", title_family)
                 font_add_google("Nunito", body_family); TRUE }, error = function(e) FALSE)
if (!ok) {
  font_add(title_family, "/System/Library/Fonts/Supplemental/Noteworthy.ttc")
  font_add(body_family,  "/System/Library/Fonts/Supplemental/Avenir Next.ttc")
}
font_add("playfair", "/Users/raycarpenter/Code/nfl-assets/lingua/fonts/PlayfairDisplay-VariableFont_wght.ttf")
showtext_auto(); showtext_opts(dpi = 300)

con <- dbConnect(SQLite(), db)
d <- dbGetQuery(con, "
  SELECT c.name, c.hex,
         MIN(e.season + (e.episode - 1) / 13.0) AS first,
         MAX(e.season + e.episode / 13.0)       AS last,
         COUNT(*) AS uses
  FROM colors c
  JOIN episode_colors ec ON ec.color_id = c.id
  JOIN episodes e        ON e.id = ec.episode_id
  GROUP BY c.id;")
dbDisconnect(con)

# debut order, earliest at top; ties broken by overall use
d <- d %>%
  arrange(first, desc(uses)) %>%
  mutate(y = n() - row_number() + 1,
         one_ep = uses == 1)

BG  <- "#F4ECDA"; INK <- "#3A2E22"
d$rim <- ifelse(toupper(d$hex) == "#FFFFFF", INK, d$hex)
bar_h <- 0.34

p <- ggplot() +
  # faint season grid
  geom_vline(xintercept = 1:32, color = "#E2D6BC", linewidth = 0.35) +
  # lifespan bars in each paint's real oil hex
  geom_rect(data = filter(d, !one_ep),
            aes(xmin = first, xmax = last, ymin = y - bar_h, ymax = y + bar_h,
                fill = hex, color = rim), linewidth = 0.4) +
  # Indian Red's single episode reads as a dab, not a bar
  geom_point(data = filter(d, one_ep),
             aes(x = (first + last) / 2, y = y, fill = hex),
             shape = 21, size = 5.5, color = INK, stroke = 0.6) +
  scale_fill_identity() + scale_color_identity() +
  # paint names hang off the left end of each bar
  geom_text(data = d, aes(x = first - 0.22, y = y, label = name),
            family = body_family, size = 4.9, color = INK, hjust = 1) +
  # episode counts off the right end
  geom_text(data = d, aes(x = last + ifelse(one_ep, 0.42, 0.22), y = y,
                          label = ifelse(one_ep, "1 episode", uses)),
            family = body_family, size = 4.3, color = "#8A795F", hjust = 0) +
  # the Burnt Umber -> Dark Sienna handoff
  annotate("text", x = 8.9, y = d$y[d$name == "Burnt Umber"] + 0.18,
           label = "Burnt Umber's last season is Season 6;\nDark Sienna starts in the next episode, S7E1",
           family = title_family, size = 5.6, color = "#6B4F2E",
           hjust = 0, lineheight = 0.8) +
  # the happy accident
  annotate("text", x = 23.1, y = d$y[d$name == "Indian Red"] - 0.72,
           label = "one happy accident: S22E1",
           family = title_family, size = 5.6, color = "#7A1F12", hjust = 0) +
  annotate("curve", x = 23.3, y = d$y[d$name == "Indian Red"] - 0.6,
           xend = 22.25, yend = d$y[d$name == "Indian Red"] - 0.18,
           curvature = -0.3, color = "#7A1F12", linewidth = 0.45,
           arrow = arrow(length = unit(0.16, "cm"), type = "closed")) +
  scale_x_continuous(breaks = seq(1, 31, 2), limits = c(-3.8, 34.4),
                     expand = expansion(add = c(0, 0))) +
  scale_y_continuous(expand = expansion(add = c(0.6, 0.7))) +
  coord_cartesian(clip = "off") +
  labs(
    title = "Bob Ross Paint Lifespans, 1983-1994",
    subtitle = "Each bar runs from a paint's first episode to its last, in the paint's own color.\nThe number is the count of episodes, out of 403, that used it.",
    x = "season",
    caption = "Ray Carpenter | TheSpade.Substack.com | @csv_enjoyer | data: yesyoucanpaint.com (The Joy of Painting, seasons 1-31)"
  ) +
  theme_minimal(base_size = 18, base_family = body_family) +
  theme(
    plot.background  = element_rect(fill = BG, color = NA),
    panel.background = element_rect(fill = BG, color = NA),
    panel.grid       = element_blank(),
    axis.text.y      = element_blank(),
    axis.title.y     = element_blank(),
    axis.title.x     = element_text(size = 17, color = "#5A4A38", margin = margin(t = 6)),
    axis.text.x      = element_text(size = 14, color = "#5A4A38"),
    text             = element_text(color = INK),
    plot.title       = element_text(family = "playfair", size = 40, color = "#2B2118",
                                    hjust = 0, margin = margin(b = 2)),
    plot.title.position = "plot",
    plot.subtitle    = element_text(size = 16, color = "#5A4A38", lineheight = 1.05,
                                    margin = margin(b = 14)),
    plot.caption     = element_text(size = 13, color = "#8A795F", hjust = 0,
                                    margin = margin(t = 12)),
    plot.caption.position = "plot",
    plot.margin      = margin(t = 22, r = 26, b = 18, l = 14)
  )

out <- file.path(outdir, "paint_lifespans.png")
ggsave(out, p, width = 13, height = 8.5, dpi = 300, bg = BG, device = ragg::agg_png)
cat("wrote", out, "\n")
