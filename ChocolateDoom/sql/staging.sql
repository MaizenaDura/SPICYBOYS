INSERT INTO telemetry_event (
    event_time,
    tic,
    pos_x,
    pos_y,
    pos_z,
    angle,
    momentum_x,
    momentum_y
)
SELECT
    CURRENT_TIMESTAMP,
    CAST(tic AS INT),
    CAST(pos_x AS FLOAT),
    CAST(pos_y AS FLOAT),
    CAST(pos_z AS FLOAT),
    CAST(angle AS FLOAT),
    CAST(momx AS FLOAT),
    CAST(momy AS FLOAT)
FROM telemetry_staging
WHERE tic IS NOT NULL
AND tic <> '';