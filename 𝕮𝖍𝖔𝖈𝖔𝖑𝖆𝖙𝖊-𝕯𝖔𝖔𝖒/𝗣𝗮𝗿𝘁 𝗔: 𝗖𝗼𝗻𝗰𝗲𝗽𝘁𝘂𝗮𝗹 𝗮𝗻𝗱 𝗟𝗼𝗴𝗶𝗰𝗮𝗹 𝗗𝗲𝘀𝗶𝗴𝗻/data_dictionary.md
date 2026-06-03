# Data Dictionary

## User

### Definition

The User entity represents a volunteer student participating in the research study. It stores demographic information and consent status required for telemetry and UX data collection.

| Attribute        | Data Type    | Description                                      | Domain / Constraints                                | Key Type  |
| ---------------- | ------------ | ------------------------------------------------ | --------------------------------------------------- | --------- |
| user_id          | SERIAL       | Unique identifier of the user.                   | Positive integer, auto-generated, unique, not null. | PK        |
| full_name        | VARCHAR(100) | Full name of the participant.                    | Maximum 100 characters, not null.                   | Attribute |
| age              | INT          | Age of the participant.                          | Integer greater than 0.                             | Attribute |
| gender           | VARCHAR(20)  | Gender of the participant.                       | Maximum 20 characters.                              | Attribute |
| experience_level | VARCHAR(50)  | Gaming experience level of the participant.      | Maximum 50 characters.                              | Attribute |
| consent_signed   | BOOLEAN      | Indicates whether informed consent was provided. | TRUE or FALSE, not null.                            | Attribute |

---

## Player

### Definition

The Player entity represents an in-game identity associated with a user. A user may own one or more player aliases.

| Attribute | Data Type   | Description                      | Domain / Constraints                                | Key Type  |
| --------- | ----------- | -------------------------------- | --------------------------------------------------- | --------- |
| player_id | SERIAL      | Unique identifier of the player. | Positive integer, auto-generated, unique, not null. | PK        |
| user_id   | INT         | User associated with the player. | Must exist in User.user_id.                         | FK        |
| nickname  | VARCHAR(50) | In-game player name.             | Maximum 50 characters, not null.                    | Attribute |

---

## Episode

### Definition

The Episode entity represents a major game episode in Doom. Each episode contains one or more maps.

| Attribute    | Data Type    | Description                       | Domain / Constraints                                | Key Type  |
| ------------ | ------------ | --------------------------------- | --------------------------------------------------- | --------- |
| episode_id   | SERIAL       | Unique identifier of the episode. | Positive integer, auto-generated, unique, not null. | PK        |
| episode_name | VARCHAR(100) | Name of the episode.              | Maximum 100 characters, not null.                   | Attribute |

---

## Map

### Definition

The Map entity represents a playable level within an episode.

| Attribute  | Data Type    | Description                       | Domain / Constraints                                | Key Type  |
| ---------- | ------------ | --------------------------------- | --------------------------------------------------- | --------- |
| map_id     | SERIAL       | Unique identifier of the map.     | Positive integer, auto-generated, unique, not null. | PK        |
| episode_id | INT          | Episode to which the map belongs. | Must exist in Episode.                              | FK        |
| map_code   | VARCHAR(20)  | Internal map code (e.g., E1M1).   | Maximum 20 characters, not null.                    | Attribute |
| map_name   | VARCHAR(100) | Descriptive name of the map.      | Maximum 100 characters.                             | Attribute |

---

## Sector

### Definition

The Sector entity represents a subdivision of a map used to identify player locations and support hotspot analysis.

| Attribute   | Data Type    | Description                      | Domain / Constraints                                | Key Type  |
| ----------- | ------------ | -------------------------------- | --------------------------------------------------- | --------- |
| sector_id   | SERIAL       | Unique identifier of the sector. | Positive integer, auto-generated, unique, not null. | PK        |
| map_id      | INT          | Map containing the sector.       | Must exist in Map.map_id.                           | FK        |
| sector_name | VARCHAR(100) | Sector name or label.            | Maximum 100 characters.                             | Attribute |

---

## Game

### Definition

The Game entity represents a gameplay session where one or more players participate on a specific map.

| Attribute  | Data Type   | Description                                | Domain / Constraints                                | Key Type  |
| ---------- | ----------- | ------------------------------------------ | --------------------------------------------------- | --------- |
| game_id    | SERIAL      | Unique identifier of the gameplay session. | Positive integer, auto-generated, unique, not null. | PK        |
| map_id     | INT         | Map where the session takes place.         | Must exist in Map.map_id.                           | FK        |
| start_time | TIMESTAMP   | Start date and time of the session.        | Valid timestamp.                                    | Attribute |
| end_time   | TIMESTAMP   | End date and time of the session.          | Must be greater than start_time.                    | Attribute |
| difficulty | VARCHAR(50) | Difficulty level selected for the session. | Maximum 50 characters.                              | Attribute |

---

## GameParticipant

### Definition

The GameParticipant entity resolves the many-to-many relationship between players and gameplay sessions.

| Attribute | Data Type | Description                  | Domain / Constraints            | Key Type |
| --------- | --------- | ---------------------------- | ------------------------------- | -------- |
| game_id   | INT       | Associated gameplay session. | Must exist in Game.game_id.     | PK, FK   |
| player_id | INT       | Associated player.           | Must exist in Player.player_id. | PK, FK   |

