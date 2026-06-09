# bob_ross_db

A SQLite database of every paint color Bob Ross used in each episode of
*The Joy of Painting*, with hex codes.

## Layout

| File | Purpose |
|------|---------|
| `schema.sql` | Tables, indexes, and the `v_episode_palette` view |
| `colors.sql` | Canonical paint palette + hex codes |
| `data/season_NN.sql` | Episodes and color usage for one season |
| `build.sh` | Rebuilds `bob_ross.db` from the SQL files |

The `.db` is gitignored — rebuild it locally:

```bash
./build.sh
```

## Schema

- **colors** — `id`, `name` (unique), `hex` (validated `#RRGGBB`)
- **episodes** — `id`, `season`, `episode`, `title`, `youtube_url` (unique on `season, episode`)
- **episode_colors** — junction of `episode_id` ↔ `color_id`
- **v_episode_palette** — flattened view: season, episode, title, color, hex

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
```

## Adding a season

Create `data/season_NN.sql` following the Season 1 pattern (insert episodes, then
link colors by name), add any new colors to `colors.sql`, and re-run `./build.sh`.

## Color source

Hex codes follow the widely-used canonical Bob Ross palette
([Two Inch Brush](https://www.twoinchbrush.com/) / FiveThirtyEight reference set).
