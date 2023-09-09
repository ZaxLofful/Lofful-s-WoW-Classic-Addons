--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local TaskType = Mixin({
	type = "getitem",
	dimmable = true,
	incompleteIcon = IconService.GetIconInfo("vendorgossipicon")
}, TaskTypeMixin)

function TaskType:IsCompletedFunc(task)
	if (task.questid and QuestStatus.GetQuestStatus(task.questid) >= QuestStatus.status.COMPLETED) then
		return true
	end
	local complete = GetItemCount(task.getitem, false) >= ((task.quantity ~= nil) and task.quantity or 1)
	if (task.root == GuideNavigationService.GetStep()) then
		if (task.canPlaySound == false and complete == false) then
			task.canPlaySound = true
		end
		if (task.canPlaySound == nil) then
			if (complete) then
				task.canPlaySound = false
			else
				task.canPlaySound = true
			end
			return complete
		end
		if (complete and task.canPlaySound) then
			task.canPlaySound = false
			local playerFaction = UnitFactionGroup("player")
			PlaySound(playerFaction == "Horde" and 6199 or 6199)
		end
	end
	return complete
end

function TaskType:RenderFunc(task, container)
	local name = Hyperlinks.GetItemHyperlink(task)
	local quantity = task.quantity or 1
	local owned = GetItemCount(task.getitem, false)
	container.text:SetShown(true)
	local _, _, _, _, icon = GetItemInfoInstant(task.getitem)
	container.text:SetText(L["Get %s/%s |T%s:14:14:0:0|t |c%s%s|r "]:format((owned < quantity) and owned or quantity,
			quantity, icon, Color.ITEM, name))
end

RegisterTaskType(TaskType)
