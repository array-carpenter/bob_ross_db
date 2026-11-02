-- The Joy of Painting: Season 8 (1986)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (8,  1, 'Misty Rolling Hills',     'https://www.youtube.com/embed/cC5ozePVKGI'),
    (8,  2, 'Lakeside Cabin',          'https://www.youtube.com/embed/CP6_5cQVZvQ'),
    (8,  3, 'Warm Winter Day',         'https://www.youtube.com/embed/mUJoNLWQ1yI'),
    (8,  4, 'Waterside Way',           'https://www.youtube.com/embed/uj5FE70BcB0'),
    (8,  5, "Hunter's Haven",          'https://www.youtube.com/embed/Da4SPyh1ATM'),
    (8,  6, 'Bubbling Mountain Brook', 'https://www.youtube.com/embed/U2_SKgM3f4A'),
    (8,  7, 'Winter Hideaway',         'https://www.youtube.com/embed/19oz9XHZNzA'),
    (8,  8, 'Foot of the Mountain',    'https://www.youtube.com/embed/cIUBUc_ITBc'),
    (8,  9, 'Majestic Pine',           'https://www.youtube.com/embed/x5CoQj9zr-c'),
    (8, 10, 'Cactus at Sunset',        'https://www.youtube.com/embed/XBqD3QhKU24'),
    (8, 11, 'Mountain Range',          'https://www.youtube.com/embed/V_l6olF3yHI'),
    (8, 12, 'Lonely Retreat',          'https://www.youtube.com/embed/qTDQt_PdlYc'),
    (8, 13, 'Northern Lights',         'https://www.youtube.com/embed/vgbMONXc9Cs');

-- Ep 1 Misty Rolling Hills: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 8 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 2 Lakeside Cabin: 12 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 8 AND e.episode = 2
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 3 Warm Winter Day, 7 Winter Hideaway, 12 Lonely Retreat: identical 10-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 8 AND e.episode IN (3, 7, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 4 Waterside Way, 6 Bubbling Mountain Brook, 9 Majestic Pine: identical 11-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 8 AND e.episode IN (4, 6, 9)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 5 Hunter's Haven: 11 colors (Prussian Blue, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 8 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 8 Foot of the Mountain: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 8 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 10 Cactus at Sunset: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 8 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 11 Mountain Range: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 8 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Phthalo Blue', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 13 Northern Lights: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 8 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Phthalo Green', 'Titanium White', 'Van Dyke Brown');
