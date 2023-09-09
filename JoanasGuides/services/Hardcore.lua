--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local isHardcoreActive = C_GameRules and C_GameRules.IsHardcoreActive and C_GameRules.IsHardcoreActive()

HardcoreService = { }

function HardcoreService.IsHardcoreEnabled()
    if (isHardcoreActive) then
        return true
    end
    return State.IsHardcoreEnabled()
end

function HardcoreService.SetHardcoreEnabled(enabled)
    if (isHardcoreActive) then return end
    State.SetHardcoreEnabled(enabled)
    MarkAllDirty()
    if (enabled) then
        local willPlay = PlaySound(11773)
        if (not willPlay) then
            local _, soundHandle = PlaySound(7294)
            C_Timer.After(4, function()
                StopSound(soundHandle)
            end)
        end
    end
end
