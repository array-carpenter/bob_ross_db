-- The Joy of Painting: Season 24 (1994)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (24,  1, 'Gray Mountain',             'https://www.youtube.com/embed/4XxClvPZ1RE'),
    (24,  2, 'Wayside Pond',              'https://www.youtube.com/embed/FPW2FwK4IOo'),
    (24,  3, 'Teton Winter',             'https://www.youtube.com/embed/I4h6TC4CPJY'),
    (24,  4, 'Little Home in the Meadow', 'https://www.youtube.com/embed/nU1zV93N-kI'),
    (24,  5, 'A Pretty Autumn Day',       'https://www.youtube.com/embed/HWedDS3p7XI'),
    (24,  6, 'Mirrored Images',           'https://www.youtube.com/embed/i29frkR1T98'),
    (24,  7, 'Back-Country Path',         'https://www.youtube.com/embed/2iNMoQB1Pe8'),
    (24,  8, 'Graceful Waterfall',        'https://www.youtube.com/embed/fBh1nA4pMDY'),
    (24,  9, 'Icy Lake',                  'https://www.youtube.com/embed/AmBDmgta3l4'),
    (24, 10, 'Rowboat on the Beach',      'https://www.youtube.com/embed/hfvhXOvg43w'),
    (24, 11, 'Portrait of Winter',        'https://www.youtube.com/embed/JLnIUGOupOA'),
    (24, 12, 'The Footbridge',            'https://www.youtube.com/embed/RqtDliGeyTg'),
    (24, 13, 'Snowbound Cabin',           'https://www.youtube.com/embed/obSLZWXmDak');

-- Eps 1, 8, 12: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 24 AND e.episode IN (1, 8, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 3 Teton Winter & 13 Snowbound Cabin: identical 6-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 24 AND e.episode IN (3, 13)
  AND c.name IN ('Alizarin Crimson', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White');

-- Eps 4 Little Home in the Meadow & 7 Back-Country Path: identical 10-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 24 AND e.episode IN (4, 7)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Yellow Ochre');

-- Ep 2 Wayside Pond: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 24 AND e.episode = 2
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 5 A Pretty Autumn Day: 11 colors (Phthalo Green; no Dark Sienna, no Van Dyke Brown).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 24 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Yellow Ochre');

-- Ep 6 Mirrored Images: 12 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 24 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 9 Icy Lake: 11 colors (Prussian Blue, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 24 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 Rowboat on the Beach: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 24 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Midnight Black', 'Phthalo Blue',
                 'Phthalo Green', 'Sap Green', 'Titanium White', 'Yellow Ochre');

-- Ep 11 Portrait of Winter: 5 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 24 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Titanium White');
