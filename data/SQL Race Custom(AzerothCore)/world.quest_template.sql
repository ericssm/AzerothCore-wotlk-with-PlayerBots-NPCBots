ALTER TABLE `quest_template` MODIFY COLUMN `AllowableRaces` INT(11) NOT NULL DEFAULT '0';

-- Quest Human
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '1', '886785') WHERE AllowableRaces = '1';
-- Quest Alliance
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '1101', '887885') WHERE AllowableRaces = '1101';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '1029', '887813') WHERE AllowableRaces = '1029';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '1028', '887812') WHERE AllowableRaces = '1028';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '1024', '887808') WHERE AllowableRaces = '1024';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '77', '886861') WHERE AllowableRaces = '77';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '68', '886852') WHERE AllowableRaces = '68';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '64', '886848') WHERE AllowableRaces = '64';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '8', '886792') WHERE AllowableRaces = '8';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '5', '886789') WHERE AllowableRaces = '5';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '4', '886788') WHERE AllowableRaces = '4';
-- Quest Orc
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '2', '1077506') WHERE AllowableRaces = '2';
-- Quest Horde
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '690', '1078194') WHERE AllowableRaces = '690';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '674', '1078178') WHERE AllowableRaces = '674';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '178', '1077682') WHERE AllowableRaces = '178';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '176', '1077680') WHERE AllowableRaces = '176';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '514', '1078018') WHERE AllowableRaces = '514';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '512', '1078016') WHERE AllowableRaces = '512';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '178', '1077682') WHERE AllowableRaces = '178';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '176', '1077680') WHERE AllowableRaces = '176';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '144', '1077648') WHERE AllowableRaces = '144';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '130', '1077634') WHERE AllowableRaces = '130';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '128', '1077632') WHERE AllowableRaces = '128';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '32', '1077536') WHERE AllowableRaces = '32';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '16', '1077520') WHERE AllowableRaces = '16';
-- Quest All Races
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '1791', '2097151') WHERE AllowableRaces = '1791';
UPDATE quest_template SET AllowableRaces = REPLACE(AllowableRaces, '595', '2097151') WHERE AllowableRaces = '595';



-- Horde race official:  690
-- Horde race custom: 1077504
-- All races horde + customs: 1078194
-- Alliance race official: 1101
-- Alliance race custom: 886784
-- All races alliance + customs: 887885
-- All races custom: 2095104
-- All races: 2097151

-- 1	Human			1
-- 2	Orc				2
-- 3	Dwarf			4
-- 4	Night Elf		8
-- 5	Undead			16
-- 6	Tauren			32
-- 7	Gnome			64
-- 8	Troll			128
-- 9	Goblin			256
-- 10	Blood Elf		512
-- 11	Draenei			1024
-- 12	Void Elf(A)		2048
-- 13	Vulpera(H)		4096
-- 14	Nightborne(H)	8192
-- 15	Pandaren(H)		16384
-- 16	Worgen(A)		32768
-- 17	Pandaren(A)		65536
-- 18	Forest Troll	131072
-- 19	Lightforged(A)	262144
-- 20	Demon Hunter(A)	524288
-- 21	Demon Hunter(H)	1048576