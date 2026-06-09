-- The Joy of Painting — Season 14 (1989)
-- NOTE: source skipped Episode 8 and labelled two episodes "Episode 9".
-- By sequence, "On a Clear Day" is Episode 8 and "Riverside Escape Oval" is Episode 9.

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (14,  1, 'Distant Mountains',      'https://www.youtube.com/embed/GpA9UM7QGag'),
    (14,  2, 'Meadow Brook Surprise',  'https://www.youtube.com/embed/Ov5oIHTAa10'),
    (14,  3, 'Mountain Moonlight Oval','https://www.youtube.com/embed/CigXQtT6BPM'),
    (14,  4, 'Snowy Solitude',         'https://www.youtube.com/embed/1ZriQGhSFTM'),
    (14,  5, 'Mountain River',         'https://www.youtube.com/embed/CnMLKAGi0yM'),
    (14,  6, 'Graceful Mountains',     'https://www.youtube.com/embed/0uVe8T-vVVg'),
    (14,  7, 'Windy Waves',            'https://www.youtube.com/embed/y6GVVjG4HMg'),
    (14,  8, 'On a Clear Day',         'https://www.youtube.com/embed/e63Cgln6Yag'),
    (14,  9, 'Riverside Escape Oval',  'https://www.youtube.com/embed/d83REwSGfGo'),
    (14, 10, 'Surprising Falls',       'https://www.youtube.com/embed/QbclL1ca7_s'),
    (14, 11, 'Shadow Pond',            'https://www.youtube.com/embed/BQWJ3kqonpA'),
    (14, 12, 'Misty Forest Oval',      'https://www.youtube.com/embed/ddU9vQvSpw8'),
    (14, 13, 'Natural Wonder',         'https://www.youtube.com/embed/knOutsaiKfU');

-- Eps 1, 5, 7, 9, 10 — full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 14 AND e.episode IN (1, 5, 7, 9, 10)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 2, 6, 11 — identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 14 AND e.episode IN (2, 6, 11)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 3 Mountain Moonlight Oval & 13 Natural Wonder — identical 11-color set (no Bright Red).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 14 AND e.episode IN (3, 13)
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 4 Snowy Solitude — 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 14 AND e.episode = 4
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 8 On a Clear Day — 11 colors (no Sap Green).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 14 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 12 Misty Forest Oval — 11 colors (no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 14 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');
