-- Unit Spawner Script by Odskee
-- This script allows you to spawn units in ANY location (created for oil rigs) by creating a "Late Activation" unit as a template and creating trigger zones to place the units.

-- HOW TO USE:
-- 1) For each unit type you want to spawn, add one anywhere in your mission with Late Activation ticked.  Set the properties of each unit as desired.  You only need one for each unit type and they can be named anything you like.

-- 2) To place the units, create a small "Quad-Point" trigger zone and name is as follows: "[ZonePrefix][Name_of_Temnplate_Unit][_0001]".  For each zone you create for the same unit, increment the _0001.

-- Example: Add Late Activation Unit called "My_Unit_01".  Assuming your ZonePrefix is "SpZone_", you spawn the unit by creating a trigger zone called "SpZone_My_Unit_01_0001", "SpZone_My_Unit_01_0002"...

-- 3) Create a new trigger in your mission as type: Once and add "Do Script File" under "Actions", selecting this file.

-- IMPORTANT: Set the following ZonePrefix as desired for your mission.
ZonePrefix = "SpZone_"




AliasCounter = 0

-- Spawns a unit as derived from the Zone name in the given zone
function SpawnUnitInZone(ZONE)
	local TargetZone = ZONE
	local ZoneName = TargetZone:GetName()
	local UnitToSpawn = string.gsub(ZoneName, ZonePrefix, "")  -- Removes the prefix from the Zone name
	UnitToSpawn = UnitToSpawn:sub(1, -6)	-- Removes the last 5 chars from Zone name (required to make them unique in ME)
	env.info("Spawning Unit: " .. UnitToSpawn .. " in Zone " .. ZoneName)	-- Output to /SavedGamed/DCS/Logs/DCS.log
	SpawnedUnit = SPAWN:NewWithAlias(UnitToSpawn, ZoneName)	-- Spawn the listed unit with a derived unique name
	AliasCounter = AliasCounter + 1	-- Increment Alias Counter that produces unique name
	SpawnedUnit:SpawnInZone(TargetZone)	-- Spawn the group in the given zone
end


-- Get list if Zones that start with the given prefix
local SpawnZoneList = SET_ZONE:New():FilterPrefixes(ZonePrefix):FilterOnce()
if SpawnZoneList ~= nil then
	SpawnZoneList:ForEachZone(SpawnUnitInZone, {curZone})
end