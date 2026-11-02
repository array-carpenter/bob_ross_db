-- The Joy of Painting: Season 10 (1987)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (10,  1, 'Towering Peaks',   'https://www.youtube.com/embed/1s58rW0_LN4'),
    (10,  2, 'Cabin at Sunset',  'https://www.youtube.com/embed/a6Wil3OXNuI'),
    (10,  3, 'Twin Falls',       'https://www.youtube.com/embed/cMwkY8ojRik'),
    (10,  4, 'Secluded Bridge',  'https://www.youtube.com/embed/vrAMRxBB5KI'),
    (10,  5, 'Ocean Breeze',     'https://www.youtube.com/embed/XZmdzfvXRuw'),
    (10,  6, 'Autumn Woods',     'https://www.youtube.com/embed/vKyMU5Z8cDI'),
    (10,  7, 'Winter Solitude',  'https://www.youtube.com/embed/ov4YaCQB9co'),
    (10,  8, 'Golden Sunset',    'https://www.youtube.com/embed/CiNDyckERXQ'),
    (10,  9, 'Mountain Oval',    'https://www.youtube.com/embed/Qj6lMtnCt8o'),
    (10, 10, 'Ocean Sunset',     'https://www.youtube.com/embed/OJ_xqtvZf3o'),
    (10, 11, 'Triple View',      'https://www.youtube.com/embed/zoTeyliLn5o'),
    (10, 12, 'Winter Frost',     'https://www.youtube.com/embed/8satX-hLkuI'),
    (10, 13, 'Lakeside Cabin',   'https://www.youtube.com/embed/1l_TsfCIb_I');

-- Ep 1 Towering Peaks: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 10 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 2, 3, 4, 6, 11, 13: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 10 AND e.episode IN (2, 3, 4, 6, 11, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 5 Ocean Breeze: 11 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 10 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 7 Winter Solitude: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 10 AND e.episode = 7
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 8 Golden Sunset: 11 colors (Sap Green, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 10 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 9 Mountain Oval: 11 colors (no Alizarin Crimson).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 10 AND e.episode = 9
  AND c.name IN ('Bright Red', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 Ocean Sunset: 11 colors (no Sap Green).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 10 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 12 Winter Frost: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 10 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown');
