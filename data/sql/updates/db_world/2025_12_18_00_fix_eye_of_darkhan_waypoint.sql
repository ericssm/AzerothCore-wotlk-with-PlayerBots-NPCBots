-- DB update 2025_12_18_00 >> Fix Eye of Dar'Khan waypoint movement error
-- 
-- Problem: WaypointMovementGenerator::LoadPath: creature Eye of Dar'Khan (Entry: 16320) 
--          doesn't have waypoint path id: 0
--
-- Solution: Change MovementType from waypoint movement to idle (0)
--           This prevents the error log spam while maintaining the creature's presence

UPDATE `creature` SET `MovementType` = 0 WHERE `id1` = 16320 AND `MovementType` != 0;
