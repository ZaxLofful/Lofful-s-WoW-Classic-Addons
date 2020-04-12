DismountMe = CreateFrame("Frame")
DismountMe:RegisterEvent("UI_ERROR_MESSAGE")

DismountMe.Buffs = { "spell_nature_swiftness", "_mount_", "_qirajicrystal_",
  "ability_racial_bearform", "ability_druid_catform", "ability_druid_travelform",
  "spell_nature_forceofnature", "ability_druid_aquaticform", "spell_nature_spiritwolf" }

DismountMe.Errors = { SPELL_FAILED_NOT_MOUNTED, ERR_ATTACK_MOUNTED, ERR_TAXIPLAYERALREADYMOUNTED,
  SPELL_FAILED_NOT_SHAPESHIFT, SPELL_FAILED_NO_ITEMS_WHILE_SHAPESHIFTED, SPELL_NOT_SHAPESHIFTED,
  SPELL_NOT_SHAPESHIFTED_NOSPACE, ERR_CANT_INTERACT_SHAPESHIFTED, ERR_NOT_WHILE_SHAPESHIFTED,
  ERR_NO_ITEMS_WHILE_SHAPESHIFTED, ERR_TAXIPLAYERSHAPESHIFTED,ERR_MOUNT_SHAPESHIFTED }

DismountMe:SetScript("OnEvent", function()
    for id, errorstring in pairs(DismountMe.Errors) do
      if arg1 == errorstring then
        for i=0,15,1 do
          currBuffTex = GetPlayerBuffTexture(i);
          if (currBuffTex) then

            for id, bufftype in pairs(DismountMe.Buffs) do
              if string.find(string.lower(currBuffTex), bufftype) then
                CancelUnitBuff(i);
              end
            end
          end
        end
      end
    end
  end)


local f = CreateFrame("Frame", "DismountMe", UIParent)
f:RegisterEvent("UI_ERROR_MESSAGE")
f:RegisterEvent("TAXIMAP_OPENED")

f:SetScript("OnEvent", function(self, event, arg1, arg2, ...)
	--print("arg1:", arg1, "| arg2:", arg2)
	if event == "UI_ERROR_MESSAGE" then
		if arg1 == 50 then
			if arg2 == "You must be standing to do that" then
				DoEmote("STAND")
			elseif arg2 == "You are mounted" then
				Dismount()
			end
		elseif arg1 == 213 then
			if arg2 == "You are already mounted! Dismount first." then
				Dismount()
			end
		elseif arg1 == 504 then
			if arg2 == "You can't do that while mounted." then
				Dismount()
			end
		end
	elseif event == "TAXIMAP_OPENED" then
		Dismount()
	end
end)

f:Hide()
