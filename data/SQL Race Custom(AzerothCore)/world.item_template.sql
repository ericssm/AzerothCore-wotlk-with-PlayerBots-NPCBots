-- Item Alliance
UPDATE item_template SET AllowableRace = REPLACE(AllowableRace, '1101', '887885') WHERE AllowableRace = '1101';
UPDATE item_template SET FlagsExtra = REPLACE(FlagsExtra, '2', '0') WHERE FlagsExtra = '2' AND AllowableRace = '887885';
UPDATE item_template SET FlagsExtra = REPLACE(FlagsExtra, '4', '0') WHERE FlagsExtra = '4' AND AllowableRace = '887885';
UPDATE item_template SET FlagsExtra = REPLACE(FlagsExtra, '6', '0') WHERE FlagsExtra = '6' AND AllowableRace = '887885';
-- Item Horde
UPDATE item_template SET AllowableRace = REPLACE(AllowableRace, '690', '1078194') WHERE AllowableRace = '690';
-- Items Alls
UPDATE item_template SET AllowableRace = REPLACE(AllowableRace, '32767', '2097151') WHERE AllowableRace = '32767';
UPDATE item_template SET AllowableRace = REPLACE(AllowableRace, '2047', '2097151') WHERE AllowableRace = '2047';
UPDATE item_template SET AllowableRace = REPLACE(AllowableRace, '28671', '2097151') WHERE AllowableRace = '28671';
UPDATE item_template SET FlagsExtra = REPLACE(FlagsExtra, '2', '0') WHERE FlagsExtra = '2' AND Entry = '50379';



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