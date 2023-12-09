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
=======
Copyright 2008-2023 João Cardoso
All Rights Reserved
>>>>>>> classic_hardcore
--]]

local Button = Scrap:NewModule('Merchant', CreateFrame('Button', nil, MerchantBuyBackItem), 'MutexDelay-1.0')
local L = LibStub('AceLocale-3.0'):GetLocale('Scrap')
<<<<<<< HEAD
=======
local C = LibStub('C_Everywhere').Container
>>>>>>> classic_hardcore


--[[ Events ]]--

function Button:OnEnable()
<<<<<<< HEAD
	local background = self:CreateTexture(nil, 'BACKGROUND')
	background:SetPoint('CENTER', -0.5, -1.2)
	background:SetColorTexture(0, 0, 0)
	background:SetSize(27, 27)

	local icon = self:CreateTexture()
	icon:SetTexture('Interface/Addons/Scrap/art/enabled-box')
	icon:SetPoint('CENTER')
	icon:SetSize(33, 33)

	local border = self:CreateTexture(nil, 'OVERLAY')
	border:SetTexture('Interface/Addons/Scrap/art/merchant-border')
	border:SetSize(35.9, 35.9)
	border:SetPoint('CENTER')

	self.background, self.icon, self.border, self.tab = background, icon, border, tab
=======
	local icon = self:CreateTexture()
	icon:SetTexture('Interface/Addons/Scrap/Art/Scrap-Enabled')
	icon:SetPoint('CENTER', 1, MerchantSellAllJunkButton and 1 or 0)
	--icon:SetPoint('CENTER')
	icon:SetSize(33, 33)

	self.icon, self.border = icon, self:CreateTexture(nil, 'OVERLAY')
>>>>>>> classic_hardcore
	self:SetHighlightTexture('Interface/Buttons/ButtonHilight-Square', 'ADD')
	self:SetPushedTexture('Interface/Buttons/UI-Quickslot-Depress')
	self:RegisterForClicks('AnyUp')
	self:SetSize(37, 37)

	self:RegisterSignal('MERCHANT_SHOW', 'OnMerchant')
	self:RegisterEvent('MERCHANT_CLOSED', 'OnClose')
	self:SetScript('OnReceiveDrag', self.OnReceiveDrag)
	self:SetScript('OnEnter', self.OnEnter)
	self:SetScript('OnLeave', self.OnLeave)
	self:SetScript('OnClick', self.OnClick)

<<<<<<< HEAD
	hooksecurefunc('MerchantFrame_UpdateRepairButtons', function()
		self:UpdatePosition()
	end)
=======
	if MerchantSellAllJunkButton then
		hooksecurefunc('MerchantFrame_UpdateMerchantInfo', function() MerchantSellAllJunkButton:Show() end)
		self:SetAllPoints(MerchantSellAllJunkButton)
	else
		local background = self:CreateTexture(nil, 'BACKGROUND')
		background:SetPoint('CENTER', -0.5, -1.2)
		background:SetColorTexture(0, 0, 0)
		background:SetSize(27, 27)

		self.border:SetTexture('Interface/Addons/Scrap/art/merchant-border')
		self.border:SetSize(35.9, 35.9)
		self.border:SetPoint('CENTER')

		hooksecurefunc('MerchantFrame_UpdateRepairButtons', function() self:UpdatePosition() end)
	end
>>>>>>> classic_hardcore
end

function Button:OnMerchant()
	if Scrap.sets.sell then
		self:Sell()
	end

	if Scrap.sets.repair then
		self:Repair()
	end

	if (Scrap.sets.tutorial or 0) < 5 and LoadAddOn('Scrap_Config') then
		Scrap.Tutorials:Start()
	end

<<<<<<< HEAD
	self:RegisterEvent('BAG_UPDATE_DELAYED', 'OnBagUpdate')
	self:RegisterSignal('LIST_CHANGED', 'UpdateState')
=======
	self:RegisterSignal('LIST_CHANGED', 'UpdateState')
	self:RegisterEvent('BAG_UPDATE', 'OnBagUpdate')
