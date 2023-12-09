--[[
<<<<<<< HEAD
Copyright 2011-2021 João Cardoso
=======
Copyright 2011-2023 João Cardoso
>>>>>>> classic_hardcore
Unfit is distributed under the terms of the GNU General Public License (Version 3).
As a special exception, the copyright holders of this library give you permission to embed it
with independent modules to produce an addon, regardless of the license terms of these
independent modules, and to copy and distribute the resulting software under terms of your
choice, provided that you also meet, for each embedded independent module, the terms and
conditions of the license of that module. Permission is not granted to modify this library.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

This file is part of Unfit.
--]]

<<<<<<< HEAD
local Lib = LibStub:NewLibrary('Unfit-1.0', 9)
=======
local Lib = LibStub:NewLibrary('Unfit-1.0', 13)
>>>>>>> classic_hardcore
if not Lib then return end


--[[ Data ]]--

do
<<<<<<< HEAD
	local _, Class = UnitClass('player')
=======
	local Class = UnitClassBase('player')
>>>>>>> classic_hardcore
	local Unusable

	if Class == 'DEATHKNIGHT' then
		Unusable = { -- weapon, armor, dual-wield
<<<<<<< HEAD
			{LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_STAFF,LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND},
			{LE_ITEM_ARMOR_SHIELD}
		}
	elseif Class == 'DEMONHUNTER' then
		Unusable = {
			{LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND},
			{LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}
		}
	elseif Class == 'DRUID' then
		Unusable = {
			{LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND},
			{LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD},
=======
			{Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Staff, Enum.ItemWeaponSubclass.Unarmed, Enum.ItemWeaponSubclass.Dagger, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand},
			{Enum.ItemArmorSubclass.Shield}
		}
	elseif Class == 'DEMONHUNTER' then
		Unusable = {
			{Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Mace1H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Staff, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand},
			{Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield}
		}
	elseif Class == 'DRUID' then
		Unusable = {
			{Enum.ItemWeaponSubclass.Axe1H, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Sword1H, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand},
			{Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield},
			true
		}
	elseif Class == 'EVOKER' then
		Unusable = {
			{Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand},
			{Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield},
>>>>>>> classic_hardcore
			true
		}
	elseif Class == 'HUNTER' then
		Unusable = {
<<<<<<< HEAD
			{LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_WAND},
			{LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}
		}
	elseif Class == 'MAGE' then
		Unusable = {
			{LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW},
			{LE_ITEM_ARMOR_LEATHER, LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD},
=======
			{Enum.ItemWeaponSubclass.Mace1H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Wand},
			{Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield}
		}
	elseif Class == 'MAGE' then
		Unusable = {
			{Enum.ItemWeaponSubclass.Axe1H, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Mace1H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Unarmed, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow},
			{Enum.ItemArmorSubclass.Leather, Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield},
>>>>>>> classic_hardcore
			true
		}
	elseif Class == 'MONK' then
		Unusable = {
<<<<<<< HEAD
			{LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND},
			{LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}
		}
	elseif Class == 'PALADIN' then
		Unusable = {
			{LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_DAGGER, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND},
=======
			{Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Dagger, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand},
			{Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield}
		}
	elseif Class == 'PALADIN' then
		Unusable = {
			{Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Staff, Enum.ItemWeaponSubclass.Unarmed, Enum.ItemWeaponSubclass.Dagger, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand},
>>>>>>> classic_hardcore
			{},
			true
		}
	elseif Class == 'PRIEST' then
		Unusable = {
<<<<<<< HEAD
			{LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW},
			{LE_ITEM_ARMOR_LEATHER, LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD},
=======
			{Enum.ItemWeaponSubclass.Axe1H, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword1H, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Unarmed, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow},
			{Enum.ItemArmorSubclass.Leather, Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield},
>>>>>>> classic_hardcore
			true
		}
	elseif Class == 'ROGUE' then
		Unusable = {
<<<<<<< HEAD
			{LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_STAFF, LE_ITEM_WEAPON_WAND},
			{LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD}
		}
	elseif Class == 'SHAMAN' then
		Unusable = {
			{LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD1H, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW, LE_ITEM_WEAPON_WAND},
			{LE_ITEM_ARMOR_PLATE}
		}
	elseif Class == 'WARLOCK' then
		Unusable = {
			{LE_ITEM_WEAPON_AXE1H, LE_ITEM_WEAPON_AXE2H, LE_ITEM_WEAPON_BOWS, LE_ITEM_WEAPON_GUNS, LE_ITEM_WEAPON_MACE1H, LE_ITEM_WEAPON_MACE2H, LE_ITEM_WEAPON_POLEARM, LE_ITEM_WEAPON_SWORD2H, LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_UNARMED, LE_ITEM_WEAPON_THROWN, LE_ITEM_WEAPON_CROSSBOW},
			{LE_ITEM_ARMOR_LEATHER, LE_ITEM_ARMOR_MAIL, LE_ITEM_ARMOR_PLATE, LE_ITEM_ARMOR_SHIELD},
			true
		}
	elseif Class == 'WARRIOR' then
		Unusable = {{LE_ITEM_WEAPON_WARGLAIVE, LE_ITEM_WEAPON_WAND}, {}}
=======
			{Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Staff, Enum.ItemWeaponSubclass.Wand},
			{Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield}
		}
	elseif Class == 'SHAMAN' then
		Unusable = {
			{Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword1H, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand},
			{Enum.ItemArmorSubclass.Plate}
		}
	elseif Class == 'WARLOCK' then
		Unusable = {
			{Enum.ItemWeaponSubclass.Axe1H, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Mace1H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Unarmed, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow},
			{Enum.ItemArmorSubclass.Leather, Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield},
			true
		}
	elseif Class == 'WARRIOR' then
		Unusable = {{Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Wand}, {}}
>>>>>>> classic_hardcore
	else
		Unusable = {{}, {}}
	end


	Lib.unusable = {}
	Lib.cannotDual = Unusable[3]

<<<<<<< HEAD
	for i, class in ipairs({LE_ITEM_CLASS_WEAPON, LE_ITEM_CLASS_ARMOR}) do
=======
	for i, class in ipairs({Enum.ItemClass.Weapon, Enum.ItemClass.Armor}) do
>>>>>>> classic_hardcore
		local list = {}
		for _, subclass in ipairs(Unusable[i]) do
			list[subclass] = true
		end

		Lib.unusable[class] = list
	end
end


--[[ API ]]--

<<<<<<< HEAD
function Lib:IsItemUnusable(...)
	if ... then
		local slot, _,_, class, subclass = select(9, GetItemInfo(...))
=======
function Lib:IsItemUnusable(item)
	if item then
		local slot, _,_, class, subclass = select(9, GetItemInfo(item))
>>>>>>> classic_hardcore
		return Lib:IsClassUnusable(class, subclass, slot)
	end
end

function Lib:IsClassUnusable(class, subclass, slot)
	if class and subclass and Lib.unusable[class] then
		return slot ~= '' and Lib.unusable[class][subclass] or slot == 'INVTYPE_WEAPONOFFHAND' and Lib.cannotDual
	end
end
<<<<<<< HEAD
=======

function Lib:Embed(object)
	object.IsItemUnusable = Lib.IsItemUnusable
	object.IsClassUnusable = Lib.IsClassUnusable
end
>>>>>>> classic_hardcore
