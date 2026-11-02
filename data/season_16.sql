-- The Joy of Painting: Season 16 (1990)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (16,  1, 'Two Seasons',                'https://www.youtube.com/embed/jwVz0uTLH1I'),
    (16,  2, 'Nestled Cabin',              'https://www.youtube.com/embed/l_jN9KN257M'),
    (16,  3, 'Wintertime Discovery',       'https://www.youtube.com/embed/uZyZW3tkCE0'),
    (16,  4, 'Mountain Mirage Wood Shape', 'https://www.youtube.com/embed/jfCsew_mz7A'),
    (16,  5, 'Double Oval Fantasy',        'https://www.youtube.com/embed/4jAsLpJzjHM'),
    (16,  6, 'Contemplative Lady',         'https://www.youtube.com/embed/gnp6WE7Ql-s'),
    (16,  7, 'Deep Woods',                 'https://www.youtube.com/embed/rE5ZVs_YJfE'),
    (16,  8, 'High Tide',                  'https://www.youtube.com/embed/_IREQ4SIcX8'),
    (16,  9, 'Barn in Snow Oval',          'https://www.youtube.com/embed/wJmi7-G9r-w'),
    (16, 10, 'That Time of Year',          'https://www.youtube.com/embed/q5moLoqOkP0'),
    (16, 11, 'Waterfall Wonder',           'https://www.youtube.com/embed/AGhXEPfp-W4'),
    (16, 12, 'Mighty Mountain Lake',       'https://www.youtube.com/embed/4vXB2R8ybDE'),
    (16, 13, 'Wooded Stream Oval',         'https://www.youtube.com/embed/-XA2h17y3HU');

-- Eps 1 Two Seasons & 5 Double Oval Fantasy: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 16 AND e.episode IN (1, 5)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 2, 8, 13: identical 11-color set (Phthalo Blue, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 16 AND e.episode IN (2, 8, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 3 Wintertime Discovery: 11 colors (Prussian Blue, no Sap Green).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 16 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 4 Mountain Mirage Wood Shape: 12 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 16 AND e.episode = 4
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 6 Contemplative Lady: 1 color (monochrome portrait).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 16 AND e.episode = 6
  AND c.name IN ('Van Dyke Brown');

-- Ep 7 Deep Woods: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 16 AND e.episode = 7
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 9 Barn in Snow Oval: 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 16 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 That Time of Year: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 16 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown');

-- Ep 11 Waterfall Wonder: 10 colors (no Bright Red).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 16 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 12 Mighty Mountain Lake: 11 colors (Prussian Blue, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 16 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');
