--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local TaskType = Mixin({
	type = "learntaxi",
	dimmable = true,
	incompleteIcon = IconService.GetIconInfo("flightmaster")
}, TaskTypeMixin)

function TaskType:IsCompletedFunc(task)
	return TaxiService.HasTaxi(task.learntaxi)
end

function TaskType:RenderFunc(task, container)
	local name
	if (task.fromnpc) then
		name = Hyperlinks.GetNPCHyperlink(task)
	else
		name = Names.GetName(TaxiService.GetTaxiName, task.learntaxi)
	end
	container.text:SetShown(true)
	if (task.fromnpc) then
		container.text:SetText(L["Talk to %s and get the flight path"]:format(name))
	else
		container.text:SetText(L["Get the |C%s%s|r flight path"]:format(Color.TAXI, name))
	end
end

RegisterTaskType(TaskType)
