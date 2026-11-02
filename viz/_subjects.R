# Subject groups built from the FiveThirtyEight tags, plus each episode's paints.
# FiveThirtyEight splits some subjects (tree/trees/conifer/...); these roll them up.

SUBJECT_GROUPS <- list(
  "Trees"     = c("tree", "trees", "conifer", "deciduous", "palm_trees"),
  "Clouds"    = "clouds",
  "Mountains" = c("mountain", "mountains", "snowy_mountain"),
  "Lake"      = c("lake", "lakes"),
  "Grass"     = "grass",
  "River"     = "river",
  "Bushes"    = "bushes",
  "Buildings" = "structure",
  "Rocks"     = "rocks",
  "Snow"      = "snow",
  "Cabin"     = "cabin",
  "Path"      = "path",
  "Sun"       = "sun",
  "Waterfall" = "waterfall",
  "Ocean"     = "ocean",
  "Night"     = "night"
)

load_subjects <- function(con) {
  el <- dbGetQuery(con, "
    SELECT ee.episode_id, el.name
    FROM episode_elements ee JOIN elements el ON el.id = ee.element_id")
  lookup <- stack(SUBJECT_GROUPS)
  names(lookup) <- c("name", "subject")
  el %>%
    inner_join(lookup, by = "name") %>%
    distinct(episode_id, subject) %>%
    mutate(subject = as.character(subject))
}

load_paints <- function(con) {
  dbGetQuery(con, "
    SELECT ec.episode_id, c.name AS paint, c.hex
    FROM episode_colors ec JOIN colors c ON c.id = ec.color_id")
}

# share of a subject's episodes that use each paint, against the episodes without it
subject_paint_lift <- function(subj, paints, n_eps) {
  n_sub <- count(subj, subject, name = "n")
  tot   <- count(paints, paint, hex, name = "tot")
  subj %>%
    inner_join(paints, by = "episode_id", relationship = "many-to-many") %>%
    count(subject, paint, name = "k") %>%
    right_join(tidyr::crossing(n_sub, tot), by = c("subject", "paint")) %>%
    mutate(k = coalesce(k, 0L),
           share = k / n,
           other = (tot - k) / (n_eps - n),
           lift  = share / other)
}
