--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local eventFrame = CreateFrame("Frame")
local buffs = { }
local debuffs = { }

AuraService = { }

function AuraService.PlayerHasBuff(spellID)
	return buffs[spellID] or false
end

function AuraService.PlayerHasDebuff(spellID)
	return debuffs[spellID] or false
end

local function OnEvent(_, event, unitTarget)
	if (event == "PLAYER_ENTERING_WORLD" or unitTarget == "player") then
		buffs = { }
		local index = 1
		while true do
			local buffName, _, _, _, _, _, _, _, _, spellId = UnitBuff("player", index)
			if not buffName then
				break
			end
			buffs[spellId] = true
			index = index + 1
		end
		debuffs = { }
		index = 1
		while true do
			local debuffName, _, _, _, _, _, _, _, _, spellId = UnitDebuff("player", index)
			if not debuffName then
				break
			end
			debuffs[spellId] = true
			index = index + 1
		end
		MarkAllDirty()
	end
end

eventFrame:SetScript("OnEvent", OnEvent)
eventFrame:RegisterEvent("UNIT_AURA")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
