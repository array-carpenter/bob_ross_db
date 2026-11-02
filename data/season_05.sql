-- The Joy of Painting: Season 5 (1985)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (5,  1, 'Mountain Waterfall', 'https://www.youtube.com/embed/DqhzxdkdQS0'),
    (5,  2, 'Twilight Meadow',    'https://www.youtube.com/embed/6evqNlOO7Bw'),
    (5,  3, 'Mountain Blossoms',  'https://www.youtube.com/embed/UVhhStJAJZc'),
    (5,  4, 'Winter Stillness',   'https://www.youtube.com/embed/qg9c1SqdRko'),
    (5,  5, 'Quiet Pond',         'https://www.youtube.com/embed/aiK9xOIJtV8'),
    (5,  6, 'Ocean Sunrise',      'https://www.youtube.com/embed/u0Bz6TNUK1Q'),
    (5,  7, 'Bubbling Brook',     'https://www.youtube.com/embed/LiKCzeqn-kg'),
    (5,  8, 'Arizona Splendor',   'https://www.youtube.com/embed/spFwCh2616s'),
    (5,  9, 'Anatomy of a Wave',  'https://www.youtube.com/embed/DFQlu6eqrBo'),
    (5, 10, 'The Windmill',       'https://www.youtube.com/embed/xj8xsTSkbUk'),
    (5, 11, 'Autumn Glory',       'https://www.youtube.com/embed/yTzlm_t0RmY'),
    (5, 12, 'Indian Girl',        'https://www.youtube.com/embed/2uXMx8Kjs8I'),
    (5, 13, 'Meadow Stream',      'https://www.youtube.com/embed/87MMbN1bQCs');

-- Eps 1, 2, 13: identical 11-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 5 AND e.episode IN (1, 2, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Phthalo Green', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 3 Mountain Blossoms: 4 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 5 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Phthalo Blue', 'Phthalo Green', 'Titanium White');

-- Ep 4 Winter Stillness: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 5 AND e.episode = 4
  AND c.name IN ('Alizarin Crimson', 'Burnt Umber', 'Indian Yellow', 'Phthalo Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown');

-- Eps 5 Quiet Pond & 7 Bubbling Brook: identical 10-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 5 AND e.episode IN (5, 7)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 6 Ocean Sunrise: 5 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 5 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Indian Yellow', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown');

-- Ep 8 Arizona Splendor: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 5 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Burnt Umber', 'Cadmium Yellow', 'Indian Yellow',
                 'Phthalo Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 9 Anatomy of a Wave: 5 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 5 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Phthalo Blue', 'Phthalo Green',
                 'Titanium White');

-- Ep 10 The Windmill: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 5 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Phthalo Blue',
                 'Phthalo Green', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 11 Autumn Glory: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 5 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Burnt Umber', 'Cadmium Yellow', 'Indian Yellow',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown');

-- Ep 12 Indian Girl: 5 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 5 AND e.episode = 12
  AND c.name IN ('Bright Red', 'Burnt Umber', 'Indian Yellow', 'Prussian Blue',
                 'Titanium White');
