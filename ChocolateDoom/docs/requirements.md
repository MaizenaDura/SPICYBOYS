# Functional Requirements

1. The system must store telemetry data generated from the modified Chocolate Doom engine.

2. The system must store gameplay information at every tic generated during game sessions.

3. The system must record player positional data including X, Y, and Z coordinates.

4. The system must store player orientation and movement information such as angle and momentum.

5. The system must store gameplay session information including timestamps and map information.

6. The system must support the ingestion of telemetry data from TSV files.

7. The system must store demographic information of volunteer participants.

8. The system must support UX survey instruments including PENS, GUESS, and BANGS.

9. The system must store UX survey responses associated with users.

10. The system must support analytical SQL queries for movement analysis and player cooperation detection.

11. The system must enforce referential integrity using primary and foreign keys.

12. The system must support indexing for telemetry and analytical optimization.

13. The system must support reusable views and materialized views for frequent analyses.

# Non-Functional Requirements

1. The database must support high-frequency telemetry insertion.

2. The database must maintain data consistency and integrity.

3. The system must support scalability for large telemetry datasets.

4. The database must support efficient analytical queries.

5. The database must support reproducibility of schema creation and sample loading.

6. The system must support normalization up to Third Normal Form (3NF).

7. The database must provide acceptable query performance using indexes.

# Ethics and Privacy Requirements

1. Participants must provide informed consent before data collection.

2. Personal information must only be used for academic purposes.

3. Telemetry and survey data must be stored using controlled identifiers.

4. Sensitive personal data must remain protected.

5. Synthetic data may be used for testing and demonstrations.