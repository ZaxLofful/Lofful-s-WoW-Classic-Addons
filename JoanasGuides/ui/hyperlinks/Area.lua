--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local function TooltipShow(frame, areaRef)
    GuideTooltip:SetOwner(frame, "ANCHOR_CURSOR")
    GuideTooltip:AddLine(C_Map.GetAreaInfo(areaRef.area))
    GuideTooltip:Show()
end

function Hyperlinks.GetAreaHyperlink(areaRef)
    if (not areaRef.label) then
        return Names.GetName(C_Map.GetAreaInfo, areaRef.area)
    end
    return string.format("|Harea:%s:%s|h%s|h", areaRef.area, Hyperlinks.CreateReference(areaRef), areaRef.label)
end

Hyperlinks.RegisterHyperlinkType("area", nil, Hyperlinks.OnEnterTooltipFunc, Hyperlinks.OnLeaveTooltipFunc, TooltipShow)
