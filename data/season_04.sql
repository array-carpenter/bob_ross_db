-- The Joy of Painting: Season 4 (1984)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (4,  1, 'Purple Splendor',    'https://www.youtube.com/embed/hP4GfMgsNVE'),
    (4,  2, 'Tranquil Valley',    'https://www.youtube.com/embed/PbchoOWWCZs'),
    (4,  3, 'Majestic Mountains', 'https://www.youtube.com/embed/NcVeRlPu_5w'),
    (4,  4, 'Winter Sawscape',    'https://www.youtube.com/embed/lmKAwKrONmE'),
    (4,  5, 'Evening Seascape',   'https://www.youtube.com/embed/y5k4GXw_-yI'),
    (4,  6, 'Warm Summer Day',    'https://www.youtube.com/embed/GBN9AIw3Ao4'),
    (4,  7, 'Cabin in the Woods', 'https://www.youtube.com/embed/81QKellPA70'),
    (4,  8, 'Wetlands',           'https://www.youtube.com/embed/2FpVyGanPwM'),
    (4,  9, 'Cool Waters',        'https://www.youtube.com/embed/tJRvBcqQd5A'),
    (4, 10, 'Quiet Woods',        'https://www.youtube.com/embed/wIZX57I4aDs'),
    (4, 11, 'Northwest Majesty',  'https://www.youtube.com/embed/9DU6bunvD_g'),
    (4, 12, 'Autumn Days',        'https://www.youtube.com/embed/VAdMkf-AAPM'),
    (4, 13, 'Mountain Challenge', 'https://www.youtube.com/embed/o2cjLA_wgIk');

-- Ep 1 Purple Splendor: 4 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 4 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Phthalo Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 2 Tranquil Valley: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 4 AND e.episode = 2
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Full 12-color palette: eps 3, 9, 12.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 4 AND e.episode IN (3, 9, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 4 Winter Sawscape: 6 colors (includes Midnight Black).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 4 AND e.episode = 4
  AND c.name IN ('Bright Red', 'Burnt Umber', 'Cadmium Yellow', 'Midnight Black',
                 'Prussian Blue', 'Titanium White');

-- Ep 5 Evening Seascape: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 4 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown');

-- Ep 6 Warm Summer Day: 11 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 4 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 7 Cabin in the Woods & 10 Quiet Woods: identical 11-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 4 AND e.episode IN (7, 10)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Phthalo Green', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 8 Wetlands: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 4 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 11 Northwest Majesty: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 4 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown');

-- Ep 13 Mountain Challenge: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 4 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Indian Yellow', 'Phthalo Blue',
                 'Phthalo Green', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');
