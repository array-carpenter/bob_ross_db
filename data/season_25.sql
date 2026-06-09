-- The Joy of Painting — Season 25 (1995)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (25,  1, 'Hide A Way Cove',       'https://www.youtube.com/embed/l_HqMYquc08'),
    (25,  2, 'Enchanted Falls Oval',  'https://www.youtube.com/embed/HklPkQ0lSKA'),
    (25,  3, 'Not Quite Spring',      'https://www.youtube.com/embed/N_u6x7LeyTM'),
    (25,  4, 'Splashes of Autumn',    'https://www.youtube.com/embed/YcbaMqq_X8s'),
    (25,  5, 'Summer in the Mountain','https://www.youtube.com/embed/gmCXgS38NDc'),
    (25,  6, 'Oriental Falls',        'https://www.youtube.com/embed/v8Znj8bbmCQ'),
    (25,  7, 'Autumn Palette',        'https://www.youtube.com/embed/HWrvW-NgaOY'),
    (25,  8, 'Cypress Swamp',         'https://www.youtube.com/embed/FdIUHudQABI'),
    (25,  9, 'Downstream View',       'https://www.youtube.com/embed/KsDPg5HZYNw'),
    (25, 10, 'Just Before the Storm', 'https://www.youtube.com/embed/Rh-jKrMrmOA'),
    (25, 11, "Fisherman's Paradise",  'https://www.youtube.com/embed/uJLK85uU5mA'),
    (25, 12, 'Desert Hues',           'https://www.youtube.com/embed/UUNNXGVNTuI'),
    (25, 13, 'The Property Line',     'https://www.youtube.com/embed/ivesI3rU7dU');

-- Eps 1 Hide A Way Cove & 9 Downstream View — full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 25 AND e.episode IN (1, 9)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 2 Enchanted Falls Oval — 5 colors. (Source's stated count "65" is a typo for 5.)
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 25 AND e.episode = 2
  AND c.name IN ('Alizarin Crimson', 'Indian Yellow', 'Sap Green', 'Titanium White',
                 'Yellow Ochre');

-- Ep 3 Not Quite Spring — 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 25 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 4 Splashes of Autumn & 8 Cypress Swamp — identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 25 AND e.episode IN (4, 8)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 5, 6, 11, 12, 13 — identical 11-color set (Prussian Blue, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 25 AND e.episode IN (5, 6, 11, 12, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 7 Autumn Palette — 11 colors (Phthalo Blue, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 25 AND e.episode = 7
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 Just Before the Storm — 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 25 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown');
