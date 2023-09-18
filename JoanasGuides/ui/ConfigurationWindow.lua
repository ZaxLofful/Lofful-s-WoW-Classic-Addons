--[[ See license.txt for license and copyright information ]]
select(2, ...).SetupGlobalFacade()

local frame, isMoving

local Init, ShowTooltip, HideTooltip

local component = UI.CreateComponent("ConfigurationWindow")

function Init()
    if (frame) then return end
    local BACKDROP_GLUE_TOOLTIP_16_16 = {
        bgFile = "Interface\\Glues\\Common\\Glue-Tooltip-Background",
        edgeFile = "Interface\\Glues\\Common\\Glue-Tooltip-Border",
        tile = true,
        tileEdge = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 10, right = 5, top = 4, bottom = 9 },
    };
    local GLUE_BACKDROP_COLOR = CreateColor(0.09, 0.09, 0.09);
    local GLUE_BACKDROP_BORDER_COLOR = CreateColor(0.8, 0.8, 0.8);
    frame = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
    frame.backdropInfo = BACKDROP_GLUE_TOOLTIP_16_16
    frame.backdropColor = GLUE_BACKDROP_COLOR
    frame.backdropColorAlpha = 1.0
    frame.backdropBorderColor = GLUE_BACKDROP_BORDER_COLOR
    frame:SetFrameLevel(3000)
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
        end
    end)
    frame:SetScript("OnUpdate", function(self)
        if (isMoving and not IsMouseButtonDown("LeftButton")) then
            self:StopMovingOrSizing()
            isMoving = nil
        end
    end)
    local title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    title:SetPoint("TOP", 0, -12)
    title:SetText(string.format("%s v%s", L["Joana's Speed Leveling Guides"], GuideModules.GetAddonVersion()))
    local title2 = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    title2:SetPoint("TOP", title, "BOTTOM", 0, -6)
    title2:SetText("Configuration Options")

    local lastComponent

    local options = {
        {
            text = L["Hardcore Mode"],
            tooltip = "Effectively takes out death warps and makes your journey through Azeroth safer.\n\n(setting saved per character)",
            checked = function()
                return HardcoreService.IsHardcoreEnabled()
            end,
            func = function()
                HardcoreService.SetHardcoreEnabled(not HardcoreService.IsHardcoreEnabled())
                MarkAllDirty()
            end
        },
        {
            text = L["Open World Grouping"],
            tooltip = "Steps labeled \"GROUP 2+ Players\" are taken out of the guide.\n\n(setting saved per character)",
            checked = function()
                return State.IsGroupingEnabled()
            end,
            func = function()
                State.SetGroupingEnabled(not State.IsGroupingEnabled())
                MarkAllDirty()
            end
        },
        {
            text = L["Auction House / Mailbox Usage"],
            tooltip = "Unofficial Hardcore uses these rules.\n\n(setting saved per character)",
            checked = function()
                return State.IsAHEnabled()
            end,
            func = function()
                State.SetAHEnabled(not State.IsAHEnabled())
                MarkAllDirty()
            end
        },
        {
            text = L["Automatically Accept and Turn-In Quests"],
            tooltip = "The addon will only accept & turn-in quests that pertain to the guide. If you are using another addon that automatically accept/turn-in quests, then it’s recommended to turn that off\n\n(setting saved account-wide)",
            checked = function()
                return State.IsAutoQuestsEnabled()
            end,
            func = function()
                State.SetAutoQuestsEnabled(not State.IsAutoQuestsEnabled())
            end
        },
        {
            text = L["Automatically Take Flights"],
            tooltip = "From the Flight Masters.\n\n(setting saved account-wide)",
            checked = function()
                return State.IsAutoTaxiEnabled()
            end,
            func = function()
                State.SetAutoTaxiEnabled(not State.IsAutoTaxiEnabled())
            end
        },
        {
            text = L["Sound on Objective Completion"],
            tooltip = "\"Work Complete\" sound when completing things\n\n(setting saved account-wide)",
            checked = function()
                return IsObjectiveCompletionSoundEnabled()
            end,
            func = function()
                SetObjectiveCompletionSoundEnabled(not IsObjectiveCompletionSoundEnabled())
            end
        },
        {
            text = L["Show Step ID"],
            tooltip = "Shown above addon, the Step ID is a mirror from the web guides. Also use the Step ID to report bugs to me.\n\n(setting saved account-wide)",
            isNotRadio = true,
            notCheckable = false,
            checked = function()
                return State.IsStepIDEnabled()
            end,
            func = function()
                State.SetStepIDEnabled(not State.IsStepIDEnabled())
            end
        },
        {
            text = L["Display Keybinds on Buttons"],
            tooltip = "Hotkeys are assigned via the buttons from the top down in the addon and can dynamically change during a step\n\n(setting saved account-wide)",
            isNotRadio = true,
            notCheckable = false,
            checked = function()
                return State.IsKeybindDisplayEnabled()
            end,
            func = function()
                State.SetKeybindDisplayEnabled(not State.IsKeybindDisplayEnabled())
            end
        },
        {
            text = L["Automatically Mark Targeted NPCs"],
            tooltip = "Raid symbol will appear above selected targets\n\n(setting saved account-wide)",
            isNotRadio = true,
            notCheckable = false,
            checked = function()
                return State.IsTargetMarkingEnabled()
            end,
            func = function()
                State.SetTargetMarkingEnabled(not State.IsTargetMarkingEnabled())
            end
        },
        {
            text = L["Target Sound Alert:"],
            tooltip = "Sound only plays on certain targets\n\n(setting saved account-wide)",
            dropdown = true,
        },
        {
            slider = true,
            text = "Guide Size:",
            min = 0.75,
            max = 1.75,
            step = 0.05,
            topPadding = 8,
            GetValue = function()
                return State.GetGuideScale()
            end,
            SetValue = function (value)
                if (not InCombatLockdown()) then
                    State.SetGuideScale(value)
                end
            end,
            FormatValue = function(value)
                return math.floor(value * 20) / 20
            end
        }
    }

    for _, option in ipairs(options) do
        local component
        if (option.tooltip) then
            option.enterFunc = ShowTooltip
            option.leaveFunc = HideTooltip
        end
        if (option.checked) then
            component = CreateMenuButton(frame, option)
        elseif (option.slider) then
            component = CreateSlider(frame, option)
        elseif (option.dropdown) then
            --todo: Convert this into a reusable component
            component = CreateFrame("Frame", nil, frame)
            component.label = component:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmallLeft")
            component.label:SetText(option.text)
            component.label:SetPoint("LEFT", 8, 0)
            component:SetSize(1, 32)
            component.dropdown = CreateFrame("Frame", "JoanasGuidesSoundDropDownButton1", component, "UIDropDownMenuTemplate")
            component.dropdown:SetPoint("LEFT", component.label, "RIGHT", -12, -2)
            component.dropdown.Text:SetText(AlertSoundsLUT[State.GetNPCAlertSound()] or "None")
            component.dropdownMenu = TieredMenu.CreateMenu(component)
            local menu = { }
            table.insert(menu, {
                text = "None",
                checked = function()
                    return State.GetNPCAlertSound() == nil
                end,
                func = function()
                    State.SetNPCAlertSound(nil)
                    component.dropdown.Text:SetText("None")
                    component.dropdownMenu:Display(false)
                end
            })
            for _, v in ipairs(AlertSounds) do
                table.insert(menu, {
                    text = v.name,
                    checked = function()
                        return State.GetNPCAlertSound() == v.id
                    end,
                    func = function()
                        State.SetNPCAlertSound(v.id)
                        component.dropdown.Text:SetText(v.name)
                        component.dropdownMenu:Display(false)
                        PlaySound(v.id)
                    end
                })
            end
            component.dropdown.Middle:SetWidth(154)
            component.dropdown.Button:SetScript("OnClick", function()
                if (component.dropdownMenu:IsShown()) then
                    component.dropdownMenu:Display(false)
                else
                    component.dropdownMenu:Display(menu, "TOPLEFT", component.dropdown.Left, "TOPLEFT", 12, -40)
                end
            end)
            component.opts = option
            component:SetScript("OnEnter", ShowTooltip)
            component:SetScript("OnLeave", HideTooltip)
        end
        if (lastComponent) then
            component:SetPoint("TOPLEFT", lastComponent, "BOTTOMLEFT", 0, -6)
        else
            component:SetPoint("TOPLEFT", 16, -64)
        end
        component:SetPoint("RIGHT", frame, "RIGHT", -6, 0)
        lastComponent = component
    end
    frame.closeButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    frame.closeButton:SetWidth(100)
    frame.closeButton:SetText(CLOSE)
    frame.closeButton:SetPoint("BOTTOM", 0, 18)
    frame.closeButton:SetScript("OnClick", function()
        frame:Hide()
    end)
    frame:OnBackdropLoaded()
    frame:SetSize(320, 376) -- + 22 for every checkbutton
end

function ShowTooltip(button)
    GuideTooltip:SetOwner(frame, "ANCHOR_NONE")
    GuideTooltip:AddLine(button.opts.text)
    GuideTooltip:AddLine(button.opts.tooltip, 1, 1, 1, true)
    GuideTooltip:SetPoint("LEFT", button, "RIGHT", 12, 0)
    GuideTooltip:Show()
end

function HideTooltip(button)
    GuideTooltip:Hide()
end

function UI.OpenConfigurationWindow()
    Init()
    frame:ClearAllPoints()
    frame:SetPoint("CENTER", UIParent, "CENTER")
    frame:Show()
end

UI.Add(component)