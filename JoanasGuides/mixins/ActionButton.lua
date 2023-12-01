--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local CalculateYOffset, OnEnter, OnLeave, OnDragStart, OnEvent
local popupDialog

local UNKNOWN_ITEM_TEXTURE = 134400
local TYPE_ITEM, TYPE_DESTROY, TYPE_SPELL, TYPE_TARGET = 1, 2, 3, 4

popupDialog = {
    text = "",
    button1 = YES,
    button2 = NO,
    OnAccept = function()
        local bag, slot = GetItemLocation(popupDialog.itemID)
        if (bag) then
            PickupContainerItem(bag, slot)
        end
        DeleteCursorItem()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    showAlert = true,
    preferredIndex = 3,
    run = function(itemID, itemName)
        popupDialog.text = "Are you sure you want to destroy " .. (itemName or "the item") .. "?"
        popupDialog.itemID = itemID
        StaticPopup_Show("JoanasGuides_CONFIRM_DESTROY_ITEM")
    end
}

setmetatable(popupDialog, popupDialogMetatable)

local destroyItemMacroTemplate = "/run StaticPopupDialogs.JoanasGuides_CONFIRM_DESTROY_ITEM.run(%s, '%s')"
local targetSingleMacroTemplate1 = "/target %s\n/cleartarget [dead]"
local targetSingleMacroTemplate2 = "/target [noexists] %s\n/cleartarget [dead]"

local targetSingleMacroTemplateAllowDead1 = "/target %s"
local targetSingleMacroTemplateAllowDead2 = "/target [noexists] %s"


StaticPopupDialogs["JoanasGuides_CONFIRM_DESTROY_ITEM"] = popupDialog


function CalculateYOffset(fromY, button)
    --todo: Check for nil safety - this should never be called if it's not going to be visible and has a parent
    local taskGroupContainerIdx = button.buttonRef.parent.idx
    local taskGroupContainer = UI.GetComponent("TaskGroupContainers").Get(taskGroupContainerIdx)
    local bPos = 1
    local current = button
    while (current:HasPrevious()) do
        current = current:GetPrevious()
        if (current.buttonRef.parent.idx == taskGroupContainerIdx) then
            bPos = bPos + 1
        else
            break
        end
    end
    local bTotal = bPos
    current = button
    while (current:HasNext()) do
        current = current:GetNext()
        if (current.buttonRef and current.buttonRef.parent.idx == taskGroupContainerIdx) then
            bTotal = bTotal + 1
        else
            break
        end
    end
    local bHeight = button[1]:GetHeight()
    local spacing = 4
    local yOffset = (taskGroupContainer.frame:GetBottom() + (taskGroupContainer.frame:GetHeight() / 2)) - fromY + 2.5
    if (State.IsInvertedModeEnabled()) then
        bPos = bTotal + 1 - bPos
    end
    return yOffset + (bHeight * bTotal + spacing * (bTotal - 1)) / 2 - bHeight / 2 - (bHeight + spacing) * (bPos - 1)

end

function OnDragStart(self)
    if (IsShiftKeyDown()) then
        local bagID, slot = GetItemLocation(self.parent.itemID)
        if (bagID) then
            PickupContainerItem(bagID, slot)
        end
    end
end

function OnEnter(self)
    GameTooltip:Hide()
    if (not GuideTooltip.refreshOnly) then
        GameTooltip_SetDefaultAnchor(GuideTooltip, self);
    end
    if (self.parent.type == TYPE_ITEM) then
        local itemID = self.parent.itemID
        if (not GuideTooltip.refreshOnly) then
            GuideTooltip:SetItemByID(itemID)
        else
            local availNow = GetItemCount(itemID, false)
            local availTotal = GetItemCount(itemID, true)
            if (availNow == 0) then
                GuideTooltip:AddLine(" ")
                if (availTotal ~= 0) then
                    GuideTooltip:AddLine("|CFFFF0000Item is in your bank|r")
                else
                    GuideTooltip:AddLine("|CFFFF0000You do not have this item|r")
                end
            end
            local type = self.parent.type
            if (availNow > 0 and type == TYPE_ITEM) then
                GuideTooltip:AddLine(" ")
                GuideTooltip:AddLine("|CFFFFFF00Shift-click to drag onto the action bar|r")
            end
            if (availTotal ~= 0 and type == TYPE_DESTROY) then
                GuideTooltip:AddLine(" ")
                GuideTooltip:AddLine("|CFFFF0000Click to destroy the item|r")
            end
            if (not KeybindService.HasBindings()) then
                GuideTooltip:AddLine(" ")
                GuideTooltip:AddLine("no keybinds set", 0.6, 0.6, 0.6)
            end
        end
    elseif (self.parent.type == TYPE_TARGET) then
        GuideTooltip:SetNPCs(self.parent.npcIDs)
        if (not KeybindService.HasBindings()) then
            GuideTooltip:AddLine(" ")
            GuideTooltip:AddLine("no keybinds set", 0.6, 0.6, 0.6)
        end
    end
    if (not GuideTooltip.refreshOnly) then
        GuideTooltip:Show()
    end
    GuideTooltip.refreshOnly = nil
