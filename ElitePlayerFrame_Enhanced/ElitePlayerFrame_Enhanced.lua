EPF = {};
EPF.Funcs = {};

function EPF.Funcs.Initialize(self)
	-- Register Events
	EPF.Frame = self;
	EPF.Frame:RegisterEvent("ADDON_LOADED");	-- Addon loaded
	EPF.Frame:RegisterEvent("PLAYER_ENTERING_WORLD");	-- UI (re)loaded
	EPF.Frame:RegisterEvent("PLAYER_LEVEL_UP");	-- Level changed
	
	-- Default Variables
	EPF.Vars = {};
	EPF.Vars.Version = 1.5;
	EPF.Vars.Revision = 3;
	EPF.Vars.Mode = 1;
	EPF.Vars.DK = 1;
	EPF.Vars.DH = 1;
	EPF.Vars.Faction = 0;
	EPF.Vars.Debug = 1;
	EPF.Vars.Loaded = false;
	
	-- Slash Commands
	SLASH_EPF1 = "/epf";
	SLASH_EPF2 = "/eliteplayerframe";
	
	-- Tables
	EPF.Tables = {};
	-- Slash Command Options
	EPF.Tables.Commands = {
		[-1] = {
			["ID"] = -1,
			["Name"] = "null",
		},
		[0] = {
			["ID"] = 0,
			["Name"] = "help",
		},
		[1] = {
			["ID"] = 1,
			["Name"] = "mode",
		},
		[2] = {
			["ID"] = 2,
			["Name"] = "dk",
		},
		[3] = {
			["ID"] = 3,
			["Name"] = "dh",
		},
		[4] = {
			["ID"] = 4,
			["Name"] = "faction",
		},
		[5] = {
			["ID"] = 5,
			["Name"] = "info",
		},
		[6] = {
			["ID"] = 6,
			["Name"] = "debug",
		},
		[7] = {
			["ID"] = 7,
			["Name"] = "reset",
		},
		[8] = {
			["ID"] = 8,
			["Name"] = "update",
		},
	};
	-- Debug Levels
	EPF.Tables.DebugLevels = {
		[0] = {
			["ID"] = 0,
			["Name"] = "Errors",
			["Prefix"] = "Error",
			["Color"] = "FFFF3333",
		},
		[1] = {
			["ID"] = 1,
			["Name"] = "Notices",
			["Prefix"] = "Notice",
			["Color"] = "FF33FF33",
		},
		[2] = {
			["ID"] = 2,
			["Name"] = "Warnings",
			["Prefix"] = "Warning",
			["Color"] = "FF33FF33",
		},
		[3] = {
			["ID"] = 3,
			["Name"] = "Debug Events",
			["Prefix"] = "Debug Event",
			["Color"] = "FF33FF33",
		},
	};
	-- Modes
	EPF.Tables.Modes = {
		[0] = {
			["ID"] = 0,
			["Name"] = "Off",
			["Color"] = "FFFF3333",
		},
		[1] = {
			["ID"] = 1,
			["Name"] = "Auto",
			["Color"] = "FF33FF33",
		},
		[2] = {
			["ID"] = 2,
			["Name"] = "Rare",
			["Color"] = "FF999999",
		},
		[3] = {
			["ID"] = 3,
			["Name"] = "Rare-Elite",
			["Color"] = "FFFFDD99",
		},
		[4] = {
			["ID"] = 4,
			["Name"] = "Elite",
			["Color"] = "FFFFDD33",
		},
		[5] = {
			["ID"] = 5,
			["Name"] = "Death Knight - Alliance",
			["Color"] = "FF33FFFF",
		},
		[6] = {
			["ID"] = 6,
			["Name"] = "Death Knight - Horde",
			["Color"] = "FFFF66FF",
		},
		[7] = {
			["ID"] = 7,
			["Name"] = "Demon Hunter",
			["Color"] = "FF99FF33",
		},
	};
	-- Death Knight Frame
	EPF.Tables.DKFrame = {
		[0] = {
			["ID"] = 0,
			["Name"] = "Off",
			["Color"] = "FFFF3333",
		},
		[1] = {
			["ID"] = 1,
			["Name"] = "On",
			["Color"] = "FF33FF33",
		},
	};
	-- Demon Hunter Frame
	EPF.Tables.DHFrame = {
		[0] = {
			["ID"] = 0,
			["Name"] = "Off",
			["Color"] = "FFFF3333",
		},
		[1] = {
			["ID"] = 1,
			["Name"] = "On",
			["Color"] = "FF33FF33",
		},
	};
	-- Genders
	EPF.Tables.Genders = {
		[1] = {
			["ID"] = 1,
			["Name"] = "Unknown",
			["Color"] = "FF999999",
		},
		[2] = {
			["ID"] = 2,
			["Name"] = "Male",
			["Color"] = "FF6699FF",
		},
		[3] = {
			["ID"] = 3,
			["Name"] = "Female",
			["Color"] = "FFFF6699",
		},
	};
	-- Factions
	EPF.Tables.Factions = {
		[0] = {
			["ID"] = 0,
			["Name"] = "Auto",
			["Color"] = "FF33FF33",
		},
		[1] = {
			["ID"] = 1,
			["Name"] = "Alliance",
			["Color"] = "FF3366FF",
		},
		[2] = {
			["ID"] = 2,
			["Name"] = "Horde",
			["Color"] = "FFFF3333",
		},
	};
	-- Classes
	EPF.Tables.Classes = {};
	-- Expansions
	EPF.Tables.Expansions = {
		[0] = {
			["ID"] = 0,
			["Name"] = "Vanilla",
			["Color"] = "FFFFDD33",
		},
		[1] = {
			["ID"] = 1,
			["Name"] = "The Burning Crusade",
			["Color"] = "FF33FF33",
		},
		[2] = {
			["ID"] = 2,
			["Name"] = "Wrath of the Lich King",
			["Color"] = "FF3399FF",
		},
		[3] = {
			["ID"] = 3,
			["Name"] = "Cataclysm",
			["Color"] = "FFFF3333",
		},
		[4] = {
			["ID"] = 4,
			["Name"] = "Mists of Pandaria",
			["Color"] = "FF33CC99",
		},
		[5] = {
			["ID"] = 5,
			["Name"] = "Warlords of Draenor",
			["Color"] = "FFCC3300",
		},
		[6] = {
			["ID"] = 6,
			["Name"] = "Legion",
			["Color"] = "FF33FF33",
		},
		[7] = {
			["ID"] = 7,
			["Name"] = "Battle for Azeroth",
			["Color"] = "FF3333CC",
		},
	};
	-- Points
	EPF.Tables.Points = {
		["PlayerFrameTexture"] = {},
		["PlayerLevelText"] = {},
		["PlayerRestIcon"] = {},
		
	};
