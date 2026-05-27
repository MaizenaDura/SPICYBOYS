CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 0),
    gender VARCHAR(20),
    experience_level VARCHAR(50),
    consent_signed BOOLEAN NOT NULL
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    nickname VARCHAR(50) NOT NULL
);

CREATE TABLE episodes (
    episode_id SERIAL PRIMARY KEY,
    episode_name VARCHAR(100) NOT NULL
);

CREATE TABLE maps (
    map_id SERIAL PRIMARY KEY,
    episode_id INT REFERENCES episodes(episode_id),
    map_code VARCHAR(20),
    map_name VARCHAR(100)
);

CREATE TABLE sectors (
    sector_id SERIAL PRIMARY KEY,
    map_id INT REFERENCES maps(map_id),
    sector_name VARCHAR(100)
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    episode_id INT REFERENCES episodes(episode_id),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    difficulty VARCHAR(50)
);

CREATE TABLE game_participants (
    game_id INT REFERENCES games(game_id),
    player_id INT REFERENCES players(player_id),

    PRIMARY KEY (game_id, player_id)
);

CREATE TABLE telemetry_event (
    telemetry_id SERIAL PRIMARY KEY,

    game_id INT REFERENCES games(game_id),
    player_id INT REFERENCES players(player_id),
    sector_id INT REFERENCES sectors(sector_id),

    tic INT NOT NULL,

    event_time TIMESTAMP NOT NULL,

    pos_x FLOAT,
    pos_y FLOAT,
    pos_z FLOAT,

    angle FLOAT,
    fov FLOAT,

    momentum_x FLOAT,
    momentum_y FLOAT,
    momentum_z FLOAT,

    health INT,
    armor INT,
    ammo INT
);

CREATE TABLE ux_instruments (
    instrument_id SERIAL PRIMARY KEY,
    instrument_name VARCHAR(100)
);

CREATE TABLE ux_items (
    item_id SERIAL PRIMARY KEY,
    instrument_id INT REFERENCES ux_instruments(instrument_id),
    question_text TEXT
);

CREATE TABLE ux_responses (
    response_id SERIAL PRIMARY KEY,

    user_id INT REFERENCES users(user_id),
    instrument_id INT REFERENCES ux_instruments(instrument_id),

    response_date DATE
);

CREATE TABLE ux_response_items (
    response_id INT REFERENCES ux_responses(response_id),
    item_id INT REFERENCES ux_items(item_id),

    score INT,

    PRIMARY KEY (response_id, item_id)
);