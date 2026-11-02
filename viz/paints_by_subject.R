# Which paints go with which subjects: FiveThirtyEight's subject tags joined to
# the paint list. Each cell is blended toward the paint's own hex by how often
# Bob Ross used it on that subject; boxes flag paints he leaned on or left out.

suppressPackageStartupMessages({
  library(DBI); library(RSQLite); library(dplyr); library(tidyr); library(ggplot2); library(ragg)
})
# run from the repo root: Rscript viz/paints_by_subject.R
source("viz/_spade_brand.R")
source("viz/_subjects.R")
spade_fonts()
font_add("playfair", "/Users/raycarpenter/Code/nfl-assets/lingua/fonts/PlayfairDisplay-VariableFont_wght.ttf")

MORE <- "#01796F"
LESS <- "#FF3B29"
SHOWN <- c("Trees", "Clouds", "Mountains", "Lake", "River", "Snow", "Cabin",
           "Sun", "Waterfall", "Ocean", "Night")

con <- dbConnect(SQLite(), "bob_ross.db")
n_eps  <- dbGetQuery(con, "SELECT COUNT(*) AS n FROM episodes")$n
subj   <- load_subjects(con)
paints <- load_paints(con)
dbDisconnect(con)

lift <- subject_paint_lift(subj, paints, n_eps) %>% filter(subject %in% SHOWN)

paint_order <- paints %>% count(paint, sort = TRUE) %>% pull(paint)
n_by_subj <- lift %>% distinct(subject, n)
row_lab <- setNames(sprintf("%s (%d)", n_by_subj$subject, n_by_subj$n), n_by_subj$subject)

base_low <- "#eef3f3"
blend <- function(hex, f) {
  m <- colorRamp(c(base_low, hex))(pmin(pmax(f, 0), 1))
  rgb(m[, 1], m[, 2], m[, 3], maxColorValue = 255)
}
lum <- function(hex) {
  m <- col2rgb(hex) / 255
  0.2126 * m[1, ] + 0.7152 * m[2, ] + 0.0722 * m[3, ]
}

g <- lift %>%
  mutate(paint   = factor(paint, levels = paint_order),
         subject = factor(subject, levels = rev(SHOWN)),
         fill    = mapply(blend, hex, share),
         ink     = ifelse(lum(fill) < 0.5, "#FFFFFF", SPADE$INK),
         label   = sprintf("%.0f", 100 * share),
         flag    = case_when(lift >= 1.4 & share >= 0.2 ~ MORE,
                             lift <= 0.6 & other >= 0.2 ~ LESS,
                             TRUE ~ NA_character_))

p <- ggplot(g, aes(paint, subject)) +
  geom_tile(aes(fill = fill), color = SPADE$BG, linewidth = 0.8, width = 0.94, height = 0.9) +
  geom_tile(data = filter(g, !is.na(flag)), aes(color = flag), fill = NA,
            linewidth = 1.3, width = 0.86, height = 0.8) +
  geom_text(aes(label = label, color = ink), family = "helvetica", size = 4.4) +
  scale_fill_identity() + scale_color_identity() +
  scale_x_discrete(position = "top") +
  scale_y_discrete(labels = row_lab) +
  labs(
    title = "Paints Bob Ross Used by Subject, 1983-1994",
    subtitle = paste0(
      "Each number is the percent of a subject's episodes that used the paint.<br>",
      "<span style='color:", MORE, "'><b>Green box</b></span>: at least 1.4 times the paint's rate in other episodes. ",
      "<span style='color:", LESS, "'><b>Red box</b></span>: 0.6 times or less."),
    x = NULL, y = NULL,
    caption = paste0(sub(")$", "", CAPTION_FB),
                     "); subjects: FiveThirtyEight.\n(n) = episodes with the subject. Boxes also need a rate of 20% or more on the higher side.")) +
  theme_spade_mint(base_size = 18) +
  theme(
    plot.title   = element_text(family = "playfair", face = "plain", size = 34, color = SPADE$INK,
                                margin = margin(b = 6)),
    plot.subtitle = ggtext::element_markdown(family = "helvetica", size = 16, color = SPADE$SUB,
                                             lineheight = 1.3, margin = margin(b = 14)),
    plot.caption = element_text(size = 11),
    panel.grid   = element_blank(),
    axis.text.x.top = element_text(angle = 40, hjust = 0, vjust = 0, size = 14, color = SPADE$INK),
    axis.text.y  = element_text(size = 15, color = SPADE$INK)
  )

out <- "viz/paints_by_subject.png"
ggsave(out, p, width = 14, height = 10.5, dpi = 300, device = agg_png, bg = SPADE$BG)
img <- image_read(out); info <- image_info(img)
logo <- image_scale(image_trim(image_read(SPADE$LOGO)), geometry_size_pixels(height = 135 * 2))
li <- image_info(logo)
image_write(image_composite(img, logo, offset = sprintf("+%d+%d", info$width - li$width - 60, 40)), out)
cat("wrote", out, "\n")

lift %>% filter(subject %in% SHOWN) %>% arrange(desc(lift)) %>%
  filter(share >= 0.2 | other >= 0.2) %>%
  slice(c(1:6, (n() - 5):n())) %>%
  mutate(across(c(share, other, lift), ~ round(.x, 2))) %>%
  print()