end

-- [ Event hanlder ] --
function EPF.Funcs.Event(self, event, ...)
	if (event == "ADDON_LOADED" and select(1,...) == "ElitePlayerFrame_Enhanced") then
		EPF.Frame:UnregisterEvent("ADDON_LOADED");
		EPF.Funcs.Loaded();
		EPF.Funcs.Msg(event,3);
		EPF.Funcs.Display.Update(true);	-- Force update
	else
		EPF.Funcs.Msg(event,3);
		if (event == "PLAYER_ENTERING_WORLD" or	event == "PLAYER_LEVEL_UP" or event == "NEUTRAL_FACTION_SELECT_RESULT") then	-- Player level, class, or faction may have changed
			EPF.Funcs.Display.Update();	-- Unforced display update
		elseif (event == "UNIT_EXITED_VEHICLE") then	-- PlayerFrame was reset
			EPF.Funcs.Display.Update(true);	-- Force display update
		end
	end
end

-- [ Loaded handler ] --
function EPF.Funcs.Loaded()
	-- Check settings
	local resolved = false
	if (EPF_Vars == nil) then
		EPF_Vars = {};
		-- New character, load default settings
		for k,v in pairs(EPF.Vars) do
			EPF_Vars[k] = v;
		end
		EPF.Funcs.Msg("New character. Loaded default settings.",1);
		resolved = true
	elseif (EPF_Vars ~= nil and EPV ~= nil) then
		if (EPF_Vars.Version < EPF.Vars.Version) or ((EPF_Vars.Version == EPF.Vars.Version) and (EPF_Vars.Revision < EPF.Vars.Revision)) then
			-- New version, update settings
			EPF__Vars = {};
			for k,v in pairs(EPF.Vars) do
				if (EPF_Vars[k] == nil) then
					EPF__Vars[k] = v;
				else
					EPF__Vars[k] = EPF_Vars[k];
				end
			end
			EPF_Vars = EPF__Vars;
			EPF_Vars.Version = EPF.Vars.Version;
			EPF_Vars.Revision = EPF.Vars.Revision;
			EPF.Funcs.Msg("Updated settings for version "..tostring(EPF_Vars.Version).."."..tostring(EPF_Vars.Revision)..".",1);
			resolved = true
		end
	end
	if (resolved == false) then
		-- Double check settings, use defaults if error
		EPF__Vars = {};
		for k,v in pairs(EPF.Vars) do
			if (EPF_Vars[k] == nil) then
				EPF__Vars[k] = v;
				EPF.Funcs.Msg("Missing variable "..tostring(k)..". Using default setting.",2);
			else
				EPF__Vars[k] = EPF_Vars[k];
			end
		end
		EPF_Vars = EPF__Vars;
	end
	
	local classes = {};
	FillLocalizedClassList(classes, (UnitSex("player") == 3))
	for k,v in pairs(RAID_CLASS_COLORS) do
		EPF.Tables.Classes[k] = {};
		EPF.Tables.Classes[k].Name = classes[k];
		EPF.Tables.Classes[k].Color = string.format("FF%02X%02X%02X", (v.r*255), (v.g*255), (v.b*255));
	end
	
	-- Get default frame points
	if (EPF_Vars.Debug >= 3) then
		EPF.Funcs.GetFramePoints("PlayerFrameTexture",PlayerFrameTexture);
	end
	local points = PlayerFrameTexture:GetNumPoints();
	local i = 1;
	while(i <= points) do
		local anchor, relativeFrame, relativeAnchor, x, y = PlayerFrameTexture:GetPoint(i);
		tinsert(EPF.Tables.Points.PlayerFrameTexture, {
			["Anchor"] = anchor,
			["RelativeFrame"] = relativeFrame,
			["RelativeAnchor"] = relativeAnchor,
			["OffsetX"] = x,
			["OffsetY"] = y
		});
		i = i + 1;
	end
	if (EPF_Vars.Debug >= 3) then
		EPF.Funcs.GetFramePoints("PlayerLevelText",PlayerLevelText);
	end
	points = PlayerLevelText:GetNumPoints();
	i = 1;
	while(i <= points) do
		local anchor, relativeFrame, relativeAnchor, x, y = PlayerLevelText:GetPoint(i);
		tinsert(EPF.Tables.Points.PlayerLevelText, {
			["Anchor"] = anchor,
			["RelativeFrame"] = PlayerFrameTexture,	-- Wrong relative frame when logging in, so force to texture frame
			["RelativeAnchor"] = relativeAnchor,
			["OffsetX"] = -61,	-- Wrong X offset when logging in, so force to -61
			["OffsetY"] = (y + 1)	-- Y offset seems wrong, so adjust
		});
		i = i + 1;
	end
	if (EPF_Vars.Debug >= 3) then
		EPF.Funcs.GetFramePoints("PlayerRestIcon",PlayerRestIcon);
	end
	points = PlayerRestIcon:GetNumPoints();
	i = 1;
	while(i <= points) do
		local anchor, relativeFrame, relativeAnchor, x, y = PlayerRestIcon:GetPoint(i);
		tinsert(EPF.Tables.Points.PlayerRestIcon, {
			["Anchor"] = anchor,
			["RelativeFrame"] = relativeFrame,
			["RelativeAnchor"] = relativeAnchor,
			["OffsetX"] = x,
			["OffsetY"] = (y - 1)	-- Y offset seems wrong, so adjust
		});
		i = i + 1;
	end
	
	-- Raise class power bars frame level above PlayerFrameTexture's
	local PFT = PlayerFrameTexture:GetParent();
	local PFTLevel = PFT:GetFrameLevel();
	EPF.Funcs.Msg('PlayerFrameTexture level is '..PFTLevel,3);
	
	-- Securely hook PlayerFrame_UpdateLevelTextAnchor to fix PlayerLevelText positioning
	hooksecurefunc("PlayerFrame_UpdateLevelTextAnchor",EPF.Funcs.Display.UpdateLevel);
	
	-- Set info
	EPF.Vars.Expansion = {};
	EPF.Funcs.Info.Expansion();
	EPF.Vars.Addon = {};
	EPF.Funcs.Info.Addon();
	EPF.Vars.Game = {};
	EPF.Funcs.Info.Game();
	EPF.Vars.Player = {};
	EPF.Funcs.Info.Player();
	
	EPF.Vars.Loaded = true;
	EPF.Funcs.Msg("Loaded!",3);
