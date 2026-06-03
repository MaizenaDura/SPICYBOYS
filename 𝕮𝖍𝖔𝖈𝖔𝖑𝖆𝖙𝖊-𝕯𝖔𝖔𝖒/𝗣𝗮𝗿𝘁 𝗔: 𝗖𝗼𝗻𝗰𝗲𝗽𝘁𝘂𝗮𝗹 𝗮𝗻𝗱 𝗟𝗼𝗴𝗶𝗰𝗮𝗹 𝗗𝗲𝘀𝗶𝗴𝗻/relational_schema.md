# Relational Schema

## User

```text
User(
    user_id PK,
    full_name,
    age,
    gender,
    experience_level,
    consent_signed
)
```

### Constraints

* user_id must be unique.
* age must be greater than 0.
* consent_signed cannot be null.

---

## Player

```text
Player(
    player_id PK,
    user_id FK → User(user_id),
    nickname
)
```

### Constraints

* player_id must be unique.
* user_id must reference an existing user.
* nickname cannot be null.

---

## Episode

```text
Episode(
    episode_id PK,
    episode_name
)
```

### Constraints

* episode_id must be unique.
* episode_name cannot be null.

---

## Map

```text
Map(
    map_id PK,
    episode_id FK → Episode(episode_id),
    map_code,
    map_name
)
```

### Constraints

* map_id must be unique.
* episode_id must reference an existing episode.
* map_code cannot be null.

---

## Sector

```text
Sector(
    sector_id PK,
    map_id FK → Map(map_id),
    sector_name
)
```

### Constraints

* sector_id must be unique.
* map_id must reference an existing map.

---

## Game

```text
Game(
    game_id PK,
    map_id FK → Map(map_id),
    start_time,
    end_time,
    difficulty
)
```

### Constraints

* game_id must be unique.
* map_id must reference an existing map.
* end_time must be greater than start_time.

---

## GameParticipant

```text
GameParticipant(
    game_id PK, FK → Game(game_id),
    player_id PK, FK → Player(player_id)
)
```

### Constraints

* Composite primary key (game_id, player_id).
* A player cannot appear twice in the same game.

---

## TelemetryEvent

```text
TelemetryEvent(
    telemetry_id PK,
    game_id FK → Game(game_id),
    player_id FK → Player(player_id),
    sector_id FK → Sector(sector_id),
    tic,
    event_time,
    pos_x,
    pos_y,
    pos_z,
    angle,
    fov,
    momentum_x,
    momentum_y,
    momentum_z,
    health,
    armor,
    ammo
)
```

### Constraints

* telemetry_id must be unique.
* game_id must reference an existing game.
* player_id must reference an existing player.
* sector_id must reference an existing sector.
* tic must be positive.
* health must be greater than or equal to 0.
* armor must be greater than or equal to 0.
* ammo must be greater than or equal to 0.
* UNIQUE(game_id, player_id, tic).

---

## UXInstrument

```text
UXInstrument(
    instrument_id PK,
    instrument_name
)
```

### Constraints

* instrument_id must be unique.
* instrument_name cannot be null.

---

## UXItem

```text
UXItem(
    item_id PK,
    instrument_id FK → UXInstrument(instrument_id),
    question_text
)
```

### Constraints

* item_id must be unique.
* instrument_id must reference an existing instrument.

---

## UXResponse

```text
UXResponse(
    response_id PK,
    user_id FK → User(user_id),
    instrument_id FK → UXInstrument(instrument_id),
    response_date
)
```

### Constraints

* response_id must be unique.
* user_id must reference an existing user.
* instrument_id must reference an existing instrument.

---

## UXResponseItem

```text
UXResponseItem(
    response_id PK, FK → UXResponse(response_id),
    item_id PK, FK → UXItem(item_id),
    score
)
```

### Constraints

* Composite primary key (response_id, item_id).
* score must be within the valid range defined by the selected UX instrument.

```
```

