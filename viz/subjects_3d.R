# What Bob Ross painted (FiveThirtyEight subject tags), as the Spade 3D bar chart.
# Each bar is extruded in the paint Bob Ross leaned on hardest for that subject:
# the paint with the biggest lift over episodes without the subject.

suppressPackageStartupMessages({
  library(DBI); library(RSQLite)
  library(dplyr); library(purrr); library(tibble); library(ggplot2); library(ragg)
})

# run from the repo root: Rscript viz/subjects_3d.R
source("viz/_spade_brand.R")
source("viz/_subjects.R")
spade_fonts()
font_add("playfair", "/Users/raycarpenter/Code/nfl-assets/lingua/fonts/PlayfairDisplay-VariableFont_wght.ttf")

here   <- "."
db     <- file.path(here, "bob_ross.db")
outdir <- file.path(here, "viz")

SPADE_BG <- SPADE$BG; PANEL <- SPADE$PANEL; PANEL_BORD <- "#9aa6a7"
GRIDLN <- "#d4dcdc"; FLOOR <- "#c4cfd0"
SPADE_TEXT <- SPADE$INK; SPADE_MUTE <- SPADE$SUB

con <- dbConnect(SQLite(), db)
n_eps  <- dbGetQuery(con, "SELECT COUNT(*) AS n FROM episodes")$n
subj   <- load_subjects(con)
paints <- load_paints(con)
white  <- dbGetQuery(con, "SELECT hex FROM colors WHERE name = 'Titanium White'")$hex
dbDisconnect(con)

lean <- subject_paint_lift(subj, paints, n_eps) %>%
  filter(share >= 0.3, lift > 1.1) %>%
  group_by(subject) %>% slice_max(lift, n = 1, with_ties = FALSE) %>% ungroup() %>%
  select(subject, paint, hex)

df <- subj %>% count(subject, name = "eps") %>%
  mutate(n = round(100 * eps / n_eps)) %>%
  slice_max(eps, n = 12) %>%
  left_join(lean, by = "subject") %>%
  mutate(paint = coalesce(paint, "Titanium White"), hex = coalesce(hex, white),
         name = subject) %>%
  arrange(desc(eps)) %>%
  mutate(x = row_number())
print(select(df, subject, eps, n, paint))

# lit top / shadowed side mixed from each paint's own hex
shade <- function(hex, to, f) {
  m <- colorRamp(c(hex, to))(f)
  rgb(m[, 1], m[, 2], m[, 3], maxColorValue = 255)
}
df$lit  <- mapply(shade, df$hex, "#FFFFFF", 0.35)
df$dark <- mapply(shade, df$hex, "#000000", 0.35)
# a white bar needs a visible side on the white wall
df$dark[toupper(df$hex) == "#FFFFFF"] <- "#d9d4c8"

ymax  <- 100
ygrid <- seq(0, 100, by = 25)
depth_x <- 0.30; depth_y <- ymax * 0.045; half_w <- 0.28
x_lo <- min(df$x) - 0.6; x_hi <- max(df$x) + 0.6

make_bar_3d <- function(xc, h, id) bind_rows(
  tibble(face="side", bar_id=id, x=c(xc+half_w, xc+half_w+depth_x, xc+half_w+depth_x, xc+half_w),
         y=c(0, depth_y, h+depth_y, h)),
  tibble(face="top", bar_id=id, x=c(xc-half_w, xc+half_w, xc+half_w+depth_x, xc-half_w+depth_x),
         y=c(h, h, h+depth_y, h+depth_y)),
  tibble(face="front", bar_id=id, x=c(xc-half_w, xc+half_w, xc+half_w, xc-half_w),
         y=c(0, 0, h, h)))
polys <- pmap_dfr(list(df$x, df$n, df$x), function(s, h, i) make_bar_3d(s, h, paste0("b", i))) %>%
  left_join(df %>% transmute(bar_id = paste0("b", x), hex, lit, dark), by = "bar_id") %>%
  mutate(fill = case_when(face == "front" ~ hex, face == "top" ~ lit, TRUE ~ dark))

wall  <- tibble(x=c(x_lo+depth_x, x_hi+depth_x, x_hi+depth_x, x_lo+depth_x),
                y=c(depth_y, depth_y, ymax+depth_y, ymax+depth_y))
