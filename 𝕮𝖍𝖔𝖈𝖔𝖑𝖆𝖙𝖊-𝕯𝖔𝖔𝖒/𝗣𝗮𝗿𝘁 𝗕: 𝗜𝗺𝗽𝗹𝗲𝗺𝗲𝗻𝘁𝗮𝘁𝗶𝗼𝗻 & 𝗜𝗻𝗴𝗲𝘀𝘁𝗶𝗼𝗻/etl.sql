
-- =====================================================
-- INVALID RECORDS -> ERROR LOG
-- =====================================================

INSERT INTO telemetry_error_log (
    raw_record,
    error_message
)

SELECT

    CONCAT_WS(
        ';',
        timestamp_raw,
        tic,
        pos_x,
        pos_y,
        pos_z,
        angle,
        momx,
        momy,
        extra_flag
    ),

    'Invalid tic value'

FROM staging_telemetry

WHERE tic !~ '^[0-9]+$';

-- =====================================================
-- STAGING -> TELEMETRY_EVENT
-- =====================================================

INSERT INTO telemetry_event (

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

    1,

    1,

    NULL,

    CAST(tic AS INTEGER),

    CAST(timestamp_raw AS TIMESTAMP),

    CAST(pos_x AS DOUBLE PRECISION),
    CAST(pos_y AS DOUBLE PRECISION),
    CAST(pos_z AS DOUBLE PRECISION),

    CAST(angle AS DOUBLE PRECISION),

    NULL,

    CAST(momx AS DOUBLE PRECISION),
    CAST(momy AS DOUBLE PRECISION),

    NULL,

    NULL,
    NULL,
    NULL

FROM staging_telemetry

WHERE tic ~ '^[0-9]+$';

-- =====================================================
-- END OF ETL
-- =====================================================
