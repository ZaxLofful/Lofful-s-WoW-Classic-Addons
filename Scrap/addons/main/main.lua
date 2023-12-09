--[[
<<<<<<< HEAD
Copyright 2008-2021 João Cardoso
Scrap is distributed under the terms of the GNU General Public License (Version 3).
As a special exception, the copyright holders of this addon do not give permission to
redistribute and/or modify it.

This addon is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the addon. If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.

This file is part of Scrap.
=======
Copyright 2008-2023 João Cardoso
All Rights Reserved
>>>>>>> classic_hardcore
--]]

local Scrap = LibStub('WildAddon-1.0'):NewAddon(...)
local L = LibStub('AceLocale-3.0'):GetLocale('Scrap')
<<<<<<< HEAD
local Unfit = LibStub('Unfit-1.0')

local CLASS_NAME = LOCALIZED_CLASS_NAMES_MALE[select(2, UnitClass('player'))]
local WEAPON, ARMOR, CONSUMABLES = LE_ITEM_CLASS_WEAPON, LE_ITEM_CLASS_ARMOR, LE_ITEM_CLASS_CONSUMABLE
local FISHING_POLE = LE_ITEM_WEAPON_FISHINGPOLE

local CAN_TRADE = BIND_TRADE_TIME_REMAINING:format('.*')
local CAN_REFUND = REFUND_TIME_REMAINING:format('.*')
local MATCH_CLASS = ITEM_CLASSES_ALLOWED:format('')
local IN_SET = EQUIPMENT_SETS:format('.*')

local SHOULDER_BREAKPOINT = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE and 15 or 25
local INTRO_BREAKPOINT = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE and 5 or 15

local POOR, COMMON, UNCOMMON, RARE, EPIC = 0,1,2,3,4
local ACTUAL_SLOTS = {
	INVTYPE_ROBE = 'INVTYPE_CHEST',
	INVTYPE_CLOAK = 'INVTYPE_BACK',
	INVTYPE_RANGEDRIGHT = 'INVTYPE_RANGED',
	INVTYPE_THROWN = 'INVTYPE_RANGED',
	INVTYPE_WEAPONMAINHAND = 'INVTYPE_MAINHAND',
	INVTYPE_WEAPONOFFHAND = 'INVTYPE_OFFHAND',
	INVTYPE_HOLDABLE = 'INVTYPE_OFFHAND',
	INVTYPE_SHIELD = 'INVTYPE_OFFHAND',
}

BINDING_NAME_SCRAP_TOGGLE = L.ToggleMousehover
BINDING_NAME_SCRAP_DESTROY = L.DestroyJunk
BINDING_NAME_SCRAP_SELL = L.SellJunk
BINDING_HEADER_SCRAP = 'Scrap'
=======
local C = LibStub('C_Everywhere').Container
local Search = LibStub('ItemSearch-1.3')

local NUM_BAGS = NUM_TOTAL_EQUIPPED_BAG_SLOTS or NUM_BAG_SLOTS
local WEAPON, ARMOR, CONSUMABLES = Enum.ItemClass.Weapon, Enum.ItemClass.Armor, Enum.ItemClass.Consumable
local FISHING_POLE = Enum.ItemWeaponSubclass.Fishingpole

local POOR, COMMON, UNCOMMON, RARE, EPIC = 0,1,2,3,4
local ACTUAL_SLOTS = {
	ROBE = 'CHEST', CLOAK = 'BACK',
	RANGEDRIGHT = 'RANGED', THROWN = 'RANGED', RELIC = 'RANGED',
	WEAPONMAINHAND = 'MAINHAND', WEAPONOFFHAND = 'OFFHAND', HOLDABLE = 'OFFHAND', SHIELD = 'OFFHAND'}

local SHOULDER_BREAKPOINT = LE_EXPANSION_LEVEL_CURRENT > 2 and 15 or 25
local INTRO_BREAKPOINT = LE_EXPANSION_LEVEL_CURRENT > 2 and 5 or 15

