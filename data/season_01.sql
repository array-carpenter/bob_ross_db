-- The Joy of Painting — Season 1 (1983)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (1,  1, 'A Walk in the Woods',  'https://www.youtube.com/embed/oh5p5f5_-7A'),
    (1,  2, 'Mt. McKinley',         'https://www.youtube.com/embed/RInDWhYceLU'),
    (1,  3, 'Ebony Sunset',         'https://www.youtube.com/embed/UOziR7PoVco'),
    (1,  4, 'Winter Mist',          'https://www.youtube.com/embed/0pwoixRikn4'),
    (1,  5, 'Quiet Stream',         'https://www.youtube.com/embed/DFSIQNjKRfk'),
    (1,  6, 'Winter Moon',          'https://www.youtube.com/embed/loAzRUzx1wI'),
    (1,  7, 'Autumn Mountain',      'https://www.youtube.com/embed/sDdpc8uisD0'),
    (1,  8, 'Peaceful Valley',      'https://www.youtube.com/embed/kQlFwTOkYzg'),
    (1,  9, 'Seascape',             'https://www.youtube.com/embed/QxcS7p1VHyQ'),
    (1, 10, 'Mountain Lake',        'https://www.youtube.com/embed/wDnLlywAL5I'),
    (1, 11, 'Winter Glow',          'https://www.youtube.com/embed/Q03YvknOVe0'),
    (1, 12, 'Snow Fall',            'https://www.youtube.com/embed/4E35-8x_y04'),
    (1, 13, 'Final Reflections',    'https://www.youtube.com/embed/IEQWfszfRlA');

-- Link episodes to the colors used. One block per episode: match by
-- (season, episode) and the list of color names, resolving to ids.

-- The standard 8-color palette used across most of Season 1.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 1 AND e.episode IN (1, 2, 3, 5, 7, 8, 9, 10, 11, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown');

-- Ep 4 Winter Mist & Ep 6 Winter Moon — 3 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 1 AND e.episode IN (4, 6)
  AND c.name IN ('Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 12 Snow Fall — 4 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 1 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');
