-- The Joy of Painting — Season 12 (1988)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (12,  1, 'Golden Knoll',          'https://www.youtube.com/embed/-O0Bs65eN5w'),
    (12,  2, 'Mountain Reflections',  'https://www.youtube.com/embed/rzYpa4XGSnA'),
    (12,  3, 'Secluded Mountain',     'https://www.youtube.com/embed/3PZabdohLso'),
    (12,  4, 'Bright Autumn Trees',   'https://www.youtube.com/embed/aR-C3h5zURM'),
    (12,  5, 'Black Seascape',        'https://www.youtube.com/embed/P_aCan4cBwc'),
    (12,  6, 'Steep Mountains',       'https://www.youtube.com/embed/fRK8_ioYWw4'),
    (12,  7, 'Quiet Mountains River', 'https://www.youtube.com/embed/Leiw-FtADZc'),
    (12,  8, 'Evening Waterfall',     'https://www.youtube.com/embed/PutvF_P4588'),
    (12,  9, 'Tropical Seascape',     'https://www.youtube.com/embed/RrBsbqO9aqI'),
    (12, 10, 'Mountain at Sunset',    'https://www.youtube.com/embed/HCsCatvigtw'),
    (12, 11, 'Soft Mountain Glow',    'https://www.youtube.com/embed/gOGJYHWjXgE'),
    (12, 12, 'Mountain in an Oval',   'https://www.youtube.com/embed/1jRPshs27H8'),
    (12, 13, 'Winter Mountain',       'https://www.youtube.com/embed/46vI20697HI');

-- Ep 1 Golden Knoll — 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 12 AND e.episode = 1
  AND c.name IN ('Cadmium Yellow', 'Dark Sienna', 'Indian Yellow', 'Midnight Black',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 2, 6, 7, 10, 11 — identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 12 AND e.episode IN (2, 6, 7, 10, 11)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 3 Secluded Mountain — full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 12 AND e.episode = 3
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 4 Bright Autumn Trees — 12 colors (Phthalo Green, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 12 AND e.episode = 4
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Green', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 5 Black Seascape — 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 12 AND e.episode = 5
  AND c.name IN ('Bright Red', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Phthalo Green', 'Titanium White', 'Van Dyke Brown');

-- Ep 8 Evening Waterfall — 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 12 AND e.episode = 8
  AND c.name IN ('Bright Red', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 9 Tropical Seascape — 11 colors (no Sap Green).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 12 AND e.episode = 9
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 12 Mountain in an Oval — 11 colors (no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 12 AND e.episode = 12
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 13 Winter Mountain — 7 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 12 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Midnight Black', 'Phthalo Blue',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');
