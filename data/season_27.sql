-- The Joy of Painting: Season 27 (1996)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (27,  1, 'Twilight Beauty',            'https://www.youtube.com/embed/0mJqzzeWyXs'),
    (27,  2, "Angler's Haven",             'https://www.youtube.com/embed/XlwfcXZ0AIU'),
    (27,  3, 'Rustic Winter Woods',        'https://www.youtube.com/embed/3q8Zi9480lw'),
    (27,  4, 'Wilderness Falls',           'https://www.youtube.com/embed/gxd0MPX8c6I'),
    (27,  5, 'Winter at the Farm',         'https://www.youtube.com/embed/LeIVNKnWz7o'),
    (27,  6, 'Daisies at Dawn',            'https://www.youtube.com/embed/_kkZcIgocBM'),
    (27,  7, 'A Spectacular View',         'https://www.youtube.com/embed/7R9HcaDT9P4'),
    (27,  8, 'Daybreak',                   'https://www.youtube.com/embed/crWDcTvDmec'),
    (27,  9, 'Island Paradise',            'https://www.youtube.com/embed/Cg3XAVhAas0'),
    (27, 10, 'Sunlight in the Shadows',    'https://www.youtube.com/embed/xgjQ0v2d9mE'),
    (27, 11, 'Splendor of a Snowy Winter', 'https://www.youtube.com/embed/JdXCoxkOdwQ'),
    (27, 12, 'Forest River',               'https://www.youtube.com/embed/wrbGlR22K0Q'),
    (27, 13, 'Golden Glow of Morning',     'https://www.youtube.com/embed/qXElmiqzcI0');

-- Eps 2 Angler's Haven & 4 Wilderness Falls: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode IN (2, 4)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 1 Twilight Beauty: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Titanium White',
                 'Van Dyke Brown');

-- Ep 3 Rustic Winter Woods: 6 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Indian Yellow', 'Midnight Black',
                 'Sap Green', 'Titanium White');

-- Ep 5 Winter at the Farm: 6 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown');

-- Ep 6 Daisies at Dawn: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Sap Green', 'Titanium White', 'Yellow Ochre');

-- Ep 7 A Spectacular View: 11 colors (Prussian Blue, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 7
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 8 Daybreak: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 9 Island Paradise: 11 colors (Phthalo Blue + Phthalo Green, no Sap Green, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 Sunlight in the Shadows: 5 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Midnight Black', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 11 Splendor of a Snowy Winter: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 12 Forest River: 12 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 13 Golden Glow of Morning: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 27 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Yellow Ochre');