end

-- [ Addon Reset ] --
function EPF.Funcs.Reset()
	-- Wipe vars and apply defaults
	EPF.Vars.Loaded = false;
	wipe(EPF_Vars);
	for k,v in pairs(EPF.Vars) do
		EPF_Vars[k] = v;
	end
	
	-- Reset info
	EPF.Vars.Expansion = {};
	EPF.Funcs.Info.Expansion();
	EPF.Vars.Addon = {};
	EPF.Funcs.Info.Addon();
	EPF.Vars.Game = {};
	EPF.Funcs.Info.Game();
	EPF.Vars.Player = {};
	EPF.Funcs.Info.Player();
	EPF.Vars.Loaded = true;
	
	-- Update display
	EPF.Funcs.Display.Update(true);
	
	EPF.Funcs.Msg("Reloaded default settings.",3);
end

-- [ Message writing function ] --
function EPF.Funcs.Msg(msg,dbg,custom)
	-- Check debugging level
	if (custom) then
		SendChatMessage("[EPF]: "..tostring(msg).."",custom.type,custom.lang,custom.to);
	else
		if (DEFAULT_CHAT_FRAME and ((dbg == nil) or ((EPF_Vars.Debug and (EPF_Vars.Debug >= dbg)) or ((not EPF_Vars.Debug) and (1 >= dbg))))) then
			if (dbg ~= nil) then
				msg = tostring(EPF.Tables.DebugLevels[dbg].Prefix)..": "..msg;
			end
			DEFAULT_CHAT_FRAME:AddMessage("[|cFFFFDD33EPF|r]: "..tostring(msg).."");
		end
	end
end

-- [ Slash Command Handlers ] --
EPF.Funcs.SlashCmd = {};
function EPF.Funcs.SlashCmd.null(s, ...)
	if ((s) and (s ~= "")) then
		-- Split the string into a table of arguments
		local args = EPF.Funcs.SplitString(s);
		-- Get handler based on first argument given
		local cmd = EPF.Funcs.SlashCmd[tostring(args[1])];
		if (type(cmd) == "function") then
			-- If the handler exists, call it
			cmd(args);
		else
			-- Invalid command, present help message.
			EPF.Funcs.Msg(s.." is not a valid command.",0);
			EPF.Funcs.SlashCmd.help(args);
		end
	else
		-- Top level command presenting help
		EPF.Funcs.SlashCmd.help();
	end
end

SlashCmdList["EPF"] = EPF.Funcs.SlashCmd.null;
EPF.Funcs.SlashHelp = {};
function EPF.Funcs.SlashCmd.help(args)
	local cmd;
	if (args and args[2] ~= nil) then
		cmd = EPF.Funcs.SlashHelp[tostring(args[2])];
		if (type(cmd) == "function") then
			cmd();
		else
			EPF.Funcs.Msg(tostring(args[2]).." is an invalid argument for /epf help",0);
		end
	else
		EPF.Funcs.Msg("Help: |cFF999999"..SLASH_EPF1..", "..SLASH_EPF2.."|r");
		for n,f in EPF.Funcs.SortedPairs(EPF.Funcs.SlashCmd,EPF.Funcs.CompareSlashCmd.Asc) do
			if (n ~= "null" or n ~= "help") then
				cmd = EPF.Funcs.SlashHelp[n]
				if (type(cmd) == "function") then
					if ((n ~= "update" and n ~= "reset") or EPF_Vars.Debug > 0) then
						cmd();
					end
				end
			end
		end
	end
end
function EPF.Funcs.SlashHelp.info()
	local msg;
	EPF.Funcs.Msg("Help: info [addon|game|expansion|player] - Presents information about the chosen option.");
