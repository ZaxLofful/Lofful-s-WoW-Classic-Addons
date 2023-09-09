--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

TargetScanService = { }

local found = false
local scanning = false
local Search

local foundTargets = { }

function Search(targetString, useAlert)
    found = false
    scanning = true
    local bugsackIcon
    if (LibDBIcon10_BugSack and LibDBIcon10_BugSack.dataObject and LibDBIcon10_BugSack.dataObject.icon) then
        bugsackIcon = LibDBIcon10_BugSack.dataObject.icon
    end
    UIParent:UnregisterEvent("ADDON_ACTION_FORBIDDEN")
    local disabledSwatter
    if (Swatter and Swatter.Frame) then
        disabledSwatter = true
        Swatter.Frame:UnregisterEvent("ADDON_ACTION_FORBIDDEN")
    end
    local bugSackMuted
    local bugSackStopAuto
    if (BugSackDB) then
        if (not BugSackDB.mute) then
            bugSackMuted = true
            BugSackDB.mute = true
        end
        if (BugSackDB.auto) then
            bugSackStopAuto = true
            BugSackDB.auto = false
        end
    end
    TargetUnit(targetString)
    if (bugSackMuted) then
        BugSackDB.mute = false
    end
    if (bugSackStopAuto) then
        BugSackDB.auto = true
    end
    if (disabledSwatter) then
        Swatter.Frame:RegisterEvent("ADDON_ACTION_FORBIDDEN")
    end
    UIParent:RegisterEvent("ADDON_ACTION_FORBIDDEN")
    scanning = false
    if (found) then
        if (useAlert) then
            local lastFound = foundTargets[targetString] or 0
            local now = time()
            if (now - lastFound >= 10) then
                local soundID = State.GetNPCAlertSound()
                if (soundID) then
                    PlaySound(soundID)
                end
            end
            foundTargets[targetString] = now
        end
        if (BugGrabberDB and BugGrabberDB.errors and #BugGrabberDB.errors > 0) then
            local errmsg = BugGrabberDB.errors[ #BugGrabberDB.errors].message
            if (string.find(errmsg, "ADDON_ACTION_FORBIDDEN")
                    and string.find(errmsg, "JoanasGuides")
                    and string.find(errmsg, "TargetUnit")) then
                BugGrabberDB.errors[ #BugGrabberDB.errors] = nil
                if (bugsackIcon) then
                    LibDBIcon10_BugSack.dataObject.icon = bugsackIcon
                end
            end
        end
    end
    return found
end

function TargetScanService.Search(targetStrings, useAlert)
    for _, targetString in ipairs(targetStrings) do
        if (Search(targetString, useAlert)) then return true end
    end
    return false
end

local function OnEvent()
    if (scanning) then
        found = true
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_ACTION_FORBIDDEN")
eventFrame:SetScript("OnEvent", OnEvent)
