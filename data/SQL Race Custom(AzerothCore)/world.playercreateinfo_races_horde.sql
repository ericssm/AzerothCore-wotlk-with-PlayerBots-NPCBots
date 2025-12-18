-- Official Races
-- Horde
-- Race (Orc)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('2','8','1','14','-618.518','-4251.67','38.718','0');
-- Class (Mage)
SET @NEW_RACE = 2;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 8;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Undead)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('5','3','0','85','1676.35','1677.45','121.67','2.70526');
-- Class (Hunter)
SET @NEW_RACE = 5;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Tauren)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('6','2','1','215','-2917.58','-257.98','52.9968','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('6','5','1','215','-2917.58','-257.98','52.9968','0');
-- Class (Paladin)
SET @NEW_RACE = 6;
SET @NEW_CLASS = 2;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Priest)
SET @NEW_RACE = 6;
SET @NEW_CLASS = 5;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Troll)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('8','9','1','14','-618.518','-4251.67','38.718','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('8','11','1','14','-618.518','-4251.67','38.718','0');
-- Class (Warlock)
SET @NEW_RACE = 8;
SET @NEW_CLASS = 9;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Druid)
SET @NEW_RACE = 8;
SET @NEW_CLASS = 11;
SET @COPY_RACE = 6;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Blood Elf)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('10','1','530','3431','10349.6','-6357.29','33.4026','5.31605');
-- Class (Warrior)
SET @NEW_RACE = 10;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 5;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Customs Races
-- Race (Pandaren)(Horde)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('15','1','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('15','3','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('15','4','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('15','5','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('15','7','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('15','8','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('15','6','609','4298','2355.84','-5664.77','426.028','3.65997');
-- Class (Warrior)
SET @NEW_RACE = 15;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 5;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Hunter)
SET @NEW_RACE = 15;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Rogue)
SET @NEW_RACE = 15;
SET @NEW_CLASS = 4;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Priest)
SET @NEW_RACE = 15;
SET @NEW_CLASS = 5;
SET @COPY_RACE = 8;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Death Knight)
SET @NEW_RACE = 15;
SET @NEW_CLASS = 6;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Shaman)
SET @NEW_RACE = 15;
SET @NEW_CLASS = 7;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Mage)
SET @NEW_RACE = 15;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 8;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Vulpera)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('13','1','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('13','3','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('13','4','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('13','5','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('13','7','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('13','8','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('13','9','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('13','6','609','4298','2355.84','-5664.77','426.028','3.65997');
-- Class (Warrior)
SET @NEW_RACE = 13;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 5;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Hunter)
SET @NEW_RACE = 13;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Rogue)
SET @NEW_RACE = 13;
SET @NEW_CLASS = 4;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Priest)
SET @NEW_RACE = 13;
SET @NEW_CLASS = 5;
SET @COPY_RACE = 8;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Death Knight)
SET @NEW_RACE = 13;
SET @NEW_CLASS = 6;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Shaman)
SET @NEW_RACE = 13;
SET @NEW_CLASS = 7;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Mage)
SET @NEW_RACE = 13;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 8;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 13;
SET @NEW_CLASS = 9;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Nightborne)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('14','1','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('14','3','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('14','4','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('14','5','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('14','8','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('14','9','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('14','6','609','4298','2355.84','-5664.77','426.028','3.65997');
-- Class (Warrior)
SET @NEW_RACE = 14;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 5;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Hunter)
SET @NEW_RACE = 14;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Rogue)
SET @NEW_RACE = 14;
SET @NEW_CLASS = 4;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Priest)
SET @NEW_RACE = 14;
SET @NEW_CLASS = 5;
SET @COPY_RACE = 8;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Death Knight)
SET @NEW_RACE = 14;
SET @NEW_CLASS = 6;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Mage)
SET @NEW_RACE = 14;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 8;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 14;
SET @NEW_CLASS = 9;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Goblin)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('9','1','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('9','3','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('9','4','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('9','5','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('9','7','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('9','8','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('9','9','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('9','6','609','4298','2355.84','-5664.77','426.028','3.65997');
-- Class (Warrior)
SET @NEW_RACE = 9;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 5;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Hunter)
SET @NEW_RACE = 9;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Rogue)
SET @NEW_RACE = 9;
SET @NEW_CLASS = 4;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Priest)
SET @NEW_RACE = 9;
SET @NEW_CLASS = 5;
SET @COPY_RACE = 8;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Death Knight)
SET @NEW_RACE = 9;
SET @NEW_CLASS = 6;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Shaman)
SET @NEW_RACE = 9;
SET @NEW_CLASS = 7;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Mage)
SET @NEW_RACE = 9;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 8;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 9;
SET @NEW_CLASS = 9;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Demon Hunter)(Horde)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('21','1','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('21','3','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('21','4','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('21','8','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('21','9','1','14','-618.518','-4251.67','38.718','1');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('21','6','609','4298','2355.84','-5664.77','426.028','3.65997');
-- Class (Warrior)
SET @NEW_RACE = 21;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 5;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 21;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 10;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 21;
SET @NEW_CLASS = 4;
SET @COPY_RACE = 10;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 21;
SET @NEW_CLASS = 6;
SET @COPY_RACE = 10;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 21;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 10;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 21;
SET @NEW_CLASS = 9;
SET @COPY_RACE = 10;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
