# Assumptions

1. The modified Chocolate Doom engine generates telemetry continuously during gameplay.

2. Telemetry data is exported as structured text output and stored in TSV format.

3. Each telemetry record represents a single gameplay state sample.

4. Each player belongs to a single user account.

5. A game session may contain multiple players.

6. Each telemetry event belongs to one game session and one player.

7. PostgreSQL will be used as the database management system.

8. Synthetic telemetry data may be generated to complement real gameplay data.

9. The system will be used exclusively for academic and research purposes.SSSSS