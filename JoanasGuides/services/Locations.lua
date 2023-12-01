--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local activeLocation
local isDirty
local lastX
local lastY
local locations
local bookmark

local HasCheckpoints, GetLastCheckpoint, GetNextCheckpoint, GetPreviousCheckpointIdx, IsValidCheckpoint

function HasCheckpoints()
    for _, location in ipairs(locations) do
        if (IsValidCheckpoint(location)) then
            return true
        end
    end
end

function GetLastCheckpoint()
    for idx = #locations, 1, -1 do
        local location = locations[idx]
        if (IsValidCheckpoint(location)) then
            return location
        end
    end
end

function GetNextCheckpoint()
    for idx = (activeLocation and activeLocation.idx + 1)
            or (bookmark and bookmark.checkpoint and bookmark.checkpoint + 1) or 1, #locations do
        local location = locations[idx]
        if (IsValidCheckpoint(location)) then
            return location
        end
    end
end

function GetPreviousCheckpointIdx()
    for idx = activeLocation.idx - 1, 1, -1 do
        if (IsValidCheckpoint(locations[idx])) then
            return idx
        end
    end
    return 0
end

function IsValidCheckpoint(location)
    return Flags.HasFlag(location, "C") and not Flags.HasFlag(location, "H") and location.conditionPassed
end

LocationsService = { }

function LocationsService.GetActiveLocation()
    return activeLocation
end

function LocationsService.GetLocationByIdx(idx)
    return locations and locations[idx]
end

function LocationsService.GetLocations()
    return locations
end

function LocationsService.GetValidCheckpointsSnapshot()
    local snapshot = { "" }
    if (locations) then
        for _, location in ipairs(locations) do
            if (location == activeLocation or not activeLocation) then break end
            if (IsValidCheckpoint(location)) then
                table.insert(snapshot, location.idx)
                table.insert(snapshot, " ")
            end
        end
    end
    return table.concat(snapshot)
end

function LocationsService.MarkDirty()
    isDirty = true
end

function LocationsService.ResetCheckpoints()
    local changed = false
    if (bookmark.checkpoint ~= 0) then
        bookmark.checkpoint = 0
        changed = true
    end
    if (activeLocation and IsValidCheckpoint(activeLocation)) then
        activeLocation = nil
        changed = true
    end
    return changed
end

function LocationsService.SetActiveLocation(location)
    activeLocation = location
    MarkAllDirty()
end

function LocationsService.SetGuide(guide)
    bookmark = guide and guide.bookmark
end

function LocationsService.SetStep(step)
    isDirty = true
    activeLocation = nil
    locations = step and step.locations
    if (locations) then
        for _, location in ipairs(locations) do
            location:ResetFlags()
            location.within = nil
            location.withinChanged = nil
            location.conditionPassed = nil
            location.activateFired = nil
        end
    end
end

function LocationsService.UpdateLocations()
    local lastActiveLocation = activeLocation
    --If ACTIVE has previously been initialized, but its location is now unavailable, set ACTIVE to nil (uninitalize)
    if (activeLocation and (not activeLocation.conditionPassed or Flags.HasFlag(activeLocation, "H"))) then
        activeLocation = nil
    end
    if (not activeLocation) then
        if (HasCheckpoints()) then
            --  Available checkpoints exist and ACTIVE == 0: Set ACTIVE to the next available checkpoint
            activeLocation = GetNextCheckpoint()
        else
            --  ACTIVE == 0 and there are available locations: Set ACTIVE to the first available location
            if (locations) then
                for _, location in ipairs(locations) do
                    if (not Flags.HasFlag(location, "H") and location.conditionPassed) then
                        activeLocation = location
                        break
                    end
                end
            end
        end
    elseif (Flags.HasFlag(activeLocation, "C")
            and activeLocation.within
            and (activeLocation ~= GetLastCheckpoint())) then
        --  Available checkpoints exist and ACTIVE is a checkpoint:
        --      if ACTIVE is the last available checkpoint, do nothing
        --      if player is not within ACTIVE, do nothing
        --      otherwise set ACTIVE to the next available checkpoint
        activeLocation = GetNextCheckpoint()
    end
    -- Reset activateFired for all locations no longer activated
    local triggersUpdated
    if (locations) then
        for _, location in ipairs(locations) do
            if (location ~= activeLocation) then
                location.activateFired = nil
            end
            if (location.onenter or location.onleave) then
                triggersUpdated = triggersUpdated or TriggerService.OnEnterOrLeave(location)
            end
        end
    end
    TriggerService.OnActivate(activeLocation)
    return activeLocation ~= lastActiveLocation or triggersUpdated
end

function LocationsService.UpdateCheckpoint()
    --  Only update CHECKPOINT if ACTIVE is a checkpoint and ACTIVE ~= CHECKPOINT:
    --      Set CHECKPOINT to the first available location previous to the ACTIVE checkpoint, or 0
    local currentCheckpoint = bookmark.checkpoint
    if (activeLocation and IsValidCheckpoint(activeLocation)) then
        if (activeLocation.within and activeLocation == GetLastCheckpoint()) then
            bookmark.checkpoint = activeLocation.idx
        else
            bookmark.checkpoint = GetPreviousCheckpointIdx()
        end
    end
    return currentCheckpoint ~= bookmark.checkpoint
end

function LocationsService.UpdatePlayerPosition()
    local x, y, continentID, _
    if (PlayerPositionOverride) then
        x, y, _, continentID  = PlayerPositionOverride()
    end
    if (not x) then
        x, y, _, continentID = UnitPosition("player")
    end
    if (not x) then
        x, y = lastX, lastY
    end
    local changed = false
    --When the player has moved or locations are dirty:
    if (lastX ~= x or lastY ~= y or isDirty) then
        --	mark locations clean
        isDirty = false
        lastX, lastY = x, y
        if (locations) then
            --	Re-evaluate WITHIN, VISITED, and EXITED values, with return value to indicate if there were any changes
            for idx, location in ipairs(locations) do
                local distance = x and addon.GetDistanceInYards(x, y, location.worldX, location.worldY) or 2147483647
                local within
                if (continentID == location.continentID) then
                    within = distance <= location.radius
                else
                    within = false
                end
                if (within ~= location.within) then
                    changed = true
                    location.within = within
                    location.withinChanged = true
                end
                if (within and bookmark.visited[idx] ~= within) then
                    bookmark.visited[idx] = true
                    changed = true
                end
                if (bookmark.visited[idx] and not within and bookmark.exited[idx] ~= not within) then
                    bookmark.exited[idx] = true
                    changed = true
                end
            end
        end
    end
    return changed
end