end
function EPF.Funcs.SlashCmd.info(args)
	if (args[2] == "addon") then
		EPF.Funcs.Msg("Addon: "..strchar(13)..tostring(EPF.Vars.Addon.Title).." v"..tostring(EPF.Vars.Addon.Version).." "..strchar(13).."by "..tostring(EPF.Vars.Addon.Author).." "..strchar(13)..tostring(EPF.Vars.Addon.Description).." "..strchar(13)..tostring(EPF.Vars.Addon.Email).." - "..tostring(EPF.Vars.Addon.URL));
	elseif (args[2] == "expansion") then
		local n = EPF.Funcs.Format(EPF.Vars.Expansion.Name,EPF.Tables.Expansions[EPF.Vars.Expansion.ID]);
		EPF.Funcs.Msg("Expansion: "..strchar(13)..tostring(n).." (#"..tostring(EPF.Vars.Expansion.ID)..") "..strchar(13).."Level "..tostring(EPF.Vars.Expansion.Level).." cap");
	elseif (args[2] == "game") then
		local v = EPF.Vars.Game.Version.."."..EPF.Vars.Game.Build;
		EPF.Funcs.Msg("Game: "..strchar(13)..tostring(v).." ("..tostring(EPF.Vars.Game.Interface)..")");
	elseif (args[2] == "player") then
		EPF.Funcs.Msg("Player: "..strchar(13)..tostring(EPF.Vars.Player.Name).." "..strchar(13).."Level "..tostring(EPF.Vars.Player.Level).." "..tostring(EPF.Funcs.Format(EPF.Tables.Factions[EPF.Vars.Player.Faction].Name,EPF.Tables.Factions[EPF.Vars.Player.Faction])).." "..tostring(EPF.Funcs.Format(EPF.Tables.Genders[EPF.Vars.Player.Gender].Name,EPF.Tables.Genders[EPF.Vars.Player.Gender])).." "..tostring(EPF.Vars.Player.Race).." "..tostring(EPF.Funcs.Format(EPF.Tables.Classes[EPF.Vars.Player.Class].Name,EPF.Tables.Classes[EPF.Vars.Player.Class])));
	elseif (args[2] == "help" or args[3] == "help") then
		EPF.Funcs.SlashHelp.info();
	elseif (args[2] == nil) then
		EPF.Funcs.SlashCmd.info({nil,"player"});
		EPF.Funcs.SlashCmd.info({nil,"expansion"});
		EPF.Funcs.SlashCmd.info({nil,"game"});
		EPF.Funcs.SlashCmd.info({nil,"addon"});
	else
		EPF.Funcs.Msg(tostring(args[2]).." is an invalid argument for /epf info",0);
		EPF.Funcs.SlashHelp.info();
	end
end
function EPF.Funcs.SlashHelp.mode()
	local msg = "mode [0-7] - Display mode (";
	local msg2;
	for k,v in EPF.Funcs.SortedPairs(EPF.Tables.Modes) do
		if (msg2 == nil) then
			msg2 = tostring(EPF.Funcs.Format(EPF.Tables.Modes[k].Name,EPF.Tables.Modes[k]));
		else
			msg2 = msg2..", "..tostring(EPF.Funcs.Format(EPF.Tables.Modes[k].Name,EPF.Tables.Modes[k]));
		end
	end
	EPF.Funcs.Msg("Help: "..msg..msg2..").");
end
function EPF.Funcs.SlashCmd.mode(args)
	local status;
	if (args[2] ~= nil) then
		if (args[2] == "help") then
			EPF.Funcs.SlashHelp.mode();
		elseif (tonumber(args[2]) == nil or (tonumber(args[2]) > 7 or tonumber(args[2]) < 0)) then
			EPF.Funcs.Msg(tostring(args[2]).." is an invalid argument for /epf mode",0);
			EPF.Funcs.SlashHelp.mode();
		else
			-- Set to given mode in second argument
			EPF_Vars.Mode = tonumber(args[2]);
			EPF.Funcs.Display.Update(true);
			EPF.Funcs.Msg("Mode: "..tostring(EPF.Funcs.Format(EPF_Vars.Mode,EPF.Tables.Modes[EPF_Vars.Mode])).." ("..tostring(EPF.Funcs.Format(EPF.Tables.Modes[EPF_Vars.Mode].Name,EPF.Tables.Modes[EPF_Vars.Mode]))..")");
		end
	else
		EPF.Funcs.Msg("Mode: "..tostring(EPF.Funcs.Format(EPF_Vars.Mode,EPF.Tables.Modes[EPF_Vars.Mode])).." ("..tostring(EPF.Funcs.Format(EPF.Tables.Modes[EPF_Vars.Mode].Name,EPF.Tables.Modes[EPF_Vars.Mode]))..")");
	end
end
function EPF.Funcs.SlashHelp.dk()
	local msg = "dk [0-1] - Setting for Death Knight frame in auto mode (";
	local msg2;
	for k,v in EPF.Funcs.SortedPairs(EPF.Tables.DKFrame) do
		if (msg2 == nil) then
			msg2 = tostring(EPF.Funcs.Format(EPF.Tables.DKFrame[k].Name,EPF.Tables.DKFrame[k]));
		else
			msg2 = msg2..", "..tostring(EPF.Funcs.Format(EPF.Tables.DKFrame[k].Name,EPF.Tables.DKFrame[k]));
		end
	end
	EPF.Funcs.Msg("Help: "..msg..msg2..").");
end
function EPF.Funcs.SlashCmd.dk(args)
	local val
	local status;
	if (args[2] ~= nil) then
		if (args[2] == "help") then
			EPF.Funcs.SlashHelp.dk();
		elseif (tonumber(args[2]) == nil or (tonumber(args[2]) > 1 or tonumber(args[2]) < 0)) then
			EPF.Funcs.Msg(tostring(args[2]).." is an invalid argument for /epf dk",0);
			EPF.Funcs.SlashHelp.dk();
		else
			-- Set to given dk frames mode in second argument
			EPF_Vars.DK = tonumber(args[2]);
			EPF.Funcs.Display.Update(true);
			EPF.Funcs.Msg("Death Knight Frame: "..tostring(EPF.Funcs.Format(EPF_Vars.DK,EPF.Tables.DKFrame[EPF_Vars.DK])).." ("..tostring(EPF.Funcs.Format(EPF.Tables.DKFrame[EPF_Vars.DK].Name,EPF.Tables.DKFrame[EPF_Vars.DK]))..")");
		end
	else
		EPF.Funcs.Msg("Death Knight Frame: "..tostring(EPF.Funcs.Format(EPF_Vars.DK,EPF.Tables.DKFrame[EPF_Vars.DK])).." ("..tostring(EPF.Funcs.Format(EPF.Tables.DKFrame[EPF_Vars.DK].Name,EPF.Tables.DKFrame[EPF_Vars.DK]))..")");
	end
end
function EPF.Funcs.SlashHelp.dh()
	local msg = "dh [0-1] - Setting for Demon Hunter frame in auto mode (";
	local msg2;
	for k,v in EPF.Funcs.SortedPairs(EPF.Tables.DHFrame) do
		if (msg2 == nil) then
			msg2 = tostring(EPF.Funcs.Format(EPF.Tables.DHFrame[k].Name,EPF.Tables.DHFrame[k]));
		else
			msg2 = msg2..", "..tostring(EPF.Funcs.Format(EPF.Tables.DHFrame[k].Name,EPF.Tables.DHFrame[k]));
		end
	end
	EPF.Funcs.Msg("Help: "..msg..msg2..").");
