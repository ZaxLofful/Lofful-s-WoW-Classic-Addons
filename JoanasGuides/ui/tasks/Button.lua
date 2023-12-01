--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local TaskType = Mixin({
	type = "button"
}, TaskTypeMixin)

function TaskType:IsCompletedFunc(task)
	return task.optional or false
end

function TaskType:RenderFunc(task, container)
	container.button:SetShown(true)
	container.button:SetText(task.button)
	if (task.color) then
		container:SetButtonColor("FF" .. task.color)
	elseif (ConditionContext["HC"]) then
		container:SetButtonColor(nil)
	else
		container:SetButtonColor(Color.MODE_NORMAL)
	end
	container.button:SetScript("OnClick", function()
		if (task.setvar) then
			CustomVariablesService.SetCharacterVariable(task.setvar, task.value)
		end
		if (task.guide or task.goto) then
			GuideNavigationService.SetManualOverrideEnabled(false)
			GuideNavigationService.Goto(task.guide, task.goto)
		end
	end)
end

RegisterTaskType(TaskType)
