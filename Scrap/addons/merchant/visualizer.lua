--[[
<<<<<<< HEAD
Copyright 2008-2021 João Cardoso
Scrap is distributed under the terms of the GNU General Public License (Version 3).
As a special exception, the copyright holders of this addon do not give permission to
redistribute and/or modify it.

This addon is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the addon. If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.

This file is part of Scrap.
--]]

local Visualizer = Scrap:NewModule('Visualizer', CreateFrame('Frame', 'ScrapVisualizer', MerchantFrame, 'ScrapVisualizerTemplate'))
local L = LibStub('AceLocale-3.0'):GetLocale('Scrap')


--[[ Events ]]--

function Visualizer:OnEnable()
	local portraitBack = self:CreateTexture(nil, 'BORDER')
	portraitBack:SetPoint('TOPRIGHT', self.portrait, -5, -5)
	portraitBack:SetPoint('BOTTOMLEFT', self.portrait, 6, 5)
	portraitBack:SetColorTexture(0, 0, 0)
=======
Copyright 2008-2023 João Cardoso
All Rights Reserved
--]]

local Visualizer = Scrap:NewModule('Visualizer', ScrapVisualizer, 'MutexDelay-1.0')
local L = LibStub('AceLocale-3.0'):GetLocale('Scrap')


--[[ Startup ]]--

function Visualizer:OnEnable()
	local title = self.TitleText or self.TitleContainer.TitleText
	title:SetText('Scrap')

	local portrait = self.portrait or self.PortraitContainer.portrait
	portrait:SetTexture('Interface/Addons/Scrap/Art/scrap-enabled')

	local backdrop = portrait:GetParent():CreateTexture(nil, 'BORDER')
	backdrop:SetColorTexture(0, 0, 0)
	backdrop:SetAllPoints(portrait)

	local mask = portrait:GetParent():CreateMaskTexture()
	mask:SetTexture('Interface/CharacterFrame/TempPortraitAlphaMask')
	mask:SetAllPoints(backdrop)
	backdrop:AddMaskTexture(mask)
	portrait:AddMaskTexture(mask)
>>>>>>> classic_hardcore

	local tab = LibStub('SecureTabs-2.0'):Add(MerchantFrame)
	tab:SetText('Scrap')
	tab.frame = self

<<<<<<< HEAD
	self.tab, self.list, self.item = tab, {}, {}
	self.portrait:SetTexture('Interface/Addons/Scrap/art/enabled-icon')
	self.TitleText:SetText('Scrap')
	self.Tab2:SetText(L.NotJunk)
	self.Tab1:SetText(L.Junk)
	self.Spinner.Anim:Play()

	PanelTemplates_TabResize(self.Tab1, 0)
	PanelTemplates_TabResize(self.Tab2, 0)
	PanelTemplates_SetNumTabs(self, 2)

	self:SetScript('OnUpdate', self.QueryItems)
	self:SetScript('OnShow', self.OnShow)
	self:SetScript('OnHide', self.OnHide)
	self:UpdateButton()
=======
	self.numTabs, self.list, self.item = 2, {}, {}
	self.Tab1:SetText('|TInterface/Addons/Scrap/Art/Thumbsup:14:14:-2:2:16:16:0:16:0:16:73:255:73|t ' .. L.NotJunk)
	self.Tab2:SetText('|TInterface/Addons/Scrap/Art/Thumbsdown:14:14:-2:-2:16:16:0:16:0:16:255:73:73|t ' .. L.Junk)
	self.ForgetButton:SetText(L.Forget)
	self.ForgetButton:SetWidth(self.ForgetButton:GetTextWidth() + 20)
	self.Spinner.Anim:Play()
	self.ParentTab = tab

	self:SetScript('OnShow', self.OnShow)
	self:SetScript('OnHide', self.OnHide)
	self:UpdateButtons()
>>>>>>> classic_hardcore
	self:SetTab(1)
end

function Visualizer:OnShow()
	CloseDropDownMenus()
<<<<<<< HEAD
	self:UpdateList()
end

function Visualizer:OnHide()
=======
	self:RegisterSignal('LIST_CHANGED', 'UpdateList')
	self:Delay(0, 'QueryItems')

	if UndoFrame then
		UndoFrame.Arrow:Hide()
	end
end

function Visualizer:OnHide()
	self:UnregisterSignal('LIST_CHANGED')
>>>>>>> classic_hardcore
	wipe(self.list)
end


-- [[ API ]]--

<<<<<<< HEAD
=======
function Visualizer:QueryItems()
	local ready = true
	for id in pairs(Scrap.junk) do
		ready = ready and GetItemInfo(id)
	end

	if not ready then
		self:Delay(0.2, 'QueryItems')
	end

	self.Spinner:SetShown(not ready)
	self:UpdateList()
end

>>>>>>> classic_hardcore
function Visualizer:SetTab(i)
	PanelTemplates_SetTab(self, i)
	self:UpdateList()
end

function Visualizer:SetItem(id)
	self.item = {id = id, type = self.selectedTab}
	self.Scroll:update()
<<<<<<< HEAD
	self:UpdateButton()
=======
	self:UpdateButtons()
>>>>>>> classic_hardcore
end

function Visualizer:ToggleItem()
	Scrap:ToggleJunk(self.item.id)
	self.item = {}
