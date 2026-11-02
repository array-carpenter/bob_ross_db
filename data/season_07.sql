-- The Joy of Painting: Season 7 (1986)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (7,  1, 'Winter Cabin',         'https://www.youtube.com/embed/kdlHV6ceI_gw'),
    (7,  2, 'Secluded Lake',        'https://www.youtube.com/embed/2OxSJcFvpoU'),
    (7,  3, 'Evergreens at Sunset', 'https://www.youtube.com/embed/YQPEy3hYGo8'),
    (7,  4, 'Mountain Cabin',       'https://www.youtube.com/embed/E3IAMvO8GyM'),
    (7,  5, 'Portrait of Sally',    'https://www.youtube.com/embed/MHJB0IBnuD4'),
    (7,  6, 'Misty Waterfall',      'https://www.youtube.com/embed/530_cVmexiI'),
    (7,  7, 'Barn at Sunset',       'https://www.youtube.com/embed/WT6n0K2zGnA'),
    (7,  8, 'Mountain Splendor',    'https://www.youtube.com/embed/GhOGZMpPUSE'),
    (7,  9, 'Lake by Mountain',     'https://www.youtube.com/embed/yAiYirlcq7o'),
    (7, 10, 'Mountain Glory',       'https://www.youtube.com/embed/0M9pwLHRR2c'),
    (7, 11, 'Grey Winter',          'https://www.youtube.com/embed/sS-hNYgDUak'),
    (7, 12, 'Dock Scene',           'https://www.youtube.com/embed/4KYxkqlzyqM'),
    (7, 13, 'Dark Waterfall',       'https://www.youtube.com/embed/VqMbL00eZqw');

-- Ep 1 Winter Cabin: 6 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 1
  AND c.name IN ('Bright Red', 'Dark Sienna', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 2 Secluded Lake & 4 Mountain Cabin: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode IN (2, 4)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 3 Evergreens at Sunset: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Sap Green', 'Titanium White');

-- Ep 5 Portrait of Sally: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Phthalo Blue', 'Titanium White', 'Yellow Ochre');

-- Ep 6 Misty Waterfall: 11 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Phthalo Green', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 7 Barn at Sunset: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 7
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 8 Mountain Splendor: 11 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 9 Lake by Mountain: 11 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 Mountain Glory: 11 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 10
  AND c.name IN ('Bright Red', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 11 Grey Winter: 3 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Midnight Black', 'Titanium White');

-- Ep 12 Dock Scene: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 12
  AND c.name IN ('Bright Red', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 13 Dark Waterfall: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 7 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');