BINDING_NAME_SCRAP_TOGGLE = L.ToggleMousehover
BINDING_NAME_SCRAP_DESTROY_ONE = L.DestroyCheapest
BINDING_NAME_SCRAP_DESTROY_ALL = L.DestroyJunk
BINDING_NAME_SCRAP_SELL = L.SellJunk
SCRAP = 'Scrap'
>>>>>>> classic_hardcore


--[[ Startup ]]--

function Scrap:OnEnable()
<<<<<<< HEAD
	self.tip = CreateFrame('GameTooltip', 'ScrapTooltip', nil, 'GameTooltipTemplate')
=======
	self.Tip = CreateFrame('GameTooltip', 'ScrapTooltip', nil, 'GameTooltipTemplate')
>>>>>>> classic_hardcore
	self:RegisterEvent('MERCHANT_SHOW', function() LoadAddOn('Scrap_Merchant'); self:SendSignal('MERCHANT_SHOW') end)
	self:RegisterSignal('SETS_CHANGED', 'OnSettings')
	self:OnSettings()

<<<<<<< HEAD
	CreateFrame('Frame', nil, InterfaceOptionsFrame):SetScript('OnShow', function()
		LoadAddOn('Scrap_Config')
	end)
end

function Scrap:OnSettings()
	Scrap_Sets = Scrap_Sets or {list = {}, sell = true, repair = true, safe = true, destroy = true, glow = true, icons = true}
	Scrap_CharSets = Scrap_CharSets or {list = {}, ml = {}}

	self.sets, self.charsets = Scrap_Sets, Scrap_CharSets
	self.junk = setmetatable(self.charsets.share and self.sets.list or self.charsets.list, self.baseList)
=======
	if (Scrap.sets.tutorial or 0) < 1 then
		LoadAddOn('Scrap_Config')
	else
		(SettingsPanel or InterfaceOptionsFrame):HookScript('OnShow', function()
			LoadAddOn('Scrap_Config')
		end)
	end
end

function Scrap:OnSettings()
	Scrap_CharSets = Scrap_CharSets or {list = {}, auto = {}}
	Scrap_Sets = Scrap_Sets or {list = {}}

	self.charsets, self.sets = Scrap_CharSets, setmetatable(Scrap_Sets, self.Defaults)
	self.junk = setmetatable(self.charsets.share and self.sets.list or self.charsets.list, self.BaseList)

	-- removes deprecated data. keep until next major game update
	self.charsets.ml = nil
	self.charsets.auto = self.charsets.auto or {}
	--

>>>>>>> classic_hardcore
	self:SendSignal('LIST_CHANGED')
end


--[[ Public API ]]--

function Scrap:IsJunk(id, ...)
	if id and self.junk and self.junk[id] ~= false then
<<<<<<< HEAD
		return self.junk[id] or (self.sets.learn and self.charsets.ml[id] and self.charsets.ml[id] >= 1) or self:IsFiltered(id, ...)
=======
		return self.junk[id] or (self.sets.learn and (self.charsets.auto[id] or 0) > .5) or self:IsFiltered(id, ...)
>>>>>>> classic_hardcore
	end
end

function Scrap:ToggleJunk(id)
	local junk = self:IsJunk(id)

	self.junk[id] = not junk
<<<<<<< HEAD
	self:Print(junk and L.Removed or L.Added, select(2, GetItemInfo(id)), 'LOOT')
=======
	self:Print(format(junk and L.Removed or L.Added, select(2, GetItemInfo(id))), 'LOOT')
>>>>>>> classic_hardcore
	self:SendSignal('LIST_CHANGED', id)
end

