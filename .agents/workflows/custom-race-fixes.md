---
description: How to fix custom race issues in AzerothCore 3.3.5 (totem crash, fatigue, quest/item race masks)
---

# Custom Race Integration Fix Guide (AzerothCore 3.3.5)

This SKILL documents the systematic approach to resolving common issues when adding custom races (IDs 9, 12-21) to an AzerothCore 3.3.5 WotLK server.

## Race ID Reference

| ID | Race | Faction | RaceMask Bit |
|----|------|---------|-------------|
| 1 | Human | Alliance | 1 |
| 2 | Orc | Horde | 2 |
| 3 | Dwarf | Alliance | 4 |
| 4 | Night Elf | Alliance | 8 |
| 5 | Undead | Horde | 16 |
| 6 | Tauren | Horde | 32 |
| 7 | Gnome | Alliance | 64 |
| 8 | Troll | Horde | 128 |
| 9 | Goblin | Horde | 256 |
| 10 | Blood Elf | Horde | 512 |
| 11 | Draenei | Alliance | 1024 |
| 12 | Void Elf | Alliance | 2048 |
| 13 | Vulpera | Horde | 4096 |
| 14 | High Elf | Alliance | 8192 |
| 15 | Pandaren | Horde | 16384 |
| 16 | Worgen | Alliance | 32768 |
| 17 | Man'ari Eredar | Horde | 65536 |
| 18 | Zandalari Troll | Horde | 131072 |
| 19 | Lightforged Draenei | Alliance | 262144 |
| 20 | Demon Hunter (A) | Alliance | 524288 |
| 21 | Demon Hunter (H) | Horde | 1048576 |

### Key Mask Constants

- **Alliance Official**: `1101` (1+4+8+64+1024)
- **Alliance Custom**: `829440` (2048+8192+32768+262144+524288)
- **Alliance Total**: `830541`
- **Horde Official**: `690` (2+16+32+128+512)
- **Horde Custom**: `1265920` (256+4096+16384+65536+131072+1048576)
- **Horde Total**: `1266610`
- **All Custom**: `2095360`
- **All Races**: `2097151`

---

## Issue 1: Shaman Totem Crash (ACCESS_VIOLATION)

### Symptom
When a custom race Shaman places a totem, the **client crashes** with `ACCESS_VIOLATION`. Official races (e.g., Draenei Shaman) work fine.

### Root Cause
The server function `ObjectMgr::GetModelForTotem()` in `ObjectMgr.cpp` looks up the `player_totem_model` table to find the totem's DisplayID for the caster's race. Custom races have no entries in this table, so the function returns `DisplayID = 0`. The client attempts to render a model with ID 0 and crashes.

### Fix (C++ Source)
**File**: `src/server/game/Globals/ObjectMgr.cpp`
**Function**: `GetModelForTotem()`

Add a fallback mechanism: if no totem model is found for a custom race, map it to a base race's totem based on faction alignment:

- Alliance custom races (12, 14, 16, 19, 20) → fallback to **Draenei** (11) totems
- Horde custom races (9, 13, 15, 17, 18, 21) → fallback to **Orc** (2) totems

```cpp
// After the initial lookup fails, add:
Races fallbackRace = RACE_NONE;
switch (race)
{
    case RACE_VOIDELF: case RACE_HIGH_ELF: case RACE_WOLGEN:
    case RACE_LIGHTFORGED: case RACE_DH_A:
        fallbackRace = RACE_DRAENEI;
        break;
    case RACE_GOBLIN: case RACE_VULPERA: case RACE_PANDAREN:
    case RACE_EREDAR: case RACE_FOREST_TROLL: case RACE_DH_H:
        fallbackRace = RACE_ORC;
        break;
    default: break;
}
if (fallbackRace != RACE_NONE)
{
    auto fallbackItr = _playerTotemModel.find(std::make_pair(totemSlot, fallbackRace));
    if (fallbackItr != _playerTotemModel.end())
        return fallbackItr->second;
}
```

