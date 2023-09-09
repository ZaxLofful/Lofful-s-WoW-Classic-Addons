--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local TaskType = Mixin({
    type = "die",
    dimmable = true,
    incompleteIcon = IconService.GetIconInfo("dungeonskull")
}, TaskTypeMixin)

function TaskType:IsCompletedFunc(task)
    return GhostService.HasPlayerDied(task.root)
end

function TaskType:RenderFunc(task, container)
    container.text:SetShown(true)
    container.text:SetText("Die on purpose")
end

RegisterTaskType(TaskType)
