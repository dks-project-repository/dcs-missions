--function SpawnSomething()
--    ---- RANDOM Vec2 within zone
--    --local RandomPositionInZone = GroundSpawnZones[1]:GetRandomPointVec2()
--    --if (RandomPositionInZone == nil) then
--    --    return
--    --end
--    ---- Group Template
--    --MESSAGE:New("Positon: "..RandomPositionInZone:GetLat().." "..RandomPositionInZone:GetLon(), 1):ToAll()
--    --local SpawnGroundUnit1 = SPAWN:New("Ground-1"):SpawnFromPointVec2(RandomPositionInZone)
--    --Index = Index + 1
--end

--SpawnGrounds = SPAWN:New("Ground-1-1"):InitLimit(20, 10):InitRandomizeUnits(true, 10, 3)

--
--function SpawnSomething()
--    local UnitName = "Ground-1-1"
--    local SpawnUnit = UNIT:FindByName(UnitName)
--    SpawnGrounds:SpawnFromUnit(SpawnUnit)
--end

--SCHEDULER:New(nil, SpawnSomething, {}, 0, 1)

--SpawnSomething()
--SpawnSomething()

--function CreateZone()
--    local RandomPositionInZone = GroundSpawnZones[1]:GetRandomPointVec2()
--    add_zone("NewZone", RandomPositionInZone:GetX(), RandomPositionInZone:GetY(), 1000)
--    local NewZone = ZONE:FindByName("New Trigger Zone-2")
--    NewZone:SetVec2(RandomPositionInZone)
--    NewZone:SetRadius(100)
--    NewZone:DrawZone()
--end
--CreateZone()