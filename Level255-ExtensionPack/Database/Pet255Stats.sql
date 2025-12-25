-- ============================================================
-- AzerothCore Pet Level Stats (Level 81-255)
-- ============================================================

-- 1. 清理 81 级以上的旧数据 (如果有)
DELETE FROM `pet_levelstats` WHERE `level` > 80;

-- 2. 直接基于 80 级数据生成 81-255 级数据
--    原理：每一级属性 = 80级属性 * (1.03 的 (等级-80) 次方)

-- 生成辅助表 (这里用一个巧妙的方法避免创建临时表/存储过程)
-- 我们利用一个简单的循环逻辑或者针对每个等级插入一次

-- 为了保证兼容性，我这里通过简单的 SQL 块来生成。
-- 由于 SQL 无法直接写 FOR 循环插入，我们使用最通用的方法：

DROP PROCEDURE IF EXISTS `generate_pet_stats_simple`;

DELIMITER $$
CREATE PROCEDURE `generate_pet_stats_simple`()
BEGIN
    DECLARE lvl INT DEFAULT 81;
    WHILE lvl <= 255 DO
        INSERT INTO `pet_levelstats` (`creature_entry`, `level`, `hp`, `mana`, `armor`, `str`, `agi`, `sta`, `inte`, `spi`)
        SELECT 
            `creature_entry`,
            lvl,
            FLOOR(`hp` * POW(1.03, lvl - 80)),
            FLOOR(`mana` * POW(1.03, lvl - 80)),
            FLOOR(`armor` * POW(1.03, lvl - 80)),
            FLOOR(`str` * POW(1.03, lvl - 80)),
            FLOOR(`agi` * POW(1.03, lvl - 80)),
            FLOOR(`sta` * POW(1.03, lvl - 80)),
            FLOOR(`inte` * POW(1.03, lvl - 80)),
            FLOOR(`spi` * POW(1.03, lvl - 80))
        FROM `pet_levelstats`
        WHERE `level` = 80;
        
        SET lvl = lvl + 1;
    END WHILE;
END$$
DELIMITER ;

-- 执行并清理
CALL `generate_pet_stats_simple`();
DROP PROCEDURE IF EXISTS `generate_pet_stats_simple`;