### Alternative Fix (SQL Only, no recompile needed)
Insert totem model entries directly for custom races:

```sql
DELETE FROM `player_totem_model` WHERE `RaceID` IN (9,12,13,14,15,16,17,18,19,20,21);
-- Alliance: clone Draenei(11) totems
INSERT INTO `player_totem_model` (`TotemID`,`RaceID`,`ModelID`)
  SELECT `TotemID`, 12, `ModelID` FROM `player_totem_model` WHERE `RaceID`=11;
-- Repeat for 14, 16, 19, 20 ...
-- Horde: clone Orc(2) totems
INSERT INTO `player_totem_model` (`TotemID`,`RaceID`,`ModelID`)
  SELECT `TotemID`, 9, `ModelID` FROM `player_totem_model` WHERE `RaceID`=2;
-- Repeat for 13, 15, 17, 18, 21 ...
```

> [!IMPORTANT]
> The C++ fix is preferred because it automatically handles any future custom races without additional SQL.

---

## Issue 2: Fatigue/Exhaustion in Gilneas (Worgen Starting Area)

### Symptom
Players (especially Worgen, race 16) entering Gilneas zones on the Eastern Kingdoms map (map 0) receive the **Fatigue** debuff and eventually die, even though they are on land.

### Root Cause
Gilneas zones (4714, 4755-4781) are flagged as "dark water" areas in the game's liquid map data. The original 3.3.5 code treats any `MAP_LIQUID_TYPE_DARK_WATER` area as fatigue-inducing. Since Gilneas wasn't a playable area in WotLK, this was never an issue for Blizzard.

### Fix (C++ Source)
**File**: `src/server/game/Entities/Player/PlayerUpdates.cpp`
**Function**: `ProcessTerrainStatusUpdate()`

In the fatigue section (around line 2278), add zone/area checks before applying fatigue:

```cpp
// After detecting MAP_LIQUID_TYPE_DARK_WATER:
uint32 currentZone = GetZoneId();
uint32 currentArea = GetAreaId();
bool isGilneas = (currentZone == 4714 || currentZone == 4755 || ...);
// Also add coordinate-based fallback check for map 0:
if (!isGilneas && GetMapId() == 0) {
    float px = GetPositionX(), py = GetPositionY();
    if (px >= -2500.0f && px <= -1000.0f && py >= 1200.0f && py <= 3000.0f)
        isGilneas = true;
}
if (!isGilneas) {
    // Apply normal fatigue logic
} else {
    m_MirrorTimerFlags &= ~UNDERWATER_INDARKWATER; // No fatigue in Gilneas
}
```

---

## Issue 3: Quests Not Available for Custom Races

### Symptom
Custom race characters cannot see or accept quests from NPCs, even in their correct starting zone.

### Root Cause
The `AllowableRaces` field in `quest_template` uses a **bitmask**. Custom races have new bit positions (e.g., High Elf = bit 13 = 8192) that are NOT included in the original quest masks. For example, a quest with `AllowableRaces = 1101` (all Alliance) does NOT include High Elf (8192).

### Fix (SQL - Dynamic Bitwise Update)
**This is the recommended universal approach** - it works regardless of what previous bad data exists:

```sql
-- Step 1: Strip all non-official race bits (clean slate)
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` & 1791 WHERE `AllowableRaces` > 0;

-- Step 2: Add all Alliance custom races to any quest that allows ANY official Alliance race
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | 829440
WHERE `AllowableRaces` > 0 AND (
    (`AllowableRaces` & 1) OR (`AllowableRaces` & 4) OR (`AllowableRaces` & 8) OR
    (`AllowableRaces` & 64) OR (`AllowableRaces` & 1024)
);

