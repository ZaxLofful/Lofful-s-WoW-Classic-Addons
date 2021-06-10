-------------------------
--Nova Instance Tracker--
-------------------------
--https://www.curseforge.com/members/venomisto/projects

local L = LibStub("AceLocale-3.0"):GetLocale("NovaInstanceTracker");
local maxRecordsKept = 300;
local maxTradesKept = 3000;
NIT.maxRecordsShown = 300;

NIT.options = {
	name =  "",
	handler = NIT,
	type = 'group',
	args = {
		titleText = {
			type = "description",
			name = "        " .. NIT.prefixColor .. "NovaInstanceTracker (v" .. GetAddOnMetadata("NovaInstanceTracker", "Version") .. ")",
			fontSize = "large",
			order = 1,
		},
		authorText = {
			type = "description",
			name = "|TInterface\\AddOns\\NovaInstanceTracker\\Media\\nitLogo32:32:32:0:20|t |cFF9CD6DEby Novaspark-Arugal",
			fontSize = "medium",
			order = 2,
		},
		colorsHeader = {
			type = "header",
			name = L["colorsHeaderDesc"],
			order = 4,
		},
		chatColor = {
			type = "color",
			name = L["chatColorTitle"],
			desc = L["chatColorDesc"],
			order = 5,
			get = "getChatColor",
			set = "setChatColor",
			hasAlpha = false,
		},
		mergeColor = {
			type = "color",
			name = L["mergeColorTitle"],
			desc = L["mergeColorDesc"],
			order = 6,
			get = "getMergeColor",
			--get = function()
			--	return 0, 255, 0;
			--end,
			set = "setMergeColor",
			hasAlpha = false,
		},
		resetColors = {
			type = "execute",
			name = L["resetColorsTitle"],
			desc = L["resetColorsDesc"],
			func = "resetColors",
			order = 7,
		},
		generalHeader = {
			type = "header",
			name = L["generalHeaderDesc"],
			order = 10,
		},
		enteredMsg = {
			type = "toggle",
			name = L["enteredMsgTitle"],
			desc = L["enteredMsgDesc"],
			order = 11,
			get = "getEnteredMsg",
			set = "setEnteredMsg",
		},
		instanceResetMsg = {
			type = "toggle",
			name = L["instanceResetMsgTitle"],
			desc = L["instanceResetMsgDesc"],
			order = 12,
			get = "getInstanceResetMsg",
			set = "setInstanceResetMsg",
		},
		minimapButton = {
			type = "toggle",
			name = L["minimapButtonTitle"],
			desc = L["minimapButtonDesc"],
			order = 13,
			get = "getMinimapButton",
			set = "setMinimapButton",
		},
		--[[ignore40Man = { --This shouldn't be an option really, it needs to be tested if 40mans count towards lockout and hardcoded.
			type = "toggle",
			name = L["ignore40ManTitle"],
			desc = L["ignore40ManDesc"],
			order = 22,
			get = "getIgnore40Man",
			set = "setIgnore40Man",
		},]]
		showMoneyTradedChat = {
			type = "toggle",
			name = L["showMoneyTradedChatTitle"],
			desc = L["showMoneyTradedChatDesc"],
			order = 23,
			get = "getShowMoneyTradedChat",
			set = "setShowMoneyTradedChat",
		},
		timeStampFormat = {
			type = "select",
			name = L["timeStampFormatTitle"],
			desc = L["timeStampFormatDesc"],
			values = {
				[12] = "12 hour",
				[24] = "24 hour",
			},
			sorting = {
				[1] = 12,
				[2] = 24,
			},
			order = 24,
			get = "getTimeStampFormat",
			set = "setTimeStampFormat",
		},
		timeStampZone = {
			type = "select",
			name = L["timeStampZoneTitle"],
			desc = L["timeStampZoneDesc"],
			values = {
				["local"] = "Local Time",
				["server"] = "Server Time",
			},
			sorting = {
				[1] = "local",
				[2] = "server",
			},
			order = 25,
			get = "getTimeStampZone",
			set = "setTimeStampZone",
		},
		instanceWindowWidth = {
			type = "range",
			name = L["instanceWindowWidthTitle"],
			desc = L["instanceWindowWidthDesc"],
			order = 26,
			get = "getInstanceWindowWidth",
			set = "setInstanceWindowWidth",
			min = 575,
			max = 900,
			softMin = 575,
			softMax = 900,
			step = 1,
			width = 1.5,
		},
		instanceWindowHeight = {
			type = "range",
			name = L["instanceWindowHeightTitle"],
			desc = L["instanceWindowHeightDesc"],
			order = 27,
			get = "getInstanceWindowHeight",
			set = "setInstanceWindowHeight",
			min = 150,
			max = 1200,
			softMin = 150,
			softMax = 1200,
			step = 1,
			width = 1.5,
		},
		charsWindowWidth = {
			type = "range",
			name = L["charsWindowWidthTitle"],
			desc = L["charsWindowWidthDesc"],
			order = 28,
			get = "getCharsWindowWidth",
			set = "setCharsWindowWidth",
			min = 350,
			max = 900,
			softMin = 350,
			softMax = 900,
			step = 1,
			width = 1.5,
		},
		charsWindowHeight = {
			type = "range",
			name = L["charsWindowHeightTitle"],
			desc = L["charsWindowHeightDesc"],
			order = 29,
			get = "getCharsWindowHeight",
			set = "setCharsWindowHeight",
			min = 150,
			max = 950,
			softMin = 150,
			softMax = 950,
			step = 1,
			width = 1.5,
		},
		tradeWindowWidth = {
			type = "range",
			name = L["tradeWindowWidthTitle"],
			desc = L["tradeWindowWidthDesc"],
			order = 30,
			get = "getTradeWindowWidth",
			set = "setTradeWindowWidth",
			min = 350,
			max = 900,
			softMin = 350,
			softMax = 900,
			step = 1,
			width = 1.5,
		},
		tradeWindowHeight = {
			type = "range",
			name = L["tradeWindowHeightTitle"],
			desc = L["tradeWindowHeightDesc"],
			order = 31,
			get = "getTradeWindowHeight",
			set = "setTradeWindowHeight",
			min = 150,
			max = 950,
			softMin = 150,
			softMax = 950,
			step = 1,
			width = 1.5,
		},
		resetFrames = {
			type = "execute",
			name = L["resetFramesTitle"],
			desc = L["resetFramesDesc"],
			func = "resetFrames",
			order = 32,
		},
		detectSameInstance = {
			type = "toggle",
			name = L["detectSameInstanceTitle"],
			desc = L["detectSameInstanceDesc"],
			order = 33,
			get = "getDetectSameInstance",
			set = "setDetectSameInstance",
		},
		logHeader = {
			type = "header",
			name = L["logHeaderDesc"],
			order = 50,
		},
		logTextExample = {
			type = "description",
			name = function()
				return NIT:getLogExample();
			end,
			fontSize = "medium",
			order = 51,
		},
		openInstanceLogFrame = {
			type = "execute",
			name = L["openInstanceLogFrameTitle"],
			func = "openInstanceLogFrame",
			order = 55,
		},
		logSize = {
			type = "range",
			name = L["logSizeTitle"],
			desc = L["logSizeDesc"],
			order = 56,
			get = "getLogSize",
			set = "setLogSize",
			min = 1,
			max = NIT.maxRecordsShown,
			softMin = 1,
			softMax = NIT.maxRecordsShown,
			step = 1,
			width = "double",
		},
		showAltsLog = {
			type = "toggle",
			name = L["showAltsLogTitle"],
			desc = L["showAltsLogDesc"],
			order = 57,
			get = "getShowAltsLog",
			set = "setShowAltsLog",
		},
		showLockoutTime = {
			type = "toggle",
			name = L["showLockoutTimeTitle"],
			desc = L["showLockoutTimeDesc"],
			order = 58,
			get = "getShowLockoutTime",
			set = "setShowLockoutTime",
		},
		show24HourOnly = {
			type = "toggle",
			name = L["show24HourOnlyTitle"],
			desc = L["show24HourOnlyDesc"],
			order = 59,
			get = "getShow24HourOnly",
			set = "setShow24HourOnly",
		},
		timeStringType = {
			type = "select",
			name = L["timeStringTypeTitle"],
			desc = L["timeStringTypeDesc"],
			values = {
				["long"] = "Long",
				["medium"] = "Medium",
				["short"] = "Short",
			},
			sorting = {
				[1] = "long",
				[2] = "medium",
				[3] = "short",
			},
			order = 60,
			get = "getTimeStringType",
			set = "setTimeStringType",
		},
		instanceStatsHeader = {
			type = "header",
			name = L["instanceStatsHeaderDesc"],
			order = 70,
		},
		instanceStatsText = {
			type = "description",
			name = "|cFFFFFF00" .. L["instanceStatsTextDesc"],
			fontSize = "medium",
			order = 71,
		},
		instanceStatsOutput = {
			type = "toggle",
			name = L["instanceStatsOutputTitle"],
			desc = L["instanceStatsOutputDesc"],
			order = 72,
			get = "getInstanceStatsOutput",
			set = "setInstanceStatsOutput",
		},
		instanceStatsOutputWhere = {
			type = "select",
			name = L["instanceStatsOutputWhereTitle"],
			desc = L["instanceStatsOutputWhereDesc"],
			values = {
				["self"] = "Chat Window",
				["group"] = "Group Chat (Party/Raid)",
			},
			sorting = {
				[1] = "self",
				[2] = "group",
			},
			order = 73,
			width = "double",
			get = "getInstanceStatsOutputWhere",
			set = "setInstanceStatsOutputWhere",
		},
		instanceStatsOutputMobCount = {
			type = "toggle",
			name = L["instanceStatsOutputMobCountTitle"],
			desc = L["instanceStatsOutputMobCountDesc"],
			order = 75,
			get = "getInstanceStatsOutputMobCount",
			set = "setInstanceStatsOutputMobCount",
		},
		instanceStatsOutputXP = {
			type = "toggle",
			name = L["instanceStatsOutputXPTitle"],
			desc = L["instanceStatsOutputXPDesc"],
			order = 76,
			get = "getInstanceStatsOutputXP",
			set = "setInstanceStatsOutputXP",
		},
		instanceStatsOutputAverageXP = {
			type = "toggle",
			name = L["instanceStatsOutputAverageXPTitle"],
			desc = L["instanceStatsOutputAverageXPDesc"],
			order = 77,
			get = "getInstanceStatsOutputAverageXP",
			set = "setInstanceStatsOutputAverageXP",
		},
		instanceStatsOutputTime = {
			type = "toggle",
			name = L["instanceStatsOutputTimeTitle"],
			desc = L["instanceStatsOutputTimeDesc"],
			order = 78,
			get = "getInstanceStatsOutputTime",
			set = "setInstanceStatsOutputTime",
		},
		instanceStatsOutputGold = {
			type = "toggle",
			name = L["instanceStatsOutputGoldTitle"],
			desc = L["instanceStatsOutputGoldDesc"],
			order = 79,
			get = "getInstanceStatsOutputGold",
			set = "setInstanceStatsOutputGold",
		},
		instanceStatsOutputAverageGroupLevel = {
			type = "toggle",
			name = L["instanceStatsOutputAverageGroupLevelTitle"],
			desc = L["instanceStatsOutputAverageGroupLevelDesc"],
			order = 80,
			get = "getInstanceStatsOutputAverageGroupLevel",
			set = "setInstanceStatsOutputAverageGroupLevel",
		},
		showStatsInRaid = {
			type = "toggle",
			name = L["showStatsInRaidTitle"],
			desc = L["showStatsInRaidDesc"],
			order = 81,
			get = "getShowStatsInRaid",
			set = "setShowStatsInRaid",
		},
		printRaidInstead = {
			type = "toggle",
			name = L["printRaidInsteadTitle"],
			desc = L["printRaidInsteadDesc"],
			order = 82,
			get = "getPrintRaidInstead",
			set = "setPrintRaidInstead",
		},
		statsOnlyWhenActivity = {
			type = "toggle",
			name = L["statsOnlyWhenActivityTitle"],
			desc = L["statsOnlyWhenActivityDesc"],
			order = 83,
			get = "getStatsOnlyWhenActivity",
			set = "setStatsOnlyWhenActivity",
		},
		instanceStatsOutputRunsPerLevel = {
			type = "toggle",
			name = L["instanceStatsOutputRunsPerLevelTitle"],
			desc = L["instanceStatsOutputRunsPerLevelDesc"],
			order = 84,
			get = "getInstanceStatsOutputRunsPerLevel",
			set = "setInstanceStatsOutputRunsPerLevel",
		},
		instanceStatsOutputRunsNextLevel = {
			type = "toggle",
			name = L["instanceStatsOutputRunsNextLevelTitle"],
			desc = L["instanceStatsOutputRunsNextLevelDesc"],
			order = 85,
			get = "getInstanceStatsOutputRunsNextLevel",
			set = "setInstanceStatsOutputRunsNextLevel",
		},
		instanceStatsOutputRep = {
			type = "toggle",
			name = L["instanceStatsOutputRepTitle"],
			desc = L["instanceStatsOutputRepDesc"],
			order = 86,
			get = "getInstanceStatsOutputRep",
			set = "setInstanceStatsOutputRep",
		},
		trimDataHeader = {
			type = "header",
			name = L["trimDataHeaderDesc"],
			order = 330,
		},
		trimDataText = {
			type = "description",
			name = "|cFF9CD6DE".. L["trimDataTextDesc"],
			fontSize = "medium",
			order = 331,
		},
		trimDataBelowLevel = {
			type = "range",
			name = L["trimDataBelowLevelTitle"],
			desc = L["trimDataBelowLevelDesc"],
			order = 332,
			get = "getTrimDataBelowLevel",
			set = "setTrimDataBelowLevel",
			min = 1,
			max = 60,
			softMin = 1,
			softMax = 60,
			step = 1,
			width = "double",
		},
		trimDataBelowLevelButton = {
			type = "execute",
			name = L["trimDataBelowLevelButtonTitle"],
			desc = L["trimDataBelowLevelButtonDesc"],
			func = "removeCharsBelowLevel",
			order = 333,
			--width = 1.7,
			confirm = function()
				return string.format(L["trimDataBelowLevelButtonConfirm"], "|cFFFFFF00" .. NIT.db.global.trimDataBelowLevel .. "|r");
			end,
		},
		--[[trimDataText2 = {
			type = "description",
			name = "|cFF9CD6DE".. L["trimDataText2Desc"],
			fontSize = "medium",
			order = 334,
		},
		trimDataCharInput = {
			type = "input",
			name = L["trimDataCharInputTitle"],
			desc = L["trimDataCharInputDesc"],
			get = "getTrimDataCharInput",
			set = "setTrimDataCharInput",
			order = 335,
			--width = 1.7,
			confirm = function(self, input)
				return string.format(L["trimDataCharInputConfirm"], "|cFFFFFF00" .. input .. "|r");
			end,
		},]]
		notesHeader = {
			type = "header",
			name = L["notesHeaderDesc"],
			order = 998,
		},
		notesDesc = {
			type = "description",
			name = "|cFFFFFF00" .. L["notesDesc"],
			fontSize = "medium",
			order = 999,
		},
	},
};

