
-- =====================================================
-- EPISODES
-- =====================================================

INSERT INTO episodes (episode_name) VALUES
('Knee-Deep in the Dead'),
('The Shores of Hell'),
('Inferno');

-- =====================================================
-- MAPS
-- =====================================================

INSERT INTO maps (
    episode_id,
    map_code,
    map_name
) VALUES

(1, 'E1M1', 'Hangar'),
(1, 'E1M2', 'Nuclear Plant'),

(2, 'E2M1', 'Deimos Anomaly'),
(2, 'E2M2', 'Containment Area'),

(3, 'E3M1', 'Hell Keep'),
(3, 'E3M2', 'Slough of Despair');

-- =====================================================
-- SECTORS
-- =====================================================

INSERT INTO sectors (
    map_id,
    sector_name
) VALUES

(1, 'Central Area'),
(1, 'North Corridor'),

(2, 'Control Room'),
(2, 'Storage Area'),

(3, 'Teleport Zone'),
(3, 'Main Hall'),

(4, 'West Wing'),
(4, 'East Wing'),

(5, 'Outer Yard'),
(5, 'Inner Fortress'),

(6, 'Bridge'),
(6, 'Final Chamber');

-- =====================================================
-- USERS
-- =====================================================

INSERT INTO users (
    full_name,
    age,
    gender,
    experience_level,
    consent_signed
) VALUES

('Juan Rojas', 20, 'Male', 'Advanced', TRUE),
('Maria Gomez', 21, 'Female', 'Intermediate', TRUE),
('Carlos Ruiz', 22, 'Male', 'Beginner', TRUE),
('Laura Torres', 20, 'Female', 'Advanced', TRUE),
('Andres Perez', 23, 'Male', 'Intermediate', TRUE),
('Sofia Martinez', 21, 'Female', 'Beginner', TRUE);

-- =====================================================
-- PLAYERS
-- =====================================================

INSERT INTO players (
    user_id,
    nickname
) VALUES

(1, 'DoomSlayer01'),
(2, 'CyberMaria'),
(3, 'RookieMarine'),
(4, 'NightHunter'),
(5, 'TechSoldier'),
(6, 'DemonCrusher');

-- =====================================================
-- GAMES
-- =====================================================

INSERT INTO games (
    map_id,
    start_time,
    end_time,
    difficulty
) VALUES

(
    1,
    '2026-06-01 18:00:00',
    '2026-06-01 18:45:00',
    'Ultra-Violence'
),

(
    3,
    '2026-06-02 19:00:00',
    '2026-06-02 19:40:00',
    'Hurt Me Plenty'
),

(
    5,
    '2026-06-03 20:00:00',
    '2026-06-03 20:50:00',
    'Ultra-Violence'
);

-- =====================================================
-- GAME PARTICIPANTS
-- =====================================================

INSERT INTO game_participants (
    game_id,
    player_id
) VALUES

(1,1),
(1,2),
(1,3),

(2,2),
(2,4),
(2,5),

(3,1),
(3,5),
(3,6);

-- =====================================================
-- UX INSTRUMENTS
-- =====================================================

INSERT INTO ux_instruments (
    instrument_name
) VALUES

('BANGS');

-- =====================================================
-- UX ITEMS (BANGS)
-- =====================================================

INSERT INTO ux_items (
    instrument_id,
    question_text
) VALUES

(1, 'I felt a sense of accomplishment while playing.'),
(1, 'The game made me feel competent.'),
(1, 'I felt challenged in a positive way.'),
(1, 'I felt engaged throughout the session.'),
(1, 'I had meaningful choices during gameplay.'),
(1, 'The game supported my autonomy.'),
(1, 'I felt connected to the game world.'),
(1, 'The gameplay experience was enjoyable.'),
(1, 'I would like to play again.'),
(1, 'Overall, I was satisfied with the experience.');

-- =====================================================
-- UX RESPONSES
-- =====================================================

INSERT INTO ux_responses (
    user_id,
    instrument_id,
    response_date
) VALUES

(1, 1, '2026-06-01'),
(2, 1, '2026-06-01'),
(3, 1, '2026-06-01'),
(4, 1, '2026-06-02'),
(5, 1, '2026-06-02'),
(6, 1, '2026-06-03');

-- =====================================================
-- UX RESPONSE ITEMS
-- =====================================================

INSERT INTO ux_response_items (
    response_id,
    item_id,
    score
)
SELECT
    r.response_id,
    i.item_id,
    4
FROM ux_responses r
CROSS JOIN ux_items i;

-- =====================================================
-- END OF SEED DATA
-- =====================================================
