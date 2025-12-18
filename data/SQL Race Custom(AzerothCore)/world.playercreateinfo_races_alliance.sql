-- Official Races
-- Alliance
-- Race (Human)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('1','3','0','12','-8949.95','-132.493','83.5312','0');
-- Class (Hunter)
SET @NEW_RACE = 1;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 4;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Dwarf)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('3','7','0','1','-6240.32','331.033','382.758','6.17716');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('3','8','0','1','-6240.32','331.033','382.758','6.17716');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('3','9','0','1','-6240.32','331.033','382.758','6.17716');
-- Class (Shaman)
SET @NEW_RACE = 3;
SET @NEW_CLASS = 7;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 3;
SET @NEW_CLASS = 9;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Night Elf)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('4','8','1','141','10311.3','831.463','1326.41','5.48033');
-- Class (Mage)
SET @NEW_RACE = 4;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Gnome)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('7','3','0','1','-6240.32','331.033','382.758','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('7','5','0','1','-6240.32','331.033','382.758','0');
-- Class (Hunter)
SET @NEW_RACE = 7;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 4;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Priest)
SET @NEW_RACE = 7;
SET @NEW_CLASS = 5;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Customs Races
-- Race (Pandaren Alliance)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('17','1','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('17','3','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('17','4','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('17','5','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('17','7','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('17','8','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('17','6','609','4298','2355.84','-5664.77','426.028','3.65997');
-- Class (Warrior)
SET @NEW_RACE = 17;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Hunter)
SET @NEW_RACE = 17;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 4;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Rogue)
SET @NEW_RACE = 17;
SET @NEW_CLASS = 4;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Priest)
SET @NEW_RACE = 17;
SET @NEW_CLASS = 5;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Death Knight)
SET @NEW_RACE = 17;
SET @NEW_CLASS = 6;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Shaman)
SET @NEW_RACE = 17;
SET @NEW_CLASS = 7;
SET @COPY_RACE = 2;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Mage)
SET @NEW_RACE = 17;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Lightforged Draenei)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('19','1','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('19','2','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('19','3','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('19','5','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('19','8','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('19','6','609','4298','2355.84','-5664.77','426.028','3.65997');
-- Class (Warrior)
SET @NEW_RACE = 19;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 11;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Paladin)
SET @NEW_RACE = 19;
SET @NEW_CLASS = 2;
SET @COPY_RACE = 11;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Hunter)
SET @NEW_RACE = 19;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 11;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Priest)
SET @NEW_RACE = 19;
SET @NEW_CLASS = 5;
SET @COPY_RACE = 11;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Death Knight)
SET @NEW_RACE = 19;
SET @NEW_CLASS = 6;
SET @COPY_RACE = 11;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Mage)
SET @NEW_RACE = 19;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 11;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Void Elf)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('12','1','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('12','3','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('12','4','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('12','5','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('12','8','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('12','9','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('12','6','609','4298','2355.84','-5664.77','426.028','3.65997');
-- Class (Warrior)
SET @NEW_RACE = 12;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Hunter)
SET @NEW_RACE = 12;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 4;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Rogue)
SET @NEW_RACE = 12;
SET @NEW_CLASS = 4;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Priest)
SET @NEW_RACE = 12;
SET @NEW_CLASS = 5;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Death Knight)
SET @NEW_RACE = 12;
SET @NEW_CLASS = 6;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Mage)
SET @NEW_RACE = 12;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 12;
SET @NEW_CLASS = 9;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Worgen)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('16','1','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('16','3','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('16','4','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('16','5','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('16','8','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('16','9','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('16','11','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('16','6','609','4298','2355.84','-5664.77','426.028','3.65997');
-- Class (Warrior)
SET @NEW_RACE = 16;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Hunter)
SET @NEW_RACE = 16;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 4;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Rogue)
SET @NEW_RACE = 16;
SET @NEW_CLASS = 4;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Priest)
SET @NEW_RACE = 16;
SET @NEW_CLASS = 5;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Death Knight)
SET @NEW_RACE = 16;
SET @NEW_CLASS = 6;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Mage)
SET @NEW_RACE = 16;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 16;
SET @NEW_CLASS = 9;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Druid)
SET @NEW_RACE = 16;
SET @NEW_CLASS = 11;
SET @COPY_RACE = 4;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;


-- Race (Demon Hunter)(Alliance)
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('20','1','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('20','3','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('20','4','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('20','8','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('20','9','0','12','-8949.95','-132.493','83.5312','0');
insert into `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`) values('20','6','609','4298','2355.84','-5664.77','426.028','3.65997');
-- Class (Warrior)
SET @NEW_RACE = 20;
SET @NEW_CLASS = 1;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Hunter)
SET @NEW_RACE = 20;
SET @NEW_CLASS = 3;
SET @COPY_RACE = 4;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Rogue)
SET @NEW_RACE = 20;
SET @NEW_CLASS = 4;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Death Knight)
SET @NEW_RACE = 20;
SET @NEW_CLASS = 6;
SET @COPY_RACE = 4;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Mage)
SET @NEW_RACE = 20;
SET @NEW_CLASS = 8;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;
-- Class (Warlock)
SET @NEW_RACE = 20;
SET @NEW_CLASS = 9;
SET @COPY_RACE = 1;
DELETE FROM `playercreateinfo_action` WHERE race = @NEW_RACE AND class = @NEW_CLASS;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`)
SELECT @NEW_RACE, @NEW_CLASS, `button`, `action`, `type` FROM `playercreateinfo_action`
WHERE race = @COPY_RACE AND class = @NEW_CLASS;