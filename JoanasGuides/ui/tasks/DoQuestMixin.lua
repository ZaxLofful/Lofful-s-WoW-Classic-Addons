--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

DoQuestMixin = Mixin({
	dimmable = true
}, TaskTypeMixin)

function DoQuestMixin:IsCompletedFunc(task)
	local questID = task[self.type]
	local status = QuestStatus.GetQuestStatus(questID)
	local completed = status >= QuestStatus.status.COMPLETED
	if (status >= QuestStatus.status.ACCEPTED and not completed) then
		if (task.objective) then
			local objectives = C_QuestLog.GetQuestObjectives(questID)
			if (objectives and #objectives > 0) then
				return objectives[task.objective].finished
			end
			return false
		end
		if (task.objectives) then
			local objectives = C_QuestLog.GetQuestObjectives(questID)
			if (objectives and #objectives > 0) then
				for _, idx in ipairs(task.objectives) do
					if (not objectives[idx].finished) then
						return false
					end
				end
				return true
			end
			return false
		end
	end
	return completed
end

function DoQuestMixin:RenderFunc(task, container)
	local link = Hyperlinks.GetQuestHyperlink(task, self.type)
	local questID = task[self.type]
	local objectives = C_QuestLog.GetQuestObjectives(questID)
	local questCompleted = C_QuestLog.IsQuestFlaggedCompleted(questID)
	local objectivesMap = { }
	task.warn = nil
	if (QuestStatus.GetQuestStatus(questID) == 0) then
		task.warn = string.format("|c%sYou don't have this quest|r", Color.RED_TEXT)
		for _, taskGroup in ipairs(task.root) do
			for _, task_ in ipairs(taskGroup) do
				if (questID == task_.accept) then
					task.warn = nil
					break
				end
			end
			if (not task.warn) then break end
		end
	end
	if (task.warn) then
		task.iconOverride = IconService.GetIconInfo("services-icon-warning")
	else
		task.iconOverride = nil
	end
	if (task.objectives) then
		for _, objective in ipairs(task.objectives) do
			objectivesMap[objective] = true
		end
	end
	if (objectives) then
		local hasSpecifiedObjectives = (task.objective or task.objectives)
		for idx, objective in ipairs(objectives) do
			local detail = container.taskDetailContainers[idx]
			local icon
			local isSpecifiedObjective = idx == task.objective or objectivesMap[idx]
			if (objective.finished or questCompleted) then
				if (hasSpecifiedObjectives and not isSpecifiedObjective) then
					icon = IconService.GetIconInfo("capacitance-general-workordercheckmark-small")
				else
					icon = IconService.GetIconInfo("capacitance-general-workordercheckmark")
				end
			elseif (isSpecifiedObjective) then
				icon = IconService.GetIconInfo("minimaparrow")
			else
				icon = IconService.GetIconInfo("partymember")
			end
			IconService.SetIconTexture(detail.icon, icon)
			detail:SetAlpha(objective.finished and DIM or 1.0)
			detail.hasIcon = true
			detail.text:SetText(FormatQuestObjective(objective, questCompleted))
			if (hasSpecifiedObjectives and not isSpecifiedObjective) then
				detail:SetFontTiny()
			end
			detail:SetShown(true)
		end
	end
	container.text:SetShown(true)
	container.text:SetText(self.taskPrefix:format(self.taskColor, link))
end
