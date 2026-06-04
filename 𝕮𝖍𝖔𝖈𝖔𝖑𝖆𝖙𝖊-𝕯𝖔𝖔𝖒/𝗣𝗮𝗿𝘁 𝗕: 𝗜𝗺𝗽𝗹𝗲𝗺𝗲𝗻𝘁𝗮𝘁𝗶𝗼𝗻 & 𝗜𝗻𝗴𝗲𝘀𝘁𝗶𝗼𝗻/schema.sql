
-- =====================================================
-- USERS
-- =====================================================

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0),
    gender VARCHAR(20),
    experience_level VARCHAR(50),
    consent_signed BOOLEAN NOT NULL
);

-- =====================================================
-- PLAYERS
-- =====================================================

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    nickname VARCHAR(50) NOT NULL
);

-- =====================================================
-- EPISODES
-- =====================================================

CREATE TABLE episodes (
    episode_id SERIAL PRIMARY KEY,
    episode_name VARCHAR(100) NOT NULL
);

-- =====================================================
-- MAPS
-- =====================================================

CREATE TABLE maps (
    map_id SERIAL PRIMARY KEY,
    episode_id INT NOT NULL REFERENCES episodes(episode_id),
    map_code VARCHAR(20) NOT NULL,
    map_name VARCHAR(100)
);

-- =====================================================
-- SECTORS
-- =====================================================

CREATE TABLE sectors (
    sector_id SERIAL PRIMARY KEY,
    map_id INT NOT NULL REFERENCES maps(map_id),
    sector_name VARCHAR(100)
);

-- =====================================================
-- GAMES
-- =====================================================

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,

    map_id INT NOT NULL
        REFERENCES maps(map_id),

    start_time TIMESTAMP NOT NULL,

    end_time TIMESTAMP NOT NULL,

    difficulty VARCHAR(50),

    CONSTRAINT chk_game_time
        CHECK (end_time > start_time)
);

-- =====================================================
-- GAME PARTICIPANTS
-- =====================================================

CREATE TABLE game_participants (
    game_id INT NOT NULL
        REFERENCES games(game_id),

    player_id INT NOT NULL
        REFERENCES players(player_id),

    PRIMARY KEY (game_id, player_id)
);

-- =====================================================
-- TELEMETRY EVENTS
-- =====================================================

CREATE TABLE telemetry_event (
    telemetry_id SERIAL PRIMARY KEY,

    game_id INT NOT NULL
        REFERENCES games(game_id),

    player_id INT NOT NULL
        REFERENCES players(player_id),

    sector_id INT
        REFERENCES sectors(sector_id),

    tic INT NOT NULL
        CHECK (tic >= 0),

    event_time TIMESTAMP NOT NULL,

    pos_x DOUBLE PRECISION,
    pos_y DOUBLE PRECISION,
    pos_z DOUBLE PRECISION,

    angle DOUBLE PRECISION,

    fov DOUBLE PRECISION
        CHECK (fov IS NULL OR fov > 0),

    momentum_x DOUBLE PRECISION,
    momentum_y DOUBLE PRECISION,
    momentum_z DOUBLE PRECISION,

    health INT
        CHECK (health IS NULL OR health >= 0),

    armor INT
        CHECK (armor IS NULL OR armor >= 0),

    ammo INT
        CHECK (ammo IS NULL OR ammo >= 0),

    CONSTRAINT uq_telemetry_event
        UNIQUE (game_id, player_id, tic)
);

-- =====================================================
-- UX INSTRUMENTS
-- =====================================================

CREATE TABLE ux_instruments (
    instrument_id SERIAL PRIMARY KEY,

    instrument_name VARCHAR(100)
        NOT NULL
        UNIQUE
);

-- =====================================================
-- UX ITEMS
-- =====================================================

CREATE TABLE ux_items (
    item_id SERIAL PRIMARY KEY,

    instrument_id INT NOT NULL
        REFERENCES ux_instruments(instrument_id),

    question_text TEXT NOT NULL
);

-- =====================================================
-- UX RESPONSES
-- =====================================================

CREATE TABLE ux_responses (
    response_id SERIAL PRIMARY KEY,

    user_id INT NOT NULL
        REFERENCES users(user_id),

    instrument_id INT NOT NULL
        REFERENCES ux_instruments(instrument_id),

    response_date DATE NOT NULL
);

-- =====================================================
-- UX RESPONSE ITEMS
-- =====================================================

CREATE TABLE ux_response_items (
    response_id INT NOT NULL
        REFERENCES ux_responses(response_id),

    item_id INT NOT NULL
        REFERENCES ux_items(item_id),

    score INT NOT NULL,

    PRIMARY KEY (response_id, item_id)
);

-- =====================================================
-- END OF SCHEMA
-- =====================================================