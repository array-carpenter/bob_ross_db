# Every color Bob Ross used, and how often. Pie in his own palette,
# Ray Carpenter brand: mint canvas, Newsreader title, Helvetica body.
# Each slice is one paint, sized by its share of all paint applications,
# filled with that paint's real oil hex.

suppressPackageStartupMessages({
  library(DBI); library(RSQLite)
  library(dplyr); library(ggplot2); library(ragg)
})

# run from the repo root: Rscript viz/color_pie.R
source("viz/_spade_brand.R")
spade_fonts()

here   <- "."
db     <- file.path(here, "bob_ross.db")
outdir <- file.path(here, "viz"); dir.create(outdir, showWarnings = FALSE)

title_family <- "playfair"; body_family <- "helvetica"

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
         # big slices carry their % inside, so the outside label is just the name
         lab   = case_when(uses == 1  ~ sprintf("%s  1 episode", name),
                           pct >= 0.03 ~ as.character(name),
                           TRUE        ~ sprintf("%s  %.1f%%", name, 100 * pct)))

BG  <- SPADE$BG; INK <- SPADE$INK
SUB <- SPADE$SUB; CAP <- SPADE$CAP; LEAD <- "#999999"

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

# hand-placed radial anchors: fixed radius, hjust by side, no repel jitter
r_name <- 1.13
d <- d %>% mutate(
  lx = r_name * sin(ang),
  ly = r_name * cos(ang) * ifelse(cos(ang) < -0.9, 1.05, 1),  # extra room at 6 o'clock
  hj = case_when(sin(ang) >  0.25 ~ 0,
                 sin(ang) < -0.25 ~ 1,
                 TRUE             ~ 0.5))

# the three sliver slices at 12 o'clock get a fanned stack with leader lines
tiny <- d %>% filter(pct < 0.03) %>% arrange(ang) %>%
  mutate(lx = c(-0.98, -0.60, -0.20), ly = c(1.22, 1.32, 1.42), hj = 1,
         ex0 = 1.02 * sin(ang), ey0 = 1.02 * cos(ang))   # leader start on the rim
d <- d %>% rows_update(tiny %>% select(name, lx, ly, hj), by = "name")

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
  # leader lines out to the sliver labels
  geom_segment(data = tiny, aes(x = ex0, y = ey0, xend = lx + 0.03, yend = ly),
               color = LEAD, linewidth = 0.3) +
  geom_text(data = d, aes(x = lx, y = ly, label = lab, hjust = hj),
            family = body_family, size = 4.5, color = INK) +
  coord_fixed(xlim = c(-1.9, 1.9), ylim = c(-1.32, 1.5), clip = "off") +
  labs(
    title = "Every Color Bob Ross Used, 1983-1994",
    subtitle = "Each slice is one paint's share of all paint uses, in the paint's own color.",
    caption = "4,108 paint uses in 403 episodes.\nRay Carpenter | TheSpade.Substack.com | @csv_enjoyer | data: yesyoucanpaint.com (The Joy of Painting, seasons 1-31)"
  ) +
  theme_void(base_family = body_family) +
  theme(
    plot.background  = element_rect(fill = BG, color = NA),
    plot.title       = element_text(family = title_family, face = "plain", size = 36,
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
spade_finish(out, rule_y_px = 505, logo_frac = 0.06, logo_y_px = 42)
cat("wrote", out, "\n")
