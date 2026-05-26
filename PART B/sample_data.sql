-- =========================================
-- UX INSTRUMENTS
-- =========================================

INSERT INTO ux_instruments (instrument_name)
VALUES ('BANGS');

-- =========================================
-- UX ITEMS
-- =========================================

INSERT INTO ux_items (instrument_id, question_text)
VALUES
(1, 'I felt competent while playing'),
(1, 'I felt immersed in the game'),
(1, 'I enjoyed cooperating with teammates'),
(1, 'I felt challenged during gameplay'),
(1, 'I would play this game again');

-- =========================================
-- USERS
-- =========================================

INSERT INTO users
(full_name, age, gender, experience_level, consent_signed)
VALUES
('Juan Rojas', 19, 'Male', 'Intermediate', TRUE),
('Carlos Diaz', 21, 'Male', 'Advanced', TRUE),
('Ana Torres', 20, 'Female', 'Beginner', TRUE),
('Laura Gomez', 22, 'Female', 'Intermediate', TRUE),
('David Ruiz', 23, 'Male', 'Advanced', TRUE),
('Sara Lopez', 19, 'Female', 'Beginner', TRUE);

-- =========================================
-- PLAYERS
-- =========================================

INSERT INTO players
(user_id, nickname)
VALUES
(1, 'DoomSlayer1'),
(2, 'CyberDemonX'),
(3, 'FragQueen'),
(4, 'ShadowMarine'),
(5, 'HellHunter'),
(6, 'PixelDoom');

-- =========================================
-- EPISODES
-- =========================================

INSERT INTO episodes (episode_name)
VALUES
('Knee-Deep in the Dead'),
('The Shores of Hell'),
('Inferno');

-- =========================================
-- MAPS
-- =========================================

INSERT INTO maps
(episode_id, map_code, map_name)
VALUES
(1, 'E1M1', 'Hangar'),
(1, 'E1M2', 'Nuclear Plant'),

(2, 'E2M1', 'Deimos Anomaly'),
(2, 'E2M2', 'Containment Area'),

(3, 'E3M1', 'Hell Keep'),
(3, 'E3M2', 'Slough of Despair');

-- =========================================
-- SECTORS
-- =========================================

INSERT INTO sectors
(map_id, sector_name)
VALUES
(1, 'Central Room'),
(1, 'North Corridor'),

(2, 'Storage Area'),
(2, 'Control Room'),

(3, 'Teleport Zone'),
(3, 'Main Hall'),

(4, 'Security Sector'),
(4, 'Hidden Chamber'),

(5, 'Lava Pit'),
(5, 'Demon Gate'),

(6, 'Final Arena'),
(6, 'Boss Entrance');

-- =========================================
-- GAMES
-- =========================================

INSERT INTO games
(episode_id, start_time, end_time, difficulty)
VALUES
(1, '2026-05-01 14:00:00', '2026-05-01 14:45:00', 'Hurt Me Plenty'),

(2, '2026-05-02 16:00:00', '2026-05-02 16:50:00', 'Ultra-Violence'),

(3, '2026-05-03 18:00:00', '2026-05-03 19:10:00', 'Nightmare');

-- =========================================
-- GAME PARTICIPANTS
-- =========================================

INSERT INTO game_participants
(game_id, player_id)
VALUES
(1,1),
(1,2),
(1,3),

(2,2),
(2,4),
(2,5),

(3,1),
(3,5),
(3,6);

-- =========================================
-- UX RESPONSES
-- =========================================

INSERT INTO ux_responses
(user_id, instrument_id, response_date)
VALUES
(1,1,CURRENT_DATE),
(2,1,CURRENT_DATE),
(3,1,CURRENT_DATE),
(4,1,CURRENT_DATE),
(5,1,CURRENT_DATE),
(6,1,CURRENT_DATE);

-- =========================================
-- UX RESPONSE ITEMS
-- =========================================

INSERT INTO ux_response_items
(response_id, item_id, score)
VALUES
(1,1,5),
(1,2,4),
(1,3,5),
(1,4,3),
(1,5,5),

(2,1,4),
(2,2,5),
(2,3,4),
(2,4,4),
(2,5,5),

(3,1,3),
(3,2,4),
(3,3,3),
(3,4,5),
(3,5,4),

(4,1,5),
(4,2,5),
(4,3,4),
(4,4,4),
(4,5,5),

(5,1,4),
(5,2,3),
(5,3,5),
(5,4,5),
(5,5,4),

(6,1,3),
(6,2,4),
(6,3,4),
(6,4,3),
(6,5,4);

-- =========================================
-- TELEMETRY DATASET (25K ROWS)
-- =========================================

INSERT INTO telemetry_event
(
    game_id,
    player_id,
    sector_id,
    tic,
    event_time,

    pos_x,
    pos_y,
    pos_z,

    angle,
    fov,

    momentum_x,
    momentum_y,
    momentum_z,

    health,
    armor,
    ammo
)

SELECT
    (random()*2 + 1)::INT,
    (random()*5 + 1)::INT,
    (random()*11 + 1)::INT,

    gs AS tic,

    CURRENT_TIMESTAMP + (gs || ' seconds')::INTERVAL,

    random()*1000,
    random()*1000,
    random()*50,

    random()*360,
    90 + random()*30,

    random()*5,
    random()*5,
    random()*2,

    (50 + random()*50)::INT,
    (random()*100)::INT,
    (10 + random()*90)::INT

FROM generate_series(1, 25000) AS gs;