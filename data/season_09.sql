-- The Joy of Painting — Season 9 (1987)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (9,  1, 'Winter Evergreens',        'https://www.youtube.com/embed/O6L5YPt9CeU'),
    (9,  2, "Surf's Up",                'https://www.youtube.com/embed/ZKxFvyyOBPQ'),
    (9,  3, 'Red Sunset',               'https://www.youtube.com/embed/e5JhYi_G-l0'),
    (9,  4, 'Meadow Road',              'https://www.youtube.com/embed/u5VT_WGM0kg'),
    (9,  5, 'Winter Oval',              'https://www.youtube.com/embed/pYWiLm_-sXw'),
    (9,  6, 'Secluded Beach',           'https://www.youtube.com/embed/WGUcw_kFvzU'),
    (9,  7, 'Forest Hills',             'https://www.youtube.com/embed/E3XW_Zp238U'),
    (9,  8, 'Little House by the Road', 'https://www.youtube.com/embed/3CDg_9gL-5M'),
    (9,  9, 'Mountain Path',            'https://www.youtube.com/embed/e0VUprkc1n0'),
    (9, 10, 'Country Charm',            'https://www.youtube.com/embed/9wp8NRzCJnw'),
    (9, 11, "Nature's Paradise",        'https://www.youtube.com/embed/7yU55PUls2c'),
    (9, 12, 'Mountain by the Sea',      'https://www.youtube.com/embed/so--opB-yuQ'),
    (9, 13, 'Mountain Hideaway',        'https://www.youtube.com/embed/q48EWPrbzVs');

-- Ep 1 Winter Evergreens — 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 9 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Prussian Blue', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 2 Surf's Up & 6 Secluded Beach — identical 10-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 9 AND e.episode IN (2, 6)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 3 Red Sunset — 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 9 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 4, 7, 8, 9, 10, 11, 13 — identical 11-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 9 AND e.episode IN (4, 7, 8, 9, 10, 11, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 5 Winter Oval — 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 9 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 12 Mountain by the Sea — 12 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 9 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');
