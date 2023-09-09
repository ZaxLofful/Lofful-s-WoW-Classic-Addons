--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local continentIDCache = { }

LocationsInitService = { }

function LocationsInitService.InitGuide(guide)
    for _, step in ipairs(guide) do
        if (step.locations) then
            local newLocations = { }
            for idx, location in ipairs(step.locations) do
                if (type(location) == "string" or type(location[1]) == "string") then
                    local condition
                    local locationAsTable
                    if (type(location) == "table") then
                        condition = location.condition
                        locationAsTable = location
                        location = location[1]
                    end
                    local flags, map, x, y, radius = strsplit("|", location)
                    x = tonumber(x)
                    y = tonumber(y)
                    local newLocation = Mixin({
                        flags = flags,
                        originalFlags = flags,
                        map = tonumber(map),
                        x = 0,
                        y = 0,
                        worldX = 0,
                        worldY = 0,
                        within = false,
                        radius = radius ~= nil and tonumber(radius) or LOCATION_DEFAULT_RADIUS,
                        condition = condition,
                        label = locationAsTable and locationAsTable.label,
                        area = locationAsTable and locationAsTable.area,
                        wmoarea = locationAsTable and locationAsTable.wmoarea,
                        npc = locationAsTable and locationAsTable.npc,
                        quest = locationAsTable and locationAsTable.quest,
                        item = locationAsTable and locationAsTable.item,
                        zone = locationAsTable and locationAsTable.zone,
                        gameobject = locationAsTable and locationAsTable.gameobject,
                        conditionPassed = false,
                        onactivate = locationAsTable.onactivate,
                        root = step,
                        idx = idx
                    }, LocationMixin)
                    if (Flags.HasFlag(newLocation, "W")) then
                        newLocation.worldX = x
                        newLocation.worldY = y
                        continentIDCache[map] = continentIDCache[map]
                                or C_Map.GetWorldPosFromMapPos(map, { x = 0.5, y = 0.5 })
                        newLocation.continentID = continentIDCache[map]
                        local _, mapPosition = C_Map.GetMapPosFromWorldPos(continentIDCache[map], { x = x, y = y }, map)
                        newLocation.x = mapPosition.x * 100
                        newLocation.y = mapPosition.y * 100
                    else
                        newLocation.x = x
                        newLocation.y = y
                        local continentID, worldCoordinate = C_Map.GetWorldPosFromMapPos(map,
                                { x = newLocation.x / 100, y = newLocation.y / 100 })
                        newLocation.continentID = continentID
                        newLocation.worldX = worldCoordinate and worldCoordinate.x or 0
                        newLocation.worldY = worldCoordinate and worldCoordinate.y or 0
                    end
                    table.insert(newLocations, newLocation)
                else
                    table.insert(newLocations,location)
                end
            end
            step.locations = newLocations
        else
            step.locations = { }
        end
    end
end
