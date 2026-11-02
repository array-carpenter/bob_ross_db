-- The Joy of Painting: Season 15 (1990)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (15,  1, 'Splendor of Winter',       'https://www.youtube.com/embed/oJvk7gPDHiE'),
    (15,  2, 'Colors of Nature',         'https://www.youtube.com/embed/Me9Ietooq4w'),
    (15,  3, "Grandpa's Barn",           'https://www.youtube.com/embed/IPPU49PyfEA'),
    (15,  4, 'Peaceful Reflections',     'https://www.youtube.com/embed/gYuH4Ilqdhs'),
    (15,  5, 'Hidden Winter Moon Oval',  'https://www.youtube.com/embed/yxAMOdl6RJE'),
    (15,  6, 'Waves of Wonder',          'https://www.youtube.com/embed/tayQX_ng-Nc'),
    (15,  7, 'Cabin by the Pond',        'https://www.youtube.com/embed/TyOO6WeP2AY'),
    (15,  8, 'Fall Stream',              'https://www.youtube.com/embed/ZY0ofhdV_L0'),
    (15,  9, 'Christmas Eve Snow',       'https://www.youtube.com/embed/cVqFG2pxK2A'),
    (15, 10, 'Forest Down Oval',         'https://www.youtube.com/embed/COsJUfPN2dA'),
    (15, 11, 'Pathway to Autumn',        'https://www.youtube.com/embed/Hg5RKc6xiL4'),
    (15, 12, 'Deep Forest Lake',         'https://www.youtube.com/embed/2bjFmSQjQrw'),
    (15, 13, 'Peaks of Majesty',         'https://www.youtube.com/embed/lTb8DN6G6dE');

-- Eps 2, 7, 8, 11, 12: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 15 AND e.episode IN (2, 7, 8, 11, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 1 Splendor of Winter: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 15 AND e.episode = 1
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 3 Grandpa's Barn: 11 colors (Prussian Blue, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 15 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 4 Peaceful Reflections: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 15 AND e.episode = 4
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 5 Hidden Winter Moon Oval: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 15 AND e.episode = 5
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 6 Waves of Wonder: 11 colors (Phthalo Green, no Indian Yellow, no Sap Green).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 15 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Phthalo Green', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 9 Christmas Eve Snow: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 15 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Ep 10 Forest Down Oval: 11 colors (Phthalo Blue, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 15 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 13 Peaks of Majesty: 11 colors (no Bright Red).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 15 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');