end
function EPF.Funcs.SlashCmd.dh(args)
	local val
	local status;
	if (args[2] ~= nil) then
		if (args[2] == "help") then
			EPF.Funcs.SlashHelp.dk();
		elseif (tonumber(args[2]) == nil or (tonumber(args[2]) > 1 or tonumber(args[2]) < 0)) then
			EPF.Funcs.Msg(tostring(args[2]).." is an invalid argument for /epf dh",0);
			EPF.Funcs.SlashHelp.dh();
		else
			-- Set to given dh frames mode in second argument
			EPF_Vars.DH = tonumber(args[2]);
			EPF.Funcs.Display.Update(true);
			EPF.Funcs.Msg("Death Hunter Frame: "..tostring(EPF.Funcs.Format(EPF_Vars.DH,EPF.Tables.DHFrame[EPF_Vars.DH])).." ("..tostring(EPF.Funcs.Format(EPF.Tables.DHFrame[EPF_Vars.DH].Name,EPF.Tables.DHFrame[EPF_Vars.DH]))..")");
		end
	else
		EPF.Funcs.Msg("Demon Hunter Frame: "..tostring(EPF.Funcs.Format(EPF_Vars.DH,EPF.Tables.DHFrame[EPF_Vars.DH])).." ("..tostring(EPF.Funcs.Format(EPF.Tables.DHFrame[EPF_Vars.DH].Name,EPF.Tables.DHFrame[EPF_Vars.DH]))..")");
	end
end
function EPF.Funcs.SlashHelp.faction()
	local msg = "faction [0-2] - Faction control for Death Knight frames (";
	local msg2;
	for k,v in EPF.Funcs.SortedPairs(EPF.Tables.Factions) do
		if (msg2 == nil) then
			msg2 = tostring(EPF.Funcs.Format(EPF.Tables.Factions[k].Name,EPF.Tables.Factions[k]));
		else
			msg2 = msg2..", "..tostring(EPF.Funcs.Format(EPF.Tables.Factions[k].Name,EPF.Tables.Factions[k]));
		end
	end
	EPF.Funcs.Msg("Help: "..msg..msg2..").");
end
function EPF.Funcs.SlashCmd.faction(args)
	local val
	local status;
	if (args[2] ~= nil) then
		if (args[2] == "help") then
			EPF.Funcs.SlashHelp.faction();
		elseif (tonumber(args[2]) == nil or (tonumber(args[2]) > 2 or tonumber(args[2]) < 0)) then
			EPF.Funcs.Msg(tostring(args[2]).." is an invalid argument for /epf faction",0);
			EPF.Funcs.SlashHelp.faction();
		else
			-- Set to given faction mode in second argument
			EPF_Vars.Faction = tonumber(args[2]);
			EPF.Funcs.Display.Update(true);
			EPF.Funcs.Msg("Faction: "..tostring(EPF.Funcs.Format(EPF_Vars.Faction,EPF.Tables.Factions[EPF_Vars.Faction])).." ("..tostring(EPF.Funcs.Format(EPF.Tables.Factions[EPF_Vars.Faction].Name,EPF.Tables.Factions[EPF_Vars.Faction]))..")");
		end
	else
		EPF.Funcs.Msg("Faction: "..tostring(EPF.Funcs.Format(EPF_Vars.Faction,EPF.Tables.Factions[EPF_Vars.Faction])).." ("..tostring(EPF.Funcs.Format(EPF.Tables.Factions[EPF_Vars.Faction].Name,EPF.Tables.Factions[EPF_Vars.Faction]))..")");
	end
end
function EPF.Funcs.SlashHelp.debug()
	local msg = "debug [0-3] - Debug output control (";
	local msg2
	for k,v in EPF.Funcs.SortedPairs(EPF.Tables.DebugLevels) do
		if (msg2 == nil) then
			msg2 = tostring(EPF.Funcs.Format(EPF.Tables.DebugLevels[k].Name,EPF.Tables.DebugLevels[k]));
		else
			msg2 = msg2..", "..tostring(EPF.Funcs.Format(EPF.Tables.DebugLevels[k].Name,EPF.Tables.DebugLevels[k]));
		end
	end
	EPF.Funcs.Msg("Help: "..msg..msg2..").");
end
function EPF.Funcs.SlashCmd.debug(args)
	local val
	local status;
	if (args[2] ~= nil) then
		if (args[2] == "help") then
			EPF.Funcs.SlashHelp.debug();
		elseif (tonumber(args[2]) == nil or (tonumber(args[2]) > 3 or tonumber(args[2]) < 0)) then
			EPF_Vars.Debug = 0;
			EPF.Funcs.Msg(tostring(args[2]).." is an invalid argument for /epf debug",0);
			EPF.Funcs.SlashHelp.debug();
		else
			-- Set to given debug level in second argument
			EPF_Vars.Debug = tonumber(args[2]);
			EPF.Funcs.Msg("Debug: "..tostring(EPF.Funcs.Format(EPF_Vars.Debug,EPF.Tables.DebugLevels[EPF_Vars.Debug])).." ("..tostring(EPF.Funcs.Format(EPF.Tables.DebugLevels[EPF_Vars.Debug].Name,EPF.Tables.DebugLevels[EPF_Vars.Debug]))..")");
		end
	else
		EPF.Funcs.Msg("Debug: "..tostring(EPF.Funcs.Format(EPF_Vars.Debug,EPF.Tables.DebugLevels[EPF_Vars.Debug])).." ("..tostring(EPF.Funcs.Format(EPF.Tables.DebugLevels[EPF_Vars.Debug].Name,EPF.Tables.DebugLevels[EPF_Vars.Debug]))..")");
	end
end
function EPF.Funcs.SlashHelp.update()
	EPF.Funcs.Msg("Help: update - Manually updates the PlayerFrame.");
