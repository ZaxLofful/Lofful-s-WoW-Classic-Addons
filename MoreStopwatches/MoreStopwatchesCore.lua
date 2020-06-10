--global tabel
MoreStopwatches = {};
MoreStopwatches.timerList = {}; -- lookup table of all timers
MoreStopwatches.timerList_sorted = {}; -- ordered list of all timers
MoreStopwatches.Addon_Initialized = false; -- ADDON_LOADED fired for our addon
MoreStopwatches.BTM_Initialized = false; -- blizzard time manager
MoreStopwatches.debugEnabled = false; -- debug output toggle

--hooks Blizzards TimeManager, only call this if Blizzards addon is loaded
local function blizzardTimeManagerHooks()
	--check if Blizzards standard stopwatch was shown with the minimap-menu
	TimeManagerStopwatchCheck:HookScript("OnClick", function()
		MoreStopwatches.BlizzTimerShownFromMinimap = StopwatchFrame:IsVisible();
	end);

	StopwatchCloseButton:HookScript("OnClick", function()
		MoreStopwatches.BlizzTimerShownFromMinimap = false;
	end);

	-- classic WoW (version 11302) seems to not have SlashCmdList["STOPWATCH"], so create that. take notice, that some addons (seen in ElvUI) map, e.g., Stopwatch_Toggle to SlashCmdList.STOPWATCH, so it >may< already exist
	if ( not SlashCmdList.STOPWATCH ) then
		SlashCmdList.STOPWATCH = (function() end); -- insert a noop
	end;

	--hook the blizzard /timer (also /sw and /stopwatch) slash command, this is where we do our magic
	hooksecurefunc(SlashCmdList, "STOPWATCH", MoreStopwatches.Slash);
end;