>>>>>>> classic_hardcore
	self:UpdatePosition()
	self:UpdateState()
end

function Button:OnBagUpdate()
	if self.saleTotal then
		self:Delay(0.5, 'Sell')
	else
<<<<<<< HEAD
		self:UpdateState()
=======
		self:Delay(0, 'UpdateState')
>>>>>>> classic_hardcore
	end
end

function Button:OnClose()
<<<<<<< HEAD
	self:UnregisterEvent('BAG_UPDATE_DELAYED')
	self:UnregisterSignal('LIST_CHANGED')
=======
	self:UnregisterSignal('LIST_CHANGED')
	self:UnregisterEvent('BAG_UPDATE')
>>>>>>> classic_hardcore
end


--[[ Interaction ]]--

function Button:OnClick(button)
	if GetCursorInfo() then
		self:OnReceiveDrag()
	elseif button == 'LeftButton' then
		self:Sell()
<<<<<<< HEAD
	elseif button == 'RightButton' and LoadAddOn('Scrap_Config') then
		local drop = LibStub('Sushi-3.1').Dropdown:Toggle(self)
=======
		self:UpdateTip(GameTooltip)
	elseif button == 'RightButton' and LoadAddOn('Scrap_Config') then
		local drop = LibStub('Sushi-3.2').Dropdown:Toggle(self)
>>>>>>> classic_hardcore
		if drop then
			drop:SetPoint('TOPLEFT', self, 'BOTTOMLEFT', 0, -12)
			drop:SetChildren {
				{ text = 'Scrap', isTitle = 1 },
				{
<<<<<<< HEAD
					text = OPTIONS, notCheckable = 1,
					func = function()
						Scrap.Options:Open()
					end
				},
				{
					text = SHOW_TUTORIALS, notCheckable = 1,
					func = function()
						Scrap.Tutorials:Reset()
					end
=======
					text = OPTIONS ..'  |A:worldquest-icon-engineering:12:12|a',
					func = function() Scrap.Options:Open() end,
					notCheckable = 1
				},
				{
					text = HELP_LABEL .. '  |T516770:12:12:0:0:64:64:14:50:14:50|t',
					func = function() Scrap.Options.Help:Open() end,
					notCheckable = 1
>>>>>>> classic_hardcore
				},
				{ text = CANCEL, notCheckable = 1 }
			}
		end
	end
end

function Button:OnReceiveDrag()
	local type, id = GetCursorInfo()
	if type == 'item' then
		Scrap:ToggleJunk(id)
		ClearCursor()
	end
end

function Button:OnEnter()
	GameTooltip:SetOwner(self, 'ANCHOR_RIGHT')
	self:UpdateTip(GameTooltip)
end

function Button:OnLeave()
	if GameTooltip:IsOwned(self) then
		GameTooltip:Hide()
	end
end


--[[ Update ]]--

function Button:UpdateState()
	local disabled = not self:AnyJunk()
	self.border:SetDesaturated(disabled)
	self.icon:SetDesaturated(disabled)
end

<<<<<<< HEAD
function Button:UpdatePosition()
	if CanMerchantRepair() then
		local off, scale
		if CanGuildBankRepair and CanGuildBankRepair() then
			off, scale = -3.5, 0.9
			MerchantRepairAllButton:SetPoint('BOTTOMRIGHT', MerchantFrame, 'BOTTOMLEFT', 120, 35)
		else
			off, scale = -1.5, 1
		end

		self:SetPoint('RIGHT', MerchantRepairItemButton, 'LEFT', off, 0)
		self:SetScale(scale)
	else
		self:SetPoint('RIGHT', MerchantBuyBackItem, 'LEFT', -17, 0.5)
		self:SetScale(1.1)
	end

	MerchantRepairText:Hide()
end

