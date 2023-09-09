--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

EquipmentService = { }

local slotIDs = { }
local slotNames = { }

for k, v in pairs({
	["HEAD"] = "HeadSlot",
	["NECK"] = "NeckSlot",
	["SHOULDER"] = "ShoulderSlot",
	["BACK"] = "BackSlot",
	["CHEST"] = "ChestSlot",
	["SHIRT"] = "ShirtSlot",
	["TABARD"] = "TabardSlot",
	["WRIST"] = "WristSlot",
	["HANDS"] = "HandsSlot",
	["WAIST"] = "WaistSlot",
	["LEGS"] = "LegsSlot",
	["FEET"] = "FeetSlot",
	["FINGER0"] = "Finger0Slot",
	["FINGER1"] = "Finger1Slot",
	["TRINKET0"] = "Trinket0Slot",
	["TRINKET1"] = "Trinket1Slot",
	["MAINHAND"] = "MainHandSlot",
	["SECONDARYHAND"] = "SecondaryHandSlot",
	["RANGED"] = "RangedSlot",
	["AMMO"] = "AmmoSlot",
}) do
	local slotId = GetInventorySlotInfo(v)
	slotIDs[k] = slotId
	table.insert(slotNames, k)
end

function EquipmentService.GetEquippedItem(slotName)
	return GetInventoryItemID("player", slotIDs[slotName])
end

function EquipmentService.GetEquippedItemSubClass(slotName)
	local itemID = GetInventoryItemID("player", slotIDs[slotName])
	if (itemID) then
		local subClass = select(13, GetItemInfo(itemID))
		return subClass
	end
end

function EquipmentService.GetSlotNames()
	return slotNames
end
