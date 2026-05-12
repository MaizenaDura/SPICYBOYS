CREATE INDEX idx_telemetry_tic
ON telemetry_event(tic);

CREATE INDEX idx_telemetry_event_time
ON telemetry_event(event_time);

CREATE INDEX idx_telemetry_position
ON telemetry_event(pos_x, pos_y, pos_z);

CREATE INDEX idx_player_user
ON players(user_id);

CREATE INDEX idx_sector_map
ON sectors(map_id);

CREATE INDEX idx_game_episode
ON games(episode_id);