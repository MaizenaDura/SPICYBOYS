# Data Dictionary

## User

| Column | Type | Description |
|---|---|---|
| user_id | INT | Unique identifier for each volunteer |
| full_name | VARCHAR | Full name of the participant |
| age | INT | Age of the participant |
| gender | VARCHAR | Gender of the participant |
| experience_level | VARCHAR | Gaming experience level |
| consent_signed | BOOLEAN | Indicates if informed consent was signed |

---

## Player

| Column | Type | Description |
|---|---|---|
| player_id | INT | Unique player identifier |
| user_id | INT | References associated user |
| nickname | VARCHAR | In-game player nickname |

---

## Episode

| Column | Type | Description |
|---|---|---|
| episode_id | INT | Unique episode identifier |
| episode_name | VARCHAR | Name of the episode |

---

## Map

| Column | Type | Description |
|---|---|---|
| map_id | INT | Unique map identifier |
| episode_id | INT | References episode |
| map_code | VARCHAR | Internal map code |
| map_name | VARCHAR | Display name of map |

---

## Sector

| Column | Type | Description |
|---|---|---|
| sector_id | INT | Unique sector identifier |
| map_id | INT | References map |
| sector_name | VARCHAR | Sector label or description |

---

## Game

| Column | Type | Description |
|---|---|---|
| game_id | INT | Unique gameplay session identifier |
| episode_id | INT | References episode |
| start_time | TIMESTAMP | Session start timestamp |
| end_time | TIMESTAMP | Session end timestamp |
| difficulty | VARCHAR | Difficulty level |

---

## GameParticipant

| Column | Type | Description |
|---|---|---|
| game_id | INT | References game |
| player_id | INT | References player |

---

## TelemetryEvent

| Column | Type | Description |
|---|---|---|
| telemetry_id | INT | Unique telemetry record identifier |
| game_id | INT | References gameplay session |
| player_id | INT | References player |
| sector_id | INT | References sector |
| tic | INT | Engine tic/frame identifier |
| event_time | TIMESTAMP | Timestamp of telemetry event |
| pos_x | FLOAT | X coordinate |
| pos_y | FLOAT | Y coordinate |
| pos_z | FLOAT | Z coordinate |
| angle | FLOAT | Player facing angle |
| fov | FLOAT | Field of view |
| momentum_x | FLOAT | X-axis momentum |
| momentum_y | FLOAT | Y-axis momentum |
| momentum_z | FLOAT | Z-axis momentum |
| health | INT | Player health value |
| armor | INT | Player armor value |
| ammo | INT | Player ammunition value |

---

## UXInstrument

| Column | Type | Description |
|---|---|---|
| instrument_id | INT | Unique UX instrument identifier |
| instrument_name | VARCHAR | Name of UX instrument |

---

## UXItem

| Column | Type | Description |
|---|---|---|
| item_id | INT | Unique question identifier |
| instrument_id | INT | References UX instrument |
| question_text | TEXT | Survey question |

---

## UXResponse

| Column | Type | Description |
|---|---|---|
| response_id | INT | Unique survey response identifier |
| user_id | INT | References user |
| instrument_id | INT | References UX instrument |
| response_date | DATE | Date of response |

---

## UXResponseItem

| Column | Type | Description |
|---|---|---|
| response_id | INT | References UX response |
| item_id | INT | References UX item |
| score | INT | Numerical survey response score |