--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local Init, OnEvent, OnUpdate
local addonLoaded
local isDirty
local lastStep
local questLogUpdated
local once

local frame = CreateFrame("Frame")

function Init(self, event, arg1)
	if (event == "ADDON_LOADED" and addonName == arg1) then
		self:UnregisterEvent("ADDON_LOADED")
		ApplyMetatable(ModelAdjustments, ModelAdjustmentMetatable)
		ApplyMetatable(ModelAdjustments_Era, ModelAdjustmentMetatable)
		ApplyMetatable(ModelAdjustments_TBC, ModelAdjustmentMetatable)
		ApplyMetatable(ModelAdjustments_WOTLK, ModelAdjustmentMetatable)
		setmetatable(ModelAdjustments, ModelAdjustmentsMetatable)
		ApplyMetatable(NPCs, NPCMetatable)
		ApplyMetatable(TaxiNodeLocations, TaxiNodeLocationsMetatable)
		setmetatable(GameObjectModels, GameObjectModelsMetatable)
		PlacesService.Init()
		State.Init()
		KeybindService.Init()
		UI.Init()
		GuideModules.Reload()
		GuideService.Init()
		Condition_OnAddonLoad()
		TaxiService.Init()
		addonLoaded = true
	end
	if (event == "QUEST_LOG_UPDATE") then
		questLogUpdated = true
	end
	if (addonLoaded and questLogUpdated) then
		self:SetScript("OnEvent", OnEvent)
		self:SetScript("OnUpdate", OnUpdate)
		GuideNavigationService.SetGuide(State.GetLastGuide())
		GuideNavigationService.SetStepFromBookmark()
	end
end

function OnEvent(self, event)
	MarkAllDirty()
end

function OnUpdate(self, elapsed_)
	GhostService.Update()
	if(GuideNavigationService.IsGuideSet() and LocationsService.UpdatePlayerPosition()) then
		--	if changes occurred, mark dirty
		MarkAllDirty()
	end
	if (isDirty) then
		TriggerService.Reset()
		UI.MarkDirty()
		--While (dirty)
		local currentStep = GuideNavigationService.GetStep()
		while (isDirty) do
			--	mark clean
			isDirty = nil
			--	Evaluate the step, taskGroups, and tasks to determine if condition has passed and if complete has passed
			--	Evaluate the locations to determine if condition has passed
			if (GuideNavigationService.IsGuideSet()) then
				local snapshot = LocationsService.GetValidCheckpointsSnapshot()
				EvaluationService.EvaluateStep(GuideNavigationService.GetStep())
				-- If any location which was not a valid checkpoint on the previous evaluation then becomes a valid
				-- checkpoint during this evaluation:
				-- 		set bookmark.checkpoint = 0
				--		if active is a valid checkpoint, set active = nil
				if (snapshot ~= LocationsService.GetValidCheckpointsSnapshot() and LocationsService.ResetCheckpoints()) then
					MarkAllDirty()
				end
				--	Determine what the active location is and set the ACTIVE condition
				--		If the location is newly active and has an onactivate handler, add it to the execution queue (max once/update)
				--		If ACTIVE got changed, mark dirty
				-- Check for onenter/onleave trigger updates and set them
				if (LocationsService.UpdateLocations()) then
					MarkAllDirty()
				end
				--	Fire all handlers in the execution queue (if any handlers got fired, mark dirty)
				if (TriggerService.RunAll()) then
					MarkAllDirty()
				end
				--	If the step is complete and autoadvance is enabled, advance to the next step (fire 'when changing to a step' functions) and mark dirty
				if (not GuideNavigationService.AutoAdvance()) then
					--	Otherwise:
					--		Determine if the checkpoint should be updated and update the CHECKPOINT condition if necessary
					--			If CHECKPOINT got changed, mark dirty
					if (LocationsService.UpdateCheckpoint()) then
						MarkAllDirty()
					end
				else
					LocationsService.UpdatePlayerPosition()
					MarkAllDirty()
				end
				GuideNavigationService.RefreshProgressTrackers()
			end
			if (not isDirty) then
				currentStep = GuideNavigationService.GetStep()
				if (currentStep and currentStep ~= lastStep) then
					ConditionContext["COMPLETEONSTART"] = not not currentStep.completedPassed
					ConditionContext["INCOMPLETEONSTART"] = not currentStep.completedPassed
					MarkAllDirty()
					if (GuideNavigationService.IsManualOverrideEnabled() and not currentStep.completedPassed) then
						GuideNavigationService.SetManualOverrideEnabled(false)
					end
				end
				lastStep = currentStep
			end
		end
		NPCMetatable.Refresh()
		GameObjectModelsMetatable.Refresh()
		ModelAdjustmentsMetatable.Refresh()
	end
	UI.Update(elapsed_)
	WorkCompleteService.Update()
	if (not once) then
		MarkAllDirty()
		once = true
	end
end

frame:SetScript("OnEvent", Init)
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("BAG_UPDATE_DELAYED")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("HEARTHSTONE_BOUND")
frame:RegisterEvent("PLAYER_MONEY")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED");
frame:RegisterEvent("PLAYER_XP_UPDATE")
frame:RegisterEvent("RAID_ROSTER_UPDATE")
frame:RegisterEvent("QUEST_LOG_UPDATE")
frame:RegisterEvent("UPDATE_FACTION")

function MarkAllDirty()
	isDirty = true
	GuideNavigationService.ClearCaches()
	WorkCompleteService.MarkDirty()
end
