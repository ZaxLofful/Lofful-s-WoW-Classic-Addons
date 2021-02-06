LootReserve = LootReserve or { };
LootReserve.ItemConditions = LootReserve.ItemConditions or { };

local DefaultConditions =
{
    Hidden = nil,
    Custom = nil,
    Faction = nil,
    ClassMask = nil,
    Limit = nil,
};

function LootReserve.ItemConditions:Get(item, server)
    if server and LootReserve.Server.CurrentSession then
        return LootReserve.Server.CurrentSession.Settings.ItemConditions[item] or LootReserve.Data.ItemConditions[item];
    elseif server then
        return LootReserve.Server.NewSessionSettings.ItemConditions[item] or LootReserve.Data.ItemConditions[item];
    else
        return LootReserve.Client.ItemConditions[item] or LootReserve.Data.ItemConditions[item];
    end
end

function LootReserve.ItemConditions:Make(item, server)
    if server and LootReserve.Server.CurrentSession then
        LootReserve:ShowError("Cannot edit loot during an active session");
        return nil;
    elseif server then
        local conditions = LootReserve.Server.NewSessionSettings.ItemConditions[item];
        if not conditions then
            conditions = LootReserve:Deepcopy(LootReserve.Data.ItemConditions[item]);
            if not conditions then
                conditions = LootReserve:Deepcopy(DefaultConditions);
            end
            LootReserve.Server.NewSessionSettings.ItemConditions[item] = conditions;
        end
        return conditions;
    else
        LootReserve:ShowError("Cannot edit loot on client");
        return nil;
    end
end

function LootReserve.ItemConditions:Save(item, server)
    if server and LootReserve.Server.CurrentSession then
        LootReserve:ShowError("Cannot edit loot during an active session");
    elseif server then
        local conditions = LootReserve.Server.NewSessionSettings.ItemConditions[item];
        if conditions then
            -- Coerce conditions
            if conditions.ClassMask == 0 then
                conditions.ClassMask = nil;
            end
            if conditions.Hidden == false then
                conditions.Hidden = nil;
            end
            if conditions.Limit and conditions.Limit <= 0 then
                conditions.Limit = nil;
            end
        end

        -- If conditions are no different from the default - delete the table
        if conditions then
            local different = false;
            local default = LootReserve.Data.ItemConditions[item];
            if default then
                for k, v in pairs(conditions) do
                    if v ~= default[k] then
                        different = true;
                        break;
                    end
                end
                for k, v in pairs(default) do
                    if v ~= conditions[k] then
                        different = true;
                        break;
                    end
                end
            else
                if next(conditions) then
                    different = true;
                end
            end

            if not different then
                conditions = nil;
                LootReserve.Server.NewSessionSettings.ItemConditions[item] = nil;
            end
        end

        LootReserve.Server.LootEdit:UpdateLootList();
        LootReserve.Server.Import:SessionSettingsUpdated();
    else
        LootReserve:ShowError("Cannot edit loot on client");
    end
end

function LootReserve.ItemConditions:Delete(item, server)
    if server and LootReserve.Server.CurrentSession then
        LootReserve:ShowError("Cannot edit loot during an active session");
    elseif server then
        LootReserve.Server.NewSessionSettings.ItemConditions[item] = nil;

        LootReserve.Server.LootEdit:UpdateLootList();
        LootReserve.Server.Import:SessionSettingsUpdated();
    else
        LootReserve:ShowError("Cannot edit loot on client");
    end
end

function LootReserve.ItemConditions:Clear(category, server)
    if server and LootReserve.Server.CurrentSession then
        LootReserve:ShowError("Cannot edit loot during an active session");
    elseif server then
        if category then
            local toRemove = { };
            for item, conditions in pairs(LootReserve.Server.NewSessionSettings.ItemConditions) do
                if LootReserve.Data:IsItemInCategory(item, category) or conditions.Custom == category then
                    table.insert(toRemove, item);
                end
            end
            for _, item in ipairs(toRemove) do
                LootReserve.Server.NewSessionSettings.ItemConditions[item] = nil;
            end
        else
            table.wipe(LootReserve.Server.NewSessionSettings.ItemConditions);
        end

        LootReserve.Server.LootEdit:UpdateLootList();
        LootReserve.Server.Import:SessionSettingsUpdated();
    else
        LootReserve:ShowError("Cannot edit loot on client");
    end
end

function LootReserve.ItemConditions:HasCustom(server)
    local container;
    if server and LootReserve.Server.CurrentSession then
        container = LootReserve.Server.CurrentSession.Settings.ItemConditions
    elseif server then
        container = LootReserve.Server.NewSessionSettings.ItemConditions;
    else
        container = LootReserve.Client.ItemConditions;
    end

    if container then
        for item, conditions in pairs(container) do
            if conditions.Custom then
                return true;
            end
        end
    end
    return false;