end
function EPF.Funcs.SlashCmd.update(args)
	if (args[2] == "help") then
		EPF.Funcs.SlashHelp.update();
	else
		EPF.Funcs.Display.Update(true);
	end
end
function EPF.Funcs.SlashHelp.reset()
	EPF.Funcs.Msg("Help: reset - Resets addon to defaults.");
end
function EPF.Funcs.SlashCmd.reset(args)
	if (args[2] == "help") then
		EPF.Funcs.SlashHelp.reset();
	else
		EPF.Funcs.Reset();
	end
end

-- [ Informational Functions ] --
EPF.Funcs.Info = {};
function EPF.Funcs.Info.Addon()
	EPF.Vars.Addon.ShortName = "EPF";
	EPF.Vars.Addon.Name, EPF.Vars.Addon.Title, EPF.Vars.Addon.Description = GetAddOnInfo("ElitePlayerFrame_Enhanced");
	EPF.Vars.Addon.Version = GetAddOnMetadata(EPF.Vars.Addon.Name, "Version");
	EPF.Vars.Addon.Author = GetAddOnMetadata(EPF.Vars.Addon.Name, "Author");
	EPF.Vars.Addon.URL = GetAddOnMetadata(EPF.Vars.Addon.Name, "X-Website");
	EPF.Vars.Addon.Email = GetAddOnMetadata(EPF.Vars.Addon.Name, "X-eMail");
	EPF.Funcs.Msg("Addon information updated.",3);
	return EPF.Vars.Addon;
end
function EPF.Funcs.Info.Expansion()
	EPF.Vars.Expansion.ID = GetExpansionLevel();
	if (not EPF.Tables.Expansions[EPF.Vars.Expansion.ID]) then
		EPF.Tables.Expansions[EPF.Vars.Expansion.ID] = {};
		EPF.Tables.Expansions[EPF.Vars.Expansion.ID].Name = "Unknown";
		EPF.Tables.Expansions[EPF.Vars.Expansion.ID].Color = "FFFFFFFF";
	end
	EPF.Vars.Expansion.Name = EPF.Tables.Expansions[EPF.Vars.Expansion.ID].Name;
	EPF.Vars.Expansion.Color = EPF.Tables.Expansions[EPF.Vars.Expansion.ID].Color;
	EPF.Vars.Expansion.Level = MAX_PLAYER_LEVEL_TABLE[EPF.Vars.Expansion.ID];
	EPF.Funcs.Msg("Expansion information updated.",3);
	return EPF.Vars.Expansion;
end
function EPF.Funcs.Info.Game()
	EPF.Vars.Game.Version, EPF.Vars.Game.Build, EPF.Vars.Game.BuildDate, EPF.Vars.Game.Interface = GetBuildInfo();
	EPF.Funcs.Msg("Game information updated.",3);
	return EPF.Vars.Game;
end
function EPF.Funcs.Info.Player()
	EPF.Vars.Player.Name = UnitName("player");
	EPF.Vars.Player.Level = UnitLevel("player");
	EPF.Vars.Player.Gender = UnitSex("player");
	EPF.Vars.Player.Race = UnitRace("player");
	EPF.Vars.Player.Class = select(1, UnitClassBase("player"));
	EPF.Vars.Player.Faction = EPF.RevLookup(EPF.Tables.Factions,"Name",UnitFactionGroup("player"));
	EPF.Funcs.Msg("Player information updated.",3);
	return EPF.Vars.Player;
end

-- [ Formatting Function ] --
function EPF.Funcs.Format(s,t)
	if (t) then
		local col = t.Color;
		s = "|c"..tostring(col)..tostring(s).."|r";
		return s;
	else
		return s;
	end
end

