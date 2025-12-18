-- Customs Races
-- Alliance
-- Race (Pandaren Alliance)
SET @NEW_RACE = 17;
SET @COPY_RACE = 1;
DELETE FROM `player_race_stats` WHERE race = @NEW_RACE;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Spirit`)
SELECT @NEW_RACE, `Strength`, `Agility`, `Stamina` , `Spirit` FROM `player_race_stats`
WHERE race = @COPY_RACE;


-- Race (Lightforged Draenei)
SET @NEW_RACE = 19;
SET @COPY_RACE = 11;
DELETE FROM `player_race_stats` WHERE race = @NEW_RACE;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Spirit`)
SELECT @NEW_RACE, `Strength`, `Agility`, `Stamina` , `Spirit` FROM `player_race_stats`
WHERE race = @COPY_RACE;



-- Race (Void Elf)
SET @NEW_RACE = 12;
SET @COPY_RACE = 10;
DELETE FROM `player_race_stats` WHERE race = @NEW_RACE;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Spirit`)
SELECT @NEW_RACE, `Strength`, `Agility`, `Stamina` , `Spirit` FROM `player_race_stats`
WHERE race = @COPY_RACE;


-- Race (Worgen)
SET @NEW_RACE = 16;
SET @COPY_RACE = 1;
DELETE FROM `player_race_stats` WHERE race = @NEW_RACE;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Spirit`)
SELECT @NEW_RACE, `Strength`, `Agility`, `Stamina` , `Spirit` FROM `player_race_stats`
WHERE race = @COPY_RACE;


-- Race (Demon Hunter)(Alliance)
SET @NEW_RACE = 20;
SET @COPY_RACE = 4;
DELETE FROM `player_race_stats` WHERE race = @NEW_RACE;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Spirit`)
SELECT @NEW_RACE, `Strength`, `Agility`, `Stamina` , `Spirit` FROM `player_race_stats`
WHERE race = @COPY_RACE;


-- Horde
-- Race (Pandaren)(Horde)
SET @NEW_RACE = 15;
SET @COPY_RACE = 2;
DELETE FROM `player_race_stats` WHERE race = @NEW_RACE;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Spirit`)
SELECT @NEW_RACE, `Strength`, `Agility`, `Stamina` , `Spirit` FROM `player_race_stats`
WHERE race = @COPY_RACE;


-- Race (Vulpera)
SET @NEW_RACE = 13;
SET @COPY_RACE = 7;
DELETE FROM `player_race_stats` WHERE race = @NEW_RACE;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Spirit`)
SELECT @NEW_RACE, `Strength`, `Agility`, `Stamina` , `Spirit` FROM `player_race_stats`
WHERE race = @COPY_RACE;


-- Race (Nightborne)
SET @NEW_RACE = 14;
SET @COPY_RACE = 4;
DELETE FROM `player_race_stats` WHERE race = @NEW_RACE;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Spirit`)
SELECT @NEW_RACE, `Strength`, `Agility`, `Stamina` , `Spirit` FROM `player_race_stats`
WHERE race = @COPY_RACE;


-- Race (Goblin)
SET @NEW_RACE = 9;
SET @COPY_RACE = 7;
DELETE FROM `player_race_stats` WHERE race = @NEW_RACE;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Spirit`)
SELECT @NEW_RACE, `Strength`, `Agility`, `Stamina` , `Spirit` FROM `player_race_stats`
WHERE race = @COPY_RACE;


-- Race (Demon Hunter)(Horde)
SET @NEW_RACE = 21;
SET @COPY_RACE = 10;
DELETE FROM `player_race_stats` WHERE race = @NEW_RACE;
INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Spirit`)
SELECT @NEW_RACE, `Strength`, `Agility`, `Stamina` , `Spirit` FROM `player_race_stats`
WHERE race = @COPY_RACE;
