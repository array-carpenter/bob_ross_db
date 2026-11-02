-- The Joy of Painting: Season 28 (1996)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (28,  1, "Fisherman's Trail",       'https://www.youtube.com/embed/VnZEpic2UzU'),
    (28,  2, 'A Warm Winter',           'https://www.youtube.com/embed/_TTdw3YnXuo'),
    (28,  3, 'Under Pastel Skies',      'https://www.youtube.com/embed/lzODyJS2ZIg'),
    (28,  4, 'Golden Rays of Sunshine', 'https://www.youtube.com/embed/zxj3xLDNxo0'),
    (28,  5, 'The Magic of Fall',       'https://www.youtube.com/embed/bSm3fmEyJ20'),
    (28,  6, 'Glacier Lake',            'https://www.youtube.com/embed/TohG7F8M3Ls'),
    (28,  7, 'The Old Weathered Barn',  'https://www.youtube.com/embed/NYUIIBFj0iQ'),
    (28,  8, 'Deep Forest Falls',       'https://www.youtube.com/embed/urHQRbRNuYI'),
    (28,  9, "Winter's Grace",          'https://www.youtube.com/embed/mxJ2On9wyvY'),
    (28, 10, 'Splendor of Autumn',      'https://www.youtube.com/embed/hEyR2FDp-00'),
    (28, 11, 'Tranquil Seas',           'https://www.youtube.com/embed/kN1DP_yqs-A'),
    (28, 12, 'Mountain Serenity',       'https://www.youtube.com/embed/wc_YVijYjT4'),
    (28, 13, 'Home Before Nightfall',   'https://www.youtube.com/embed/22SiIDvyJeM');

-- Eps 1, 3, 6, 8: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 28 AND e.episode IN (1, 3, 6, 8)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 5 The Magic of Fall & 7 The Old Weathered Barn: identical 9-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 28 AND e.episode IN (5, 7)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Yellow Ochre');

-- Ep 2 A Warm Winter: 9 colors (Prussian Blue, no Phthalo Green).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 28 AND e.episode = 2
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Midnight Black',
                 'Phthalo Blue', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Yellow Ochre');

-- Ep 4 Golden Rays of Sunshine: 6 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 28 AND e.episode = 4
  AND c.name IN ('Alizarin Crimson', 'Indian Yellow', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White');

-- Ep 9 Winter's Grace: 4 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 28 AND e.episode = 9
  AND c.name IN ('Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Titanium White');

-- Ep 10 Splendor of Autumn: 11 colors (no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 28 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 11 Tranquil Seas: 10 colors (Phthalo Green; no Dark Sienna, no Van Dyke Brown, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 28 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Phthalo Green', 'Sap Green',
                 'Titanium White', 'Yellow Ochre');

-- Ep 12 Mountain Serenity: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 28 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 13 Home Before Nightfall: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 28 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Midnight Black',
                 'Phthalo Blue', 'Sap Green', 'Titanium White', 'Yellow Ochre');