function Scrap:IterateJunk()
<<<<<<< HEAD
	local bagNumSlots, bag, slot = GetContainerNumSlots(BACKPACK_CONTAINER), BACKPACK_CONTAINER, 0
	local match, id

	return function()
		match = nil

		while not match do
			if slot < bagNumSlots then
				slot = slot + 1
			elseif bag < NUM_BAG_FRAMES then
				bag = bag + 1
				bagNumSlots = GetContainerNumSlots(bag)
				slot = 1
			else
				bag, slot = nil
				break
			end

			id = GetContainerItemID(bag, slot)
			match = self:IsJunk(id, bag, slot)
		end

		return bag, slot, id
=======
	local numSlots = C.GetContainerNumSlots(BACKPACK_CONTAINER)
	local bag, slot = BACKPACK_CONTAINER, 0

	return function()
		while true do
			if slot < numSlots then
				slot = slot + 1
			elseif bag < NUM_BAGS then
				bag, slot = bag + 1, 1
				numSlots = C.GetContainerNumSlots(bag)
			else
				return
			end

			local id = C.GetContainerItemID(bag, slot)
			if self:IsJunk(id, bag, slot) then
				return bag, slot, id
			end
		end
	end
end

function Scrap:DestroyCheapest()
	local best = {value = 2^128}

	for bag, slot in self:IterateJunk() do
		local _, family = C.GetContainerNumFreeSlots(bag)
		if family == 0 then
			local item = C.GetContainerItemInfo(bag, slot)
			local _,_,_,_,_,_,_, maxStack, _,_, price = GetItemInfo(item.itemID) 

			local value = price * (item.stackCount + sqrt(maxStack - item.stackCount) * 0.5)
			if value < best.value then
				best.bag, best.slot, best.item, best.value = bag, slot, item, value
			end
		end
	end

	if best.item then
		C.PickupContainerItem(best.bag, best.slot)
		DeleteCursorItem()
		self:Print(L.Destroyed:format(best.item.hyperlink, best.item.stackCount), 'LOOT')
>>>>>>> classic_hardcore
	end
end

