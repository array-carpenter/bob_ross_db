-- Bob Ross "The Joy of Painting" — color database schema
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS colors (
    id   INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    hex  TEXT NOT NULL CHECK (hex GLOB '#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]')
);

CREATE TABLE IF NOT EXISTS episodes (
    id          INTEGER PRIMARY KEY,
    season      INTEGER NOT NULL,
    episode     INTEGER NOT NULL,
    title       TEXT NOT NULL,
    youtube_url TEXT,
    UNIQUE (season, episode)
);

CREATE TABLE IF NOT EXISTS episode_colors (
    episode_id INTEGER NOT NULL REFERENCES episodes(id) ON DELETE CASCADE,
    color_id   INTEGER NOT NULL REFERENCES colors(id)   ON DELETE CASCADE,
    PRIMARY KEY (episode_id, color_id)
);

CREATE INDEX IF NOT EXISTS idx_episode_colors_color ON episode_colors(color_id);

-- Subject tags (trees, clouds, frames, guests, ...) from FiveThirtyEight
CREATE TABLE IF NOT EXISTS elements (
    id   INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS episode_elements (
    episode_id INTEGER NOT NULL REFERENCES episodes(id) ON DELETE CASCADE,
    element_id INTEGER NOT NULL REFERENCES elements(id) ON DELETE CASCADE,
    PRIMARY KEY (episode_id, element_id)
);

CREATE INDEX IF NOT EXISTS idx_episode_elements_element ON episode_elements(element_id);

-- Convenience view: one row per (episode, color) with names + hex
CREATE VIEW IF NOT EXISTS v_episode_palette AS
SELECT e.season, e.episode, e.title, c.name AS color, c.hex
FROM episodes e
JOIN episode_colors ec ON ec.episode_id = e.id
JOIN colors c          ON c.id = ec.color_id
ORDER BY e.season, e.episode, c.name;

-- One row per (episode, element)
CREATE VIEW IF NOT EXISTS v_episode_elements AS
SELECT e.season, e.episode, e.title, el.name AS element
FROM episodes e
JOIN episode_elements ee ON ee.episode_id = e.id
JOIN elements el         ON el.id = ee.element_id
ORDER BY e.season, e.episode, el.name;
