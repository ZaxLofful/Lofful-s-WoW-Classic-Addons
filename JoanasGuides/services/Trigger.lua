--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local queue = { }
local functions = { }
local GotoAutomatic, IsRecursionSafe

function GotoAutomatic(...)
    GuideNavigationService.SetManualOverrideEnabled(false)
    GuideNavigationService.Goto(...)
end

function IsRecursionSafe(f)
    if (functions[f]) then
        if (State.IsDebugEnabled()) then
            DEFAULT_CHAT_FRAME:AddMessage("RECURSION WARNING!")
        end
        return false
    end
    functions[f] = true
    return true
end

TriggerService = { }

function TriggerService.OnActivate(obj)
    if (obj and obj.onactivate and obj.root == GuideNavigationService.GetStep()) then
        if (obj.activateFired and not obj:IsActive()) then
            obj.activateFired = nil
            return
        end
        if (obj:IsActive() and not obj.activateFired) then
            table.insert(queue, obj)
        end
    end
end

function TriggerService.OnComplete(node)
    local currentStep = GuideNavigationService.GetStep()
    if (node.oncomplete and (node == currentStep or node.root == currentStep)) then
        if (node.oncompleteFired and not node.completedPassed) then
            node.oncompleteFired = nil
            return
        end
        if (node.completedPassed and not node.completedFired) then
            table.insert(queue, node)
        end
    end
end

function TriggerService.RunAll()
    if (#queue == 0) then return false end
    local triggersRan = false
    for _, obj in ipairs(queue) do
        local context = {
            locations = obj.root and obj.root.locations or obj.locations,
            SESSION = CustomVariablesService.GetSessionScope(),
            VAR = CustomVariablesService.GetCharacterScope(),
            COMPLETEONSTART = ConditionContext["COMPLETEONSTART"],
            INCOMPLETEONSTART = ConditionContext["INCOMPLETEONSTART"],
            Goto = GotoAutomatic,
        }
        if (obj.oncomplete) then
            if (type(obj.oncomplete) == "string") then
                obj.oncomplete = loadstring(obj.oncomplete)
            end
            if (IsRecursionSafe(obj.oncomplete)) then
                setfenv(obj.oncomplete, context)
                obj.oncomplete()
                obj.completedFired = true
                triggersRan = true
            end
        elseif (obj.onactivate) then
            if (type(obj.onactivate) == "string") then
                obj.onactivate = loadstring(obj.onactivate)
            end
            if (IsRecursionSafe(obj.onactivate)) then
                setfenv(obj.onactivate, context)
                obj.onactivate()
                obj.activateFired = true
                triggersRan = true
            end
        end
    end
    queue = { }
    return triggersRan
end

function TriggerService.Reset()
    queue = { }
    functions = { }
end
