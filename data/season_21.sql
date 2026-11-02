-- The Joy of Painting: Season 21 (1993)

INSERT OR IGNORE INTO episodes (season, episode, title, youtube_url) VALUES
    (21,  1, 'Valley View',         'https://www.youtube.com/embed/pw5ETGiiBRg'),
    (21,  2, 'Tranquil Dawn',       'https://www.youtube.com/embed/4abDq6Q-mlM'),
    (21,  3, 'Royal Majesty',       'https://www.youtube.com/embed/ubUXBqE6t0U'),
    (21,  4, 'Serenity',            'https://www.youtube.com/embed/crqmO3qDdco'),
    (21,  5, 'Cabin at Trails End', 'https://www.youtube.com/embed/GLkLO4KqTRs'),
    (21,  6, 'Mountain Rhapsody',   'https://www.youtube.com/embed/H4VsmKU5T7g'),
    (21,  7, 'Wilderness Cabin',    'https://www.youtube.com/embed/GWehiacnd1E'),
    (21,  8, 'By the Sea',          'https://www.youtube.com/embed/8tHHBTK6wwc'),
    (21,  9, 'Indian Summer',       'https://www.youtube.com/embed/pfWV8NkotvU'),
    (21, 10, 'Blue Winter',         'https://www.youtube.com/embed/liR0gS0sZY0'),
    (21, 11, 'Desert Glow',         'https://www.youtube.com/embed/QyncJfL_HmU'),
    (21, 12, 'Lone Mountain',       'https://www.youtube.com/embed/NJbzIftLLmU'),
    (21, 13, "Florida's Glory",     'https://www.youtube.com/embed/HQC5sPN9Xhc');

-- Eps 1, 3, 9: identical 12-color set.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 21 AND e.episode IN (1, 3, 9)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Prussian Blue',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 4 Serenity & 5 Cabin at Trails End: identical 11-color set (no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 21 AND e.episode IN (4, 5)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Sap Green',
                 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Eps 7 Wilderness Cabin & 12 Lone Mountain: full 13-color palette.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 21 AND e.episode IN (7, 12)
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Prussian Blue', 'Sap Green', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 2 Tranquil Dawn: 9 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 21 AND e.episode = 2
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Titanium White', 'Van Dyke Brown',
                 'Yellow Ochre');

-- Ep 6 Mountain Rhapsody: 8 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 21 AND e.episode = 6
  AND c.name IN ('Alizarin Crimson', 'Dark Sienna', 'Indian Yellow', 'Midnight Black',
                 'Phthalo Blue', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 8 By the Sea: 12 colors (Phthalo Green, no Prussian Blue).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 21 AND e.episode = 8
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Dark Sienna',
                 'Indian Yellow', 'Midnight Black', 'Phthalo Blue', 'Phthalo Green',
                 'Sap Green', 'Titanium White', 'Van Dyke Brown', 'Yellow Ochre');

-- Ep 10 Blue Winter: 3 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 21 AND e.episode = 10
  AND c.name IN ('Midnight Black', 'Prussian Blue', 'Titanium White');

-- Ep 11 Desert Glow: 9 colors (no Dark Sienna, no Van Dyke Brown).
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 21 AND e.episode = 11
  AND c.name IN ('Alizarin Crimson', 'Bright Red', 'Cadmium Yellow', 'Indian Yellow',
                 'Midnight Black', 'Phthalo Blue', 'Sap Green', 'Titanium White',
                 'Yellow Ochre');

-- Ep 13 Florida's Glory: 10 colors.
INSERT OR IGNORE INTO episode_colors (episode_id, color_id)
SELECT e.id, c.id FROM episodes e JOIN colors c
WHERE e.season = 21 AND e.episode = 13
  AND c.name IN ('Alizarin Crimson', 'Cadmium Yellow', 'Dark Sienna', 'Midnight Black',
                 'Phthalo Blue', 'Prussian Blue', 'Sap Green', 'Titanium White',
                 'Van Dyke Brown', 'Yellow Ochre');
