--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local TaskType = Mixin({
	type = "turnin",
	dimmable = true,
	compactable = true,
	incompleteIcon = IconService.GetIconInfo("questturnin")
}, TaskTypeMixin)

function TaskType:IsCompletedFunc(task)
	return QuestStatus.GetQuestStatus(task.turnin) >= QuestStatus.status.TURNEDIN
end

function TaskType:RenderFunc(task, container)
	local link = Hyperlinks.GetQuestHyperlink(task, "turnin")
	container.text:SetShown(true)
	container.text:SetText(L["Turn in: |C%s%s|r"]:format(Color.QUEST_TURNIN, link))
end

RegisterTaskType(TaskType)