end

function OnEvent(self, event)
    if (event == "BAG_UPDATE_COOLDOWN") then
        self.parent:RefreshButtonCooldown()
    end
end

function OnLeave()
    GuideTooltip:Hide()
end

ActionButtonMixin = { }

function ActionButtonMixin:Init()
    if (not self.initialized) then
        self.buttonSide = SCREEN_LEFT
        local actionButtonName = UI.GetNextActionButtonName()
        self.bindingName = "CLICK " .. actionButtonName .. ":LeftButton"
        for i = 1, 2 do
            local button = CreateFrame("Button", i == 1 and UI.GetNextActionButtonName() or nil,
                    UI.GetComponent("GuideContainer").frame, "SecureActionButtonTemplate")
            button.parent = self
            button.idx = i
            self[i] = button
            button:SetSize(26, 26)
            local buttonCover = CreateFrame("Button", nil, button)
            buttonCover:SetSize(26, 26)
            buttonCover:SetPoint("CENTER", button, "CENTER", 0, 0)
            buttonCover:SetFrameLevel(button:GetFrameLevel() + 1)
            buttonCover:Hide()
            button.cover = buttonCover
            button.icon = button:CreateTexture(nil, "BACKGROUND")
            button.icon:SetAllPoints()
            button.hotkey = button:CreateFontString(nil, "ARTWORK", "NumberFontNormal")
            button.hotkey:SetVertexColor(0.6, 0.6, 0.6)
            button.hotkey:SetText(RANGE_INDICATOR)
            button.hotkey:SetJustifyH("RIGHT")
            button.hotkey:SetSize(32, 10)
            button.hotkey:SetPoint("TOPLEFT", 3, -5)
            button.hotkey:SetScale(0.7)
            button.hotkey:Hide()
            button.Count = button:CreateFontString(nil, "ARTWORK", "NumberFontNormal")
            button.Count:SetJustifyH("RIGHT")
            button.Count:SetPoint("BOTTOMRIGHT", -3, 2)
            button.Count:SetScale(0.7)
            button.Count:Hide()
            button.IconBorder = AddTexture(
                    button,
                    { texture = "Interface/Common/WhiteIconFrame", level = "OVERLAY" },
                    26,
                    26,
                    "CENTER"
            )
            button.IconBorder:Hide()
            button.IconOverlay = AddTexture(
                    button,
                    { texture = "Interface/Common/WhiteIconFrame", level = "OVERLAY", drawLayer = 1 },
                    26,
                    26,
                    "CENTER"
            )
            button.IconOverlay:Hide()
            button.cooldown = CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
            button.cooldown:SetScale(0.7)
            button.x = AddTexture(
                    button,
                    { texture = I.x, level = "ARTWORK", drawLayer = 2 },
                    26,
                    26,
                    "CENTER"
            )
            button.x:SetAlpha(0.4)
            button.x:Hide()
            AddNormalTexture(button,"Interface/Buttons/UI-Quickslot2", 42, 42,"CENTER")
            AddPushedTexture(button, "Interface/Buttons/UI-Quickslot-Depress")
            if (i == 2) then
                self.pushed = AddNormalTexture(button,"Interface/Buttons/UI-Quickslot-Depress")
                self.pushed:Hide()
            end
            AddHighlightTexture(button, "Interface/Buttons/ButtonHilight-Square")
            button:RegisterForDrag("LeftButton");
            button:SetScript("OnEnter", OnEnter)
            button:SetScript("OnLeave", OnLeave)
            button:SetScript("OnDragStart", OnDragStart)
            button:SetScript("OnMouseDown", function()
                if (self.buttonRef and self.buttonRef.targets) then
                    if (not self.buttonRef.targetsShifted) then
                        self.buttonRef.targetsShifted = { }
                        for _, target in ipairs(self.buttonRef.targets) do
                            table.insert(self.buttonRef.targetsShifted, target)
                        end
                    end
                    table.insert(self.buttonRef.targetsShifted, table.remove(self.buttonRef.targetsShifted, 1))
                    UI.GetComponent("ActionButtons"):MarkDirty()
                end
            end)
            button:Show()
        end
        self[1]:SetScript("OnEvent", OnEvent)
        self[1]:RegisterEvent("BAG_UPDATE_COOLDOWN")
        self.initialized = true
    end
