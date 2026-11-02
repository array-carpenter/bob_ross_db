-- The Joy of Painting: Season 17 (1991)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (17,  1, 'Golden Mist Oval',      'https://www.youtube.com/embed/lhpfaW0k6uM'),
    (17,  2, 'The Old Home Place',    'https://www.youtube.com/embed/EVQcDEiJh2o'),
    (17,  3, 'Soothing Vista',        'https://www.youtube.com/embed/NqfRLiv0SZ0'),
    (17,  4, 'Stormy Seas',           'https://www.youtube.com/embed/LE6agCR5iBw'),
    (17,  5, 'Country Time',          'https://www.youtube.com/embed/e_bt9rQoGN0'),
    (17,  6, "A Mild Winter's Day",   'https://www.youtube.com/embed/BbYO579MmhA'),
    (17,  7, 'Spectacular Waterfall', 'https://www.youtube.com/embed/nK-HebXL2uw'),
    (17,  8, 'View from the Park',    'https://www.youtube.com/embed/Q4n90jsOUtY'),
    (17,  9, 'Lake View',            'https://www.youtube.com/embed/07acfzBaoa0'),
    (17, 10, 'Old Country Mill',      'https://www.youtube.com/embed/n8HlFCQACYA'),
    (17, 11, 'Morning Walk',          'https://www.youtube.com/embed/pSvgNkQdR2Y'),
    (17, 12, "Nature's Splendor",     'https://www.youtube.com/embed/uCAtI2IwEwk'),
    (17, 13, 'Mountain Beauty',       'https://www.youtube.com/embed/8P-YeoTmVrw');

-- Eps 1 Golden Mist Oval & 4 Stormy Seas: identical 9-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 17 AND e.episode IN (1, 4)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 2, 10, 13: identical 11-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 17 AND e.episode IN (2, 10, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 3, 5, 9, 12: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 17 AND e.episode IN (3, 5, 9, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 7 Spectacular Waterfall & 8 View from the Park: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 17 AND e.episode IN (7, 8)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 6 A Mild Winter's Day: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 17 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 11 Morning Walk: 11 colors (Prussian Blue, no Indian Yellow).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 17 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Midnight Black', 'Phthalo Blue', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');