function NIT:getLogExample()
	--Simulate a log entry.
	local classLocalized, classEnglish = UnitClass("player");
	local v = {
		playerName = UnitName("player"),
		classEnglish = classEnglish,
		instanceName = "Test Instance",
		enteredTime = GetServerTime() - 600,
		leftTime = GetServerTime() - 300,
	}
	local line = NIT:buildInstanceLineFrameString(v, 1);
	return "Example: " .. line;
end

------------------------
--Load option defaults--
------------------------
NIT.optionDefaults = {
	global = {
		--The Ace3 GUI color picker seems to play better with decimals.
		--Some colors work with 255 method, some don't.
		--chatColorR = 255, chatColorG = 255, chatColorB = 0,
		--prefixColorR = 255, prefixColorG = 105, prefixColorB = 0,
		chatColorR = 1, chatColorG = 1, chatColorB = 0,
		mergeColorR = 1, mergeColorG = 1, mergeColorB = 0,
		prefixColorR = 1, prefixColorG = 0.4117647058823529, prefixColorB = 0,
		logSize = 100,
		showAltsLog = true,
		timeStringType = "medium",
		showLockoutTime = true,
		maxRecordsKept = maxRecordsKept,
		maxTradesKept = maxTradesKept,
		instanceResetMsg = true;
		enteredMsg = true;
		timeStampFormat = 12,
		timeStampZone = "local",
		ignore40Man = false,
		showMoneyTradedChat = true,
		instanceStatsOutputMobCount = true,
		instanceStatsOutputXP = true,
		instanceStatsOutputAverageXP = false,
		instanceStatsOutputTime = true,
		instanceStatsOutputGold = true,
		instanceStatsOutputAverageGroupLevel = false,
		instanceStatsOutputRep = true,
		lastVersionMsg = 0,
		moneyString = "textures",
		instanceStatsOutput = true,
		instanceStatsOutputWhere = "self",
		minimapIcon = {["minimapPos"] = 180, ["hide"] = false},
		minimapButton = true,
		restedCharsOnly = false,
		detectSameInstance = true,
		showStatsInRaid = false,
		printRaidInstead = true,
		statsOnlyWhenActivity = false,
		show24HourOnly = false,
		autoSfkDoor = true,
		autoSlavePens = true,
		trimDataBelowLevel = 1,
		instanceStatsOutputRunsPerLevel = true,
		instanceStatsOutputRunsNextLevel = false,
		instanceWindowWidth = 620,
		instanceWindowHeight = 501,
		charsWindowWidth = 550,
		charsWindowHeight = 320,
		tradeWindowWidth = 580,
		tradeWindowHeight = 320,
		copyTradeTime = true,
		copyTradeZone = true,
		copyTradeTimeAgo = true,
		copyTradeRecords = 100;
		resetCharData = true, --Reset one time to delete data before alt UI stuff was added.
	},
};

