-- The Joy of Painting: Season 26 (1995)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (26,  1, 'In the Stillness of Morning', 'https://www.youtube.com/embed/5rfGa1_iJpw'),
    (26,  2, 'Delightful Meadow Home',      'https://www.youtube.com/embed/tWoInh2USOs'),
    (26,  3, 'First Snow',                  'https://www.youtube.com/embed/raAkJKeo0Sk'),
    (26,  4, 'Lake in the Valley',          'https://www.youtube.com/embed/KvJmSrErm20'),
    (26,  5, 'A Trace of Spring',           'https://www.youtube.com/embed/JMPwj3u4ZTA'),
    (26,  6, 'An Arctic Winter Day',        'https://www.youtube.com/embed/9BHWlbjd95c'),
    (26,  7, 'Snow Birch',                  'https://www.youtube.com/embed/wKeemvioVrM'),
    (26,  8, 'Early Autumn',                'https://www.youtube.com/embed/SLQXlFLoqQc'),
    (26,  9, 'Tranquil Wooded Stream',      'https://www.youtube.com/embed/lSeRrm5ZK9c'),
    (26, 10, 'Purple Mountain Range',       'https://www.youtube.com/embed/nkDA_R-XmqA'),
    (26, 11, "Storm's A Comin",             'https://www.youtube.com/embed/EHD9u-lo2wc'),
    (26, 12, 'Sunset Aglow',                'https://www.youtube.com/embed/gMEZp47VKC0'),
    (26, 13, 'Evening at the Falls',        'https://www.youtube.com/embed/RulXVcpgpqw');

-- Eps 3, 8, 12: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 26 AND e.episode IN (3, 8, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 4, 5, 10: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 26 AND e.episode IN (4, 5, 10)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 1 In the Stillness of Morning: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 26 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 2 Delightful Meadow Home: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 26 AND e.episode = 2
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Yellow Ochre');

-- Ep 6 An Arctic Winter Day: 6 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 26 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown');

-- Ep 7 Snow Birch: 4 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 26 AND e.episode = 7
  AND c.name IN ('Indian Yellow', 'Phthalo Blue', 'Prussian Blue', 'Titanium White');

-- Ep 9 Tranquil Wooded Stream: 11 colors (no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 26 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 11 Storm's A Comin: 9 colors (Phthalo Green; no Indian Yellow, no Sap Green).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 26 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Phthalo Green', 'Titanium White',
                 'Van Dyke Brown');

-- Ep 13 Evening at the Falls: 5 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 26 AND e.episode = 13
  AND c.name IN ('Cadmium Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White');
