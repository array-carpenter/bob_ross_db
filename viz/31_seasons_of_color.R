# 31 Seasons of Color: each oil's season-by-season usage, painted in its own hex.
# Ray Carpenter spade brand: mint canvas, ALL-CAPS Newsreader title, Helvetica body.
# Brighter cell = that paint appeared in more of the season's 13 episodes.

suppressPackageStartupMessages({
  library(DBI); library(RSQLite); library(dplyr); library(ggplot2); library(ragg)
})
# run from the repo root: Rscript viz/31_seasons_of_color.R
source("viz/_spade_brand.R")
spade_fonts()

here   <- "."
outdir <- file.path(here, "viz")

con <- dbConnect(SQLite(), file.path(here, "bob_ross.db"))
raw <- dbGetQuery(con, "
  WITH per AS (
    SELECT e.season AS season, c.id AS cid, c.name AS name, c.hex AS hex,
           COUNT(DISTINCT e.id) AS eps
    FROM episodes e
    JOIN episode_colors ec ON ec.episode_id = e.id
    JOIN colors c          ON c.id = ec.color_id
    GROUP BY e.season, c.id),
  tot AS (SELECT cid, SUM(eps) AS total FROM per GROUP BY cid)
  SELECT p.season, p.name, p.hex, p.eps, t.total
  FROM per p JOIN tot t ON t.cid = p.cid;")
dbDisconnect(con)

eps_per_season <- 13; seasons <- 1:31
used <- raw %>% distinct(name, hex, total)
grid <- expand.grid(season = seasons, name = used$name, stringsAsFactors = FALSE) %>%
  left_join(used, by = "name") %>%
  left_join(raw %>% select(season, name, eps), by = c("season", "name")) %>%
  mutate(eps = coalesce(eps, 0L), frac = eps / eps_per_season)

ord <- used %>% arrange(desc(total)) %>% pull(name)
grid$name <- factor(grid$name, levels = rev(ord))

# blend a light mint base -> the paint's true hex by usage fraction
base_low <- "#e6eeee"
blend <- function(hex, f) {
  m <- colorRamp(c(base_low, hex))(pmin(pmax(f, 0), 1))
  rgb(m[,1], m[,2], m[,3], maxColorValue = 255)
}
grid$fill <- mapply(blend, grid$hex, grid$frac)

# pure-paint swatch strip at x = 0
swatch <- used %>% mutate(name = factor(name, levels = rev(ord)), season = 0L)
swatch$rim <- ifelse(toupper(swatch$hex) == "#FFFFFF", SPADE$INK, "#9aa6a7")

# lone Indian Red episode, S22E1
ir <- grid %>% filter(name == "Indian Red", season == 22)
ACCENT <- "#C8553D"

p <- ggplot(grid, aes(season, name)) +
  geom_tile(aes(fill = fill), color = SPADE$BG, linewidth = 0.5, width = 0.9, height = 0.84) +
  geom_tile(data = swatch, aes(x = season, y = name, fill = hex, color = rim),
            width = 0.9, height = 0.84, linewidth = 0.5) +
  scale_fill_identity() + scale_color_identity() +
  geom_tile(data = ir, aes(season, name), fill = NA, color = ACCENT,
            linewidth = 1.2, width = 0.9, height = 0.84) +
  annotate("richtext", x = 24.4, y = "Indian Red",
           label = "<b>one happy accident</b><br>its only episode, S22E1",
           family = "helvetica", size = 4.1, color = ACCENT, hjust = 0,
           fill = NA, label.color = NA, lineheight = 1.2) +
  annotate("curve", x = 24.2, y = which(levels(grid$name) == "Indian Red"),
           xend = 22.45, yend = which(levels(grid$name) == "Indian Red"),
           curvature = -0.25, color = ACCENT, linewidth = 0.5,
           arrow = arrow(length = unit(0.16, "cm"), type = "closed")) +
  scale_x_continuous(breaks = c(0, seq(1, 31, 2)),
                     labels = c("paint", as.character(seq(1, 31, 2))),
                     expand = expansion(add = c(0.6, 0.6))) +
  coord_cartesian(clip = "off") +
  labs(title = "Bob Ross Paint Use by Season, 1983-1994",
       subtitle = "Each row is one paint, in its own color. The stronger the color, the more of that season's<br>13 episodes used the paint.",
       x = "season", y = NULL, caption = CAPTION_FB) +
  theme_spade_mint(base_size = 16) +
  theme(
    panel.grid     = element_blank(),
    axis.title.x   = element_text(size = 13.5, color = SPADE$SUB, margin = margin(t = 8)),
    axis.text.x    = element_text(size = 12, color = SPADE$SUB),
    axis.text.y    = element_text(size = 13, color = SPADE$INK, hjust = 1),
    plot.margin    = margin(20, 30, 16, 22)
  )

out <- file.path(outdir, "31_seasons_of_color.png")
ggsave(out, p, width = 13, height = 8.5, dpi = 300, bg = SPADE$BG, device = ragg::agg_png)
spade_finish(out, rule_y_px = 360, logo_frac = 0.07, logo_y_px = 34)
cat("wrote", out, "\n")
