-- The Joy of Painting: Season 20 (1992)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (20,  1, 'Mystic Mountain',   'https://www.youtube.com/embed/VlucWfTUo1A'),
    (20,  2, "New Day's Dawn",    'https://www.youtube.com/embed/vbPdQ0w8ylg'),
    (20,  3, 'Winter in Pastel',  'https://www.youtube.com/embed/kbnXZRNMouM'),
    (20,  4, 'Hazy Day',          'https://www.youtube.com/embed/5U3G61r35Mc'),
    (20,  5, 'Divine Elegance',   'https://www.youtube.com/embed/mb-Gwx1S5Gs'),
    (20,  6, 'Cliffside',         'https://www.youtube.com/embed/p6Uy2qOLvGk'),
    (20,  7, 'Autumn Fantasy',    'https://www.youtube.com/embed/FozIp7Va7dY'),
    (20,  8, 'The Old Oak Tree',  'https://www.youtube.com/embed/dN4HjAn8p5U'),
    (20,  9, 'Winter Paradise',   'https://www.youtube.com/embed/DY1aBv8Z1SQ'),
    (20, 10, 'Days Gone By',      'https://www.youtube.com/embed/DmYhNHVIdMI'),
    (20, 11, 'Change of Seasons', 'https://www.youtube.com/embed/QbgPu5f2Vf8'),
    (20, 12, 'Hidden Delight',    'https://www.youtube.com/embed/ZyPNzDaaDt8'),
    (20, 13, 'Double Take',       'https://www.youtube.com/embed/ppzFgG2K2k4');

-- Eps 1, 10, 11: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 20 AND e.episode IN (1, 10, 11)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 2, 4, 6, 7, 8, 12: identical 11-color set (no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 20 AND e.episode IN (2, 4, 6, 7, 8, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 3 Winter in Pastel: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 20 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 5 Divine Elegance: 12 colors (Phthalo Green, no Bright Red).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 20 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 9 Winter Paradise: 6 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 20 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Prussian Blue', 'Titanium White');

-- Ep 13 Double Take: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 20 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');