### Additional Constraints

* Composite Primary Key: (game_id, player_id)
* A player cannot be registered more than once in the same game session.

---

## TelemetryEvent

### Definition

The TelemetryEvent entity stores telemetry information generated by the modified Chocolate Doom engine at every tic during gameplay. It contains player state, position, movement, and combat statistics.

| Attribute    | Data Type | Description                                | Domain / Constraints                                | Key Type  |
| ------------ | --------- | ------------------------------------------ | --------------------------------------------------- | --------- |
| telemetry_id | SERIAL    | Unique identifier of the telemetry record. | Positive integer, auto-generated, unique, not null. | PK        |
| game_id      | INT       | Game session associated with the event.    | Must exist in Game.game_id.                         | FK        |
| player_id    | INT       | Player associated with the event.          | Must exist in Player.player_id.                     | FK        |
| sector_id    | INT       | Sector where the event occurred.           | Must exist in Sector.sector_id.                     | FK        |
| tic          | INT       | Temporal index emitted by the game engine. | Integer greater than or equal to 0, not null.       | Attribute |
| event_time   | TIMESTAMP | Timestamp associated with the event.       | Valid timestamp.                                    | Attribute |
| pos_x        | FLOAT     | X coordinate of the player position.       | Real number.                                        | Attribute |
| pos_y        | FLOAT     | Y coordinate of the player position.       | Real number.                                        | Attribute |
| pos_z        | FLOAT     | Z coordinate of the player position.       | Real number.                                        | Attribute |
| angle        | FLOAT     | Player orientation angle.                  | Real number.                                        | Attribute |
| fov          | FLOAT     | Field of view of the player.               | Positive real number.                               | Attribute |
| momentum_x   | FLOAT     | X component of momentum vector.            | Real number.                                        | Attribute |
| momentum_y   | FLOAT     | Y component of momentum vector.            | Real number.                                        | Attribute |
| momentum_z   | FLOAT     | Z component of momentum vector.            | Real number.                                        | Attribute |
| health       | INT       | Player health value.                       | Integer greater than or equal to 0.                 | Attribute |
| armor        | INT       | Player armor value.                        | Integer greater than or equal to 0.                 | Attribute |
| ammo         | INT       | Player ammunition count.                   | Integer greater than or equal to 0.                 | Attribute |

### Additional Constraints

* UNIQUE(game_id, player_id, tic)
* Prevents duplicate telemetry records for the same player at the same tic in the same game.

---

## UXInstrument

### Definition

The UXInstrument entity stores metadata about the user experience instrument used in the study, such as PENS, GUESS, or BANGS.

| Attribute       | Data Type    | Description                          | Domain / Constraints                                | Key Type  |
| --------------- | ------------ | ------------------------------------ | --------------------------------------------------- | --------- |
| instrument_id   | SERIAL       | Unique identifier of the instrument. | Positive integer, auto-generated, unique, not null. | PK        |
| instrument_name | VARCHAR(100) | Name of the UX instrument.           | Maximum 100 characters, not null.                   | Attribute |

---

## UXItem

### Definition

The UXItem entity stores individual questions belonging to a UX instrument.

| Attribute     | Data Type | Description                         | Domain / Constraints                                | Key Type  |
| ------------- | --------- | ----------------------------------- | --------------------------------------------------- | --------- |
| item_id       | SERIAL    | Unique identifier of the question.  | Positive integer, auto-generated, unique, not null. | PK        |
| instrument_id | INT       | Instrument containing the question. | Must exist in UXInstrument.instrument_id.           | FK        |
| question_text | TEXT      | Text of the survey question.        | Non-empty text value.                               | Attribute |

---

## UXResponse

### Definition

The UXResponse entity stores a participant's response submission for a UX instrument.

| Attribute     | Data Type | Description                             | Domain / Constraints                                | Key Type  |
| ------------- | --------- | --------------------------------------- | --------------------------------------------------- | --------- |
| response_id   | SERIAL    | Unique identifier of the response.      | Positive integer, auto-generated, unique, not null. | PK        |
| user_id       | INT       | User who completed the survey.          | Must exist in User.user_id.                         | FK        |
| instrument_id | INT       | Instrument answered by the participant. | Must exist in UXInstrument.instrument_id.           | FK        |
| response_date | DATE      | Date on which the survey was completed. | Valid date.                                         | Attribute |

---

## UXResponseItem

### Definition

The UXResponseItem entity stores individual answers for each question contained in a UX response.

| Attribute   | Data Type | Description                                  | Domain / Constraints                                      | Key Type  |
| ----------- | --------- | -------------------------------------------- | --------------------------------------------------------- | --------- |
| response_id | INT       | Associated survey response.                  | Must exist in UXResponse.response_id.                     | PK, FK    |
| item_id     | INT       | Associated survey question.                  | Must exist in UXItem.item_id.                             | PK, FK    |
| score       | INT       | Numerical score assigned to the survey item. | Integer according to the scale defined by the instrument. | Attribute |

### Additional Constraints

* Composite Primary Key: (response_id, item_id)
* One answer per survey question within the same response.