-- [ Display Functions ] --
EPF.Funcs.Display = {};
function EPF.Funcs.Display.Update(force)
	if (EPF.Vars.Player.Level ~= UnitLevel("player") or EPF.Tables.Factions[EPF.Vars.Player.Faction].Name ~= UnitFactionGroup("player") or EPF.Vars.Player.Class ~= select(2, UnitClassBase("player")) or force) then
		EPF.Funcs.Info.Player();
		if (EPF_Vars.Mode == 7 or (EPF_Vars.Mode == 1 and EPF.Vars.Player.Class == "DEMONHUNTER" and EPF_Vars.DH == 1)) then
			PlayerFrameTexture:SetTexture("Interface\\AddOns\\ElitePlayerFrame_Enhanced\\Textures\\UI-TargetingFrame-DemonHunter.blp");
			PlayerFrameTexture:ClearAllPoints();
			for k,v in pairs(EPF.Tables.Points.PlayerFrameTexture) do
				if (k == 1) then
					PlayerFrameTexture:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
				else
					PlayerFrameTexture:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, (v.OffsetX + 24), (v.OffsetY - 28));
				end
			end
			for k,v in pairs(EPF.Tables.Points.PlayerRestIcon) do
				PlayerRestIcon:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
			end
			EPF.Funcs.Display.UpdateLevel();
			PlayerFrameTexture:SetTexCoord(1, 0, 0, 1);
			EPF.Funcs.Msg("Displaying "..tostring(EPF.Funcs.Format(EPF.Tables.Modes[7].Name,EPF.Tables.Modes[7])).." frame.",3);
		elseif (EPF_Vars.Mode == 6 or (EPF_Vars.Mode == 1 and ((EPF.Vars.Player.Faction == 2 and EPF_Vars.Faction == 0) or EPF_Vars.Faction == 2) and EPF.Vars.Player.Class == "DEATHKNIGHT" and EPF_Vars.DK == 1)) then
			PlayerFrameTexture:SetTexture("Interface\\AddOns\\ElitePlayerFrame_Enhanced\\Textures\\UI-PlayerFrame-Deathknight-Horde.tga");
			PlayerFrameTexture:ClearAllPoints();
			for k,v in pairs(EPF.Tables.Points.PlayerFrameTexture) do
				if (k == 1) then
					PlayerFrameTexture:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, (v.OffsetX + 11), (v.OffsetY + 13));
				else
					PlayerFrameTexture:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, (v.OffsetX + 35), (v.OffsetY - 15));
				end
			end
			for k,v in pairs(EPF.Tables.Points.PlayerRestIcon) do
				if (k == 1) then
					PlayerRestIcon:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX - 3, v.OffsetY);
				end
			end
			EPF.Funcs.Display.UpdateLevel();
			PlayerFrameTexture:SetTexCoord(0, 1, 0, 1);
			EPF.Funcs.Msg("Displaying "..tostring(EPF.Funcs.Format(EPF.Tables.Modes[6].Name,EPF.Tables.Modes[6])).." frame.",3);
		elseif (EPF_Vars.Mode == 5 or (EPF_Vars.Mode == 1 and ((EPF.Vars.Player.Faction == 1 and EPF_Vars.Faction == 0) or EPF_Vars.Faction == 1) and EPF.Vars.Player.Class == "DEATHKNIGHT" and EPF_Vars.DK == 1)) then
			PlayerFrameTexture:SetTexture("Interface\\AddOns\\ElitePlayerFrame_Enhanced\\Textures\\UI-PlayerFrame-Deathknight-Alliance.tga");
			PlayerFrameTexture:ClearAllPoints();
			for k,v in pairs(EPF.Tables.Points.PlayerFrameTexture) do
				if (k == 1) then
					PlayerFrameTexture:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, (v.OffsetX + 9), (v.OffsetY + 6));
				else
					PlayerFrameTexture:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, (v.OffsetX + 33), (v.OffsetY - 20));
				end
			end
			for k,v in pairs(EPF.Tables.Points.PlayerRestIcon) do
				if (k == 1) then
					PlayerRestIcon:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX - 3, v.OffsetY);
				end
			end
			EPF.Funcs.Display.UpdateLevel();
			PlayerFrameTexture:SetTexCoord(0, 1, 0, 1);
			EPF.Funcs.Msg("Displaying "..tostring(EPF.Funcs.Format(EPF.Tables.Modes[5].Name,EPF.Tables.Modes[5])).." frame.",3);
		elseif (EPF_Vars.Mode == 4 or (EPF.Vars.Player.Level == EPF.Vars.Expansion.Level and EPF_Vars.Mode == 1)) then
			PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite.blp");
			PlayerFrameTexture:ClearAllPoints();
			for k,v in pairs(EPF.Tables.Points.PlayerFrameTexture) do
				PlayerFrameTexture:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
			end
			for k,v in pairs(EPF.Tables.Points.PlayerRestIcon) do
				PlayerRestIcon:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
			end
			EPF.Funcs.Display.UpdateLevel();
			PlayerFrameTexture:SetTexCoord(1, 0.09375, 0, 0.78125);
			EPF.Funcs.Msg("Displaying "..tostring(EPF.Funcs.Format(EPF.Tables.Modes[4].Name,EPF.Tables.Modes[4])).." frame.",3);
		elseif (EPF_Vars.Mode == 3 or (EPF.Vars.Player.Level >= MAX_PLAYER_LEVEL_TABLE[0] and EPF_Vars.Mode == 1)) then
			PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite.blp");
			PlayerFrameTexture:ClearAllPoints();
			for k,v in pairs(EPF.Tables.Points.PlayerFrameTexture) do
				PlayerFrameTexture:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
			end
			for k,v in pairs(EPF.Tables.Points.PlayerRestIcon) do
				PlayerRestIcon:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
			end
			EPF.Funcs.Display.UpdateLevel();
			PlayerFrameTexture:SetTexCoord(1, 0.09375, 0, 0.78125);
			EPF.Funcs.Msg("Displaying "..tostring(EPF.Funcs.Format(EPF.Tables.Modes[3].Name,EPF.Tables.Modes[3])).." frame.",3);
		elseif (EPF_Vars.Mode == 2 or (EPF.Vars.Player.Level >= 10 and EPF_Vars.Mode == 1)) then
			PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare.blp");
			PlayerFrameTexture:ClearAllPoints();
			for k,v in pairs(EPF.Tables.Points.PlayerFrameTexture) do
				PlayerFrameTexture:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
			end
			for k,v in pairs(EPF.Tables.Points.PlayerRestIcon) do
				PlayerRestIcon:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
			end
			EPF.Funcs.Display.UpdateLevel();
			PlayerFrameTexture:SetTexCoord(1, 0.09375, 0, 0.78125);
			EPF.Funcs.Msg("Displaying "..tostring(EPF.Funcs.Format(EPF.Tables.Modes[2].Name,EPF.Tables.Modes[2])).." frame.",3);
		else
			PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame.blp");
			PlayerFrameTexture:ClearAllPoints();
			for k,v in pairs(EPF.Tables.Points.PlayerFrameTexture) do
				PlayerFrameTexture:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
			end
			for k,v in pairs(EPF.Tables.Points.PlayerRestIcon) do
				PlayerRestIcon:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
			end
			EPF.Funcs.Display.UpdateLevel();
			PlayerFrameTexture:SetTexCoord(1.0, 0.09375, 0, 0.78125);
			EPF.Funcs.Msg("Displaying "..tostring(EPF.Funcs.Format("Standard",EPF.Tables.Modes[1])).." frame.",3);
		end
		if (EPF_Vars.Debug >= 3) then
			EPF.Funcs.GetFramePoints("PlayerFrameTexture",PlayerFrameTexture);
			EPF.Funcs.GetFramePoints("PlayerLevelText",PlayerLevelText);
			EPF.Funcs.GetFramePoints("PlayerRestIcon",PlayerRestIcon);
		end
	else
		EPF.Funcs.Msg("Player info has not changed since last display update.",3);
	end
	if (PlayerFrame:IsClampedToScreen() == false or force) then
		PlayerFrame:SetClampedToScreen(true);
	end
