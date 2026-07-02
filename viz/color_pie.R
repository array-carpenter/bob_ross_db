# Every color Bob Ross used, and how often. Pie in his own palette,
# Ray Carpenter brand: mint canvas, Newsreader title, Helvetica body.
# Each slice is one paint, sized by its share of all paint applications,
# filled with that paint's real oil hex.

suppressPackageStartupMessages({
  library(DBI); library(RSQLite)
  library(dplyr); library(ggplot2)
  library(showtext); library(sysfonts); library(ragg); library(ggrepel)
})

# run from the repo root: Rscript viz/color_pie.R
here   <- "."
db     <- file.path(here, "bob_ross.db")
outdir <- file.path(here, "viz"); dir.create(outdir, showWarnings = FALSE)

title_family <- "newsreader"; body_family <- "helvetica"
font_add(body_family, "/System/Library/Fonts/Helvetica.ttc",
         bold = "/System/Library/Fonts/Helvetica.ttc")
tryCatch(font_add_google("Newsreader", title_family),
         error = function(e) font_add(title_family,
           "/System/Library/Fonts/Supplemental/Times New Roman.ttf",
           bold = "/System/Library/Fonts/Supplemental/Times New Roman Bold.ttf"))
showtext_auto(); showtext_opts(dpi = 300)

con <- dbConnect(SQLite(), db)
d <- dbGetQuery(con, "
  SELECT c.name, c.hex, COUNT(*) AS uses
  FROM episode_colors ec JOIN colors c ON c.id = ec.color_id
  GROUP BY c.id ORDER BY uses DESC;")
dbDisconnect(con)

total <- sum(d$uses)
d <- d %>%
  mutate(pct   = uses / total,
         name  = factor(name, levels = name)) %>%          # keep frequency order
  arrange(desc(uses)) %>%
  mutate(ymax  = cumsum(pct),
         ymin  = lag(ymax, default = 0),
         ymid  = (ymin + ymax) / 2,
         ang   = 2 * pi * ymid,                            # 0 = 12 o'clock, clockwise
         side  = ifelse(ang <= pi, 1, -1),                 # right vs left half
         lab   = ifelse(uses == 1, sprintf("%s  1 episode", name),
                        sprintf("%s  %.1f%%", name, 100 * pct)))

BG  <- "#DDEBEC"; INK <- "#333333"
SUB <- "#474746"; CAP <- "#888888"; LEAD <- "#999999"

# percent text inside slices: dark on the light paints, white elsewhere
d$ink <- ifelse(d$name %in% c("Titanium White", "Cadmium Yellow", "Yellow Ochre",
                              "Indian Yellow"), INK, "white")
# white paint needs a soft rim to read against the mint
d$edge <- ifelse(toupper(d$hex) == "#FFFFFF", "#b3c5c6", BG)

r_out <- 1.0; r_lab <- 1.07

# build each slice as a filled wedge polygon (cartesian, 0 = 12 o'clock, clockwise)
wedge <- function(i) {
  a <- seq(2 * pi * d$ymin[i], 2 * pi * d$ymax[i], length.out = 80)
  data.frame(slice = i, hex = d$hex[i], edge = d$edge[i],
             x = c(0, r_out * sin(a)), y = c(0, r_out * cos(a)))
}
polys <- do.call(rbind, lapply(seq_len(nrow(d)), wedge))

# anchor each label on its slice's outer edge; repel handles collisions
d <- d %>% mutate(
  lx0 = r_out * sin(ang), ly0 = r_out * cos(ang),
  nx  = 0.45 * sin(ang),  ny = 0.45 * cos(ang))   # nudge outward, away from center

p <- ggplot() +
  geom_polygon(data = polys, aes(x, y, group = slice, fill = hex, color = edge),
               linewidth = 0.8) +
  scale_fill_identity() +
  # percent label inside the larger slices
  geom_text(data = filter(d, pct >= 0.03),
            aes(x = 0.62 * r_out * sin(ang), y = 0.62 * r_out * cos(ang),
                label = sprintf("%.1f%%", 100 * pct), color = ink),
            family = body_family, fontface = "bold", size = 4.6) +
  scale_color_identity() +
  # outside name labels with leader lines; repel keeps the small slices legible
  geom_text_repel(data = d, aes(x = lx0, y = ly0, label = lab),
                  family = body_family, size = 4.5, color = INK,
                  nudge_x = d$nx, nudge_y = d$ny, force = 1.2, max.overlaps = Inf,
                  segment.color = LEAD, segment.size = 0.3,
                  min.segment.length = 0, point.padding = 0, box.padding = 0.18,
                  seed = 7) +
  coord_fixed(xlim = c(-1.9, 1.9), ylim = c(-1.3, 1.35), clip = "off") +
  labs(
    title = "EVERY COLOR BOB ROSS USED",
    subtitle = "Share of all 4,108 paint applications across 403 episodes of The Joy of Painting.\nEach slice is the paint's own oil color.",
    caption = "Ray Carpenter | TheSpade.Substack.com | @csv_enjoyer | data: yesyoucanpaint.com (The Joy of Painting, seasons 1-31)"
  ) +
  theme_void(base_family = body_family) +
  theme(
    plot.background  = element_rect(fill = BG, color = NA),
    plot.title       = element_text(family = title_family, face = "bold", size = 38,
                                    color = INK, hjust = 0, margin = margin(t = 6, b = 4)),
    plot.title.position = "plot",
    plot.subtitle    = element_text(size = 16, color = SUB, hjust = 0,
                                    lineheight = 1.05, margin = margin(b = 4)),
    plot.caption     = element_text(size = 13, color = CAP, hjust = 0,
                                    margin = margin(t = 8)),
    plot.caption.position = "plot",
    plot.margin      = margin(t = 16, r = 28, b = 14, l = 28)
  )

out <- file.path(outdir, "color_pie.png")
ggsave(out, p, width = 11, height = 10, dpi = 300, bg = BG, device = ragg::agg_png)
cat("wrote", out, "\n")
