--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local function TooltipShow(frame, spellRef)
    GuideTooltip:SetOwner(frame, "ANCHOR_CURSOR")
    GuideTooltip:SetHyperlink(string.format("|Hspell:%s|h|h", spellRef.spell))
    GuideTooltip:Show()
end

local function OnClick(frame, spellRef)
    TogglePopup(Hyperlinks.GetExternalSiteURL("spell", spellRef.spell), L["CTRL-C"], nil, frame)
end

function Hyperlinks.GetSpellHyperlink(spellRef)
    local name = spellRef.label or Names.GetName(GetSpellInfo, spellRef.spell)
    return string.format("|Hspell:%s:%s|h%s|h", spellRef.spell, Hyperlinks.CreateReference(spellRef), name)
end

Hyperlinks.RegisterHyperlinkType("spell", OnClick, Hyperlinks.OnEnterTooltipFunc, Hyperlinks.OnLeaveTooltipFunc, TooltipShow)
