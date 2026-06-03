# Assumptions and Requirements

## 1. Assumptions

1. The modified Chocolate Doom engine generates telemetry data continuously during gameplay and produces one telemetry record per tic.

2. Telemetry data is exported in Tab-Separated Values (TSV) format and can be loaded into the database through an ETL process.

3. Each telemetry event corresponds to a unique combination of game session, player, and tic.

4. A game session may involve one or more players participating simultaneously.

5. Each player identity is associated with a single volunteer user, while a user may own one or more player aliases.

6. Telemetry events include positional data (x, y, z), orientation, momentum, combat statistics, and level-related information such as episode, map, and sector.

7. UX data is collected using one of the supported instruments: PENS, GUESS, or BANGS.

8. Survey responses are submitted by volunteer participants after or independently from gameplay sessions and are linked to the corresponding user.

9. The database will aggregate telemetry from multiple gameplay sessions to support behavioral, movement, and cooperation analyses.

10. Synthetic data may be generated to satisfy testing, validation, and project population requirements.

11. PostgreSQL is used as the database management system due to its support for indexing, analytical queries, and advanced data integrity mechanisms.

12. The system is intended exclusively for academic and research purposes.

---

## 2. Functional Requirements

1. The system must store volunteer user information, including demographic attributes and consent status.

2. The system must manage player identities and their association with users.

3. The system must store gameplay session information, including start time, end time, and configuration metadata.

4. The system must store episode, map, and sector information associated with gameplay sessions.

5. The system must store telemetry events generated at each tic during gameplay.

6. The system must record player position coordinates (x, y, z), viewing angle, momentum, field of view, health, armor, and ammunition values.

7. The system must support the ingestion of telemetry records from TSV files through a staging-to-core ETL process.

8. The system must validate telemetry records before loading them into operational tables.

9. The system must detect and prevent duplicate telemetry records based on the combination of game session, player, and tic.

10. The system must store UX instruments, survey items, and user responses.

11. The system must support the association between users and their corresponding UX survey responses.

12. The system must support analytical queries related to player trajectories.

13. The system must support analytical queries related to player proximity and cooperation.

14. The system must support hotspot analysis based on player activity within sectors.

15. The system must support aggregation of telemetry information across multiple gameplay sessions.

16. The system must provide reusable views and materialized views for recurring analyses.

---

## 3. Non-Functional Requirements

1. The database must maintain referential integrity through primary keys, foreign keys, and domain constraints.

2. The database design must comply with Third Normal Form (3NF) to minimize redundancy and update anomalies.

3. The system must support efficient storage and retrieval of high-frequency telemetry data.

4. The database must be scalable to accommodate datasets containing tens of thousands of telemetry events.

5. The system must provide acceptable analytical query performance through indexing strategies.

6. The ETL process must ensure data quality through validation, transformation, and error logging mechanisms.

7. The database schema and sample data loading process must be reproducible through documented scripts.

8. The system must ensure consistency between gameplay, telemetry, and survey data.

9. The database must support future extensions without requiring major structural changes.

---

## 4. Ethics and Privacy Requirements

1. Participation in the study must be voluntary.

2. Informed consent must be obtained before collecting demographic, gameplay, or survey data.

3. Personal information must be used exclusively for academic and research purposes.

4. Access to participant information must be restricted to authorized researchers.

5. User identities must be represented through controlled identifiers whenever possible.

6. Telemetry and survey data must not be used to identify participants outside the scope of the study.

7. Sensitive personal information must be protected against unauthorized access.

8. Synthetic datasets may be used for testing, demonstrations, and performance evaluations to reduce exposure of participant data.

---

## 5. Design Decisions

1. PostgreSQL is selected as the database management system.

2. A staging-to-core ETL architecture will be used to separate raw telemetry ingestion from validated operational data.

3. Telemetry data will be modeled at tic level to preserve temporal accuracy for movement analysis.

4. Spatial and analytical indexes will be implemented to improve query performance.

5. Materialized views will be used to optimize frequently executed analytical reports.

6. The schema will be designed to support trajectory analysis, proximity detection, sector co-occurrence analysis, and UX correlation studies.
