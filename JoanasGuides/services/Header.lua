--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local zoneTitle

HeaderService = { }

function HeaderService.GetHeaderTitles()
    local title1, title2
    local currentGuide = GuideNavigationService.GetGuide()
    if (not currentGuide) then
        title1 = nil
        title2 = L["Click cogwheel to load a guide"]
    else
        local activeLocation = LocationsService.GetActiveLocation()
        if (activeLocation) then
            local activeMap = activeLocation:GetMap()
            if (activeMap == currentGuide.info.zone) then
                zoneTitle = nil
            else
                zoneTitle = Names.GetName(GetMapName, activeMap)
            end
        end
        title1 = currentGuide.info.description
        if (zoneTitle) then
            title2 = title1
            title1 = zoneTitle
        end
    end
    return title1, title2
end

function HeaderService.GetStepText()
    local currentStep = GuideNavigationService.GetStep()
    if (currentStep) then
        if (TestingService.IsConnected()) then
            return currentStep.id
        else
            return string.sub(string.match(currentStep.id,"^([%w-]+)"),1,6)
        end
    end
end
