addTriggerZone("PlaneComplite", helic_points[count_points].x, helic_points[count_points].y, 500, {0,0,0,1})

local function CreateTrigger(group_id, zone_id)
    trigger.misc.addTrigger(addTriggerDeactivateInZone(group_id, zone_id))
end

local function CreateZone(zone_data)
    return trigger.misc.addZone(zone_data)
end

function CreateGroups(group_country,groups_to_create)

    local trigger_zone_helic = CreateZone(groups_to_create.plane_trigger)

    local heli = coalition.addGroup(group_country, Group.Category.HELICOPTER, groups_to_create.plane_groups)
    CreateTrigger(heli:getID(), trigger_zone_helic.zoneId)

    return {
        heli:getID(),
        trigger_zone_helic.zoneId
    }
end

function addTriggerZone(name, x, y, radius, color, link_obj)

    if radius == nil then
        radius = 100
    end

    local color_ = {}

    if color == nil then
        color_ = {
            [1] = 1,
            [2] = 0,
            [3] = 0,
            [4] = 1,
        }
    else
        color_ = {
            [1] = color[1],
            [2] = color[2],
            [3] = color[3],
            [4] = color[4],
        }
    end

    if link_obj == nil then
        link_obj = 0
    end

    return {
        ["y"] = y,
        ["x"] = x,
        ["radius"] = radius,
        ["color"] = color_,
        ["properties"] =
        {
            [1] =
            {
                ["key"] = name,
                ["value"] = "",
            }, -- end of [1]
        }, -- end of ["properties"]
        ["hidden"] = false,
        ["name"] = name,
        ["linked_object_name"] = link_obj,
    }
end