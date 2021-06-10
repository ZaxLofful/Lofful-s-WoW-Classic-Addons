local FollowMeFrame = CreateFrame("Frame")

SLASH_FOLLOWME1 = "/fme"
SlashCmdList["FOLLOWME"] = function()

end

local function handleChatMsg(msg, player)

	if(string.upper(msg) == 'FME' and strPlayer ~= UnitName("player")) then
		local strPlayer = Ambiguate(player, "short")
		FollowUnit(strPlayer);
	end
  
  if(string.upper(msg) == 'FMES' and strPlayer ~= UnitName("player")) then
		local strSelf = UnitName("player")	
		FollowUnit(strSelf);
	end	
end

--Handle events
local function EventHandler(self, event, arg1, arg2, ...)

	if(event == 'CHAT_MSG_PARTY' or event == 'CHAT_MSG_PARTY_LEADER') then
		handleChatMsg(arg1, arg2);
	elseif(event == 'CHAT_MSG_RAID' or event == 'CHAT_MSG_RAID_LEADER') then
		handleChatMsg(arg1, arg2);
	elseif(event == "CHAT_MSG_WHISPER") then
		handleChatMsg(arg1, arg2);
	--elseif(event == 'CHAT_MSG_SAY') then
	--	handleChatMsg(arg1, arg2);
	end
end 

local function LoginEvent(self, event, ...)

	FollowMeFrame:UnregisterEvent("PLAYER_LOGIN")
	
	FollowMeFrame:SetScript("OnEvent", EventHandler)
	FollowMeFrame:RegisterEvent("CHAT_MSG_PARTY")	
	FollowMeFrame:RegisterEvent("CHAT_MSG_PARTY_LEADER")
	FollowMeFrame:RegisterEvent("CHAT_MSG_RAID")
	FollowMeFrame:RegisterEvent("CHAT_MSG_RAID_LEADER")
	FollowMeFrame:RegisterEvent("CHAT_MSG_WHISPER")
	--FollowMeFrame:RegisterEvent("CHAT_MSG_SAY")
end

FollowMeFrame:SetScript("OnEvent", LoginEvent)
FollowMeFrame:RegisterEvent("PLAYER_LOGIN")