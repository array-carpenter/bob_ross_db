-- The Joy of Painting — Season 2 (1983)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (2,  1, 'Meadow Lake',              'https://www.youtube.com/embed/GARWowi0QXI'),
    (2,  2, 'Winter Sun',               'https://www.youtube.com/embed/VPfYRj4DDco'),
    (2,  3, 'Ebony Sea',                'https://www.youtube.com/embed/aOJsKNzO3i8'),
    (2,  4, 'Shades of Grey',           'https://www.youtube.com/embed/I-ousb8-SD0'),
    (2,  5, 'Autumn Splendor',          'https://www.youtube.com/embed/rTTWw5Gd79I'),
    (2,  6, 'Black River',              'https://www.youtube.com/embed/6O4sfJd8G_M'),
    (2,  7, 'Brown Mountain',           'https://www.youtube.com/embed/Vx6v47gHBWM'),
    (2,  8, 'Reflections',              'https://www.youtube.com/embed/0FYfo94qefg'),
    (2,  9, 'Black and White Seascape', 'https://www.youtube.com/embed/PMDyPrE0puo'),
    (2, 10, 'Lazy River',               'https://www.youtube.com/embed/BW2wKKFvH1g'),
    (2, 11, 'Black Waterfall',          'https://www.youtube.com/embed/GzSqjyQUPZQ'),
    (2, 12, 'Mountain Waterfall',       'https://www.youtube.com/embed/9jIt95PCFAA'),
    (2, 13, 'Final Grace',              'https://www.youtube.com/embed/miJ19Kz_i3Y');

-- Full 12-color palette: eps 1, 2, 3, 8, 10, 12, 13.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 2 AND e.episode IN (1, 2, 3, 8, 10, 12, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 4 Shades of Grey — 3 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 2 AND e.episode = 4
  AND c.name IN ('Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Eps 5, 6, 7 — full minus Indian Yellow (11).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 2 AND e.episode IN (5, 6, 7)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 9 Black and White Seascape — full minus Burnt Umber (11).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 2 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 11 Black Waterfall — full minus Bright Red (11).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 2 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Burnt Umber', 'Cadmium Yellow', 'Indian Yellow',
                 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');
