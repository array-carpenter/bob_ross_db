-- The Joy of Painting: Season 13 (1989)
-- NOTE: source listed both Oval Essence and Lost Lake as "Episode 12"; Lost Lake
-- is the season finale, recorded here as Episode 13.

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (13,  1, 'Rolling Hills',       'https://www.youtube.com/embed/H4GyGrT7lEQ'),
    (13,  2, 'Frozen Solitude',     'https://www.youtube.com/embed/kNZssD9zWlw'),
    (13,  3, 'Meadow Brook',        'https://www.youtube.com/embed/06W8GsWj2Yg'),
    (13,  4, 'Evening at Sunset',   'https://www.youtube.com/embed/7ZUQTXuDPaI'),
    (13,  5, 'Mountain View',       'https://www.youtube.com/embed/dJfnAyDLwPY'),
    (13,  6, 'Hidden Creek',        'https://www.youtube.com/embed/KmoRz01bm0Y'),
    (13,  7, 'Peaceful Haven',      'https://www.youtube.com/embed/j20pZ96E_CE'),
    (13,  8, 'Mountain Exhibition', 'https://www.youtube.com/embed/bgI3_1quJ18'),
    (13,  9, 'Emerald Waters',      'https://www.youtube.com/embed/lLunPQBzW6g'),
    (13, 10, 'Mountain Summit',     'https://www.youtube.com/embed/kasGRkfkiPM'),
    (13, 11, 'Cabin Hideaway',      'https://www.youtube.com/embed/NjTlW2NL1Lo'),
    (13, 12, 'Oval Essence',        'https://www.youtube.com/embed/q7WXF_BSEXw'),
    (13, 13, 'Lost Lake',          'https://www.youtube.com/embed/9-ATP8xyDM0');

-- Eps 1, 10, 13: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 13 AND e.episode IN (1, 10, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 2 Frozen Solitude: 5 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 13 AND e.episode = 2
  AND c.name IN ('Dark Sienna', 'Midnight Black', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown');

-- Eps 3 Meadow Brook & 7 Peaceful Haven: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 13 AND e.episode IN (3, 7)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 4 Evening at Sunset & 5 Mountain View: identical 11-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 13 AND e.episode IN (4, 5)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 6 Hidden Creek: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 13 AND e.episode = 6
  AND c.name IN ('Cadmium Yellow', 'Dark Sienna', 'Indian Yellow', 'Midnight Black',
                 'Phthalo Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 8 Mountain Exhibition: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 13 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 9 Emerald Waters: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 13 AND e.episode = 9
  AND c.name IN ('Cadmium Yellow', 'Dark Sienna', 'Midnight Black', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 11 Cabin Hideaway: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 13 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 12 Oval Essence: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 13 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Phthalo Green', 'Titanium White', 'Van Dyke Brown');
