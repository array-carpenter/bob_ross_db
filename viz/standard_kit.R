# The eight most-used palettes: Bob Ross used 133 distinct palettes across 403 episodes,
# but kept reaching for the same dozen paints. Top loadouts as rows of paint
# dabs, each dab in its real oil hex, sized by how many episodes used it.

suppressPackageStartupMessages({
  library(DBI); library(RSQLite)
  library(dplyr); library(tidyr); library(ggplot2)
  library(showtext); library(sysfonts); library(ragg)
})

# run from the repo root: Rscript viz/standard_kit.R
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
sigs <- dbGetQuery(con, "
  WITH sig AS (
    SELECT ec.episode_id,
           GROUP_CONCAT(ec.color_id) AS sig
    FROM (SELECT episode_id, color_id FROM episode_colors
          ORDER BY episode_id, color_id) ec
    GROUP BY ec.episode_id)
  SELECT s.sig, COUNT(*) AS n,
         MIN(e.season) AS s_min, MAX(e.season) AS s_max
  FROM sig s JOIN episodes e ON e.id = s.episode_id
  GROUP BY s.sig ORDER BY n DESC LIMIT 8;")
cols <- dbGetQuery(con, "
  SELECT c.id, c.name, c.hex, COUNT(*) AS uses
  FROM colors c JOIN episode_colors ec ON ec.color_id = c.id
  GROUP BY c.id ORDER BY uses DESC;")
dbDisconnect(con)

# columns: paints in overall-use order, most-used at left
cols$x <- seq_len(nrow(cols))

# rows: top palettes, most-used at top
sigs <- sigs %>%
  mutate(rank = row_number(), y = n() - rank + 1,
         n_paints = lengths(strsplit(sig, ",")),
         era = ifelse(s_min == s_max, sprintf("S%d", s_min),
                      sprintf("S%d-S%d", s_min, s_max)))

chips <- sigs %>%
  mutate(id = strsplit(sig, ",")) %>%
  unnest(id) %>%
  mutate(id = as.integer(id)) %>%
  left_join(cols, by = "id")

# full grid so absent paints show as faint empty dabs
grid_all <- crossing(y = sigs$y, x = cols$x) %>%
  left_join(sigs %>% select(y, rank), by = "y")

BG  <- "#F4ECDA"; INK <- "#3A2E22"
# white paint dabs need an ink rim to read on cream
chips$rim <- ifelse(toupper(chips$hex) == "#FFFFFF", INK, chips$hex)

x_lab <- max(cols$x) + 0.9   # where the counts column starts

p <- ggplot() +
  # faint empty dab where a paint sat the loadout out
  geom_point(data = grid_all, aes(x, y), shape = 21, size = 7.5,
             fill = NA, color = "#D8CCB2", stroke = 0.7) +
  # the paint dabs themselves, real oil hexes
  geom_point(data = chips, aes(x, y, fill = hex, color = rim),
             shape = 21, size = 7.5, stroke = 0.7) +
  scale_fill_identity() + scale_color_identity() +
  # episode count per loadout
  geom_text(data = sigs, aes(x = x_lab, y = y, label = n),
            family = body_family, fontface = "bold", size = 6.6,
            color = INK, hjust = 0) +
  geom_text(data = sigs, aes(x = x_lab + 1.05, y = y,
                             label = sprintf("episodes, %s", era)),
            family = body_family, size = 4.3, color = "#8A795F", hjust = 0) +
  # paint names across the top
  geom_text(data = cols, aes(x = x, y = max(sigs$y) + 0.62, label = name),
            family = body_family, size = 4.1, color = "#5A4A38",
            angle = 38, hjust = 0) +
  # callouts sit in the row gaps, never up in the column names
  annotate("text", x = 0.55, y = sigs$y[sigs$rank == 1] - 0.5,
           label = "the 12-paint palette: 66 of 403 episodes used exactly this set",
           family = title_family, size = 5.8, color = "#6B4F2E", hjust = 0) +
  annotate("text", x = 0.55, y = sigs$y[sigs$n_paints == 8][1] - 0.5,
           label = "Season 1's original eight",
           family = title_family, size = 5.8, color = "#6B4F2E", hjust = 0) +
  scale_y_continuous(expand = expansion(add = c(0.75, 1.9))) +
  scale_x_continuous(limits = c(0.4, x_lab + 4.4)) +
  coord_cartesian(clip = "off") +
  labs(
    title = "The Eight Palettes Bob Ross Used Most",
    subtitle = "Each row is one palette: the paints on it for a whole episode. Each dab is one paint, in its own color.",
    caption = "133 different palettes in 403 episodes.\nRay Carpenter | TheSpade.Substack.com | @csv_enjoyer | data: yesyoucanpaint.com (The Joy of Painting, seasons 1-31)"
  ) +
  theme_void(base_family = body_family) +
  theme(
    plot.background = element_rect(fill = BG, color = NA),
    plot.title      = element_text(family = "playfair", size = 40, color = "#2B2118",
                                   hjust = 0, margin = margin(b = 2)),
    plot.title.position = "plot",
    plot.subtitle   = element_text(size = 16, color = "#5A4A38", lineheight = 1.05,
                                   margin = margin(b = 4)),
    plot.caption    = element_text(size = 13, color = "#8A795F", hjust = 0,
                                   margin = margin(t = 12)),
    plot.caption.position = "plot",
    plot.margin     = margin(t = 22, r = 30, b = 18, l = 22)
  )

out <- file.path(outdir, "standard_kit.png")
ggsave(out, p, width = 13, height = 9, dpi = 300, bg = BG, device = ragg::agg_png)
cat("wrote", out, "\n")
