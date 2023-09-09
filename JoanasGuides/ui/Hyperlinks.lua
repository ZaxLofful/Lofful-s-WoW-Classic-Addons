--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local component = UI.CreateComponent("Hyperlinks")

Hyperlinks = { }

local linkTypes = { }
local lastLink, lastStep
local refs = { }
local lastTooltipID
local externalSiteBaseURLPattern

function Hyperlinks.CreateReference(ref)
    for idx, ref_ in ipairs(refs) do
        if (ref_ == ref) then
            return idx
        end
    end
    table.insert(refs, ref)
    return #refs
end

function Hyperlinks.GetExternalSiteURL(type, var)
    if (not externalSiteBaseURLPattern) then
        local _, _, _, gameVersion = GetBuildInfo()
        local gameSlug
        if (gameVersion < 20000) then
            gameSlug = "classic"
        elseif (gameVersion >= 30000) then
            gameSlug = "wotlk"
        else
            gameSlug = "tbc"
        end
        externalSiteBaseURLPattern = "https://www.wowhead.com/" .. gameSlug .. "/%s=%s"
    end
    return string.format(externalSiteBaseURLPattern, type, var)
end

function Hyperlinks.GetReference(idx)
    if (type(idx) == "string") then
        idx = tonumber(idx)
    end
    return refs[idx]
end

function Hyperlinks.OnHyperlinkClick(frame, link)
    local linkType, arg1, arg2, arg3, arg4 = strsplit(":", link);
    if (linkType == "image") then
        ShowIllustration(arg1)
    elseif (linkType == "location") then
        local location = LocationsService.GetLocationByIdx(tonumber(arg1))
        if (location) then
            LocationsService.SetActiveLocation(location)
        end
    else
        linkType = linkTypes[linkType]
        if (linkType.clickFunc) then
            local ref = Hyperlinks.GetReference(arg2)
            linkType.clickFunc(frame, ref, arg3)
        end
    end
end

function Hyperlinks.OnEnterTooltipFunc(frame, link)
    local linkType, _, refID, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8 = strsplit(":", link)
    linkType = linkTypes[linkType]
    local ref = Hyperlinks.GetReference(refID)
    lastTooltipID = DelayedTooltip.Show(0.25, linkType.tooltipFunc, frame, ref, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
end

function Hyperlinks.OnEnterTooltipFuncNoRef(frame, link)
    local linkType = strsplit(":", link)
    linkType = linkTypes[linkType]
    lastTooltipID = DelayedTooltip.Show(0.25, linkType.tooltipFunc, frame, link)
end

function Hyperlinks.OnEnterTooltipFuncSimple(tooltipFunc)
    lastTooltipID = DelayedTooltip.Show(0.25, tooltipFunc)
end

function Hyperlinks.OnHyperlinkEnter(self, link)
    lastLink = link
    local linkType = strsplit(":", link);
    linkType = linkTypes[linkType]
    if (linkType and linkType.enterFunc) then
        linkType.enterFunc(self, link)
    end
end

function Hyperlinks.OnHyperlinkLeave(self)
    local linkType = strsplit(":", lastLink);
    linkType = linkTypes[linkType]
    if (linkType and linkType.leaveFunc) then
        linkType.leaveFunc(self, lastLink)
    end
end

function Hyperlinks.OnLeaveTooltipFunc()
    if (lastTooltipID) then
        DelayedTooltip.Cancel(lastTooltipID)
    end
    GuideTooltip:Hide()
end

function Hyperlinks.RegisterHyperlinkType(linkType, clickFunc, enterFunc, leaveFunc, tooltipFunc)
    linkTypes[linkType] = {
        clickFunc = clickFunc,
        enterFunc = enterFunc,
        leaveFunc = leaveFunc,
        tooltipFunc = tooltipFunc,
    }
end

function component.Update()
    if (component:IsDirty()) then
        if (GuideNavigationService.IsGuideSet()) then
            local currentStep = GuideNavigationService.GetStep()
            if (lastStep ~= currentStep) then
                lastStep = currentStep
                refs = { }
            end
        end
        component:MarkClean()
    end
end

UI.Add(component)