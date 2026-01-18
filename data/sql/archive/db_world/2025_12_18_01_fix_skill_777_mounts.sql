-- DB update 2025_12_18_01 >> Fix Skill 777 (Mounts) for all races/classes
-- 
-- Problem: Player has skill (777) that is invalid for the race/class combination.
--          Skill 777 (Mounts) has no entry in skillraceclassinfo_dbc, causing the skill
--          to be deleted for players of any race/class.
--
-- Solution: Add skill 777 to skillraceclassinfo_dbc with RaceMask and ClassMask set to -1
--           (allowing all races and all classes)

-- Check if entry already exists, if not insert it
INSERT IGNORE INTO `skillraceclassinfo_dbc` (`ID`, `SkillID`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierID`, `SkillCostIndex`)
SELECT 
    (SELECT COALESCE(MAX(`ID`), 0) + 1 FROM `skillraceclassinfo_dbc` t2),
    777, -1, -1, 0, 0, 0, 0
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `skillraceclassinfo_dbc` WHERE `SkillID` = 777);
