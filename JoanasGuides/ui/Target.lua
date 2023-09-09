--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local lastStep

local component = UI.CreateComponent("TargetMarker")

local eventFrame = CreateFrame("Frame")

local function SetRaidTargetNoToggle(index)
    if ( GetRaidTargetIndex("target") ~= index ) then
        SetRaidTarget("target", index);
    end
end

local function OnEvent()
    if (State.IsTargetMarkingEnabled()) then
        if (UnitExists("target") and not UnitIsPlayer("target") and not UnitIsDead("target")) then
            local guid = UnitGUID("target")
            local _, _, _, _, _, npcID = strsplit("-", guid)
            npcID = tonumber(npcID)
            local currentStep = GuideNavigationService.IsGuideSet() and GuideNavigationService.GetStep() or nil
            if (currentStep) then
                for _, taskGroup in ipairs(currentStep) do
                    if (taskGroup.conditionPassed and taskGroup.buttons and not UI.IsTaskGroupDimmed(taskGroup)) then
                        for _, actionButtonRef in ipairs(taskGroup.buttons) do
                            if (actionButtonRef.conditionPassed) then
                                if (actionButtonRef.target and actionButtonRef.target == npcID) then
                                    if (UnitCanAttack("player", "target")) then
                                        SetRaidTargetNoToggle(8)
                                    else
                                        SetRaidTargetNoToggle(5)
                                    end
                                    return
                                end
                                if (actionButtonRef.targets) then
                                    for _, target in ipairs(actionButtonRef.targets) do
                                        if (target == npcID) then
                                            if (UnitCanAttack("player", "target")) then
                                                SetRaidTargetNoToggle(8)
                                            else
                                                SetRaidTargetNoToggle(5)
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

eventFrame:SetScript("OnEvent", OnEvent)
eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")

function component.Update()
    local currentStep = GuideNavigationService.GetStep()
    if (lastStep ~= currentStep) then
        lastStep = currentStep
        if (State.IsTargetMarkingEnabled() and not IsInGroup()) then
            SetRaidTarget("player", 8)
            SetRaidTarget("player", 5)
            SetRaidTarget("player", 0)
        end
    end
end

UI.Add(component)