--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local context = { }
local functionBase = "return %s"

ConditionContext = context

local currentRoot
local currentObj
local reservedContextVars = { }

function CheckCondition(obj, conditionProperty)
	if (type(obj) ~= "table" or not (conditionProperty or obj.condition)) then
		return true
	end
	currentRoot = obj.root or obj
	currentObj = nil
	conditionProperty = conditionProperty or obj.condition
	local func = loadstring(functionBase:format(conditionProperty))
	setfenv(func, context)
	return (func() == true)
end

function CheckCompleted(obj)
	if (type(obj) ~= "table" or not obj.completed) then return nil end
	currentRoot = obj.root or obj
	currentObj = obj
	local func = loadstring(functionBase:format(obj.completed))
	setfenv(func, context)
	return (func() == true)
end

local REP_LEVELS = {
	UNKNOWN = 0,
	HATED = 1,
	HOSTILE = 2,
	UNFRIENDLY = 3,
	NEUTRAL = 4,
	FRIENDLY = 5,
	HONORED = 6,
	REVERED = 7,
	EXALTED = 8,
}

local QUEST = { }

setmetatable(QUEST, {
	__index = function(_, key)
		return QuestStatus.GetQuestStatus(key)
	end
})

local OBJECTIVE = { }

setmetatable(OBJECTIVE, {
	__index = function(_, key)
		local objectives = { }
		local complete = C_QuestLog.IsQuestFlaggedCompleted(key)
		local questObjectives = QuestStatus.GetQuestObjectives(key) or { }
		for idx, objective in ipairs(questObjectives) do
			objectives[idx] = complete or objective.finished
		end
		return objectives
	end
})

local BANKITEM = { }

setmetatable(BANKITEM, {
	__index = function(_, key)
		return GetItemCount(key, true) - GetItemCount(key, false)
	end
})

local ITEM = { }

setmetatable(ITEM, {
	__index = function(_, key)
		return GetItemCount(key, false)
	end
})

local REP = { }

setmetatable(REP, {
	__index = function(_, key)
		local _, _, standingId = GetFactionInfoByID(key)
		if (not standingId) then return REP_LEVELS.UNKNOWN end
		return standingId
	end
})

local WITHIN = { }

setmetatable(WITHIN, {
	__index = function(_, key)
		if (currentRoot ~= GuideNavigationService.GetStep()) then return false end
		local location = LocationsService.GetLocationByIdx(key)
		if (location) then
			return location:IsPlayerWithin()
		end
		return false
	end
})

local VISITED = { }

setmetatable(VISITED, {
	__index = function(_, key)
		if (currentRoot ~= GuideNavigationService.GetStep()) then return false end
		local location = LocationsService.GetLocationByIdx(key)
		if (location) then
			return location:HasVisited()
		end
		return false
	end
})

local EXITED = { }

setmetatable(EXITED, {
	__index = function(_, key)
		if (currentRoot ~= GuideNavigationService.GetStep()) then return false end
		local location = LocationsService.GetLocationByIdx(key)
		if (location) then
			return location:HasExited()
		end
		return false
	end
})

local BUFF = { }

setmetatable(BUFF, {
	__index = function(_, key)
		return AuraService.PlayerHasBuff(key)
	end
})

local DEBUFF = { }

setmetatable(DEBUFF, {
	__index = function(_, key)
		return AuraService.PlayerHasDebuff(key)
	end
})

local contextFunctions = {
	ACTIVE = function()
		if (currentRoot ~= GuideNavigationService.GetStep()) then return 0 end
		local activeLocation = LocationsService.GetActiveLocation()
		return activeLocation and activeLocation.idx or 0
	end,
	AH = function()
		return State.IsAHEnabled()
	end,
	ALIVE = function()
		return not UnitIsDeadOrGhost("player")
	end,
	AREA = function()
		return PlacesService.GetCurrentAreaID()
	end,
	DEAD = function()
		return UnitIsDead("player")
	end,
	DEADORGHOST = function()
		return UnitIsDeadOrGhost("player")
	end,
	DIED = function()
		return GhostService.HasPlayerDied(currentRoot)
	end,
	CHECKPOINT = function()
		if (currentRoot ~= GuideNavigationService.GetStep()) then return 0 end
		return GuideNavigationService.GetGuide().bookmark.checkpoint
	end,
	COMPLETE = function()
		if (currentObj and currentObj.taskType) then
			return currentObj.taskType:IsCompleted(currentObj)
		end
	end,
	GHOST = function()
		return UnitIsGhost("player")
	end,
	GROUPS = function()
		return State.IsGroupingEnabled()
	end,
	HC = function()
		return HardcoreService.IsHardcoreEnabled()
	end,
	JOYOUS = function()
		return AuraService.PlayerHasBuff(377749)
	end,
	LEVEL = function()
		return UnitLevel("player")
	end,
	LEVELD = function()
		return UnitLevel("player") + UnitXP("player") / UnitXPMax("player")
	end,
	MONEY = GetMoney,
	ONTAXI = function()
		if (PlayerOnTaxiOverride) then
			return PlayerOnTaxiOverride()
		end
		return UnitOnTaxi("player")
	end,
	PARENTWMOAREA = function()
		return PlacesService.GetCurrentParentWMOAreaID()
	end,
	PETSTABLE = function()
		return MerchantService.IsPetStableVisited(currentRoot)
	end,
	REPAIRED = function()
		return MerchantService.IsRepairMerchantVisited(currentRoot)
	end,
	RESUPPLIED = function()
		return MerchantService.IsSupplyMerchantVisited(currentRoot)
	end,
	SPIRITRESSED = function()
		return GhostService.HasPlayerSpiritRessed(currentRoot)
	end,
	TALENTTRAINER = function()
		return MerchantService.IsTalentTrainerVisited(currentRoot)
	end,
	TAXITAKEN = function()
		return TaxiService.IsTaxiTaken(currentRoot)
	end,
	TRADESKILLTRAINER = function()
		return MerchantService.IsTradeskillTrainerVisited(currentRoot)
	end,
	WEAPONSKILLTRAINER = function()
		return MerchantService.IsTalentTrainerVisited(currentRoot)
	end,
	WMOAREA = function()
		return PlacesService.GetCurrentWMOAreaID()
	end,
	XP = function()
		return UnitXP("player")
	end,
	XPMAX = function()
		return UnitXPMax("player")
	end,
	ZONE = function()
		if (PlayerPositionOverride) then
			local _, _, mapID = PlayerPositionOverride()
			if (mapID) then
				return mapID
			end
		end
		return C_Map.GetBestMapForUnit("player")
	end,
}

