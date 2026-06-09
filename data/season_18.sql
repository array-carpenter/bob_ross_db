-- The Joy of Painting — Season 18 (1991)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (18,  1, 'Half-Oval Vignette',  'https://www.youtube.com/embed/uY3fIry2tOE'),
    (18,  2, 'Absolutely Autumn',   'https://www.youtube.com/embed/PGPVpil2UmE'),
    (18,  3, 'Mountain Seclusion',  'https://www.youtube.com/embed/EBZKuVbRY54'),
    (18,  4, 'Crimson Oval',        'https://www.youtube.com/embed/R7Y3izMFPbM'),
    (18,  5, 'Autumn Exhibition',   'https://www.youtube.com/embed/6afHY2d9Lv8'),
    (18,  6, 'Majestic Peaks',      'https://www.youtube.com/embed/lilbzLCNnDo'),
    (18,  7, 'Golden Morning Mist', 'https://www.youtube.com/embed/rCHXqj4DHlM'),
    (18,  8, 'Winter Lace',         'https://www.youtube.com/embed/WJF_qoQRPck'),
    (18,  9, 'Seascape Fantasy',    'https://www.youtube.com/embed/sBBBilrDuSw'),
    (18, 10, 'Double Oval Stream',  'https://www.youtube.com/embed/rRjnHdr9DmU'),
    (18, 11, 'Enchanted Forest',    'https://www.youtube.com/embed/ikR7UT9mVBw'),
    (18, 12, 'Southwest Serenity',  'https://www.youtube.com/embed/EVfPPJ5FUmA'),
    (18, 13, 'Rippling Waters',     'https://www.youtube.com/embed/XvnJBynSiT0');

-- Eps 1 Half-Oval Vignette & 10 Double Oval Stream — identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 18 AND e.episode IN (1, 10)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 2, 4, 5, 7, 13 — identical 11-color set.
-- Ep 11 Enchanted Forest joins here: source stated 12 but only 11 were listed
-- (matching this set); 11 entered per the listed colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 18 AND e.episode IN (2, 4, 5, 7, 11, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 3 Mountain Seclusion — 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 18 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 6 Majestic Peaks — full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 18 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 8 Winter Lace — 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 18 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 9 Seascape Fantasy — 10 colors (no Bright Red, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 18 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 12 Southwest Serenity — 10 colors (no Indian Yellow, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 18 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');
