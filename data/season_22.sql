-- The Joy of Painting: Season 22 (1993)
-- First appearance of Indian Red (Ep 1).

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (22,  1, 'Autumn Images',        'https://www.youtube.com/embed/HMx34Am6RFg'),
    (22,  2, 'Hint of Springtime',   'https://www.youtube.com/embed/C-OSaHvt8ms'),
    (22,  3, 'Around the Bend',      'https://www.youtube.com/embed/Kl5X3icOVvw'),
    (22,  4, 'Countryside Oval',     'https://www.youtube.com/embed/hdNH5axK4u0'),
    (22,  5, 'Russet Winter',        'https://www.youtube.com/embed/aE4nID1p-t0'),
    (22,  6, 'Purple Haze',          'https://www.youtube.com/embed/ZoJ2tcXWb7g'),
    (22,  7, 'Dimensions',           'https://www.youtube.com/embed/JUuP75RVZDI'),
    (22,  8, 'Deep Wilderness Home', 'https://www.youtube.com/embed/uZWNvDFfbUk'),
    (22,  9, 'Haven in the Valley',  'https://www.youtube.com/embed/Qccgam514ds'),
    (22, 10, 'Wintertime Blues',     'https://www.youtube.com/embed/dbMJVM4iL2Q'),
    (22, 11, 'Pastel Seascape',      'https://www.youtube.com/embed/K4aud_SpFDQ'),
    (22, 12, 'Country Creek',        'https://www.youtube.com/embed/JDa6JPcqy88'),
    (22, 13, 'Silent Forest',        'https://www.youtube.com/embed/AE1GKcL3NuI');

-- Ep 1 Autumn Images: 11 colors (Indian Red, Prussian Blue; no Indian Yellow, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 22 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Red', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 2 Hint of Springtime, 3 Around the Bend, 9 Haven in the Valley: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 22 AND e.episode IN (2, 3, 9)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 4, 7, 8, 12: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 22 AND e.episode IN (4, 7, 8, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 6, 11, 13: identical 11-color set (no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 22 AND e.episode IN (6, 11, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 5 Russet Winter: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 22 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 10 Wintertime Blues: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 22 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');
