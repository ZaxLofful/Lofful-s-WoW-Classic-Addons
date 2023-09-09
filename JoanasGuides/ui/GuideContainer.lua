--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local isMoving

local component = UI.CreateComponent("GuideContainer")

function component.Init()
	local frame = CreateFrame("Frame", nil, UIParent)
	frame:Hide()
	frame:SetSize(242, 120)
	local windowLocation = State.GetWindowLocation()
	if (windowLocation) then
		frame:ClearAllPoints();
		frame:SetPoint(unpack(windowLocation));
		ValidateFramePosition(frame);
	else
		frame:SetPoint("TOPRIGHT", -15, -330)
	end
	frame:SetMovable(true)
	frame:EnableMouse(true)
	frame:RegisterForDrag("LeftButton")
	if (frame.SetPassThroughButtons) then
		frame:SetPassThroughButtons("RightButton")
	end
	frame:SetClampedToScreen(true)
	frame:SetScript("OnDragStart", function(self)
		if not self.isLocked then
			self:StartMoving()
			isMoving = true
			UI.CloseGuideMenu()
		end
	end)
	frame:SetScript("OnUpdate", function(self)
		if (isMoving and not IsMouseButtonDown("LeftButton")) then
			self:StopMovingOrSizing()
			isMoving = nil
			SavedVariables.WindowLocation = { self:GetPoint() }
		end
	end)
	frame:EnableMouse(not State.IsWindowLocked())
	component.frame = frame
end

function component.Update()
	if (component:IsDirty() and not InCombatLockdown()) then
		component.frame:SetShown(State.IsGuideShown())
		component.frame:SetScale(State.GetGuideScale())
		component:MarkClean()
	end
end

function UI.IsGuideContainerLocked()
	return State.IsWindowLocked()
end

function UI.IsGuideContainerMoving()
	return isMoving
end

function UI.SetGuideContainerLocked(lockedFlag)
	State.SetWindowLocked(lockedFlag)
	component.frame:EnableMouse(not lockedFlag)
end

UI.Add(component)