end
function EPF.Funcs.Display.UpdateLevel(level)
	PlayerLevelText:ClearAllPoints();
	if (EPF_Vars.Mode == 7 or (EPF_Vars.Mode == 1 and EPF.Vars.Player.Class == "DEMONHUNTER" and EPF_Vars.DH == 1)) then
		for k,v in pairs(EPF.Tables.Points.PlayerLevelText) do
			PlayerLevelText:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, (v.OffsetX - 12), (v.OffsetY + 14));
		end
	elseif (EPF_Vars.Mode == 6 or (EPF_Vars.Mode == 1 and ((EPF.Vars.Player.Faction == 2 and EPF_Vars.Faction == 0) or EPF_Vars.Faction == 2) and EPF.Vars.Player.Class == "DEATHKNIGHT" and EPF_Vars.DK == 1)) then
		for k,v in pairs(EPF.Tables.Points.PlayerLevelText) do
			PlayerLevelText:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, (v.OffsetX - 26), (v.OffsetY + 1));
		end
	elseif (EPF_Vars.Mode == 5 or (EPF_Vars.Mode == 1 and ((EPF.Vars.Player.Faction == 1 and EPF_Vars.Faction == 0) or EPF_Vars.Faction == 1) and EPF.Vars.Player.Class == "DEATHKNIGHT" and EPF_Vars.DK == 1)) then
		for k,v in pairs(EPF.Tables.Points.PlayerLevelText) do
			PlayerLevelText:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, (v.OffsetX - 23.5), (v.OffsetY + 6.5));
		end
	else
		for k,v in pairs(EPF.Tables.Points.PlayerLevelText) do
			PlayerLevelText:SetPoint(v.Anchor, v.RelativeFrame, v.RelativeAnchor, v.OffsetX, v.OffsetY);
		end
	end
	EPF.Funcs.Msg("Updated level text position.",3);
end

-- [ Misc. Functions ] --
-- [ Frame Points Function ] --
function EPF.Funcs.GetFramePoints(name,frame)
	local l = frame:GetNumPoints();
	local i = 1;
	local points = {};
	while(i <= l) do
		local anchor, relativeFrame, relativeAnchor, x, y = frame:GetPoint(i);
		EPF.Funcs.Msg(tostring(name)..":GetPoints["..tostring(i).."/"..tostring(l).."]: "..tostring(x)..","..tostring(y)..".",3);
		tinsert(points,{
			["Anchor"] = anchor,
			["RelativeFrame"] = relativeFrame,
			["RelativeAnchor"] = relativeAnchor,
			["OffsetX"] = x,
			["OffsetY"] = y
		});
		i = i + 1;
	end
	return points;
end
-- [ String Splitting Function ] -- Credit to Mikk
function EPF.Funcs.SplitString(s)
	local tt = {};
	local i = 0;
	while(true) do
		local word;
		_, i, word = strfind(s, "^ *([^%s]+) *", i+1);
		if(not word) then
			return tt;
		end
		tinsert(tt,word);
	end
end
-- [ Reverse Lookup Function ] --
function EPF.RevLookup(t,i,x)
	for k,v in pairs(t) do
		if (v[i] == x) then
			return k;
		end
	end
end
-- [ Sort Pairing Function ] --
function EPF.Funcs.SortedPairs(t,c)
	local tt = {};
	if (not c) then
		c = EPF.Funcs.Compare.Asc;
	elseif (type(c) ~= "function") then
		if (c == 1) then
			c = EPF.Funcs.Compare.Desc;
		else
			c = EPF.Funcs.Compare.Asc;
		end
	end
	for k in pairs(t) do
		tinsert(tt,k);
	end
	sort(tt,c);
	local i = 0
	local f = function ()
		i = i + 1;
		if tt[i] == nil then
			return nil;
		else
			EPF.Funcs.Msg("Pair "..tostring(i).." ["..tostring(tt[i]).."]",3);
			return tt[i], t[tt[i]];
		end
	end
	return f;
end
-- [ Sort Comparison Functions ] --
EPF.Funcs.Compare = {};
function EPF.Funcs.Compare.Null(a,b,d)
	local dir;
	local result;
	local ctype = "Unknown";
	if (type(a) ~= type(b)) then
		if ((tonumber(a) ~= nil) and (tonumber(b) ~= nil)) then
			a = tonumber(a);
			b = tonumber(b);
			ctype = "number";
		elseif ((type(a) == "string") or (type(b) == "string")) then
			a = tostring(a);
			b = tostring(b);
			ctype = "string";
		end
	else
		ctype = type(a);
	end
	if (d == 1) then
		result = a > b;
		dir = "Descending";
	else
		result = a < b;
		dir = "Ascending";
	end
	EPF.Funcs.Msg("Comparing "..tostring(a).." to "..tostring(b).." as "..tostring(ctype).." ("..tostring(dir)..") - Result is "..tostring(result)..".",3);
	if (d == 1) then
		return a > b;
	else
		return a < b;
	end
end
function EPF.Funcs.Compare.Asc(a,b)
	return EPF.Funcs.Compare.Null(a,b,0);
end
function EPF.Funcs.Compare.Desc(a,b)
	return EPF.Funcs.Compare.Null(a,b,1);
end
EPF.Funcs.CompareSlashCmd = {};
function EPF.Funcs.CompareSlashCmd.Null(a,b,d)
	local result;
	local ctype = "number";
	a2 = EPF.RevLookup(EPF.Tables.Commands,"Name",a);
	b2 = EPF.RevLookup(EPF.Tables.Commands,"Name",b);
	if (d == 1) then
		result = a2 > b2;
		dir = "Descending";
	else
		result = a2 < b2;
		dir = "Ascending";
	end
	EPF.Funcs.Msg("Comparing slash command "..tostring(a2).."("..tostring(a)..") to "..tostring(b2).."("..tostring(b)..") as "..tostring(ctype).." ("..tostring(dir)..") - Result is "..tostring(result)..".",3);
	if (d == 1) then
		return a2 > b2;
	else
		return a2 < b2;
	end
end
function EPF.Funcs.CompareSlashCmd.Asc(a,b)
	return EPF.Funcs.CompareSlashCmd.Null(a,b,0);
end
function EPF.Funcs.CompareSlashCmd.Desc(a,b)
	return EPF.Funcs.CompareSlashCmd.Null(a,b,1);
end
