-- The Joy of Painting — Season 19 (1992)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (19,  1, 'Snowfall Magic',           'https://www.youtube.com/embed/1enWTsRi16o'),
    (19,  2, 'Quiet Mountain Lake',      'https://www.youtube.com/embed/2gq2V6dCt2I'),
    (19,  3, 'Final Embers of Sunlight', 'https://www.youtube.com/embed/IeFbdk36MUU'),
    (19,  4, 'Snowy Morn',               'https://www.youtube.com/embed/iB1TDWlo0kk'),
    (19,  5, "Camper's Haven",           'https://www.youtube.com/embed/C34WAUgkAT0'),
    (19,  6, 'Waterfall in the Woods',   'https://www.youtube.com/embed/uBRKVa7sy1Q'),
    (19,  7, 'Covered Bridge Oval',      'https://www.youtube.com/embed/F4iPbH1OHsQ'),
    (19,  8, 'Scenic Seclusion',         'https://www.youtube.com/embed/d50HkqB9JEM'),
    (19,  9, 'Ebb Tide',                 'https://www.youtube.com/embed/mFOna_LN7Ys'),
    (19, 10, 'After the Rain',           'https://www.youtube.com/embed/Wj-3ct7RvAI'),
    (19, 11, 'Winter Elegance',          'https://www.youtube.com/embed/JjBZzKp_u5E'),
    (19, 12, "Evening's Peace",          'https://www.youtube.com/embed/uEUMVwc4o5U'),
    (19, 13, 'Valley of Tranquility',    'https://www.youtube.com/embed/FnY7jDY5PsE');

-- Eps 2, 3, 6 — identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 19 AND e.episode IN (2, 3, 6)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 8 Scenic Seclusion & 13 Valley of Tranquility — full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 19 AND e.episode IN (8, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 9 Ebb Tide & 11 Winter Elegance — identical 9-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 19 AND e.episode IN (9, 11)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 1 Snowfall Magic — 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 19 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 4 Snowy Morn — 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 19 AND e.episode = 4
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 5 Camper's Haven — 11 colors (no Bright Red).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 19 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 7 Covered Bridge Oval — 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 19 AND e.episode = 7
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 After the Rain — 11 colors (no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 19 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 12 Evening's Peace — 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 19 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');