floor <- tibble(x=c(x_lo, x_hi, x_hi+depth_x, x_lo+depth_x), y=c(0, 0, depth_y, depth_y))
wgrid <- map_dfr(ygrid, ~tibble(x=x_lo+depth_x, xend=x_hi+depth_x, y=.x+depth_y, yend=.x+depth_y))

p <- ggplot() +
  geom_rect(aes(xmin=x_lo, xmax=x_hi+depth_x, ymin=0, ymax=ymax+depth_y),
            fill=PANEL, colour=PANEL_BORD, linewidth=0.5) +
  geom_polygon(data=wall, aes(x,y), fill="#ffffff", colour=PANEL_BORD, linewidth=0.4) +
  geom_polygon(data=floor, aes(x,y), fill=FLOOR, colour=PANEL_BORD, linewidth=0.4) +
  geom_segment(data=wgrid, aes(x=x, xend=xend, y=y, yend=yend), colour=GRIDLN, linewidth=0.4) +
  geom_text(data=tibble(y=ygrid), aes(x=x_lo-0.18, y=y, label=y), family="helvetica",
            size=3.4, colour=SPADE_MUTE, hjust=1) +
  geom_polygon(data=filter(polys, face=="side"), aes(x,y,group=bar_id, fill=fill), colour=SPADE_TEXT, linewidth=0.25) +
  geom_polygon(data=filter(polys, face=="top"),  aes(x,y,group=bar_id, fill=fill), colour=SPADE_TEXT, linewidth=0.25) +
  geom_polygon(data=filter(polys, face=="front"),aes(x,y,group=bar_id, fill=fill), colour=SPADE_TEXT, linewidth=0.30) +
  scale_fill_identity() +
  geom_text(data=df, aes(x=x+depth_x/2, y=n+depth_y+ymax*0.028, label=paste0(n, "%")), family="helvetica",
            fontface="bold", size=4.2, colour=SPADE_TEXT) +
  geom_text(data=df, aes(x=x+0.12, y=-ymax*0.035, label=name), family="helvetica",
            size=4.4, colour=SPADE_TEXT, angle=35, hjust=1) +
  geom_text(data=df, aes(x=x+0.12, y=-ymax*0.035 - 7, label=paint), family="helvetica",
            size=3.0, colour=SPADE_MUTE, angle=35, hjust=1) +
  annotate("text", x=x_lo-1.15, y=ymax/2, label="percent of episodes", angle=90, family="helvetica",
           size=3.6, colour=SPADE_MUTE) +
  coord_cartesian(xlim=c(x_lo-1.6, x_hi+depth_x+0.2), ylim=c(-ymax*0.36, ymax+depth_y),
                  clip="off", expand=FALSE) +
  labs(title="What Bob Ross Painted, 1983-1994",
       subtitle="Percent of the 403 episodes with each subject. Each bar is in the paint whose use rose most<br>with that subject, compared with episodes without it (gray label).",
       caption=paste0(sub(")$", "", CAPTION_FB), "); subjects: FiveThirtyEight\nBar paint: highest ratio of use with the subject to use without it, among paints in 30% or more of its episodes. White: no ratio above 1.1.")) +
  theme_void(base_size=14) +
  theme(plot.background=element_rect(fill=SPADE_BG, colour=NA),
        text=element_text(family="helvetica", colour=SPADE_TEXT),
        plot.title=element_text(family="playfair", face="plain", size=30, colour=SPADE_TEXT, hjust=0, margin=margin(b=4)),
        plot.subtitle=element_markdown(size=15, lineheight=1.3, colour=SPADE_MUTE, hjust=0, margin=margin(b=16)),
        plot.caption=element_text(size=10, colour="#888888", hjust=0, margin=margin(t=14)),
        plot.title.position="plot", plot.caption.position="plot", plot.margin=margin(20,25,18,25))

out <- file.path(outdir, "subjects_3d.png")
ggsave(out, p, width=13, height=8.5, dpi=300, bg=SPADE_BG)
img <- image_read(out); info <- image_info(img)
logo <- image_scale(image_trim(image_read(SPADE$LOGO)), geometry_size_pixels(height=round(info$height*0.075)))
li <- image_info(logo)
# y offset ~52px drops the logo to sit level with the title, not flush to the top edge
image_write(image_composite(img, logo, offset=sprintf("+%d+%d", info$width-li$width-30, 52)), out)
cat("wrote", out, "\n")