=======
>>>>>>> classic_hardcore
function Button:UpdateTip(tooltip)
	local type, id = GetCursorInfo()
	if type == 'item' then
		tooltip:SetText(Scrap:IsJunk(id) and L.Remove or L.Add, 1, 1, 1)
	else
		tooltip:SetText(MerchantFrame:IsShown() and L.SellJunk or L.DestroyJunk)

		local value, qualities = self:GetReport()
		for quality, count in pairs(qualities) do
			local r,g,b = GetItemQualityColor(quality)
			tooltip:AddDoubleLine(_G['ITEM_QUALITY' .. quality .. '_DESC'], count, r,g,b, r,g,b)
		end

		tooltip:AddLine(value > 0 and GetCoinTextureString(value) or ITEM_UNSELLABLE, 1,1,1)
	end

	tooltip:Show()
end

<<<<<<< HEAD
=======
if MerchantSellAllJunkButton then
	function Button:UpdatePosition() end
else
	function Button:UpdatePosition()
		if CanMerchantRepair() then
			local off, scale
			if CanGuildBankRepair and CanGuildBankRepair() then
				off, scale = -3.5, 0.9
				MerchantRepairAllButton:SetPoint('BOTTOMRIGHT', MerchantFrame, 'BOTTOMLEFT', 120, 35)
			else
				off, scale = -1.5, 1
			end

			self:SetPoint('RIGHT', MerchantRepairItemButton, 'LEFT', off, 0)
			self:SetScale(scale)
		else
			self:SetPoint('RIGHT', MerchantBuyBackItem, 'LEFT', -17, 0.5)
			self:SetScale(1.1)
		end

		MerchantRepairText:Hide()
	end
end

>>>>>>> classic_hardcore

--[[ Actions ]]--

function Button:Sell()
	self.saleTotal = self.saleTotal or self:GetReport()

	local count = 0
	for bag, slot, id in Scrap:IterateJunk() do
<<<<<<< HEAD
		local _, _, locked = GetContainerItemInfo(bag, slot)
		if not locked then
			local value = select(11, GetItemInfo(id)) or 0
			if value > 0 then
				UseContainerItem(bag, slot)
			elseif Scrap.sets.destroy then
				PickupContainerItem(bag, slot)
=======
		if not C.GetContainerItemInfo(bag, slot).isLocked then
			local value = select(11, GetItemInfo(id)) or 0
			if value > 0 then
				C.UseContainerItem(bag, slot)
			elseif Scrap.sets.destroy then
				C.PickupContainerItem(bag, slot)
>>>>>>> classic_hardcore
				DeleteCursorItem()
			end

			if count < 11 then
				count = count + 1
			else
				break
			end
		end
	end

	local remaining = self:GetReport()
	if remaining == 0 or Scrap.sets.safe then
		if count > 0 then
			Scrap:PrintMoney(L.SoldJunk, self.saleTotal - remaining)
		end

		self.saleTotal = nil
	end
end

function Button:GetReport()
	local qualities = {}
	local total = 0

<<<<<<< HEAD
	for bag, slot, id in Scrap:IterateJunk() do
		local _, count, locked, quality = GetContainerItemInfo(bag, slot)
		if not locked then
			qualities[quality] = (qualities[quality] or 0) + count
			total = total + count * (select(11, GetItemInfo(id)) or 0)
=======
	for bag, slot in Scrap:IterateJunk() do
		local item = C.GetContainerItemInfo(bag, slot)
		if not item.isLocked then
			qualities[item.quality] = (qualities[item.quality] or 0) + item.stackCount
			total = total + item.stackCount * (select(11, GetItemInfo(item.itemID)) or 0)
>>>>>>> classic_hardcore
		end
	end

	return total, qualities
end

function Button:AnyJunk()
	return Scrap:IterateJunk()()
end

function Button:Repair()
	local cost = GetRepairAllCost()
	if cost > 0 then
		local guild = self:CanGuildRepair(cost)
		if guild or GetMoney() >= cost then
			Scrap:PrintMoney(L.Repaired, cost)
			RepairAllItems(guild)
		end
	end
end

function Button:CanGuildRepair(cost)
	if Scrap.sets.guild and CanGuildBankRepair and CanGuildBankRepair() and not GetGuildInfoText():find('%[noautorepair%]') then
		local money = GetGuildBankWithdrawMoney() or -1
		return money < 0 or money >= cost
	end
end
