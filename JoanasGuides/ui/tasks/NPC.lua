--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local TaskType = Mixin({
	type = "npc",
}, TaskTypeMixin)

function TaskType:RenderFunc(task, container)
	local link = Hyperlinks.GetNPCHyperlink(task)
	container.text:SetShown(true)
	container.text:SetText(L["Speak to %s"]:format(link))
end

RegisterTaskType(TaskType)