setmetatable(context, {
	__index = function(tbl, key)
		local dotPosition = string.find(key, "%.")
		local subKey
		if dotPosition then
			local newKey = string.sub(key, 1, dotPosition - 1)
			subKey = string.sub(key, dotPosition + 1)
			key = newKey
		end
		local val = rawget(tbl, key) or contextFunctions[key]
		if (type(val) == "function") then
			return val()
		else
			if (subKey) then
				return val[subKey]
			else
				return val
			end
		end
	end,
	__newindex = function(tbl, key, val)
		local dotPosition = string.find(key, "%.")
		if dotPosition then
			local newKey = string.sub(key, 1, dotPosition - 1)
			local subKey = string.sub(key, dotPosition + 1)
			local subTable = rawget(tbl, newKey)
			if (subTable) then
				subTable[subKey] = val
			end
		else
			rawset(tbl, key, val)
		end
	end
})

function Condition_ResetGuides()
	for _, guideInfo in ipairs(GuideInfos) do
		local moduleInfo = GuideModules.GetModule(guideInfo.moduleID)
		if (moduleInfo and moduleInfo.installed and moduleInfo.compatible) then
			context[guideInfo.guideID] = true
		end
	end
end

function GetCondition(varname)
	return context[varname]
end

function SetCondition(varname, value, scope, allowReserved)
	if (reservedContextVars[varname] and not allowReserved) then
		DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000Cannot overwrite reserved condition variable: " .. varname .. "|r")
		return
	end
	context[varname] = value
	State.SetCustomVariable(varname, value, scope)
end

function Condition_OnAddonLoad()
	local _, playerClass = UnitClass("Player")
	local _, _, _, gameVersion = GetBuildInfo()
	context["GAMEVERSION"] = gameVersion
	if (gameVersion < 20000) then
		context["ERA"] = true
	elseif (gameVersion >= 30000) then
		context["WOTLK"] = true
	else
		context["TBC"] = true
	end
	context["PHASE"] = 6
	context[playerClass] = true
	Condition_ResetGuides()
	context["QUEST"] = QUEST
	context["OBJECTIVE"] = OBJECTIVE
	context["BANKITEM"] = BANKITEM
	context["ITEM"] = ITEM
	for k, v in pairs(QuestStatus.status) do
		context[k] = v
	end
	for repLevel, value in pairs(REP_LEVELS) do
		context[repLevel] = value
	end
	context["REP"] = REP
	local playerFaction = UnitFactionGroup("player")
	PLAYER_FACTION = string.upper(playerFaction)
	context[PLAYER_FACTION] = true
	local _, playerRace = UnitRace("player")
	context[string.upper(playerRace)] = true
	context["WITHIN"] = WITHIN
	context["VISITED"] = VISITED
	context["EXITED"] = EXITED
	context["BUFF"] = BUFF
	context["DEBUFF"] = DEBUFF
	context["SESSION"] = CustomVariablesService.GetSessionScope()
	context["VAR"] = CustomVariablesService.GetCharacterScope()
	for k, v in pairs(ProfessionService.Tiers) do
		context[k] = v
	end
	for k in pairs(Professions) do
		contextFunctions[k] = function()
			return ProfessionService.PlayerProfessions[k] or 0
		end
	end
	for _, slotName in ipairs(EquipmentService.GetSlotNames()) do
		contextFunctions[slotName] = function()
			return EquipmentService.GetEquippedItem(slotName)
		end
		contextFunctions[slotName .. "SUBCLASS"] = function()
			return EquipmentService.GetEquippedItemSubClass(slotName)
		end
	end
	for k, v in pairs(Enum.ItemWeaponSubclass) do
		context[string.upper(k)] = v
	end
end
