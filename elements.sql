-- Subject tags from FiveThirtyEight's "A Statistical Analysis of the Work of Bob Ross" (CC BY 4.0).
-- Run by build.sh after the CSV is imported into stage_538.

INSERT INTO elements (name) VALUES
    ('apple_frame'),
    ('aurora_borealis'),
    ('barn'),
    ('beach'),
    ('boat'),
    ('bridge'),
    ('building'),
    ('bushes'),
    ('cabin'),
    ('cactus'),
    ('circle_frame'),
    ('cirrus'),
    ('cliff'),
    ('clouds'),
    ('conifer'),
    ('cumulus'),
    ('deciduous'),
    ('diane_andre'),
    ('dock'),
    ('double_oval_frame'),
    ('farm'),
    ('fence'),
    ('fire'),
    ('florida_frame'),
    ('flowers'),
    ('fog'),
    ('framed'),
    ('grass'),
    ('guest'),
    ('half_circle_frame'),
    ('half_oval_frame'),
    ('hills'),
    ('lake'),
    ('lakes'),
    ('lighthouse'),
    ('mill'),
    ('moon'),
    ('mountain'),
    ('mountains'),
    ('night'),
    ('ocean'),
    ('oval_frame'),
    ('palm_trees'),
    ('path'),
    ('person'),
    ('portrait'),
    ('rectangle_3d_frame'),
    ('rectangular_frame'),
    ('river'),
    ('rocks'),
    ('seashell_frame'),
    ('snow'),
    ('snowy_mountain'),
    ('split_frame'),
    ('steve_ross'),
    ('structure'),
    ('sun'),
    ('tomb_frame'),
    ('tree'),
    ('trees'),
    ('triple_frame'),
    ('waterfall'),
    ('waves'),
    ('windmill'),
    ('window_frame'),
    ('winter'),
    ('wood_framed');

