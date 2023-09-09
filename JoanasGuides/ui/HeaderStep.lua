--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local component = UI.CreateComponent("HeaderStep")

function component.Init(components)
	local parent = components.Header.frame
	local text = parent:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	text:SetPoint("BOTTOM", parent, "TOP", -8, 0)
	text:SetTextScale(0.95)
	text:Hide()
	component.text = text
end

function component.Update()
	if (component:IsDirty()) then
		local stepText = State.IsStepIDEnabled() and HeaderService.GetStepText()
		if (stepText) then
			component.text:SetText(("Step: %s"):format(stepText))
			component.text:SetShown(true)
		else
			component.text:SetShown(false)
		end
		component:MarkClean()
	end
end

UI.Add(component)
