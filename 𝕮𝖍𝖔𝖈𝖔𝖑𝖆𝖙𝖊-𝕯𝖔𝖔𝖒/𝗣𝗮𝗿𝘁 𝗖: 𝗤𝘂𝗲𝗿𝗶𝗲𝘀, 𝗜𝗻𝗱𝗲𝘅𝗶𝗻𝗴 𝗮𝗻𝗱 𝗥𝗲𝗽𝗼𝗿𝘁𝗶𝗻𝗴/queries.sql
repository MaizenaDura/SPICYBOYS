-- =====================================================
-- QUERY 1 - AVERAGE GAME SESSION DURATION PER MAP
-- =====================================================

SELECT
m.map_code,
m.map_name,
ROUND(AVG(EXTRACT(EPOCH FROM (g.end_time-g.start_time))/60),2) AS avg_duration_minutes
FROM games g
JOIN maps m ON g.map_id=m.map_id
GROUP BY m.map_code,m.map_name
ORDER BY avg_duration_minutes DESC;

-- =====================================================
-- QUERY 2 - TRAJECTORY DURATION PER PLAYER
-- =====================================================

SELECT
player_id,
MIN(tic) AS first_tic,
MAX(tic) AS last_tic,
MAX(tic)-MIN(tic) AS trajectory_duration
FROM telemetry_event
GROUP BY player_id;

-- =====================================================
-- QUERY 3 - UX RESPONSES FOR PLAYERS WITH
-- ABOVE-AVERAGE TRAJECTORY DURATION
-- =====================================================

SELECT
p.nickname,
ur.response_id,
ur.response_date
FROM players p
JOIN users u ON p.user_id=u.user_id
JOIN ux_responses ur ON u.user_id=ur.user_id
WHERE p.player_id IN (
SELECT player_id
FROM telemetry_event
GROUP BY player_id
HAVING MAX(tic)-MIN(tic)>(
SELECT AVG(duration)
FROM (
SELECT MAX(tic)-MIN(tic) AS duration
FROM telemetry_event
GROUP BY player_id
) t
)
);

-- =====================================================
-- QUERY 4 - MOST VISITED AREA (HOTSPOT)
-- =====================================================

SELECT
FLOOR(pos_x/100)*100 AS zone_x,
FLOOR(pos_y/100)*100 AS zone_y,
COUNT(*) AS visits
FROM telemetry_event
GROUP BY zone_x,zone_y
ORDER BY visits DESC
LIMIT 20;

-- =====================================================
-- QUERY 5 - AVERAGE UX SCORE PER PLAYER
-- =====================================================

SELECT
p.nickname,
ROUND(AVG(uri.score),2) AS average_score
FROM players p
JOIN users u ON p.user_id=u.user_id
JOIN ux_responses ur ON u.user_id=ur.user_id
JOIN ux_response_items uri ON ur.response_id=uri.response_id
GROUP BY p.nickname
ORDER BY average_score DESC;

-- =====================================================
-- QUERY 6 - TOTAL TELEMETRY EVENTS PER PLAYER
-- =====================================================

SELECT
p.nickname,
COUNT(*) AS total_events
FROM telemetry_event te
JOIN players p ON te.player_id=p.player_id
GROUP BY p.nickname
ORDER BY total_events DESC;

-- =====================================================
-- END OF ANALYTICAL QUERIES
-- =====================================================