INSERT INTO episode_elements (episode_id, element_id)
SELECT e.id, el.id
FROM (
    SELECT EPISODE, 'apple_frame' AS name FROM stage_538 WHERE APPLE_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'aurora_borealis' AS name FROM stage_538 WHERE AURORA_BOREALIS = '1'
    UNION ALL
    SELECT EPISODE, 'barn' AS name FROM stage_538 WHERE BARN = '1'
    UNION ALL
    SELECT EPISODE, 'beach' AS name FROM stage_538 WHERE BEACH = '1'
    UNION ALL
    SELECT EPISODE, 'boat' AS name FROM stage_538 WHERE BOAT = '1'
    UNION ALL
    SELECT EPISODE, 'bridge' AS name FROM stage_538 WHERE BRIDGE = '1'
    UNION ALL
    SELECT EPISODE, 'building' AS name FROM stage_538 WHERE BUILDING = '1'
    UNION ALL
    SELECT EPISODE, 'bushes' AS name FROM stage_538 WHERE BUSHES = '1'
    UNION ALL
    SELECT EPISODE, 'cabin' AS name FROM stage_538 WHERE CABIN = '1'
    UNION ALL
    SELECT EPISODE, 'cactus' AS name FROM stage_538 WHERE CACTUS = '1'
    UNION ALL
    SELECT EPISODE, 'circle_frame' AS name FROM stage_538 WHERE CIRCLE_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'cirrus' AS name FROM stage_538 WHERE CIRRUS = '1'
    UNION ALL
    SELECT EPISODE, 'cliff' AS name FROM stage_538 WHERE CLIFF = '1'
    UNION ALL
    SELECT EPISODE, 'clouds' AS name FROM stage_538 WHERE CLOUDS = '1'
    UNION ALL
    SELECT EPISODE, 'conifer' AS name FROM stage_538 WHERE CONIFER = '1'
    UNION ALL
    SELECT EPISODE, 'cumulus' AS name FROM stage_538 WHERE CUMULUS = '1'
    UNION ALL
    SELECT EPISODE, 'deciduous' AS name FROM stage_538 WHERE DECIDUOUS = '1'
    UNION ALL
    SELECT EPISODE, 'diane_andre' AS name FROM stage_538 WHERE DIANE_ANDRE = '1'
    UNION ALL
    SELECT EPISODE, 'dock' AS name FROM stage_538 WHERE DOCK = '1'
    UNION ALL
    SELECT EPISODE, 'double_oval_frame' AS name FROM stage_538 WHERE DOUBLE_OVAL_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'farm' AS name FROM stage_538 WHERE FARM = '1'
    UNION ALL
    SELECT EPISODE, 'fence' AS name FROM stage_538 WHERE FENCE = '1'
    UNION ALL
    SELECT EPISODE, 'fire' AS name FROM stage_538 WHERE FIRE = '1'
    UNION ALL
    SELECT EPISODE, 'florida_frame' AS name FROM stage_538 WHERE FLORIDA_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'flowers' AS name FROM stage_538 WHERE FLOWERS = '1'
    UNION ALL
    SELECT EPISODE, 'fog' AS name FROM stage_538 WHERE FOG = '1'
    UNION ALL
    SELECT EPISODE, 'framed' AS name FROM stage_538 WHERE FRAMED = '1'
    UNION ALL
    SELECT EPISODE, 'grass' AS name FROM stage_538 WHERE GRASS = '1'
    UNION ALL
    SELECT EPISODE, 'guest' AS name FROM stage_538 WHERE GUEST = '1'
    UNION ALL
    SELECT EPISODE, 'half_circle_frame' AS name FROM stage_538 WHERE HALF_CIRCLE_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'half_oval_frame' AS name FROM stage_538 WHERE HALF_OVAL_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'hills' AS name FROM stage_538 WHERE HILLS = '1'
    UNION ALL
    SELECT EPISODE, 'lake' AS name FROM stage_538 WHERE LAKE = '1'
    UNION ALL
    SELECT EPISODE, 'lakes' AS name FROM stage_538 WHERE LAKES = '1'
    UNION ALL
    SELECT EPISODE, 'lighthouse' AS name FROM stage_538 WHERE LIGHTHOUSE = '1'
    UNION ALL
    SELECT EPISODE, 'mill' AS name FROM stage_538 WHERE MILL = '1'
    UNION ALL
    SELECT EPISODE, 'moon' AS name FROM stage_538 WHERE MOON = '1'
    UNION ALL
    SELECT EPISODE, 'mountain' AS name FROM stage_538 WHERE MOUNTAIN = '1'
    UNION ALL
    SELECT EPISODE, 'mountains' AS name FROM stage_538 WHERE MOUNTAINS = '1'
    UNION ALL
    SELECT EPISODE, 'night' AS name FROM stage_538 WHERE NIGHT = '1'
    UNION ALL
    SELECT EPISODE, 'ocean' AS name FROM stage_538 WHERE OCEAN = '1'
    UNION ALL
    SELECT EPISODE, 'oval_frame' AS name FROM stage_538 WHERE OVAL_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'palm_trees' AS name FROM stage_538 WHERE PALM_TREES = '1'
    UNION ALL
    SELECT EPISODE, 'path' AS name FROM stage_538 WHERE PATH = '1'
    UNION ALL
    SELECT EPISODE, 'person' AS name FROM stage_538 WHERE PERSON = '1'
    UNION ALL
    SELECT EPISODE, 'portrait' AS name FROM stage_538 WHERE PORTRAIT = '1'
    UNION ALL
    SELECT EPISODE, 'rectangle_3d_frame' AS name FROM stage_538 WHERE RECTANGLE_3D_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'rectangular_frame' AS name FROM stage_538 WHERE RECTANGULAR_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'river' AS name FROM stage_538 WHERE RIVER = '1'
    UNION ALL
    SELECT EPISODE, 'rocks' AS name FROM stage_538 WHERE ROCKS = '1'
    UNION ALL
    SELECT EPISODE, 'seashell_frame' AS name FROM stage_538 WHERE SEASHELL_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'snow' AS name FROM stage_538 WHERE SNOW = '1'
    UNION ALL
    SELECT EPISODE, 'snowy_mountain' AS name FROM stage_538 WHERE SNOWY_MOUNTAIN = '1'
    UNION ALL
    SELECT EPISODE, 'split_frame' AS name FROM stage_538 WHERE SPLIT_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'steve_ross' AS name FROM stage_538 WHERE STEVE_ROSS = '1'
    UNION ALL
    SELECT EPISODE, 'structure' AS name FROM stage_538 WHERE STRUCTURE = '1'
    UNION ALL
    SELECT EPISODE, 'sun' AS name FROM stage_538 WHERE SUN = '1'
    UNION ALL
    SELECT EPISODE, 'tomb_frame' AS name FROM stage_538 WHERE TOMB_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'tree' AS name FROM stage_538 WHERE TREE = '1'
    UNION ALL
    SELECT EPISODE, 'trees' AS name FROM stage_538 WHERE TREES = '1'
    UNION ALL
    SELECT EPISODE, 'triple_frame' AS name FROM stage_538 WHERE TRIPLE_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'waterfall' AS name FROM stage_538 WHERE WATERFALL = '1'
    UNION ALL
    SELECT EPISODE, 'waves' AS name FROM stage_538 WHERE WAVES = '1'
    UNION ALL
    SELECT EPISODE, 'windmill' AS name FROM stage_538 WHERE WINDMILL = '1'
    UNION ALL
    SELECT EPISODE, 'window_frame' AS name FROM stage_538 WHERE WINDOW_FRAME = '1'
    UNION ALL
    SELECT EPISODE, 'winter' AS name FROM stage_538 WHERE WINTER = '1'
    UNION ALL
    SELECT EPISODE, 'wood_framed' AS name FROM stage_538 WHERE WOOD_FRAMED = '1'
) t
JOIN episodes e  ON e.season = CAST(substr(t.EPISODE, 2, 2) AS INTEGER)
               AND e.episode = CAST(substr(t.EPISODE, 5, 2) AS INTEGER)
JOIN elements el ON el.name = t.name;

DROP TABLE stage_538;
