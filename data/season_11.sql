-- The Joy of Painting — Season 11 (1988)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (11,  1, 'Mountain Stream',       'https://www.youtube.com/embed/xdFCj6BzQio'),
    (11,  2, 'Country Cabin',         'https://www.youtube.com/embed/Dkww2nHpuZw'),
    (11,  3, 'Daisy Delight',         'https://www.youtube.com/embed/HuHC1RqtvDA'),
    (11,  4, 'Hidden Stream',         'https://www.youtube.com/embed/JGzTg8fCj4w'),
    (11,  5, 'Towering Glacier',      'https://www.youtube.com/embed/67vdGbA3Xkg'),
    (11,  6, 'Oval Barn',             'https://www.youtube.com/embed/HqBhCibidNM'),
    (11,  7, 'Lakeside Path',         'https://www.youtube.com/embed/1yjGoJokbZg'),
    (11,  8, 'Sunset Oval',           'https://www.youtube.com/embed/9xG6IzcGotI'),
    (11,  9, 'Winter Barn',           'https://www.youtube.com/embed/_xkn0ceDreo'),
    (11, 10, 'Sunset over the Waves', 'https://www.youtube.com/embed/c4b_B2F1eZg'),
    (11, 11, 'Golden Glow',           'https://www.youtube.com/embed/aA8RhtaWACA'),
    (11, 12, 'Roadside Barn',         'https://www.youtube.com/embed/vJpKhiXvXdA'),
    (11, 13, 'Happy Accident',        'https://www.youtube.com/embed/Fw6odlNp7_8');

-- Eps 1, 4, 7 — identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 11 AND e.episode IN (1, 4, 7)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 2 Country Cabin — 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 11 AND e.episode = 2
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Midnight Black',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 3 Daisy Delight — 9 colors. (Source's stated count of 10 was an error;
-- confirmed 9 colors are correct.)
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 11 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 5, 12, 13 — identical 11-color set (Prussian Blue, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 11 AND e.episode IN (5, 12, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 6 Oval Barn — 6 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 11 AND e.episode = 6
  AND c.name IN ('Bright Red', 'Dark Sienna', 'Midnight Black', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown');

-- Ep 8 Sunset Oval — 11 colors (Phthalo Blue, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 11 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 9 Winter Barn — 6 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 11 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Titanium White', 'Van Dyke Brown');

-- Ep 10 Sunset over the Waves — 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 11 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Titanium White',
                 'Van Dyke Brown');

-- Ep 11 Golden Glow — 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 11 AND e.episode = 11
  AND c.name IN ('Cadmium Yellow', 'Dark Sienna', 'Indian Yellow', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');