end

function ActionButtonMixin:IsIconTextureSet()
    return self.iconTexture and self.iconTexture ~= UNKNOWN_ITEM_TEXTURE
end

function ActionButtonMixin:IsShown()
    return self[1]:IsShown()
end

function ActionButtonMixin:Reset(preserveButtonRef)
    self.itemID = nil
    self.npcIDs = nil
    self.targetStrings = nil
    self.type = nil
    self.buttonRef = preserveButtonRef and self.buttonRef or nil
    self.dim = nil
    self[1]:SetAttribute("item", nil)
    self[1]:SetAttribute("type1", nil)
    self[1]:SetAttribute("macrotext1", nil)
    self[1].x:Hide()
    self[1].Count:Hide()
    self[2]:SetAttribute("item", nil)
    self[2]:SetAttribute("type1", nil)
    self[2]:SetAttribute("macrotext1", nil)
    self[2].x:Hide()
    self[2].Count:Hide()
end

function ActionButtonMixin:RefreshButtonCooldown()
    local bagID, slot = GetItemLocation(self.itemID)
    if (bagID) then
        local start, duration, enable = GetContainerItemCooldown(bagID, slot);
        CooldownFrame_Set(self[1].cooldown, start, duration, enable);
        CooldownFrame_Set(self[2].cooldown, start, duration, enable);
    else
        CooldownFrame_Set(self[1].cooldown, 0, 0, false);
        CooldownFrame_Set(self[2].cooldown, 0, 0, false);
    end
end

function ActionButtonMixin:SetButtonRef(buttonRef)
    local itemID = buttonRef.item or buttonRef.destroy
    if (itemID) then
        local _, _, _, _, _, _, _, _, _, texture = GetItemInfo(itemID)
        if (buttonRef.item) then
            self:SetItemID(buttonRef.item)
        elseif (buttonRef.destroy) then
            self:SetDestroyItemID(buttonRef.destroy)
        end
        self:SetIconTexture(texture)
        local itemCount = GetItemCount(itemID, false) or 0
        self:SetAvailable(itemCount ~= 0)
        self:UpdateCount()
        self.buttonRef = buttonRef
    elseif (buttonRef.target or buttonRef.targets) then
        self.buttonRef = buttonRef
        self:SetTargets(buttonRef.target or buttonRef.targetsShifted or buttonRef.targets)
        self:SetAvailable(true)
        if (buttonRef.alert) then
--            self:SetIconTexture(254883)
            self:SetIconTexture(I.inv_sigil_hodir)
        else
            self:SetIconTexture(132222)
        end
        --self:SetIconTexture(132212)
        --self:SetIconTexture(236179)
    end
    self:RefreshButtonCooldown()
end

function ActionButtonMixin:SetDestroyItemID(itemID)
    self:Reset()
    local macroText = string.format(destroyItemMacroTemplate, itemID, Names.GetName(GetItemInfo, itemID):gsub("'", "\\'"))
    self.itemID = itemID
    self.type = TYPE_DESTROY
    self[1]:SetAttribute("type1", "macro")
    self[1]:SetAttribute("macrotext1", macroText)
    self[1].x:Show()
    self[2]:SetAttribute("type1", "macro")
    self[2]:SetAttribute("macrotext1", macroText)
    self[2].x:Show()
end

function ActionButtonMixin:SetHotkeyShown(shown)
    local keybind = State.IsKeybindDisplayEnabled() and GetBindingKey(self.bindingName)
    local label = keybind or RANGE_INDICATOR
    shown = keybind and true or shown
    self[1].hotkey:SetText(label)
    self[2].hotkey:SetText(label)
    self[1].hotkey:SetShown(shown)
    self[2].hotkey:SetShown(shown)
end

function ActionButtonMixin:SetHotkeyVertexColor(r, g, b)
    self[1].hotkey:SetVertexColor(r, g, b);
    self[2].hotkey:SetVertexColor(r, g, b);
