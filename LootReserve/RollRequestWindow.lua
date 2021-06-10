local LibCustomGlow = LibStub("LibCustomGlow-1.0");

function LootReserve.Client:RollRequested(sender, item, players, custom, duration, maxDuration, phase, example)
    local frame = LootReserveRollRequestWindow;

    if LibCustomGlow then
        LibCustomGlow.ButtonGlow_Stop(frame.ItemFrame.IconGlow);
    end

    self.RollRequest = nil;
    frame:Hide();

    if not example then
        if not self.Settings.RollRequestShow then return; end
        if not LootReserve:Contains(players, LootReserve:Me()) then return; end
        if custom and not self.Settings.RollRequestShowUnusable and LootReserve:IsItemUsable(item) == false then return; end -- Need to check for false, returns nil if item not loaded
    end

    self.RollRequest =
    {
        Sender = sender,
        Item = item,
        Custom = custom or nil,
        Duration = duration and duration > 0 and duration or nil,
        MaxDuration = maxDuration and maxDuration > 0 and maxDuration or nil,
        Phase = phase,
        Example = example,
    };
    local roll = self.RollRequest;

    local name, link, _, _, _, type, subtype, _, _, texture = GetItemInfo(item);
    if subtype and type ~= subtype then
        type = type .. ", " .. subtype;
    end
    frame.Link = link;

    frame.Sender = sender;
    frame.Item = item;
    frame.Roll = roll;
    frame.LabelSender:SetText(format(custom and "%s offers you to roll%s on this item:" or "%s asks you to roll%s on the item you reserved:", LootReserve:ColoredPlayer(sender), phase and format(" for |cFF00FF00%s|r", phase) or ""));
    frame.ItemFrame.Icon:SetTexture(texture);
    frame.ItemFrame.Name:SetText((link or name or "|cFFFF4000Loading...|r"):gsub("[%[%]]", ""));
    frame.ItemFrame.Misc:SetText(type);
    frame.ButtonRoll:Disable();
    frame.ButtonRoll:SetAlpha(0.25);
    frame.ButtonPass:Disable();
    frame.ButtonPass:SetAlpha(0.25);

    frame.DurationFrame:SetShown(self.RollRequest.MaxDuration);
    local durationHeight = frame.DurationFrame:IsShown() and 20 or 0;
    frame.DurationFrame:SetHeight(math.max(durationHeight, 0.00001));

    frame:SetHeight(90 + durationHeight);
    frame:SetMinResize(300, 90 + durationHeight);
    frame:SetMaxResize(1000, 90 + durationHeight);

    frame:Show();

    C_Timer.After(1, function()
        if frame.Roll == roll then
            frame.ButtonRoll:Enable();
            frame.ButtonRoll:SetAlpha(1);
            frame.ButtonPass:Enable();
            frame.ButtonPass:SetAlpha(1);
            if LibCustomGlow and (not self.Settings.RollRequestGlowOnlyReserved or not roll.Custom) then
                LibCustomGlow.ButtonGlow_Start(frame.ItemFrame.IconGlow);
            end
        end
    end);

    if not name or not link then
        C_Timer.After(0.25, function()
            self:RollRequested(sender, item, players, custom, duration, maxDuration, phase);
        end);
    end
end

function LootReserve.Client:RespondToRollRequest(response)
    if LibCustomGlow then
        LibCustomGlow.ButtonGlow_Stop(LootReserveRollRequestWindow.ItemFrame.IconGlow);
    end
    LootReserveRollRequestWindow:Hide();

    if not self.RollRequest then return; end

    if not self.RollRequest.Example then
        if response then
            RandomRoll(1, 100);
        else
            LootReserve.Comm:SendPassRoll(self.RollRequest.Item);
        end
    end
    self.RollRequest = nil;
end