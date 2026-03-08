-- 完美修复：自定义种族萨满祭司“扔图腾就崩溃”的致命Bug！！ (针对 Playerbot 分支)
-- 客户端闪退原因：核心读取 player_totem_model 时对新种族找不到独立的图腾模型，导致发送到客户端的 DisplayID = 0，从而引发模型渲染地址越界（ACCESS_VIOLATION）。
-- 解决方案：为所有自定义的新种族，自动匹配克隆最正宗的官方图腾模型。

-- 我们将联盟侧新种族绑定为 德莱尼(11) 的图腾外观
-- 我们将部落侧新种族绑定为 兽人(2) 的图腾外观

-- 先安全清理可能残留的错误图腾绑定
DELETE FROM `player_totem_model` WHERE `RaceID` IN (9, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21);

-- 联盟新种族(Playerbot)：Void Elf(12), Worgen(16), Pandaren Alliance(17), Lightforged Draenei(19), Demon Hunter Alliance(20)
-- 克隆 德莱尼 (11) 的图腾外观
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 12, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 11;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 16, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 11;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 17, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 11;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 19, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 11;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 20, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 11;

-- 部落新种族(Playerbot): Goblin(9), Vulpera(13), Nightborne(14), Pandaren Horde(15), Zandalari Troll(18), Demon Hunter Horde(21)
-- 克隆 兽人 (2) 的图腾外观
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 9, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 2;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 13, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 2;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 14, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 2;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 15, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 2;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 18, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 2;
INSERT INTO `player_totem_model` (`TotemID`, `RaceID`, `ModelID`) SELECT `TotemID`, 21, `ModelID` FROM `player_totem_model` WHERE `RaceID` = 2;
