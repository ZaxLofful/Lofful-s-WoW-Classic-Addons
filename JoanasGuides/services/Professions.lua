--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local eventFrame = CreateFrame("Frame")

ProfessionService = { }

ProfessionService.Tiers = {
	NONE = 0,
	APPRENTICE = 1,
	JOURNEYMAN = 2,
	EXPERT = 3,
	ARTISAN = 4,
	MASTER = 5,
	GRANDMASTER = 6
}

ProfessionService.PlayerProfessions = { }

local function OnEvent()
	for profKey, tiers in pairs(Professions) do
		ProfessionService.PlayerProfessions[profKey] = 0
		for i = #tiers, 1, -1 do
			if (IsPlayerSpell(tiers[i])) then
				ProfessionService.PlayerProfessions[profKey] = i
				break;
			end
		end
	end
	MarkAllDirty()
end

eventFrame:SetScript("OnEvent", OnEvent)
eventFrame:RegisterEvent("SPELLS_CHANGED")