end

function LootReserve.ItemConditions:TestClassMask(classMask, playerClass)
    return classMask and playerClass and bit.band(classMask, bit.lshift(1, playerClass - 1)) ~= 0;
end

function LootReserve.ItemConditions:TestFaction(faction)
    return faction and UnitFactionGroup("player") == faction;
end

function LootReserve.ItemConditions:TestLimit(limit, item, player, server)
    if limit <= 0 then
        -- Has no limiton the number of reserves
        return true;
    end

    if server then
        local reserves = LootReserve.Server.CurrentSession.ItemReserves[item];
        if not reserves then
            -- Not reserved by anyone yet
            return true;
        end

        if LootReserve:Contains(reserves.Players, player) then
            -- Player is already reserving the item - allow them to cancel
            return true;
        end

        return #reserves.Players < limit;
    else
        return LootReserve.Client:IsItemReservedByMe(item) or #LootReserve.Client:GetItemReservers(item) < limit;
    end
end

function LootReserve.ItemConditions:TestPlayer(player, item, server)
    if not server and not LootReserve.Client.SessionServer then
        -- Show all items until connected to a server
        return true;
    end

    local conditions = self:Get(item, server);
    if conditions then
        if conditions.Hidden then
            return false;
        end
        if conditions.Custom then
            if server and conditions.Custom ~= LootReserve.Server.CurrentSession.Settings.LootCategory then
                return false;
            elseif not server and conditions.Custom ~= LootReserve.Client.LootCategory then
                return false;
            end
        end
        if conditions.ClassMask and not self:TestClassMask(conditions.ClassMask, select(3, UnitClass(player))) then
            return false;
        end
        if conditions.Faction and not self:TestFaction(conditions.Faction) then
            return false;
        end
        if conditions.Limit and not self:TestLimit(conditions.Limit, item, player, server) then
            return false, true;
        end
    end
    return true;
end

function LootReserve.ItemConditions:TestServer(item)
    local conditions = self:Get(item, true);
    if conditions then
        if conditions.Hidden then
            return false;
        end
        if conditions.Custom and LootReserve.Server.CurrentSession and conditions.Custom ~= LootReserve.Server.CurrentSession.Settings.LootCategory then
            return false;
        end
        if conditions.Custom and not LootReserve.Server.CurrentSession and conditions.Custom ~= LootReserve.Server.NewSessionSettings.LootCategory then
            return false;
        end
        if conditions.Faction and not self:TestFaction(conditions.Faction) then
            return false;
        end
    end
    return true;
end

function LootReserve.ItemConditions:IsItemVisibleOnClient(item)
    local canReserve, overrideShow = self:TestPlayer("player", item, false);
    return canReserve and overrideShow ~= false or overrideShow == true;
end

function LootReserve.ItemConditions:IsItemReservableOnClient(item)
    local canReserve, overrideShow = self:TestPlayer("player", item, false);
    return canReserve;
end

function LootReserve.ItemConditions:Pack(conditions)
    local text = "";
    if conditions.Hidden then
        text = text .. "-";
    elseif conditions.Custom then
        text = text .. "+";
    end
    if conditions.Faction == "Alliance" then
        text = text .. "A";
    elseif conditions.Faction == "Horde" then
        text = text .. "H";
    end
    if conditions.ClassMask and conditions.ClassMask ~= 0 then
        text = text .. "C" .. conditions.ClassMask;
    end
    if conditions.Limit and conditions.Limit ~= 0 then
        text = text .. "L" .. conditions.Limit;
    end
    return text;
end

function LootReserve.ItemConditions:Unpack(text, category)
    local conditions = LootReserve:Deepcopy(DefaultConditions);

    for i = 1, #text do
        local char = text:sub(i, i);
        if char == "-" then
            conditions.Hidden = true;
        elseif char == "+" then
            conditions.Custom = category;
        elseif char == "A" then
            conditions.Faction = "Alliance";
        elseif char == "H" then
            conditions.Faction = "Horde";
        elseif char == "C" then
            for len = 1, 10 do
                local mask = text:sub(i + 1, i + len);
                if tonumber(mask) then
                    conditions.ClassMask = tonumber(mask);
                else
                    break;
                end
            end
        elseif char == "L" then
            for len = 1, 10 do
                local limit = text:sub(i + 1, i + len);
                if tonumber(limit) then
                    conditions.Limit = tonumber(limit);
                else
                    break;
                end
            end
        end
    end
    return conditions;
end