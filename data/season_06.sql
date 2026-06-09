-- The Joy of Painting — Season 6 (1985)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (6,  1, 'Blue River',         'https://www.youtube.com/embed/LygUyAb78oY'),
    (6,  2, "Nature's Edge",      'https://www.youtube.com/embed/Bcqyzo85A1o'),
    (6,  3, 'Morning Mist',       'https://www.youtube.com/embed/wbZreRaE74k'),
    (6,  4, 'Whispering Stream',  'https://www.youtube.com/embed/QglIjlqsUdU'),
    (6,  5, 'Secluded Forest',    'https://www.youtube.com/embed/USkduOfwJok'),
    (6,  6, 'Snow Trail',         'https://www.youtube.com/embed/n9EsFFtwZnE'),
    (6,  7, 'Arctic Beauty',      'https://www.youtube.com/embed/UQ-RTZCOQn0'),
    (6,  8, 'Horizons West',      'https://www.youtube.com/embed/m6UM-rN2D6s'),
    (6,  9, 'High Chateau',       'https://www.youtube.com/embed/dafH8ks9Zww'),
    (6, 10, 'Country Life',       'https://www.youtube.com/embed/j8Jf7QVKLgQ'),
    (6, 11, 'Western Expanse',    'https://www.youtube.com/embed/MTInkV5ODjk'),
    (6, 12, 'Marshlands',         'https://www.youtube.com/embed/Ugiwi8uizpg'),
    (6, 13, 'Blaze of Color',     'https://www.youtube.com/embed/se7wOprxRGs');

-- Eps 1, 2, 4 — 11 colors (Prussian Blue, no Phthalo Green).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 6 AND e.episode IN (1, 2, 4)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 3 Morning Mist & 12 Marshlands — identical 10-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 6 AND e.episode IN (3, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 5 Secluded Forest — 11 colors. (Source's stated count of 12 was an error;
-- confirmed 11 colors, no Prussian Blue. "Permanent Red" = Bright Red.)
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 6 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Phthalo Green', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 6 Snow Trail — 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 6 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Burnt Umber', 'Cadmium Yellow', 'Phthalo Blue',
                 'Phthalo Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 7, 9, 11, 13 — 11 colors (Phthalo Green, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 6 AND e.episode IN (7, 9, 11, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Phthalo Green', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 8 Horizons West — 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 6 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 10 Country Life — 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 6 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');
