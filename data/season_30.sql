-- The Joy of Painting: Season 30 (1997)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (30,  1, 'Babbling Brook',     'https://www.youtube.com/embed/ZHUdS0wEaKk'),
    (30,  2, 'Woodgrain View',     'https://www.youtube.com/embed/fcx1yUuSf3o'),
    (30,  3, "Winter's Peace",     'https://www.youtube.com/embed/Xzv3iiWi1Wo'),
    (30,  4, 'Wilderness Trail',   'https://www.youtube.com/embed/vGsW_6BCukU'),
    (30,  5, 'A Copper Winter',    'https://www.youtube.com/embed/BSjee-ond7w'),
    (30,  6, 'Misty Foothills',    'https://www.youtube.com/embed/LEz4UVL7POE'),
    (30,  7, 'Through the Window', 'https://www.youtube.com/embed/SrN4A9rVXj0'),
    (30,  8, 'Home in the Valley', 'https://www.youtube.com/embed/enutOy-nsZk'),
    (30,  9, 'Mountains of Grace', 'https://www.youtube.com/embed/nXlu_Q0sR7c'),
    (30, 10, 'Seaside Harmony',    'https://www.youtube.com/embed/CY6sGFs209E'),
    (30, 11, 'A Cold Spring Day',  'https://www.youtube.com/embed/jq8bIbpW7DQ'),
    (30, 12, "Evening's Glow",     'https://www.youtube.com/embed/eTEKGOi6SVg'),
    (30, 13, 'Blue Ridge Falls',   'https://www.youtube.com/embed/fz0YjqtHW84');

-- Eps 8 Home in the Valley & 11 A Cold Spring Day: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode IN (8, 11)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 2 Woodgrain View & 4 Wilderness Trail: identical 11-color set (Prussian Blue, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode IN (2, 4)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 1 Babbling Brook: 11 colors (Phthalo Blue, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 3 Winter's Peace: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 5 A Copper Winter: 12 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 6 Misty Foothills: 10 colors (no Bright Red, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 7 Through the Window: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode = 7
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 9 Mountains of Grace: 11 colors (no Indian Yellow).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 Seaside Harmony: 10 colors (no Bright Red, no Yellow Ochre).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown');

-- Ep 12 Evening's Glow: 10 colors (no Phthalo Blue, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 13 Blue Ridge Falls: 11 colors (no Bright Red).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 30 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');