--5 per hour and 30 per day lockouts are character specific.
function NIT:buildDatabase()
	--Create realm tables if they don't exist.
	if (not self.db.global[NIT.realm]) then
		self.db.global[NIT.realm] = {};
	end
	if (not self.db.global[NIT.realm].instances) then
		self.db.global[NIT.realm].instances = {};
	end
	if (not self.db.global[NIT.realm].trades) then
		self.db.global[NIT.realm].trades = {};
	end
	if (not self.db.global[NIT.realm].myChars) then
		self.db.global[NIT.realm].myChars = {};
	end
	if (not self.db.global[NIT.realm].myChars[UnitName("player")]) then
		self.db.global[NIT.realm].myChars[UnitName("player")] = {};
	end
	self.data = self.db.global[NIT.realm];
end

function NIT:setLogSize(info, value)
	self.db.global.logSize = value;
end

function NIT:getLogSize(info)
	return self.db.global.logSize;
end

--Show all alts in the log window.
function NIT:setShowAltsLog(info, value)
	self.db.global.showAltsLog = value;
	NIT:hideAllLineFrames();
	NIT:recalcInstanceLineFrames();
	if (NIT.instanceFrameShowsAltsButton) then
		--Refresh the checkbox on instance log frame.
		NIT.instanceFrameShowsAltsButton:SetChecked(value);
	end
