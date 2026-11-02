-- The Joy of Painting: Season 29 (1997)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (29,  1, 'Island in the Wilderness', 'https://www.youtube.com/embed/lLWEXRAnQd0'),
    (29,  2, 'Autumn Oval',              'https://www.youtube.com/embed/2XnIdinwot0'),
    (29,  3, 'Seasonal Progression',     'https://www.youtube.com/embed/T2G5waMfQ-g'),
    (29,  4, 'Light at the Summit',      'https://www.youtube.com/embed/HOdS-G8p1KE'),
    (29,  5, 'Countryside Barn',         'https://www.youtube.com/embed/G7Etn7QMeO4'),
    (29,  6, 'Mountain Lake Falls',      'https://www.youtube.com/embed/dNEp3hoHSDI'),
    (29,  7, 'Cypress Creek',            'https://www.youtube.com/embed/Tnb2cXKKuWM'),
    (29,  8, "Trapper's Cabin",          'https://www.youtube.com/embed/chhCkmp0RG8'),
    (29,  9, 'Storm on the Horizon',     'https://www.youtube.com/embed/pA_2paUhBAQ'),
    (29, 10, "Pot O' Posies",            'https://www.youtube.com/embed/2zv_S_uVoVQ'),
    (29, 11, 'A Perfect Winter Day',     'https://www.youtube.com/embed/Io4fwhacpEs'),
    (29, 12, "Aurora's Dance",           'https://www.youtube.com/embed/iRMsb9Vf7GM'),
    (29, 13, "Woodman's Retreat",        'https://www.youtube.com/embed/ODrV0dfQcNs');

-- Eps 1 Island in the Wilderness & 3 Seasonal Progression: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 29 AND e.episode IN (1, 3)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 2 Autumn Oval & 7 Cypress Creek: identical 10-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 29 AND e.episode IN (2, 7)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 4, 5, 8, 13: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 29 AND e.episode IN (4, 5, 8, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 6 Mountain Lake Falls: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 29 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Midnight Black', 'Phthalo Blue',
                 'Phthalo Green', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown');

-- Ep 9 Storm on the Horizon: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 29 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 10 Pot O' Posies: 5 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 29 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Midnight Black', 'Prussian Blue',
                 'Sap Green');

-- Ep 11 A Perfect Winter Day: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 29 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 12 Aurora's Dance: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 29 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Phthalo Green', 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');
