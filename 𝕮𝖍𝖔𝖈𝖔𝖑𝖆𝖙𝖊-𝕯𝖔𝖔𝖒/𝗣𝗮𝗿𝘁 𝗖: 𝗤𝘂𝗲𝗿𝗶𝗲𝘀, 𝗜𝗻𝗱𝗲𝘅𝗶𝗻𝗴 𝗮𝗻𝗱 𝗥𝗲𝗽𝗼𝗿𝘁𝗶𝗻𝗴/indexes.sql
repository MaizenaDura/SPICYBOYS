
-- =====================================================
-- TELEMETRY INDEXES
-- =====================================================

CREATE INDEX idx_telemetry_game_player_tic
ON telemetry_event(game_id, player_id, tic);

CREATE INDEX idx_telemetry_event_time
ON telemetry_event(event_time);

-- =====================================================
-- UX INDEXES
-- =====================================================

CREATE INDEX idx_ux_responses_user
ON ux_responses(user_id);

-- =====================================================
-- END OF INDEXES
-- =====================================================
