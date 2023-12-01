--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

-- backwards compatibility
local function UpgradeBookmark(guideID)
	local bookmark = SavedVariablesPerCharacter.bookmarks[guideID]
	local oldGuideID
	if (not bookmark) then
		oldGuideID = string.sub(PLAYER_FACTION,1,1) .. string.sub(guideID,2)
		bookmark = SavedVariablesPerCharacter.bookmarks[oldGuideID]
		SavedVariablesPerCharacter.bookmarks[oldGuideID] = nil
	end
	if (bookmark and type(bookmark) == "string") then
		bookmark = {
			stepID = bookmark,
		}
	end
	SavedVariablesPerCharacter.bookmarks[guideID] = bookmark or { }
	bookmark = SavedVariablesPerCharacter.bookmarks[guideID]
	bookmark.checkpoint = bookmark.checkpoint or 0
	bookmark.visited = bookmark.visited or { }
	bookmark.exited = bookmark.exited or { }
end

State = { }

function State.GetBookmark(guideID)
	if (guideID) then
		UpgradeBookmark(guideID)
		return SavedVariablesPerCharacter.bookmarks[guideID]
	end
end

function State.GetCustomVariables()
	return SavedVariablesPerCharacter.custom
end

function State.GetGuideScale()
	return SavedVariables.scale
end

function State.GetLastGuide()
	return SavedVariablesPerCharacter.lastGuide
end

function State.GetLastSpiritHealerLocation()
	return SavedVariables.lastSpiritHealerLocation
end

function State.GetNPCAlertSound()
	if (not SavedVariables.npcAlertSound) then
		return AlertSounds[1].id
	end
	if (SavedVariables.npcAlertSound == 0) then
		return nil
	end
	return SavedVariables.npcAlertSound
end

function State.GetWindowLocation()
	return SavedVariables.WindowLocation
end

--todo: Move other saved variables initializers to here
function State.Init()
	_G[SavedVariablesName] = DefaultEmptyTable(_G[SavedVariablesName])
	SavedVariables = _G[SavedVariablesName]
	SavedVariables.scale = DefaultValue(SavedVariables.scale, 1.0)
	SavedVariables.enableStepID = DefaultTrue(SavedVariables.enableStepID)
	SavedVariables.objectiveCompletionSound = DefaultTrue(SavedVariables.objectiveCompletionSound)
	SavedVariables.autoquests = DefaultTrue(SavedVariables.autoquests)
	SavedVariables.autobanking = DefaultTrue(SavedVariables.autobanking)
	SavedVariables.autotaxi = DefaultTrue(SavedVariables.autotaxi)
	_G[SavedVariablesPerCharacterName] = DefaultEmptyTable(_G[SavedVariablesPerCharacterName])
	local playerGUID = UnitGUID("player")
	_G[SavedVariablesPerCharacterName].playerGUID = _G[SavedVariablesPerCharacterName].playerGUID or playerGUID
	if (_G[SavedVariablesPerCharacterName].playerGUID ~= playerGUID) then
		_G[SavedVariablesPerCharacterName] = { }
	end
	SavedVariablesPerCharacter = _G[SavedVariablesPerCharacterName]
	SavedVariablesPerCharacter.custom = DefaultEmptyTable(SavedVariablesPerCharacter.custom)
	SavedVariablesPerCharacter.bookmarks = DefaultEmptyTable(SavedVariablesPerCharacter.bookmarks)
end

function State.IsAHEnabled()
	return DefaultValue(SavedVariablesPerCharacter.ah, true)
end

function State.IsAutoBankingEnabled()
	return SavedVariables.autobanking
end

function State.IsAutoQuestsEnabled()
	return SavedVariables.autoquests
end

function State.IsAutoSetHome()
	return DefaultValue(SavedVariables.autosethome, true)
end

function State.IsAutoTaxiEnabled()
	return SavedVariables.autotaxi
end

function State.IsDebugEnabled()
	return SavedVariables and SavedVariables.debug
end

function State.IsGroupingEnabled()
	return DefaultValue(SavedVariablesPerCharacter.grouping, true)
end

function State.IsGuideShown()
	return SavedVariables.hideGuide ~= true
end

function State.IsHardcoreEnabled()
	return DefaultValue(SavedVariablesPerCharacter.hc, false)
end

function State.IsHiddenInInstances()
	return DefaultValue(SavedVariables.hiddenInInstances, true)
end

function State.IsInvertedModeEnabled()
	return DefaultValue(SavedVariables.invertedMode,false)
end

function State.IsKeybindDisplayEnabled()
	return DefaultValue(SavedVariables.keybindDisplay, true)
end

function State.IsMapPingAnimationEnabled()
	return DefaultValue(SavedVariables.mapPingAnimationEnabled, true)
end

function State.IsStepIDEnabled()
	return SavedVariables.enableStepID
end

function State.IsTargetMarkingEnabled()
	return DefaultValue(SavedVariables.enableTargetMarking, true)
end

function State.IsWindowLocked()
	return SavedVariables.WindowLocked == true
end

function State.SetAHEnabled(enabled)
	SavedVariablesPerCharacter.ah = enabled
end

function State.SetAutoBankingEnabled(flag)
	SavedVariables.autobanking = flag
end

function State.SetAutoQuestsEnabled(flag)
	SavedVariables.autoquests = flag
end

function State.SetAutoSetHome(flag)
	SavedVariables.autosethome = flag
end

function State.SetAutoTaxiEnabled(flag)
	SavedVariables.autotaxi = flag
end

function State.SetCustomVariable(varname, value)
	SavedVariablesPerCharacter.custom[varname] = value;
	ConditionContext[varname] = value
end

function State.SetDebugEnabled(enabled)
	SavedVariables.debug = enabled
end

function State.SetGroupingEnabled(enabled)
	SavedVariablesPerCharacter.grouping = enabled
end

function State.SetGuide(guideID)
	SavedVariablesPerCharacter.lastGuide = guideID
end

function State.SetGuideShown(shown)
	if (not InCombatLockdown()) then
		SavedVariables.hideGuide = not shown
		UI.MarkDirty()
	end
end

function State.SetGuideScale(scale)
	SavedVariables.scale = scale
	UI.MarkDirty()
end

function State.SetHardcoreEnabled(enabled)
	SavedVariablesPerCharacter.hc = enabled
end

function State.SetHiddenInInstances(enabled)
	SavedVariables.hiddenInInstances = enabled
end

function State.SetInvertedModeEnabled(overridden)
	if (not InCombatLockdown()) then
		SavedVariables.invertedMode = overridden
		UI.MarkDirty()
	end
end

function State.SetKeybindDisplayEnabled(enabled)
	SavedVariables.keybindDisplay = enabled
end

function State.SetLastSpiritHealerLocation(location)
	SavedVariables.lastSpiritHealerLocation = location
end

function State.SetNPCAlertSound(soundID)
	SavedVariables.npcAlertSound = soundID or 0
end

function State.SetMapPingAnimationEnabled(enabled)
	SavedVariables.mapPingAnimationEnabled = enabled
	UI.MarkDirty()
end

function State.SetStepIDEnabled(enabled)
	SavedVariables.enableStepID = enabled
	UI.MarkDirty()
end

function State.SetTargetMarkingEnabled(enabled)
	SavedVariables.enableTargetMarking = enabled
end

function State.SetWindowLocked(locked)
	SavedVariables.WindowLocked = locked
end