end

<<<<<<< HEAD

--[[ Query ]]--

function Visualizer:QueryItems()
	if self:QueryList() then
		return
	else
		HybridScrollFrame_CreateButtons(self.Scroll, 'ScrapVisualizerButtonTemplate', 1, -2, 'TOPLEFT', 'TOPLEFT', 0, -3)
	end

	self.QueryItems, self.QueryList = nil
	self:RegisterSignal('LIST_CHANGED', 'UpdateList')
	self:SetScript('OnUpdate', nil)
	self.Spinner:Hide()
	self:UpdateList()
end

function Visualizer:QueryList()
	for id in pairs(Scrap.junk) do
		if not GetItemInfo(id) then
			return true
		end
	end
=======
function Visualizer:ForgetItem()
	Scrap.junk[self.item.id] = nil
	Scrap:Print(format(L.Forgotten, select(2, GetItemInfo(self.item.id))), 'LOOT')
	Scrap:SendSignal('LIST_CHANGED', self.item.id)
	self.item = {}
>>>>>>> classic_hardcore
end


--[[ Update ]]--

function Visualizer:UpdateList()
<<<<<<< HEAD
	if not self.QueryItems and self:IsShown() then
		self.list = {}

		local mode = self.selectedTab == 1
		for id, classification in pairs(Scrap.junk) do
			if classification == mode then
=======
	if self:IsVisible() then
		self.list = {}

		local mode = self.selectedTab == 2
		for id, classification in pairs(Scrap.junk) do
			if classification == mode and GetItemInfo(id) then
>>>>>>> classic_hardcore
				tinsert(self.list, id)
			end
		end

		sort(self.list, function(A, B)
			if not A then
				return true
			elseif not B or A == B then
				return nil
			end

			local nameA, _ , qualityA, _,_,_,_,_,_,_,_, classA = GetItemInfo(A)
			local nameB, _ , qualityB, _,_,_,_,_,_,_,_, classB = GetItemInfo(B)
			if qualityA == qualityB then
				return (classA == classB and nameA < nameB) or classA > classB
			else
				return qualityA > qualityB
			end
		end)

		self.Scroll:update()
<<<<<<< HEAD
	end

	self:UpdateButton()
=======
		self:UpdateButtons()
	end
>>>>>>> classic_hardcore
end

function Visualizer.Scroll:update()
	local self = Visualizer
<<<<<<< HEAD
	local offset = HybridScrollFrame_GetOffset(self.Scroll)
	local width = #self.list > 18 and 296 or 318
	local focus = GetMouseFocus()
=======
	if not self.Scroll.buttons then
		HybridScrollFrame_CreateButtons(self.Scroll, 'ScrapVisualizerButtonTemplate', 1, -2, 'TOPLEFT', 'TOPLEFT', 0, -3)
	end

	local focus = GetMouseFocus()
	local offset = HybridScrollFrame_GetOffset(self.Scroll)
	local width = #self.list > 17 and 296 or 318
>>>>>>> classic_hardcore

	for i, button in ipairs(self.Scroll.buttons) do
		local index = i + offset
		local id = self.list[index]

		if id then
			local name, link, quality = GetItemInfo(id)
<<<<<<< HEAD
			button.text:SetTextColor(GetItemQualityColor(quality))
			button.icon:SetTexture(GetItemIcon(id))
			button.text:SetText(name)
			button:SetWidth(width)
			button.item = id
			button.link = link
			button:Show()

			if id == self.item.id then
				button:LockHighlight()
			else
				button:UnlockHighlight()
			end

			if focus == button then
				button:GetScript('OnEnter')(button)
			end

			if mod(index, 2) == 0 then
				button.stripe:Show()
			else
				button.stripe:Hide()
=======
			button.item, button.link = id, link
			button:SetHighlightLocked(id == self.item.id)
			button.Text:SetTextColor(ITEM_QUALITY_COLORS[quality].color:GetRGB())
			button.Icon:SetTexture(GetItemIcon(id))
			button.Text:SetText(name)
			button:SetWidth(width)
			button:Show()

			if focus == button then
				ExecuteFrameScript(button, 'OnEnter')
			end

			if mod(index, 2) == 0 then
				button.Stripe:Show()
			else
				button.Stripe:Hide()
>>>>>>> classic_hardcore
			end
		else
			button:Hide()
		end
	end

	HybridScrollFrame_Update(self.Scroll, #self.list * 20 + 2, #self.Scroll.buttons * 18)
	self.Scroll:SetWidth(width + 5)
end

<<<<<<< HEAD
function Visualizer:UpdateButton()
	self.Button:SetEnabled(self.selectedTab == self.item.type)
	self.Button:SetText(self.selectedTab == 1 and L.Remove or L.Add)
	self.Button:SetWidth(self.Button:GetTextWidth() + 20)
=======
function Visualizer:UpdateButtons()
	self.ForgetButton:SetEnabled(self.selectedTab == self.item.type)
	self.ToggleButton:SetEnabled(self.selectedTab == self.item.type)
	self.ToggleButton:SetText(self.selectedTab == 1 and L.Add or L.Remove)
	self.ToggleButton:SetWidth(self.ToggleButton:GetTextWidth() + 20)
>>>>>>> classic_hardcore
end