function Scrap:DestroyJunk()
<<<<<<< HEAD
	LibStub('Sushi-3.1').Popup {
		id = 'DeleteScrap',
		text = L.ConfirmDelete, button1 = OKAY, button2 = CANCEL,
		hideOnEscape = 1, showAlert = 1, whileDead = 1,
		OnAccept = function()
			for bag, slot in self:IterateJunk() do
				PickupContainerItem(bag, slot)
=======
	LibStub('Sushi-3.2').Popup {
		text = L.ConfirmDelete, showAlert = true, button1 = OKAY, button2 = CANCEL,
		OnAccept = function()
			for bag, slot in self:IterateJunk() do
				C.PickupContainerItem(bag, slot)
>>>>>>> classic_hardcore
				DeleteCursorItem()
			end
		end
	}
end


--[[ Filters ]]--

function Scrap:IsFiltered(id, ...)
	local location = self:GuessLocation(id, ...)
<<<<<<< HEAD
	local _, link, quality, level,_,_,_,_, slot, _, value, class, subclass = GetItemInfo(id)
	local level = location and C_Item.GetCurrentItemLevel(location) or level or 0

	if not value or value == 0 then
		return

	elseif class == ARMOR or class == WEAPON then
		if value and self:IsCombatItem(class, subclass, slot) then
			if self:IsGray(quality) then
				return (slot ~= 'INVTYPE_SHOULDER' and level > INTRO_BREAKPOINT) or level > SHOULDER_BREAKPOINT
			elseif self:IsStandardQuality(quality) then
				self:LoadTip(link, location and location.bagID, location and location.slotIndex)

				if not self:BelongsToSet() and location and C_Item.IsBound(location) then
					local unusable = self.charsets.unusable and (Unfit:IsClassUnusable(class, subclass, slot) or self:IsOtherClass())
					return unusable or self:IsLowEquip(slot, level)
=======
	local _, link, quality, level,_,_,_,_, slot, _, value, class, subclass, bound = GetItemInfo(id)
	local level = location and C_Item.GetCurrentItemLevel(location) or level or 0

	if not value or value == 0 or (IsCosmeticItem and IsCosmeticItem(id)) then
		return

	elseif class == ARMOR or class == WEAPON then
		if value and slot ~= 'INVTYPE_TABARD' and slot ~= 'INVTYPE_BODY' and subclass ~= FISHING_POLE then
			if quality == POOR then
				return bound ~= LE_ITEM_BIND_ON_EQUIP and ((slot ~= 'INVTYPE_SHOULDER' and level > INTRO_BREAKPOINT) or level > SHOULDER_BREAKPOINT)
			elseif quality >= UNCOMMON and quality <= EPIC and location and C_Item.IsBound(location) then
				if IsEquippableItem(id) and not Search:BelongsToSet(id) then
					return self:IsLowEquip(slot, level) or self.charsets.unusable and Search:IsUnusable(id)
>>>>>>> classic_hardcore
				end
			end
		end

<<<<<<< HEAD
	elseif self:IsGray(quality) then
		return true
	elseif class == CONSUMABLES then
		return self.charsets.consumable and quality < RARE and self:IsLowLevel(level)
	end
end

function Scrap:IsGray(quality)
	return quality == POOR
end

function Scrap:IsLowLevel(level)
	return level ~= 0 and level < (UnitLevel('player') - 10)
end

function Scrap:IsStandardQuality(quality)
	return quality >= UNCOMMON and quality <= EPIC
end

function Scrap:IsCombatItem(class, subclass, slot)
	return slot ~= 'INVTYPE_TABARD' and slot ~= 'INVTYPE_BODY' and subclass ~= FISHING_POLE
end

function Scrap:IsLowEquip(slot, level)
	if self.charsets.equip and slot ~= ''  then
		local slot1 = gsub(ACTUAL_SLOTS[slot] or slot, 'INVTYPE', 'INVSLOT')
		local slot2, double

		if slot1 == 'INVSLOT_WEAPON' or slot1 == 'INVSLOT_2HWEAPON' then
			if slot1 == 'INVSLOT_2HWEAPON' then
				double = true
			end

			slot1, slot2 = 'INVSLOT_MAINHAND', 'INVSLOT_OFFHAND'
		elseif slot1 == 'INVSLOT_FINGER' then
			slot1, slot2 = 'INVSLOT_FINGER1', 'INVSLOT_FINGER2'
		elseif slot1 == 'INVSLOT_TRINKET' then
			slot1, slot2 = 'INVSLOT_TRINKET1', 'INVSLOT_TRINKET2'
=======
	elseif quality == POOR then
		return bound ~= LE_ITEM_BIND_ON_EQUIP
	elseif class == CONSUMABLES then
		return self.charsets.consumable and quality < RARE and self:IsLowConsumable(level)
	end
end

function Scrap:IsLowEquip(slot, level)
	if self.charsets.equip and slot ~= ''  then
		local slot1 = slot:sub(9)
		local slot2, double

		if slot1 == 'WEAPON' or slot1 == '2HWEAPON' then
			if slot1 == '2HWEAPON' then
				double = true
			end

			slot1, slot2 = 'MAINHAND', 'OFFHAND'
		elseif slot1 == 'FINGER' then
			slot1, slot2 = 'FINGER1', 'FINGER2'
		elseif slot1 == 'TRINKET' then
			slot1, slot2 = 'TRINKET1', 'TRINKET2'
		else
			slot1 = ACTUAL_SLOTS[slot1] or slot1
>>>>>>> classic_hardcore
		end

		return self:IsBetterEquip(slot1, level) and (not slot2 or self:IsBetterEquip(slot2, level, double))
	end
end

<<<<<<< HEAD
function Scrap:IsBetterEquip(slot, level, empty)
	local item = ItemLocation:CreateFromEquipmentSlot(_G[slot])
	if C_Item.DoesItemExist(item) then
		return (C_Item.GetCurrentItemLevel(item) or 0) >= (level + 10)
	elseif empty then
		return true
	end
end


--[[ Data Retrieval ]]--
=======
function Scrap:IsBetterEquip(slot, level, canEmpty)
	local item = ItemLocation:CreateFromEquipmentSlot(_G['INVSLOT_' .. slot])
	if C_Item.DoesItemExist(item) then
		return (C_Item.GetCurrentItemLevel(item) or 0) >= (level * 1.3)
	end
	return canEmpty
end

function Scrap:IsLowConsumable(level)
	return level > 1 and (level * 1.3) < UnitLevel('player')
end


--[[ Guessing ]]--
>>>>>>> classic_hardcore

function Scrap:GuessLocation(...)
	local bag, slot = self:GuessBagSlot(...)
	if bag and slot then
		local location = ItemLocation:CreateFromBagAndSlot(bag, slot)
<<<<<<< HEAD
		if C_Item.DoesItemExist(location) then
			return location
		end
=======
		return C_Item.DoesItemExist(location) and location
>>>>>>> classic_hardcore
	end
end

function Scrap:GuessBagSlot(id, bag, slot)
	if bag and slot then
<<<<<<< HEAD
		if bag >= BACKPACK_CONTAINER and bag < NUM_BAG_FRAMES then
			return bag, slot
		end
	elseif GetItemCount(id) > 0 then
		for bag = BACKPACK_CONTAINER, NUM_BAG_FRAMES do
		  	 for slot = 1, GetContainerNumSlots(bag) do
		  	 	if id == GetContainerItemID(bag, slot) then
=======
		return bag, slot
	elseif GetItemCount(id) > 0 then
		for bag = BACKPACK_CONTAINER, NUM_BAGS do
		  	 for slot = 1, C.GetContainerNumSlots(bag) do
		  	 	if id == C.GetContainerItemID(bag, slot) then
>>>>>>> classic_hardcore
		  	 		return bag, slot
		  	 	end
			end
		end
	end
end

<<<<<<< HEAD
function Scrap:IsOtherClass()
	for i = self.numLines, self.limit, -1 do
		local text = self:ScanLine(i)
		if text:find(MATCH_CLASS) then
			return not text:find(CLASS_NAME)
		end
	end
end

function Scrap:BelongsToSet()
	return C_EquipmentSet and C_EquipmentSet.CanUseEquipmentSets() and self:ScanLine(self.numLines - 1):find(IN_SET)
end

function Scrap:LoadTip(link, bag, slot)
	self.tip:SetOwner(UIParent, 'ANCHOR_NONE')

	if bag and slot then
		if bag ~= BANK_CONTAINER then
			self.tip:SetBagItem(bag, slot)
		else
			self.tip:SetInventoryItem('player', BankButtonIDToInvSlotID(slot))
		end
	else
		self.tip:SetHyperlink(link)
	end

	self.limit = 2
	self.numLines = self.tip:NumLines()
end

function Scrap:ScanLine(i)
	local line = _G[self.tip:GetName() .. 'TextLeft' .. i]
	return line and line:GetText() or ''
end

=======
>>>>>>> classic_hardcore

--[[ Chat ]]--

function Scrap:PrintMoney(pattern, value)
<<<<<<< HEAD
	self:Print(pattern, GetMoneyString(value, true), 'MONEY')
end

function Scrap:Print(pattern, value, channel)
=======
	self:Print(pattern:format(GetMoneyString(value, true)), 'MONEY')
end

function Scrap:Print(text, channel)
>>>>>>> classic_hardcore
	local i = 1
	local frame = _G['ChatFrame' .. i]
 	local channel = 'CHAT_MSG_' .. channel

	while frame do
		if frame:IsEventRegistered(channel) then
<<<<<<< HEAD
			ChatFrame_MessageEventHandler(frame, channel, pattern:format(value), '', nil, '')
=======
			ChatFrame_MessageEventHandler(frame, channel, text, '', nil, '')
>>>>>>> classic_hardcore
		end

		i = i + 1
		frame = _G['ChatFrame' .. i]
	end
end
