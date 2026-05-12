CREATE VIEW player_session_summary AS
SELECT
    COUNT(t.telemetry_id) AS telemetry_events,
    MIN(t.tic) AS first_tic,
    MAX(t.tic) AS last_tic,
    AVG(t.angle) AS average_angle
FROM telemetry_event t;

CREATE VIEW movement_summary AS
SELECT
    AVG(ABS(momentum_x)) AS avg_momentum_x,
    AVG(ABS(momentum_y)) AS avg_momentum_y,
    AVG(pos_z) AS average_height
FROM telemetry_event;

CREATE MATERIALIZED VIEW player_distance_summary AS
SELECT
    COUNT(*) AS total_events,
    AVG(pos_x) AS avg_x,
    AVG(pos_y) AS avg_y
FROM telemetry_event;