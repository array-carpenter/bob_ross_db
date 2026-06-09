-- The Joy of Painting — Season 3 (1984)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (3,  1, 'Mountain Retreat', 'https://www.youtube.com/embed/hoimk4s8JoQ'),
    (3,  2, 'Blue Moon',        'https://www.youtube.com/embed/loit61vLUMc'),
    (3,  3, 'Bubbling Stream',  'https://www.youtube.com/embed/fuFalEXVN0k'),
    (3,  4, 'Winter Night',     'https://www.youtube.com/embed/8ysFkNYwhAE'),
    (3,  5, 'Distant Hills',    'https://www.youtube.com/embed/8Zge88tVwjE'),
    (3,  6, 'Covered Bridge',   'https://www.youtube.com/embed/OHSm8kLE7js'),
    (3,  7, 'Quiet Inlet',      'https://www.youtube.com/embed/9N5IWKzYIyU'),
    (3,  8, 'Night Light',      'https://www.youtube.com/embed/l141Y0x8om0'),
    (3,  9, 'The Old Mill',     'https://www.youtube.com/embed/OFKFUJ9eDNs'),
    (3, 10, 'Campfire',         'https://www.youtube.com/embed/L5bXkI0-pEg'),
    (3, 11, 'Rustic Barn',      'https://www.youtube.com/embed/WJJwrnFhUUg'),
    (3, 12, 'Hidden Lake',      'https://www.youtube.com/embed/P_DaqkFbnac'),
    (3, 13, 'Peaceful Waters',  'https://www.youtube.com/embed/Z0vtjRLqXcQ');

-- Full 12-color palette: eps 1, 2, 3, 11.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 3 AND e.episode IN (1, 2, 3, 11)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 4 Winter Night — 6 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 3 AND e.episode = 4
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Phthalo Green',
                 'Titanium White', 'Van Dyke Brown');

-- Ep 5 Distant Hills — 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 3 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Burnt Umber', 'Cadmium Yellow', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 6 Covered Bridge — 10 colors (includes Midnight Black).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 3 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Midnight Black', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 7 Quiet Inlet — 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 3 AND e.episode = 7
  AND c.name IN ('Alizarin Crimson', 'Burnt Umber', 'Cadmium Yellow', 'Phthalo Blue',
                 'Phthalo Green', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 8 Night Light — 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 3 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Burnt Umber', 'Cadmium Yellow', 'Phthalo Green',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 9 The Old Mill & 12 Hidden Lake — identical 10-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 3 AND e.episode IN (9, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Phthalo Blue', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 Campfire — 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 3 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Burnt Umber', 'Cadmium Yellow',
                 'Indian Yellow', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 13 Peaceful Waters — 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 3 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');