--do our stuff once saved vars are loaded
local startup = CreateFrame("Frame");
startup:RegisterEvent("ADDON_LOADED");
startup:SetScript("OnEvent",function(self, event, addonName)
	if ( addonName == "MoreStopwatches" ) then
		--locals
		local FRAME_PREFIX = "MoreStopwatches_";

		--debug stuff
		local function debug(...)
			if ( MoreStopwatches.debugEnabled ) then
				print("MoreStopwatches Debug:", ...);
			end;
		end;

		--init saved vars on first login
		if ( not MoreStopwatchesSave ) then
			MoreStopwatchesSave = {};
		end;

		--for UTF8sub function below
		local function chsize(char)
			if not char then
				return 0;
			elseif char>240 then
				return 4;
			elseif char>225 then
				return 3;
			elseif char>192 then
				return 2;
			else
				return 1;
			end;
		end;

		--UTF8 aware strsub function
		--taken from http://wowprogramming.com/snippets/UTF-8_aware_stringsub_7
		local function utf8sub(str, startChar, numChars)
			local startIndex = 1;
			while startChar>1 do
				local char = strbyte(str,startIndex);
				startIndex = startIndex + chsize(char);
				startChar = startChar - 1;
			end;

			local currentIndex = startIndex;
			while ( numChars > 0 ) and ( currentIndex <= #str ) do
				local char = strbyte(str, currentIndex);
				currentIndex = currentIndex + chsize(char);
				numChars = numChars -1;
			end;

			return str:sub(startIndex, currentIndex - 1);
		end;

		--prepends 0 for low ints: 9 -> 09
		local function IntToStr(i)
			if ( i < 10 ) then
				return "0" .. tostring(i);
			else
				return tostring(i);
			end;
		end;

		--return the position of the timer which was last created AND is currently visible [returns table of GetPoint values]
		local function GetLastTimerPosition()
			for i = #MoreStopwatches.timerList_sorted, 1, -1 do
				local timer = MoreStopwatches.timerList_sorted[i];
				if ( timer:IsVisible() ) then
					return { timer:GetPoint(0) };
				end;
			end;

			return {};
		end;

		--return the position for the next timer to create. this position should be below the last timer created [returns values for SetPoint]
		local function GetNextTimerPosition(default)
			local lastTimerPos = GetLastTimerPosition();
			debug("GetNextTimerPosition:", default, unpack(lastTimerPos));
			if ( lastTimerPos[5] and ( not default ) ) then
				lastTimerPos[5] = lastTimerPos[5] - 42;
				return unpack(lastTimerPos);
			else
				return "TOPRIGHT", UIParent, "TOPRIGHT", -250, -300; -- default timer position, as also defined in TimeManger.xml
			end;
		end;

		--Create normal timer: /timer Timer Name
		--Create timer, which will be saved between sessions: /timer true Timer Name
		--Create timer, with starting value of 3 minutes: /timer 3 Timer Name
		--Create timer, with starting value of 3 minutes, which will be saved between sessions: /timer true 3 Timer Name OR /timer 3 true Timer Name
		local paramsPrototype = {
			__newindex = function(tab, key, value)
				if ( tab.timerName == "" ) then
					if ( value == "true" ) then
						rawset(tab, "saveBetweenSessions", true);
						debug("User requested saveBetweenSessions.");
					elseif ( value == "false") then
						rawset(tab, "saveBetweenSessions", false);
						debug("User requested to NOT saveBetweenSessions.");
					elseif ( tonumber(value) ) then
						rawset(tab, "setTimer", tonumber(value));
						debug("User requested timer to be set to:", value);
					elseif ( type(value) == "string" ) then
						--first letter of name upper case
						local timerName = strupper(utf8sub(value, 1, 1)) .. utf8sub(value, 2, strlenutf8(value));
						rawset(tab, "timerName", timerName);
						debug("User requested Timername:", timerName, "Value was:", value);
					end;
				elseif ( type(value) == "string" ) then
					local timerName = format("%s %s", tab.timerName, value);
					rawset(tab, "timerName", timerName);
					debug("New part of user requested name:", timerName, "Value was:", value);
				end;
			end,
		};

		--patterns to find strings/numbers at the begging of a slash command
		local pattern = {
			number = "^(%d+%.?%d*)%s+(.*)$", -- get x: first number (int or float) and y: rest after white-space after that number
			string = "^(%S*)%s*(.-)$", -- get x: first (whole) string and y: rest after white-space after that string
		};

		--returns a table of parameters, containing timerName=title of the timer, [setTimer=the time - in minutes - the timer should be set to, default:0], [saveBetweenSessions=true if timer state should be saved between sessions, default: true]
		local function GetParameters(msg)
			local params = setmetatable( { timerName = "", saveBetweenSessions = true, }, paramsPrototype );

			-- #parameters - 1
			local _, spaceCount = gsub(msg, "%s+", 1);

			-- extract timer position from command. must be in the form of "position:x,y" (or a dot instead of the comma). it can be anywhere inside the slash command.
			local positionPattern = "position:(%d+)[%,%.](%d+)";
			local _, _, x, y = strfind(msg, positionPattern);
			if ( x and y ) then
				msg = gsub(msg, positionPattern, "");
				rawset(params, "savedPosition", { "BOTTOMLEFT", UIParent, "BOTTOMLEFT", x, y });
				debug("Position requested:", x, y);
			end;

			local commandRest, command = msg;

			--iterate over paramters and add them to the return (meta)table
			for i = 1, spaceCount + 1 do
				if ( (i == 1) or (i == 2) ) and ( not params.setTimer ) and ( commandRest:match(pattern.number) ) then
					command, commandRest = commandRest:match(pattern.number);
					debug("Paramter Number", i, command, "---", commandRest);
				else
					command, commandRest = commandRest:match(pattern.string);
					debug("Paramter String", i, command, "---", commandRest);
				end;

				if ( command ) then
					params[i] = command;
				end;
			end;

			return setmetatable(params, nil);
		end;

		--slash command function
		function MoreStopwatches.Slash(msg, status, savedPosition)
			debug("Slash msg:", msg, "status:", status, "savedPosition:", savedPosition);

			--hide blizzard stopwatch. because we hijack blizzards /timer slash command, we have to hide the default stopwatch after being called (except when user uses the minimap-menu to explicitly use the default stopwatch)
			if ( StopwatchFrame ) then
				if ( MoreStopwatches.BlizzTimerShownFromMinimap ) then
					StopwatchFrame:Show();
				else
					StopwatchFrame:Hide();
				end;
			end;

			--paramters table contains: timerName[, saveBetweenSessions[, setTimer]]
			local params = GetParameters(msg);

			--initialize all time manger functions (which are adapted from Blizzard_TimeManager.lua) on first /timer call
			MoreStopwatches.Init();

			--use the command parameter as name for the timer, or generate a default name when called with '/timer'
			local timerName, timer;
			if ( params.timerName == "" ) then
				local timerID = 0;
				repeat
					timerID = timerID + 1;
					timerName = "Stopwatch" .. IntToStr(timerID);

					--check if this name is already in use (exists and is visible). if that is the case: use another one. [hard cap is 1k default names]
					timer = MoreStopwatches.timerList[timerName];
					if ( timer and timer:IsVisible() ) then
						timer = false;
					end;
				until ( (timer) or (timer == nil) or (timerID > 1e3) );
				debug("Generated default name:",timerName);
			else
				timerName = params.timerName;
				timer = MoreStopwatches.timerList[timerName];
			end;

			if ( timer ) then
				--show the timer if the timerName already exists
				timer:Show();
				debug("Timer already exists. Reusing.");
			else
				--...or create a new timer if not
				timer = CreateFrame("Frame", FRAME_PREFIX .. timerName, UIParent, "MoreStopwatchesTemplate");
				debug("New timer created.");
			end;

			local StopwatchTicker = _G[timer:GetName().."StopwatchTicker"];
			StopwatchTicker.startTime = GetServerTime();
			debug("Start time:", StopwatchTicker.startTime);

			--set a specific time (if user requested that) [in minutes]
			if ( params.setTimer ) then
				_G[timer:GetName() .. "StopwatchTicker"].timer = ( params.setTimer * 60 );
				StopwatchTicker.startTime = StopwatchTicker.startTime - ( params.setTimer * 60 );
				MoreStopwatches_StopwatchTemplateTicker_Update(timer);
				debug("Timer set to requested time:", params.setTimer*60);
			end;

			if ( params.saveBetweenSessions ) then
				--register this stopwatch to be saved between sessions
				timer.saveBetweenSessions = true;
				_G[timer:GetName() .. "StopwatchTabFrameStopwatchTitle"]:SetText(timerName);
				debug("Timer will be saved between sessions.");
			else
				--show that it is not registered with a star in the label
				timer.saveBetweenSessions = nil;
				_G[timer:GetName() .. "StopwatchTabFrameStopwatchTitle"]:SetText(timerName .. "*");
				debug("Timer will NOT be saved between sessions.");
			end;

			--restore saved position of timer
			timer:ClearAllPoints();
			if ( params.savedPosition ) then
				timer:SetPoint( unpack(params.savedPosition) );
				debug("Used requested timer position:", unpack(params.savedPosition));
			elseif ( savedPosition ) then
				savedPosition[2] = UIParent; -- the old saved UIParent is not valid anymore
				timer:SetPoint( unpack(savedPosition) );
				debug("Used saved timer position:", unpack(savedPosition));
			else
				timer:SetPoint( GetNextTimerPosition() );
				debug("Used default timer position:", timer:GetPoint(0));
			end;

			--sanitize position
			if ( timer:GetLeft() < 0 ) or ( timer:GetRight() > UIParent:GetWidth() ) or ( timer:GetBottom() < 0 ) or ( timer:GetTop() > UIParent:GetHeight() ) then
				timer:ClearAllPoints();
				timer:SetPoint( GetNextTimerPosition(true) ); -- force default position
			end;

			--make timer public
			MoreStopwatches.timerList[timerName] = timer;
			tinsert(MoreStopwatches.timerList_sorted, timer);

			--store last position: we will place the next timer below the last one
			MoreStopwatchesSave.savedTimers[timer:GetName()].savedPosition = { timer:GetPoint(0) };

			if ( MoreStopwatchesSave.savedTimers[timer:GetName()].isDisabled ) then
				debug("Timer was disabled in last sesssion.");
			end;

			--only start the timer if it was not paused on save, or if we are called by user (then status is a table)
			if ( type(status) == "table" ) or ( status == "PLAYING" ) then
				MoreStopwatches_StopwatchTemplate_Play(_G[timer:GetName() .. "StopwatchPlayPauseButton"]);
				debug("Timer started on create:", timerName);
			end;

			-- show header if requested by user
			if ( MoreStopwatchesSave.PermanentHeaders ) then
				local StopwatchTabFrame = _G[timer:GetName() .. "StopwatchTabFrame"];
				UIFrameFadeIn(StopwatchTabFrame, CHAT_FRAME_FADE_TIME);
				debug("Header is permanently shown.");
			end;
		end;

		local MoreStopwatchesString = "MoreStopwatches: ";

		function MoreStopwatches.ConfigSlash(msg)
			debug("ConfigSlash msg:", msg);

			local lowmsg = strlower(msg);
			local command, commandrest = lowmsg:match("^(%S*)%s*(.-)$");

			if ( (command == "header") or (command == "headers") ) then
				if ( MoreStopwatchesSave.PermanentHeaders ) then
					MoreStopwatchesSave.PermanentHeaders = false;
					print(MoreStopwatchesString .. "Permanent headers disabled.");
				else
					MoreStopwatchesSave.PermanentHeaders = true;
					print(MoreStopwatchesString .. "Permanent headers enabled.");
				end;

				for i = #MoreStopwatches.timerList_sorted, 1, -1 do
					local timer = MoreStopwatches.timerList_sorted[i];
					local StopwatchTabFrame = _G[timer:GetName() .. "StopwatchTabFrame"];
					if ( timer:IsVisible() ) then
						if ( MoreStopwatchesSave.PermanentHeaders ) then
							UIFrameFadeIn(StopwatchTabFrame, CHAT_FRAME_FADE_TIME);
						else
							UIFrameFadeOut(StopwatchTabFrame, CHAT_FRAME_FADE_TIME);
						end;
					end;
				end;
			elseif ( (command == "closeall") or (command == "close") or (command == "hide") ) then
				for i, k in pairs(MoreStopwatches.timerList) do
					k:Hide();
					--remove savedTimer if user closes stopwatch
					MoreStopwatchesSave.savedTimers[k:GetName()] = nil;
				end;
			elseif ( command == "help" ) then
				if ( commandrest == "header" ) then
					print(MoreStopwatchesString .. "'|cffFFFF00/msw header|r': Toggles the permanent visibility of the timer headers (where the timer name is displayed).");
				elseif ( commandrest == "close" ) then
					print(MoreStopwatchesString .. "'|cffFFFF00/msw close|r': Close all stopwatches created by this addon.");
				else
					print(MoreStopwatchesString .. "Available commands are: header, close.");
				end;
			else
				print(MoreStopwatchesString .. "To create a new timer use '/sw MyNewTimer'. To show help use '/msw help'");
			end;
		end;

		-- while the above slash command creates a new timer/stopwatch, we shall add a "config" slash command here
		SLASH_MORESTOPWATCHESCONFIG1 = "/morestopwatches";
		SLASH_MORESTOPWATCHESCONFIG2 = "/msw";
		SlashCmdList["MORESTOPWATCHESCONFIG"] = MoreStopwatches.ConfigSlash;

		if ( not (MoreStopwatchesSave.savedTimers and MoreStopwatchesSave.time) ) then
			MoreStopwatchesSave.savedTimers = {};
			MoreStopwatchesSave.time = GetServerTime();
		end;

		setmetatable(MoreStopwatchesSave.savedTimers, {
			__index = function(tab, key)
				rawset(tab, key, {});
				return rawget(tab, key);
			end;
		});

		--restore saved stopwatches
		if ( MoreStopwatchesSave.savedTimers and MoreStopwatchesSave.time ) then
			for frameName, tab in pairs(MoreStopwatchesSave.savedTimers) do
				if ( type(tab.savedTime) == "number" ) and ( type(tab.savedPosition) == "table" ) then
					local restoreTime;

					if ( tab.playing ) then
						restoreTime= (GetServerTime() - MoreStopwatchesSave.time) + tab.savedTime;
					else
						restoreTime = tab.savedTime;
					end;

					-- Slash command takes minutes
					restoreTime = restoreTime / 60;

					if ( restoreTime < 6000 ) then
						--strip frame-prefix to get timer label
						local label = gsub(frameName, FRAME_PREFIX, "");

						--simulate slash command (and pause button if it was not playing on save)
						MoreStopwatches.Slash(string.format("%f true %s", restoreTime, label), tab.playing and "PLAYING" or "PAUSED", tab.savedPosition);

						--discard if restoreTime ~0
						local timer = MoreStopwatches.timerList[label];
						if ( (abs(restoreTime*60) < 0.1) and timer ) then
							MoreStopwatches_StopwatchTemplate_Clear(timer);
						end;
					else
						--saved time is too big, discard it
						MoreStopwatchesSave.savedTimers[frameName] = nil;
						debug("Discarded timer, because too big:", frameName);
					end;
				else
					MoreStopwatchesSave.savedTimers[frameName] = nil;
					debug("Discarded timer, saved time/position are not correct: ", frameName, "[", type(tab.savedTime), ", ", type(tab.savedPosition), "]");
				end;
			end;
		end;

		if ( not IsAddOnLoaded("Blizzard_TimeManager") ) then
			LoadAddOn("Blizzard_TimeManager");
		end;

		if ( MoreStopwatches.BTM_Initialized ) then
			blizzardTimeManagerHooks();
		end;

		MoreStopwatches.Addon_Initialized = true;
	elseif ( addonName == "Blizzard_TimeManager" ) then
		if ( MoreStopwatches.Addon_Initialized ) then
			blizzardTimeManagerHooks();
		end;

		MoreStopwatches.BTM_Initialized = true;
	end;

	if ( MoreStopwatches.Addon_Initialized and MoreStopwatches.BTM_Initialized ) then
		--everything set up - we are done here
		self:UnregisterAllEvents();
	end;
end);
