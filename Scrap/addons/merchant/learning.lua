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

local Learn = Scrap:NewModule('Learning') -- a really really dumb ml algortihm
local L = LibStub('AceLocale-3.0'):GetLocale('Scrap')
=======
Copyright 2008-2023 João Cardoso
All Rights Reserved
--]]

local Learn = Scrap:NewModule('Learning') -- dumb ml algortihm using exponential mean average
local L = LibStub('AceLocale-3.0'):GetLocale('Scrap')
local C = LibStub('C_Everywhere').Container
>>>>>>> classic_hardcore


--[[ Events ]] --

function Learn:OnEnable()
<<<<<<< HEAD
  hooksecurefunc('UseContainerItem', function(...)
=======
  C.hooksecurefunc('UseContainerItem', function(...)
>>>>>>> classic_hardcore
    if self:IsActive() then
      self:OnItemSold(...)
    end
  end)

  local buyBack = BuybackItem
  BuybackItem = function(...)
    if self:IsActive() then
      self:OnItemRefund(...)
    end
    return buyBack(...)
  end
end

<<<<<<< HEAD
function Learn:OnItemSold(...)
	local id = GetContainerItemID(...)
	if not id or Scrap.junk[id] ~= nil or Scrap:IsFiltered(id, ...) then
		return
	end

	local stack = select(2, GetContainerItemInfo(...))
	if GetItemCount(id, true) == stack then
		local link = GetContainerItemLink(...)
		local maxStack = select(8, GetItemInfo(id))
		local stack = self:GetBuypackStack(link) + stack

		local old = Scrap.charsets.ml[id] or 0
		local new = old + stack / maxStack
		Scrap.charsets.ml[id] = new

    if old < 2 and new >= 2 then
      Scrap:Print(L.Added, link, 'LOOT')
      Scrap:SendSignal('LIST_CHANGED', id)
    end
	end
=======
function Learn:OnItemSold(bag, slot)
	local id = C.GetContainerItemID(bag, slot)
	if id and Scrap.junk[id] == nil and not Scrap:IsFiltered(id, bag, slot) then
  	local rate = self:GetDecay(id, C.GetContainerItemInfo(bag, slot).stackCount)
    local old = Scrap.charsets.auto[id] or 0
    local new = old + (1 - old) * rate

  	Scrap.charsets.auto[id] = new
    if old <= .5 and new > .5 then
      Scrap:Print(L.Added:format(C.GetContainerItemLink(bag, slot)), 'LOOT')
      Scrap:SendSignal('LIST_CHANGED', id)
    end
  end
>>>>>>> classic_hardcore
end

function Learn:OnItemRefund(index)
	local link = GetBuybackItemLink(index)
<<<<<<< HEAD
	local id = ink and tonumber(link:match('item:(%d+)'))
	local old = Scrap.charsets.ml[id]

	if old then
		local maxStack = select(8, GetItemInfo(id))
		local stack = self:GetBuypackStack(link)

		local new = old - stack / maxStack
		if new <= 0 then
			Scrap.charsets.ml[id] = nil
		else
			Scrap.charsets.ml[id] = new
		end

    if old >= 2 and new < 2 then
      Scrap:Print(L.Removed, link, 'LOOT')
      Scrap:SendSignal('LIST_CHANGED', id)
    end
	end
=======
	local id = link and tonumber(link:match('item:(%d+)'))
  local old = Scrap.charsets.auto[id]
	if old then
    local rate = self:GetDecay(id, select(4, GetBuybackItemInfo(index)))
    local new = (1 - rate * 2) * old

  	Scrap.charsets.auto[id] = new > 0.1 and new or nil
    if old > .5 and new <= .5 then
      Scrap:Print(L.Removed:format(link), 'LOOT')
      Scrap:SendSignal('LIST_CHANGED', id)
    end
  end
>>>>>>> classic_hardcore
end


--[[ API ]]--

function Learn:IsActive()
  return Scrap.sets.learn and MerchantFrame:IsVisible()
end

<<<<<<< HEAD
function Learn:GetBuypackStack(link)
	local stack = 0
	for i = 1, GetNumBuybackItems() do
		if GetBuybackItemLink(i) == link then
			stack = stack + select(4, GetBuybackItemInfo(i))
		end
	end
	return stack
=======
function Learn:GetDecay(id, stack)
  local maxStack = select(8, GetItemInfo(id))
  return 0.382 * stack / maxStack
>>>>>>> classic_hardcore
end