end

function NIT:getShowAltsLog(info)
	return self.db.global.showAltsLog;
end

--Show the past 24h in log only.
function NIT:setShow24HourOnly(info, value)
	self.db.global.show24HourOnly = value;
	NIT:hideAllLineFrames();
	NIT:recalcInstanceLineFrames();
end

function NIT:getShow24HourOnly(info)
	return self.db.global.show24HourOnly;
end

--Show lockout instead of time entered.
function NIT:setShowLockoutTime(info, value)
	self.db.global.showLockoutTime = value;
	NIT:recalcInstanceLineFrames();
end

function NIT:getShowLockoutTime(info)
	return self.db.global.showLockoutTime;
end
--Time strings in instance log.
function NIT:setTimeStringType(info, value)
	self.db.global.timeStringType = value;
	NIT:recalcInstanceLineFrames();
end

function NIT:getTimeStringType(info)
	return self.db.global.timeStringType;
end

function NIT:setInstanceResetMsg(info, value)
	self.db.global.instanceResetMsg = value;
end

function NIT:getInstanceResetMsg(info)
	return self.db.global.instanceResetMsg;
end

function NIT:setEnteredMsg(info, value)
	self.db.global.enteredMsg = value;
end

function NIT:getEnteredMsg(info)
	return self.db.global.enteredMsg;