-- Step 3: Add all Horde custom races to any quest that allows ANY official Horde race
UPDATE `quest_template` SET `AllowableRaces` = `AllowableRaces` | 1265920
WHERE `AllowableRaces` > 0 AND (
    (`AllowableRaces` & 2) OR (`AllowableRaces` & 16) OR (`AllowableRaces` & 32) OR
    (`AllowableRaces` & 128) OR (`AllowableRaces` & 512)
);
```

> [!TIP]
> Quests with `AllowableRaces = 0` are already open to ALL races, so they need no modification.

---

## Issue 4: Items Not Usable by Custom Races

### Symptom
Custom race characters cannot equip faction-specific items (e.g., Alliance-only tabards).

### Root Cause
Same as quests - `AllowableRace` field in `item_template` uses bitmasks that don't include custom race bits.

### Fix (SQL - Dynamic Bitwise Update)

```sql
-- Strip non-official bits (handle -1 as "all races allowed" - skip those)
UPDATE `item_template` SET `AllowableRace` = `AllowableRace` & 1791
WHERE `AllowableRace` > 0 AND `AllowableRace` != -1;

-- Add Alliance custom races
UPDATE `item_template` SET `AllowableRace` = `AllowableRace` | 829440
WHERE `AllowableRace` > 0 AND `AllowableRace` != -1 AND (
    (`AllowableRace` & 1) OR (`AllowableRace` & 4) OR (`AllowableRace` & 8) OR
    (`AllowableRace` & 64) OR (`AllowableRace` & 1024)
);

-- Add Horde custom races
UPDATE `item_template` SET `AllowableRace` = `AllowableRace` | 1265920
WHERE `AllowableRace` > 0 AND `AllowableRace` != -1 AND (
    (`AllowableRace` & 2) OR (`AllowableRace` & 16) OR (`AllowableRace` & 32) OR
    (`AllowableRace` & 128) OR (`AllowableRace` & 512)
);
```

---

## Issue 5: Duplicate Entry Errors on SQL Import

### Symptom
`1062 - Duplicate entry 'X-Y-Z' for key 'PRIMARY'` when importing SQL files.

### Solution
- Use `INSERT IGNORE INTO` instead of `INSERT INTO` (silently skip duplicates)
- Use `REPLACE INTO` instead of `INSERT INTO` (overwrite existing data)
- Use `UPDATE IGNORE` for UPDATE statements that might cause key collisions
- Always `DELETE` old data before re-inserting when changing primary key values

---

## General Workflow for Adding a New Custom Race

1. **Add to C++ enum** (`SharedDefines.h`): Define the new `RACE_XXX` constant and update `MAX_RACES`, `RACEMASK_ALL_PLAYABLE`, `RACEMASK_ALLIANCE`/`RACEMASK_HORDE`
2. **Update DBC files**: `ChrRaces.dbc` must have the new race entry
3. **SQL - player_race_stats**: Clone base stats from a similar official race
4. **SQL - playercreateinfo**: Set starting map/zone/coordinates
5. **SQL - playercreateinfo_action**: Clone action bars from a similar race
6. **SQL - playercreateinfo_skills**: Add skill masks for the new race
7. **SQL - quest_template**: Run the dynamic bitwise update (Issue 3)
8. **SQL - item_template**: Run the dynamic bitwise update (Issue 4)
9. **SQL - creature_template**: Set `gossip_menu_id = 0` for city guards (prevents crash on interaction)
10. **C++ - ObjectMgr.cpp**: Add totem fallback for the new race (Issue 1)
11. **C++ - PlayerUpdates.cpp**: Add fatigue zone exclusions if needed (Issue 2)
12. **Recompile** the server and **restart**
13. **Client**: Ensure the client has matching MPQ patches with race models/textures

> [!WARNING]
> The game **client** must also support the custom races. A modified `Wow.exe` and properly built `.mpq` patch files are required. Server-side fixes alone will NOT prevent client crashes from missing race models.
