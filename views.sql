
-- =====================================================
-- VIEW 1 - PLAYER TELEMETRY SUMMARY
-- =====================================================

CREATE VIEW vw_player_telemetry_summary AS
SELECT
    player_id,
    COUNT(*) AS total_events,
    MIN(tic) AS first_tic,
    MAX(tic) AS last_tic,
    MAX(tic)-MIN(tic) AS trajectory_duration
FROM telemetry_event
GROUP BY player_id;

-- =====================================================
-- VIEW 2 - PLAYER UX SUMMARY
-- =====================================================

CREATE VIEW vw_player_ux_summary AS
SELECT
    p.player_id,
    p.nickname,
    ROUND(AVG(uri.score),2) AS average_score
FROM players p
JOIN users u ON p.user_id=u.user_id
JOIN ux_responses ur ON u.user_id=ur.user_id
JOIN ux_response_items uri ON ur.response_id=uri.response_id
GROUP BY p.player_id,p.nickname;

-- =====================================================
-- MATERIALIZED VIEW - PLAYER MOVEMENT STATS
-- =====================================================

CREATE MATERIALIZED VIEW mv_player_movement_stats AS
SELECT
    player_id,
    COUNT(*) AS total_events,
    MIN(event_time) AS first_event,
    MAX(event_time) AS last_event,
    MAX(tic)-MIN(tic) AS total_tics
FROM telemetry_event
GROUP BY player_id;

-- =====================================================
-- END OF VIEWS
-- =====================================================