end

--Chat color.
function NIT:setChatColor(info, r, g, b, a)
	self.db.global.chatColorR, self.db.global.chatColorG, self.db.global.chatColorB = r, g, b;
	NIT.chatColor = "|cff" .. NIT:RGBToHex(self.db.global.chatColorR, self.db.global.chatColorG, self.db.global.chatColorB);
end

function NIT:getChatColor(info)
	return self.db.global.chatColorR, self.db.global.chatColorG, self.db.global.chatColorB;
end

--Merge color.
function NIT:setMergeColor(info, r, g, b, a)
	self.db.global.mergeColorR, self.db.global.mergeColorG, self.db.global.mergeColorB = r, g, b;
	NIT.mergeColor = "|cff" .. NIT:RGBToHex(self.db.global.mergeColorR, self.db.global.mergeColorG, self.db.global.mergeColorB);
end

function NIT:getMergeColor(info)
	return self.db.global.mergeColorR, self.db.global.mergeColorG, self.db.global.mergeColorB;
end

--Reset colors.
function NIT:resetColors(info, r, g, b, a)
	self.db.global.chatColorR = self.optionDefaults.global.chatColorR;
	self.db.global.chatColorG = self.optionDefaults.global.chatColorG;
	self.db.global.chatColorB = self.optionDefaults.global.chatColorB;
	self.db.global.mergeColorR = self.optionDefaults.global.mergeColorR;
	self.db.global.mergeColorG = self.optionDefaults.global.mergeColorG;
	self.db.global.mergeColorB = self.optionDefaults.global.mergeColorB;
	NIT.chatColor = "|cff" .. NIT:RGBToHex(self.db.global.chatColorR, self.db.global.chatColorG, self.db.global.chatColorB);
	NIT.mergeColor = "|cff" .. NIT:RGBToHex(self.db.global.mergeColorR, self.db.global.mergeColorG, self.db.global.mergeColorB);
