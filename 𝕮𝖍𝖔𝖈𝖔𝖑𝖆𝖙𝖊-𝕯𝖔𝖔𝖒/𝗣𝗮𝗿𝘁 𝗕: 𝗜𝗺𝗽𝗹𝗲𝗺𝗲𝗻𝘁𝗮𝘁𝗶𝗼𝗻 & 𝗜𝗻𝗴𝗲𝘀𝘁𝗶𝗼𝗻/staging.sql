
-- =====================================================
-- STAGING TELEMETRY
-- =====================================================

CREATE TABLE staging_telemetry (

    timestamp_raw TEXT,

    tic TEXT,

    pos_x TEXT,
    pos_y TEXT,
    pos_z TEXT,

    angle TEXT,

    momx TEXT,
    momy TEXT,

    extra_flag TEXT
);

-- =====================================================
-- TELEMETRY ERROR LOG
-- =====================================================

CREATE TABLE telemetry_error_log (

    error_id SERIAL PRIMARY KEY,

    raw_record TEXT NOT NULL,

    error_message TEXT NOT NULL,

    error_timestamp TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- END OF STAGING
-- =====================================================
