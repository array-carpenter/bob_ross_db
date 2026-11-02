-- The Joy of Painting: Season 31 (1994, final season)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (31,  1, 'Reflections of Calm',    'https://www.youtube.com/embed/kJFB6rH3z2A'),
    (31,  2, 'Before the Snowfall',    'https://www.youtube.com/embed/_MdMhQIOL1Y'),
    (31,  3, 'Winding Stream',         'https://www.youtube.com/embed/QDwd4pMYyuo'),
    (31,  4, 'Tranquility Cove',       'https://www.youtube.com/embed/7t6ue0pEcNE'),
    (31,  5, 'Cabin in the Hollow',    'https://www.youtube.com/embed/KYlM2zJnNWY'),
    (31,  6, 'View from Clear Creek',  'https://www.youtube.com/embed/TLX1bmS8wBE'),
    (31,  7, 'Bridge to Autumn',       'https://www.youtube.com/embed/ReENCTH7MYI'),
    (31,  8, "Trail's End",            'https://www.youtube.com/embed/XWQrP-WiLgc'),
    (31,  9, 'Evergreen Valley',       'https://www.youtube.com/embed/mEU0stNfkxI'),
    (31, 10, 'Balmy Beach',            'https://www.youtube.com/embed/kMgd6r6c4vE'),
    (31, 11, 'Lake at the Ridge',      'https://www.youtube.com/embed/8QWvzEQ69Kw'),
    (31, 12, 'In the Midst of Winter', 'https://www.youtube.com/embed/qx2IsmrCs3c'),
    (31, 13, 'Wilderness Day',         'https://www.youtube.com/embed/nJGCVFn57U8');

-- Eps 6 View from Clear Creek & 9 Evergreen Valley: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 31 AND e.episode IN (6, 9)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Eps 1, 3, 11: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 31 AND e.episode IN (1, 3, 11)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 2, 5, 12: identical 7-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 31 AND e.episode IN (2, 5, 12)
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Prussian Blue', 'Titanium White', 'Van Dyke Brown');

-- Eps 4 Tranquility Cove & 13 Wilderness Day: identical 11-color set (Phthalo Blue, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 31 AND e.episode IN (4, 13)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 7 Bridge to Autumn: 11 colors (Prussian Blue, no Phthalo Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 31 AND e.episode = 7
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Prussian Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 8 Trail's End: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 31 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Midnight Black', 'Phthalo Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 Balmy Beach: 11 colors (Phthalo Green, no Sap Green, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 31 AND e.episode = 10
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');