end

--Which timestamp format to use 12h/24h.
function NIT:setTimeStampFormat(info, value)
	self.db.global.timeStampFormat = value;
end

function NIT:getTimeStampFormat(info)
	return self.db.global.timeStampFormat;
end

--Which timezone format to use local/server.
function NIT:setTimeStampZone(info, value)
	self.db.global.timeStampZone = value;
end

function NIT:getTimeStampZone(info)
	return self.db.global.timeStampZone;
end

--Ignore 40man instances.
function NIT:setIgnore40Man(info, value)
	self.db.global.ignore40Man = value;
end

function NIT:getIgnore40Man(info)
	return self.db.global.ignore40Man;
end

--Minimap button
function NIT:setMinimapButton(info, value)
	self.db.global.minimapButton = value;
	if (value) then
		NIT.LDBIcon:Show("NovaInstanceTracker");
		self.db.global.minimapIcon.hide = false;
	else
		NIT.LDBIcon:Hide("NovaInstanceTracker");
		self.db.global.minimapIcon.hide = true;
	end
end

function NIT:getMinimapButton(info)
	return self.db.global.minimapButton;
end

--Show gold trades in chat.
function NIT:setShowMoneyTradedChat(info, value)
	self.db.global.showMoneyTradedChat = value;
end

function NIT:getShowMoneyTradedChat(info)
	return self.db.global.showMoneyTradedChat;
end

--Auto detect same instance as last.
function NIT:setDetectSameInstance(info, value)
	self.db.global.detectSameInstance = value;
end

function NIT:getDetectSameInstance(info)
	return self.db.global.detectSameInstance;
end

--Show stats when exiting dungeon.
function NIT:setInstanceStatsOutput(info, value)
	self.db.global.instanceStatsOutput = value;
end

function NIT:getInstanceStatsOutput(info)
	return self.db.global.instanceStatsOutput;
end

--Where to show stats when exiting dungeon.
function NIT:setInstanceStatsOutputWhere(info, value)
	self.db.global.instanceStatsOutputWhere = value;
end

function NIT:getInstanceStatsOutputWhere(info)
	return self.db.global.instanceStatsOutputWhere;
end

