--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local taxiMaps = {
	1463,   -- Eastern Kingdoms
	1464,   -- Kalimdor
	987,    -- Outland
	988,    -- Northrend
}

local taxiMapFlags = {
	ALLIANCE = 1,
	HORDE = 2
}

local FindEligibleTaxiNode, HookTakeTaxiNode
local lastEligibleIDX, lastEligibleStep
local Taxis
local TaxiNodeLUT
local useLegacyAPI = true

function FindEligibleTaxiNode()
	local currentStep = GuideNavigationService.GetStep()
	if (currentStep) then
		for _, taskGroup in ipairs(currentStep) do
			if (taskGroup.conditionPassed and not taskGroup.completedPassed) then
				for _, task in ipairs(taskGroup) do
					local taxiNodeID = task.taketaxi
					if (taxiNodeID and task.conditionPassed and not task.completedPassed) then
						return taxiNodeID
					end
				end
			end
		end
	end
end

function HookTakeTaxiNode(idx)
	if (idx == lastEligibleIDX) then
		local currentStep = GuideNavigationService.GetStep()
		if (currentStep and currentStep == lastEligibleStep) then
			GuideNavigationService.GetGuide().bookmark.taxiTaken = true
			currentStep.taxiTaken = true
		end
	end
end

local function OnEvent(_, event, _, arg3)
	if (event == "TAXIMAP_OPENED") then
		local foundTaxiNodeID = FindEligibleTaxiNode()
		local foundTaxiIDX
		lastEligibleIDX = nil
		if (useLegacyAPI) then
			local nodes = NumTaxiNodes()
			for i = 1, nodes do
				local name = TaxiNodeName(i)
				local taxiNodeID = TaxiNodeLUT[name]
				if (taxiNodeID) then
					Taxis[TaxiNodeLUT[name]] = true
					if (taxiNodeID == foundTaxiNodeID) then
						foundTaxiIDX = i
					end
				end
			end
		else
			for _, map in ipairs(taxiMaps) do
				local taxiNodes = C_TaxiMap.GetAllTaxiNodes(map)
				for _, node in ipairs(taxiNodes) do
					Taxis[node.nodeID] = node.state ~= Enum.FlightPathState.Unreachable
					if (node.nodeID == foundTaxiNodeID) then
						foundTaxiIDX = node.slotIndex
					end
				end
			end
		end
		if (foundTaxiIDX) then
			lastEligibleIDX = foundTaxiIDX
			lastEligibleStep = GuideNavigationService.GetStep()
			if (State.IsAutoTaxiEnabled()) then
				TakeTaxiNode(foundTaxiIDX)
			end
		end
		MarkAllDirty()
		return
	end
	if (event == "UI_INFO_MESSAGE" and arg3 == ERR_NEWTAXIPATH) then
		local y, x, _, continent = UnitPosition("player")
		if (y) then
			local flag = taxiMapFlags[PLAYER_FACTION]
			local minDistance, minDistanceNode = 2147483647, nil
			for taxiNodeID, taxiNodeLocation in pairs(TaxiNodeLocations) do
				if (continent == taxiNodeLocation.continentID and bit.band(taxiNodeLocation.flags, flag) ~= 0) then
					local distance = addon.GetDistanceInYards(x, y, taxiNodeLocation.x, taxiNodeLocation.y)
					if (distance < minDistance) then
						minDistance = distance
						minDistanceNode = taxiNodeID
					end
				end
			end
			if (minDistanceNode ~= nil) then
				Taxis[minDistanceNode] = true
				MarkAllDirty()
				return
			end
		end
	end
end

TaxiService = { }

function TaxiService.GetTaxiName(nodeID)
	return TaxiNodes[nodeID] or "..."
end

function TaxiService.HasTaxi(nodeID)
	return Taxis[nodeID] or false
end

function TaxiService.Init()
	SavedVariablesPerCharacter.knownTaxis = SavedVariablesPerCharacter.knownTaxis or { }
	Taxis = SavedVariablesPerCharacter.knownTaxis
	for _, map in ipairs(taxiMaps) do
		local taxiNodes = C_TaxiMap.GetTaxiNodesForMap(map)
		for _, node in ipairs(taxiNodes) do
			useLegacyAPI = false
			TaxiNodes[node.nodeID] = node.name
		end
	end
	if (useLegacyAPI) then
		TaxiNodeLUT = { }
		for k, v in ipairs(TaxiNodes) do
			TaxiNodeLUT[v] = k
		end
	end
end

function TaxiService.IsTaxiTaken(rootNode)
	local step = rootNode or GuideNavigationService.GetStep()
	return step.taxiTaken or false
end

function TaxiService.OnGossipShow()
	if (not GuideNavigationService.IsGuideSet()) then return false end
	local gossipOption
	if (C_GossipInfo and C_GossipInfo.GetOptions) then
		local options = C_GossipInfo.GetOptions()
		if (options) then
			for idx, option in ipairs(options) do
				if (option.icon == 132057) then
					gossipOption = idx
					break
				end
			end
		end
	else
		local options = { GetGossipOptions() }
		for i = 1, #options, 2 do
			if (options[i + 1] == "taxi") then
				gossipOption = (i + 1) / 2
			end
		end
	end
	if (gossipOption and FindEligibleTaxiNode()) then
		if (State.IsAutoTaxiEnabled()) then
			SelectGossipOption(gossipOption)
		end
		return true
	end
end

local frame = CreateFrame("Frame")
frame:SetScript("OnEvent", OnEvent)
frame:RegisterEvent("TAXIMAP_OPENED")
frame:RegisterEvent("UI_INFO_MESSAGE")

hooksecurefunc("TakeTaxiNode", HookTakeTaxiNode)