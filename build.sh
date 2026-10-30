#!/usr/bin/env bash
# Rebuild bob_ross.db from scratch out of the schema + color + season files.
set -euo pipefail
cd "$(dirname "$0")"

DB="bob_ross.db"
rm -f "$DB"

sqlite3 "$DB" < schema.sql
sqlite3 "$DB" < colors.sql
for f in data/season_*.sql; do
    echo "loading $f"
    sqlite3 "$DB" < "$f"
done

echo "loading FiveThirtyEight elements"
sqlite3 "$DB" ".import --csv data/fivethirtyeight/elements-by-episode.csv stage_538" ".read elements.sql"

echo "built $DB"
sqlite3 "$DB" "SELECT 'colors', COUNT(*) FROM colors
               UNION ALL SELECT 'episodes', COUNT(*) FROM episodes
               UNION ALL SELECT 'episode_colors', COUNT(*) FROM episode_colors
               UNION ALL SELECT 'elements', COUNT(*) FROM elements
               UNION ALL SELECT 'episode_elements', COUNT(*) FROM episode_elements;"