--Mob count stats output when exiting dungeon.
function NIT:setInstanceStatsOutputMobCount(info, value)
	self.db.global.instanceStatsOutputMobCount = value;
end

function NIT:getInstanceStatsOutputMobCount(info)
	return self.db.global.instanceStatsOutputMobCount;
end

--XP stats output when exiting dungeon.
function NIT:setInstanceStatsOutputXP(info, value)
	self.db.global.instanceStatsOutputXP = value;
end

function NIT:getInstanceStatsOutputXP(info)
	return self.db.global.instanceStatsOutputXP;
end

--Average XP stats output when exiting dungeon.
function NIT:setInstanceStatsOutputAverageXP(info, value)
	self.db.global.instanceStatsOutputAverageXP = value;
end

function NIT:getInstanceStatsOutputAverageXP(info)
	return self.db.global.instanceStatsOutputAverageXP;
end

--Time stats output when exiting dungeon.
function NIT:setInstanceStatsOutputTime(info, value)
	self.db.global.instanceStatsOutputTime = value;
end

function NIT:getInstanceStatsOutputTime(info)
	return self.db.global.instanceStatsOutputTime;
end

--Gold stats output when exiting dungeon.
function NIT:setInstanceStatsOutputGold(info, value)
	self.db.global.instanceStatsOutputGold = value;
end

function NIT:getInstanceStatsOutputGold(info)
	return self.db.global.instanceStatsOutputGold;
end

--Average group level stats output when exiting dungeon.
function NIT:setInstanceStatsOutputAverageGroupLevel(info, value)
	self.db.global.instanceStatsOutputAverageGroupLevel = value;
end

function NIT:getInstanceStatsOutputAverageGroupLevel(info)
	return self.db.global.instanceStatsOutputAverageGroupLevel;
end

--Show stats while in raid.
function NIT:setShowStatsInRaid(info, value)
	self.db.global.showStatsInRaid = value;
end

function NIT:getShowStatsInRaid(info)
	return self.db.global.showStatsInRaid;
end

--Print to chat if in raid instead.
function NIT:setPrintRaidInstead(info, value)
	self.db.global.printRaidInstead = value;
end

function NIT:getPrintRaidInstead(info)
	return self.db.global.printRaidInstead;
end

--Show stats only when activity (xp, mob kills etc).
function NIT:setStatsOnlyWhenActivity(info, value)
	self.db.global.statsOnlyWhenActivity = value;
end

function NIT:getStatsOnlyWhenActivity(info)
	return self.db.global.statsOnlyWhenActivity;
end

--Trim data of characters below this level.
function NIT:setTrimDataBelowLevel(info, value)
	self.db.global.trimDataBelowLevel = value;
end

function NIT:getTrimDataBelowLevel(info)
	return self.db.global.trimDataBelowLevel;
end

--Trim data for single char.
function NIT:setTrimDataCharInput(info, value)
	NIT:removeSingleChar(value);
end

function NIT:getTrimDataCharInput(info)

end

--Runs per level stats output when exiting dungeon.
function NIT:setInstanceStatsOutputRunsPerLevel(info, value)
	self.db.global.instanceStatsOutputRunsPerLevel = value;
end

function NIT:getInstanceStatsOutputRunsPerLevel(info)
	return self.db.global.instanceStatsOutputRunsPerLevel;
end

--Runs until next level stats output when exiting dungeon.
function NIT:setInstanceStatsOutputRunsNextLevel(info, value)
	self.db.global.instanceStatsOutputRunsNextLevel = value;
end

function NIT:getInstanceStatsOutputRunsNextLevel(info)
	return self.db.global.instanceStatsOutputRunsNextLevel;
end

--Rep stats output when exiting dungeon.
function NIT:setInstanceStatsOutputRep(info, value)
	self.db.global.instanceStatsOutputRep = value;
end

function NIT:getInstanceStatsOutputRep(info)
	return self.db.global.instanceStatsOutputRep;
end

--Instance window dimensions.
function NIT:setInstanceWindowWidth(info, value)
	self.db.global.instanceWindowWidth = value;
	_G["NITInstanceFrame"]:SetWidth(value);
	_G["NITInstanceFrame"].EditBox:SetWidth(value - 30);
end

function NIT:getInstanceWindowWidth(info)
	return self.db.global.instanceWindowWidth;
