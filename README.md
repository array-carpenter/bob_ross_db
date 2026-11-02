# bob_ross_db

A SQLite database of every paint color Bob Ross used in each episode of
*The Joy of Painting*, with hex codes, plus what is in each painting (trees,
clouds, mountains, cabins) from FiveThirtyEight's subject tags.

## Layout

| File | Purpose |
|------|---------|
| `schema.sql` | Tables, indexes, and the `v_episode_palette` view |
| `colors.sql` | Canonical paint palette + hex codes |
| `data/season_NN.sql` | Episodes and color usage for one season |
| `data/fivethirtyeight/elements-by-episode.csv` | FiveThirtyEight's subject tags, unchanged ([source](https://github.com/fivethirtyeight/data/tree/master/bob-ross)) |
| `elements.sql` | Loads that CSV into `elements` / `episode_elements` |
| `build.sh` | Rebuilds `bob_ross.db` from the SQL files |
| `analysis/` | Palette clustering, subject/palette association, snow-scene model |
| `viz/` | Chart scripts (R) and rendered PNGs |

The `.db` is gitignored — rebuild it locally:

```bash
./build.sh
```

## Schema

- **colors** — `id`, `name` (unique), `hex` (validated `#RRGGBB`)
- **episodes** — `id`, `season`, `episode`, `title`, `youtube_url` (unique on `season, episode`)
- **episode_colors** — junction of `episode_id` ↔ `color_id`
- **v_episode_palette** — flattened view: season, episode, title, color, hex
- **elements** — `id`, `name`: the 67 FiveThirtyEight tags, lowercased (`tree`,
  `clouds`, `cabin`, frame types, guest painters, ...)
- **episode_elements** — junction of `episode_id` ↔ `element_id`
- **v_episode_elements** — flattened view: season, episode, title, element

## Example queries

```sql
-- Full palette for one episode
SELECT color, hex FROM v_episode_palette WHERE season = 1 AND episode = 1;

-- How many episodes each color appears in
SELECT c.name, c.hex, COUNT(*) AS episodes
FROM colors c JOIN episode_colors ec ON ec.color_id = c.id
GROUP BY c.id ORDER BY episodes DESC;

-- Episodes using the fewest colors
SELECT season, episode, title, COUNT(*) AS n_colors
FROM v_episode_palette GROUP BY season, episode ORDER BY n_colors;

-- Share of mountain paintings that use each paint
SELECT p.color, ROUND(100.0 * COUNT(*) / (
         SELECT COUNT(*) FROM v_episode_elements WHERE element = 'mountain'), 1) AS pct
FROM v_episode_palette p
JOIN v_episode_elements x USING (season, episode)
WHERE x.element = 'mountain'
GROUP BY p.color ORDER BY pct DESC;
```

## Analysis

Two scripts in `analysis/`, both run from the repo root after `./build.sh`:

- `explore.R` — k-medoids palette archetypes (Jaccard distance over the 403×15
  presence matrix) and subject→palette association from keyword-tagged titles
  (Fisher tests, BH-corrected). Three archetypes fall out: the early Burnt Umber
  palette (S1–6), the later standard kit, and a cross-era winter palette.
- `snow_predict.R` — can you guess a snow scene from the palette alone? A
  one-feature logistic (count of warm/green paints present) hits 0.90 AUC under
  stratified 5-fold CV. The depth-2 tree version: no Cadmium Yellow and no Sap
  Green → 70% chance it's a snow scene.

Each saves an `.rds` (gitignored) that the corresponding chart script reads.

## Charts

Scripts in `viz/`, run from the repo root (`Rscript viz/color_pie.R`).
`subjects_3d.R` and `paints_by_subject.R` use the FiveThirtyEight subject tags
(grouped in `viz/_subjects.R`, so `tree`, `trees`, `conifer`, ... count as one "Trees").

![Every color Bob Ross used](viz/color_pie.png)
![31 seasons of color](viz/31_seasons_of_color.png)
![Paint lifespans](viz/paint_lifespans.png)
![The standard kit](viz/standard_kit.png)
![Bob's fifteen paints, ranked](viz/color_frequency_3d.png)
![Guessing snow from Bob's palette](viz/snow_from_palette.png)
![What Bob Ross painted](viz/subjects_3d.png)
![Paints Bob Ross used by subject](viz/paints_by_subject.png)

## Adding a season

Create `data/season_NN.sql` following the Season 1 pattern (insert episodes, then
link colors by name), add any new colors to `colors.sql`, and re-run `./build.sh`.

## Color source

Hex codes follow the widely-used canonical Bob Ross palette
([Two Inch Brush](https://www.twoinchbrush.com/) / FiveThirtyEight reference set),
with two exceptions. That set lists Phthalo Blue as `#0C0040` and Sap Green as
`#0A3410`, which turn violet and kelly green once mixed with white. Both now use
the pigment values from Wikipedia: Phthalo Blue `#000F89`
([copper phthalocyanine](https://en.wikipedia.org/wiki/Copper_phthalocyanine))
and Sap Green `#507D2A` ([sap green](https://en.wikipedia.org/wiki/Shades_of_green#Sap_green)).

## Subject source

The subject tags come from Walt Hickey's
[A Statistical Analysis of the Work of Bob Ross](https://fivethirtyeight.com/features/a-statistical-analysis-of-the-work-of-bob-ross/)
(FiveThirtyEight, 2014). The CSV is copied as-is from
[fivethirtyeight/data](https://github.com/fivethirtyeight/data/tree/master/bob-ross)
and used under [CC BY 4.0](https://github.com/fivethirtyeight/data/blob/master/LICENSE).
Their data has what Bob painted but not the paints he used. With both in one
database you can ask which paints go with which subjects.

Episodes join on season and episode number (all 403 match). About 30 titles are
spelled differently in the two sources ("Snowfall" vs "Snow Fall"); `episodes.title`
keeps this repo's spelling. "Any tree" (`tree`, `trees`, `conifer`, `deciduous`,
`palm_trees`) covers 91.6% of episodes, the "91% with trees" figure; `clouds` is
44.4% and `mountain` 39.7%.
