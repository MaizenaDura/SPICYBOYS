SELECT
    tic,
    pos_x,
    pos_y,
    pos_z
FROM telemetry_event
ORDER BY tic;

SELECT
    AVG(ABS(momentum_x)) AS avg_momentum_x,
    AVG(ABS(momentum_y)) AS avg_momentum_y
FROM telemetry_event;

SELECT
    FLOOR(pos_x / 100) * 100 AS zone_x,
    FLOOR(pos_y / 100) * 100 AS zone_y,
    COUNT(*) AS visits
FROM telemetry_event
GROUP BY zone_x, zone_y
ORDER BY visits DESC;

SELECT
    tic,
    pos_x,
    pos_y,
    momentum_x,
    momentum_y
FROM telemetry_event
WHERE ABS(momentum_x) > 5
OR ABS(momentum_y) > 5;

SELECT
    AVG(pos_z) AS average_height
FROM telemetry_event;

SELECT
    COUNT(*) AS total_events,
    MIN(tic) AS first_tic,
    MAX(tic) AS last_tic,
    AVG(angle) AS average_angle
FROM telemetry_event;