end

function NIT:setInstanceWindowHeight(info, value)
	self.db.global.instanceWindowHeight = value;
	_G["NITInstanceFrame"]:SetHeight(value);
end

function NIT:getInstanceWindowHeight(info)
	return self.db.global.instanceWindowHeight;
end

--Chars window dimensions.
function NIT:setCharsWindowWidth(info, value)
	self.db.global.charsWindowWidth = value;
	_G["NITAltsFrame"]:SetWidth(value);
	_G["NITAltsFrame"].EditBox:SetWidth(value - 30);
end

function NIT:getCharsWindowWidth(info)
	return self.db.global.charsWindowWidth;
end

function NIT:setCharsWindowHeight(info, value)
	self.db.global.charsWindowHeight = value;
	_G["NITAltsFrame"]:SetHeight(value);
end

function NIT:getCharsWindowHeight(info)
	return self.db.global.charsWindowHeight;
end

--Trade window dimensions.
function NIT:setTradeWindowWidth(info, value)
	self.db.global.tradeWindowWidth = value;
	_G["NITTradeLogFrame"]:SetWidth(value);
	_G["NITTradeLogFrame"].EditBox:SetWidth(value - 30);
end

function NIT:getTradeWindowWidth(info)
	return self.db.global.tradeWindowWidth;
end

function NIT:setTradeWindowHeight(info, value)
	self.db.global.tradeWindowHeight = value;
	_G["NITTradeLogFrame"]:SetHeight(value);
end

function NIT:getTradeWindowHeight(info)
	return self.db.global.tradeWindowHeight;
end

--Reset frames.
function NIT:resetFrames()
	self.db.global.instanceWindowWidth = self.optionDefaults.global.instanceWindowWidth;
	self.db.global.instanceWindowHeight = self.optionDefaults.global.instanceWindowHeight;
	self.db.global.charsWindowWidth = self.optionDefaults.global.charsWindowWidth;
	self.db.global.charsWindowHeight = self.optionDefaults.global.charsWindowHeight;
	self.db.global.tradeWindowWidth = self.optionDefaults.global.tradeWindowWidth;
	self.db.global.tradeWindowHeight = self.optionDefaults.global.tradeWindowHeight;
	_G["NITInstanceFrame"]:SetWidth(self.db.global.instanceWindowWidth);
	_G["NITInstanceFrame"].EditBox:SetWidth(self.db.global.instanceWindowWidth - 30);
	_G["NITInstanceFrame"]:SetHeight(self.db.global.instanceWindowHeight);
	_G["NITInstanceFrame"]:ClearAllPoints();
	_G["NITInstanceFrame"]:SetPoint("CENTER", UIParent, 0, 100);
	_G["NITAltsFrame"]:SetWidth(self.db.global.charsWindowWidth);
	_G["NITAltsFrame"].EditBox:SetWidth(self.db.global.charsWindowWidth - 30);
	_G["NITAltsFrame"]:SetHeight(self.db.global.charsWindowHeight);
	_G["NITAltsFrame"]:ClearAllPoints();
	_G["NITAltsFrame"]:SetPoint("CENTER", UIParent, 0, 100);
	_G["NITTradeLogFrame"]:SetWidth(self.db.global.tradeWindowWidth);
	_G["NITTradeLogFrame"].EditBox:SetWidth(self.db.global.tradeWindowWidth - 30);
	_G["NITTradeLogFrame"]:SetHeight(self.db.global.tradeWindowHeight);
	_G["NITTradeLogFrame"]:ClearAllPoints();
	_G["NITTradeLogFrame"]:SetPoint("CENTER", UIParent, 20, 120);
	_G["NITTradeCopyFrame"]:SetWidth(self.db.global.tradeWindowWidth);
	_G["NITTradeCopyFrame"].EditBox:SetWidth(self.db.global.tradeWindowWidth - 30);
	_G["NITTradeCopyFrame"]:SetHeight(self.db.global.tradeWindowHeight);
	_G["NITTradeCopyFrame"]:ClearAllPoints();
	_G["NITTradeCopyFrame"]:SetPoint("CENTER", UIParent, -70, 150);
	NIT:print(L["resetFramesMsg"]);
end