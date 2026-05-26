CREATE TABLE IF NOT EXISTS telemetry_staging (
    raw_date TEXT,
    raw_time TEXT,
    tic TEXT,
    pos_x TEXT,
    pos_y TEXT,
    pos_z TEXT,
    angle TEXT,
    momentum_x TEXT,
    momentum_y TEXT,
    extra_flag TEXT
);


CREATE TABLE IF NOT EXISTS telemetry_error_log (
    error_id SERIAL PRIMARY KEY,
    raw_data TEXT,
    error_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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
    TO_TIMESTAMP(
        raw_date || ' ' || raw_time,
        'DD/MM/YYYY HH24:MI:SS'
    ),
    tic::INT,
    pos_x::FLOAT,
    pos_y::FLOAT,
    pos_z::FLOAT,
    angle::FLOAT,
    momx::FLOAT,
    momy::FLOAT
FROM telemetry_staging
WHERE tic IS NOT NULL
AND raw_date ~ '^[0-9]{2}/[0-9]{2}/[0-9]{4}$';