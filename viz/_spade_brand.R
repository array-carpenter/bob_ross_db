# Shared Ray Carpenter spade-brand furniture for the bob_ross_db viz set.
# source() this from each chart script so the whole set stays consistent.

suppressPackageStartupMessages({
  library(showtext); library(sysfonts); library(magick); library(ggplot2); library(ggtext)
})

SPADE <- list(
  BG = "#DDEBEC", INK = "#333333", SUB = "#474746", CAP = "#888888",
  NAVY = "#2e2d88", GRID = "#c4d4d5", PANEL = "#eef3f3", PANEL_BORD = "#aab8b9",
  RULE = "#c0cccd",
  LOGO = "viz/assets/spade_logo.png"
)
CAPTION_FB <- "Ray Carpenter | TheSpade.Substack.com | @csv_enjoyer | data: yesyoucanpaint.com (The Joy of Painting, seasons 1-31)"

spade_fonts <- function() {
  # sysfonts only reads a ttc's first face, so the oblique lives in its own ttf if present
  obl <- "~/.local/share/extracted-fonts/Helvetica-Oblique.ttf"
  font_add("helvetica", "/System/Library/Fonts/Helvetica.ttc",
           bold   = "/System/Library/Fonts/Helvetica.ttc",
           italic = if (file.exists(obl)) obl else NULL)
  tryCatch(font_add_google("Newsreader", "newsreader"),
           error = function(e) font_add("newsreader",
             "/System/Library/Fonts/Supplemental/Times New Roman.ttf",
             bold = "/System/Library/Fonts/Supplemental/Times New Roman Bold.ttf"))
  tryCatch(font_add_google("Playfair Display", "playfair"),
           error = function(e) font_add("playfair", "/Library/Fonts/PlayfairDisplay-Regular.ttf"))
  showtext_auto(); showtext_opts(dpi = 300)
}

# Mint base theme. Title Case Playfair Display titles; body Helvetica.
theme_spade_mint <- function(base_size = 15) {
  theme_minimal(base_size = base_size, base_family = "helvetica") +
    theme(
      plot.background  = element_rect(fill = SPADE$BG, color = NA),
      panel.background = element_rect(fill = SPADE$BG, color = NA),
      text             = element_text(color = SPADE$INK),
      plot.title       = element_text(family = "playfair", face = "plain", size = 32,
                                      color = SPADE$INK, hjust = 0, margin = margin(b = 4)),
      plot.title.position = "plot",
      plot.subtitle    = element_markdown(family = "helvetica", size = 14, color = SPADE$SUB,
                                      lineheight = 1.25, margin = margin(b = 18)),
      plot.caption     = element_text(family = "helvetica", size = 11, color = SPADE$CAP,
                                      hjust = 0, margin = margin(t = 12)),
      plot.caption.position = "plot",
      plot.margin      = margin(20, 26, 16, 22)
    )
}

# Full-width header rule (absolute px from top, stable across heights) + spade crest
# composited top-right on the title's vertical midline.
spade_finish <- function(out, rule_y_px = 348, logo_frac = 0.072, logo_y_px = 30) {
  img <- image_read(out); info <- image_info(img)
  mL <- round(info$width * 0.018); mR <- round(info$width * 0.982)
  img <- image_draw(img)
  segments(mL, rule_y_px, mR, rule_y_px, col = SPADE$RULE, lwd = 2)
  dev.off()
  logo <- image_scale(image_trim(image_read(SPADE$LOGO)),
                      geometry_size_pixels(height = round(info$height * logo_frac)))
  li <- image_info(logo)
  image_write(image_composite(img, logo,
              offset = sprintf("+%d+%d", info$width - li$width - 28, logo_y_px)), out)
}