end

function ActionButtonMixin:SetItemID(itemID)
    self:Reset()
    self.itemID = itemID
    self.type = TYPE_ITEM
    local itemLink = ("item:%s"):format(itemID or 0)
    self[1]:SetAttribute("type1", "item")
    self[2]:SetAttribute("type1", "item")
    self[1]:SetAttribute("item", itemLink)
    self[2]:SetAttribute("item", itemLink)
end

function ActionButtonMixin:SetSpell(spellID)
    self:Reset()
    --todo: Implement spell support
    self.type = TYPE_SPELL
end

function ActionButtonMixin:SetTargets(npcIDs)
    self:Reset(true)
    if (type(npcIDs) ~= "table") then
        npcIDs = { npcIDs }
    end
    self.npcIDs = npcIDs
    self.targetStrings = { }
    local macroText = { "/cleartarget\n" }
    for i, npcID in ipairs(npcIDs) do
        local targetString =  Names.GetName(GetCreatureName,npcID)
        table.insert(self.targetStrings, targetString)
        local template1, template2 = targetSingleMacroTemplate1, targetSingleMacroTemplate2
        if (self.buttonRef.allowdead) then
            template1, template2 = targetSingleMacroTemplateAllowDead1, targetSingleMacroTemplateAllowDead2
        end
        if (i == 1) then
            table.insert(macroText, string.format(template1, targetString))
        else
            table.insert(macroText, string.format(template2, targetString))
        end
        if (i ~= #npcIDs) then table.insert(macroText, "\n") end
    end
    local macroTextConcat = table.concat(macroText)
    self[1]:SetAttribute("type1", "macro")
    self[1]:SetAttribute("macrotext1", macroTextConcat)
    self[2]:SetAttribute("type1", "macro")
    self[2]:SetAttribute("macrotext1", macroTextConcat)
    self.type = TYPE_TARGET
end

function ActionButtonMixin:SetAvailable(available)
    self[1].icon:SetDesaturated(not available)
    self[2].icon:SetDesaturated(not available)
    if (available) then
        self[1].icon:SetVertexColor(1, 1, 1)
        self[2].icon:SetVertexColor(1, 1, 1)
    else
        self[1].icon:SetVertexColor(0.4, 0.4, 0.4)
        self[2].icon:SetVertexColor(0.4, 0.4, 0.4)
    end
end

function ActionButtonMixin:SetIconTexture(texture)
    self.iconTexture = texture or UNKNOWN_ITEM_TEXTURE
    self[1].icon:SetTexture(self.iconTexture)
    self[2].icon:SetTexture(self.iconTexture)
end

function ActionButtonMixin:SetShown(shown)
    self.shown = shown
    if (not InCombatLockdown()) then
        self[1]:SetShown(shown)
        self[2]:SetShown(shown)
    end
    local headerFrame = UI.GetComponent("Header").frame
    if (shown) then
        local yOffset = CalculateYOffset(headerFrame:GetBottom(), self)
        if (math.abs(self.yOffset - yOffset) < 1) then
            self[self.buttonSide]:SetAlpha(1)
            self[self.buttonSide].cover:SetShown(false)
            self[self.buttonSide].cooldown:SetDrawBling(true)
        else
            self.shown = false
        end
    else
        self[self.buttonSide]:SetAlpha(self.dim and 0.5 or 0.001)
        self[self.buttonSide].cover:SetShown(true)
        self[self.buttonSide].cooldown:SetDrawBling(false)
    end
end

function ActionButtonMixin:SetYOffset()
    local headerFrame = UI.GetComponent("Header").frame
    local yOffset = CalculateYOffset(headerFrame:GetBottom(), self)
    self[1]:ClearAllPoints()
    self[1]:SetPoint("RIGHT", headerFrame, "BOTTOMLEFT", -18, yOffset)
    self[2]:ClearAllPoints()
    self[2]:SetPoint("LEFT", headerFrame, "BOTTOMRIGHT", 4, yOffset)
    self.yOffset = yOffset
end

function ActionButtonMixin:UpdateCount()
    local itemID = self.itemID
    if (itemID) then
        local _, _, _, _, _, _, _, stackCount = GetItemInfo(itemID)
        if (stackCount and stackCount > 1) then
            local itemCount = GetItemCount(itemID, true)
            self[1].Count:SetText(itemCount)
            self[2].Count:SetText(itemCount)
            self[1].Count:Show()
            self[2].Count:Show()
            return
        end
    end
end
