-- The Joy of Painting: Season 23 (1994)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (23,  1, 'Frosty Winter Morn',        'https://www.youtube.com/embed/1-9_enMBquw'),
    (23,  2, 'Forest Edge',               'https://www.youtube.com/embed/puGk2iFvvp0'),
    (23,  3, 'Mountain Ridge Lake',       'https://www.youtube.com/embed/Hq-z06i6HCs'),
    (23,  4, 'Reflections of Gold',       'https://www.youtube.com/embed/8f9CCnqJ_1Y'),
    (23,  5, 'Quiet Cove',                'https://www.youtube.com/embed/cR9hTbSomx4'),
    (23,  6, 'Rivers Peace',              'https://www.youtube.com/embed/flCWS9LB4Ks'),
    (23,  7, "At Dawn's Light",           'https://www.youtube.com/embed/HFdTxqEznIk'),
    (23,  8, 'Valley Waterfall',          'https://www.youtube.com/embed/VYcsYzzRae4'),
    (23,  9, 'Toward Days End',           'https://www.youtube.com/embed/cFi_fJl40BA'),
    (23, 10, 'Falls in the Glen',         'https://www.youtube.com/embed/txAtX-VyVNc'),
    (23, 11, 'Frozen Beauty in Vignette', 'https://www.youtube.com/embed/H15kV1wbDG4'),
    (23, 12, 'Crimson Tide',              'https://www.youtube.com/embed/Y7SDU4i6Fco'),
    (23, 13, 'Winter Bliss',              'https://www.youtube.com/embed/yInYwy6AsDQ');

-- Eps 2 Forest Edge & 5 Quiet Cove: identical 11-color set (Prussian Blue, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 23 AND e.episode IN (2, 5)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 3 Mountain Ridge Lake & 6 Rivers Peace: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 23 AND e.episode IN (3, 6)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 8, 9, 10: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 23 AND e.episode IN (8, 9, 10)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 1 Frosty Winter Morn: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 23 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Midnight Black', 'Phthalo Blue',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown');

-- Ep 4 Reflections of Gold: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 23 AND e.episode = 4
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 7 At Dawn's Light: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 23 AND e.episode = 7
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Prussian Blue', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 11 Frozen Beauty in Vignette: 9 colors (no Alizarin Crimson).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 23 AND e.episode = 11
  AND c.name IN ('Bright Red', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Phthalo Green', 'Prussian Blue', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 12 Crimson Tide: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 23 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 13 Winter Bliss: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 23 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');
