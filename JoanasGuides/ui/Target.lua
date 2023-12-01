--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local lastStep

local component = UI.CreateComponent("TargetMarker")

local eventFrame = CreateFrame("Frame")

local markedTargets = { }

local function SetRaidTargetNoToggle(index, targetOrMouseover, guid)
    if ( GetRaidTargetIndex(targetOrMouseover) ~= index ) then
        if (IsInGroup()) then
            if (markedTargets[index] == guid) then
                return
            end
        end
        markedTargets[index] = guid
        SetRaidTarget(targetOrMouseover, index);
    end
end

local function TrySetMark(targetOrMouseover, hostileMark, friendlyMark, overrideMark)
    if (State.IsTargetMarkingEnabled()) then
        if (UnitExists(targetOrMouseover) and not UnitIsPlayer(targetOrMouseover) and not UnitIsDead(targetOrMouseover)) then
            if (not overrideMark and GetRaidTargetIndex(targetOrMouseover)) then
                return
            end
            local guid = UnitGUID(targetOrMouseover)
            local _, _, _, _, _, npcID = strsplit("-", guid)
            npcID = tonumber(npcID)
            local currentStep = GuideNavigationService.IsGuideSet() and GuideNavigationService.GetStep() or nil
            if (currentStep) then
                for _, taskGroup in ipairs(currentStep) do
                    if (taskGroup.conditionPassed and taskGroup.buttons and not UI.IsTaskGroupDimmed(taskGroup)) then
                        for _, actionButtonRef in ipairs(taskGroup.buttons) do
                            if (actionButtonRef.conditionPassed) then
                                if (actionButtonRef.target and actionButtonRef.target == npcID) then
                                    if (actionButtonRef.alert) then
                                        SetRaidTargetNoToggle(2, targetOrMouseover, guid)
                                    elseif (UnitCanAttack("player", targetOrMouseover)) then
                                        SetRaidTargetNoToggle(hostileMark, targetOrMouseover, guid)
                                    else
                                        SetRaidTargetNoToggle(friendlyMark, targetOrMouseover, guid)
                                    end
                                    return
                                end
                                if (actionButtonRef.targets) then
                                    for _, target in ipairs(actionButtonRef.targets) do
                                        if (target == npcID) then
                                            if (actionButtonRef.alert) then
                                                SetRaidTargetNoToggle(2, targetOrMouseover, guid)
                                            elseif (UnitCanAttack("player", targetOrMouseover)) then
                                                SetRaidTargetNoToggle(hostileMark, targetOrMouseover, guid)
                                            else
                                                SetRaidTargetNoToggle(friendlyMark, targetOrMouseover, guid)
                                            end
                                            return
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

local function OnEvent(_, event)
    if (event == "PLAYER_TARGET_CHANGED") then
        TrySetMark("target", 8, 5, true)
    elseif (event == "RAID_TARGET_UPDATE") then
        markedTargets = { }
    end
end

eventFrame:SetScript("OnEvent", OnEvent)
eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
eventFrame:RegisterEvent("RAID_TARGET_UPDATE")

function component.Update()
    local currentStep = GuideNavigationService.GetStep()
    if (lastStep ~= currentStep) then
        lastStep = currentStep
        if (State.IsTargetMarkingEnabled() and not IsInGroup()) then
            SetRaidTarget("player", 8)
            SetRaidTarget("player", 7)
            SetRaidTarget("player", 5)
            SetRaidTarget("player", 2)
            SetRaidTarget("player", 0)
        end
    else
        TrySetMark("mouseover", 7, 5, false)
    end
end

UI.Add(component)