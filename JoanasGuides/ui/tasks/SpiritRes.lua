--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local TaskType = Mixin({
    type = "spiritres",
    dimmable = true,
    incompleteIcon = IconService.GetIconInfo("spiritres") --todo: Set icon to something for resurrection
}, TaskTypeMixin)

function TaskType:IsCompletedFunc(task)
    return GhostService.HasPlayerSpiritRessed(task.root)
end

function TaskType:RenderFunc(task, container)
    container.text:SetShown(true)
    if (UnitIsDead("player")) then
        container.text:SetText("Res at the Spirit Healer (Release Spirit)")
    else
        container.text:SetText("Res at the Spirit Healer")
    end
end

RegisterTaskType(TaskType)
