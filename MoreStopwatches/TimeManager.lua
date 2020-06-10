--locals
local inited = false;
local disabledWarning = true;

--init all stopwatch functions: adapted from \Interface\AddOns\Blizzard_TimeManager\Blizzard_TimeManager.lua
function MoreStopwatches.Init()
	if ( inited ) then
		return;
	else
		inited = true;
	end;

	-- speed optimizations (mostly so update functions are faster)
	local _G = getfenv(0);
	local abs = _G.abs;
	local min = _G.min;
	local floor = _G.floor;
	local mod = _G.mod;
	local GetServerTime = _G.GetServerTime;

	-- private data
	local SEC_TO_MINUTE_FACTOR = 1/60;
	local SEC_TO_HOUR_FACTOR = SEC_TO_MINUTE_FACTOR*SEC_TO_MINUTE_FACTOR;

	function MoreStopwatches_StopwatchTemplate_Play(self)
		local timer = self:GetParent();
		local StopwatchPlayPauseButton = self;
		local StopwatchTicker = _G[timer:GetName().."StopwatchTicker"];

		if ( StopwatchPlayPauseButton.playing ) then
			return;
		end;

		StopwatchPlayPauseButton.playing = true;

		if ( self:GetParent().saveBetweenSessions ) then
			MoreStopwatchesSave.savedTimers[timer:GetName()].playing = true;
		end;

		StopwatchTicker.startTime = GetServerTime() - StopwatchTicker.timer;
		StopwatchTicker:SetScript("OnUpdate", MoreStopwatches_StopwatchTemplateTicker_OnUpdate);
		StopwatchPlayPauseButton:SetNormalTexture("Interface\\TimeManager\\PauseButton");
	end;

	function MoreStopwatches_StopwatchTemplate_Pause(self)
		local StopwatchPlayPauseButton = self;
		local StopwatchTicker = _G[self:GetParent():GetName().."StopwatchTicker"];

		if ( not StopwatchPlayPauseButton.playing ) then
			return;
		end;

		StopwatchPlayPauseButton.playing = false;

		if ( self:GetParent().saveBetweenSessions ) then
			MoreStopwatchesSave.savedTimers[self:GetParent():GetName()].playing = false;
		end;

		StopwatchTicker:SetScript("OnUpdate", nil);
		StopwatchPlayPauseButton:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up");
	end;

	function MoreStopwatches_StopwatchTemplate_Clear(stopwatchSelf, resetbuttonSelf)
		local self;

		if ( stopwatchSelf ) then
			self = stopwatchSelf;
		elseif ( resetbuttonSelf ) then
			self = resetbuttonSelf:GetParent();
		end;

		local StopwatchTicker = _G[self:GetName().."StopwatchTicker"];
		StopwatchTicker.timer = 0;
		StopwatchTicker:SetScript("OnUpdate", nil);

		MoreStopwatches_StopwatchTemplateTicker_Update(self);

		local StopwatchPlayPauseButton = _G[self:GetName().."StopwatchPlayPauseButton"];

		StopwatchPlayPauseButton.playing = false;

		if ( self.saveBetweenSessions ) then
			MoreStopwatchesSave.savedTimers[self:GetName()].playing = false;
		end;

		StopwatchPlayPauseButton:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up");
	end;

	function MoreStopwatches_StopwatchTemplateCloseButton_OnClick(self)
		local StopwatchFrame = self:GetParent():GetParent();
		StopwatchFrame:Hide();
		PlaySound(SOUNDKIT.IG_MAINMENU_QUIT);

		--remove savedTimer if user closes stopwatch
		MoreStopwatchesSave.savedTimers[StopwatchFrame:GetName()] = nil;
	end;

	function MoreStopwatches_StopwatchTemplateFrame_OnLoad(self)
		-- user may have disabled dragging (with a right-click), only enable it if not. also disable the close button if dragging disabled.
		if ( MoreStopwatchesSave.savedTimers[self:GetName()].isDisabled ) then
			_G[self:GetName().."StopwatchTabFrameStopwatchCloseButton"]:Disable();
		else
			self:RegisterForDrag("LeftButton");
		end;

		local StopwatchTabFrame = _G[self:GetName().."StopwatchTabFrame"];
		StopwatchTabFrame:SetAlpha(0);

		MoreStopwatches_StopwatchTemplate_Clear(self);
	end;

	function MoreStopwatches_StopwatchTemplateFrame_OnUpdate(self, elapsed)
		local name = self:GetName();

		--save time of stopwatches every 1 second and store it in a savedVar
		if ( self.saveBetweenSessions ) then
			self.elapsed = (self.elapsed or 0) + elapsed;

			if ( self.elapsed > 1 ) then
				MoreStopwatchesSave.time = GetServerTime();
				MoreStopwatchesSave.savedTimers[name].savedTime = _G[name .. "StopwatchTicker"].timer;
				self.elapsed = 0;
			end;
		end;

		local StopwatchTabFrame = _G[name .. "StopwatchTabFrame"];

		if ( not MoreStopwatchesSave.PermanentHeaders ) then
			if ( self.prevMouseIsOver ) then
				if ( not self:IsMouseOver() ) then
					UIFrameFadeOut(StopwatchTabFrame, CHAT_FRAME_FADE_TIME);
					self.prevMouseIsOver = false;
				end;
			elseif ( self:IsMouseOver() ) then
				UIFrameFadeIn(StopwatchTabFrame, CHAT_FRAME_FADE_TIME);
				self.prevMouseIsOver = true;
			end;
		end;
	end;

	function MoreStopwatches_StopwatchTemplateFrame_OnHide(self)
		local StopwatchTabFrame = _G[self:GetName() .. "StopwatchTabFrame"];

		UIFrameFadeRemoveFrame(StopwatchTabFrame);
		self.prevMouseIsOver = false;
	end;

	function MoreStopwatches_StopwatchTemplateFrame_OnMouseDown(self)
		self:SetScript("OnUpdate", nil);
	end;

	function MoreStopwatches_StopwatchTemplateFrame_OnMouseUp(self, button)
		-- disable/enable button dragging and closing with right-click
		if ( button == "RightButton" ) then
			local closeButton = _G[self:GetName().."StopwatchTabFrameStopwatchCloseButton"];
			if ( closeButton:IsEnabled() ) then
				closeButton:Disable();
				self:RegisterForDrag(); -- disable drag
				MoreStopwatchesSave.savedTimers[self:GetName()].isDisabled = true;

				-- warn the user (once per session) that they disabled a timer
				if ( disabledWarning ) then
					print("|cffFFFF00MoreStopwatches: Rightclicking the timer fixes it in place. Rightclick again to re-enable dragging and closing.|r");
					disabledWarning = false;
				end;
			else
				closeButton:Enable();
				self:RegisterForDrag("LeftButton"); -- enable drag
				MoreStopwatchesSave.savedTimers[self:GetName()].isDisabled = false;
			end;
		-- paste current time to active edit box when timer is shift-clicked
		elseif ( IsShiftKeyDown() ) then
			local editBox = GetCurrentKeyBoardFocus();

			if ( editBox ) then
				local StopwatchTicker = _G[self:GetName().."StopwatchTicker"];
				local hour = _G[StopwatchTicker:GetName().."Hour"]:GetText();
				local minute = _G[StopwatchTicker:GetName().."Minute"]:GetText();
				local second = _G[StopwatchTicker:GetName().."Second"]:GetText();
				local timer = hour .. ":" .. minute .. ":" .. second
				editBox:Insert(timer);
			end;
		end;

		self:SetScript("OnUpdate", MoreStopwatches_StopwatchTemplateFrame_OnUpdate);
	end;

	function MoreStopwatches_StopwatchTemplateFrame_OnDragStart(self)
		self:StartMoving();
	end;

	function MoreStopwatches_StopwatchTemplateFrame_OnDragStop(self)
		MoreStopwatches_StopwatchTemplateFrame_OnMouseUp(self); -- OnMouseUp won't fire if OnDragStart fired after OnMouseDown
		self:StopMovingOrSizing();

		--save position after dragging
		if ( self.saveBetweenSessions ) then
			MoreStopwatchesSave.savedTimers[self:GetName()].savedPosition = { self:GetPoint(0) };
		end;
	end;

	function MoreStopwatches_StopwatchTemplateTicker_OnUpdate(self, elapsed)
		self.timer = GetServerTime() - self.startTime;
		MoreStopwatches_StopwatchTemplateTicker_Update(nil, self);
	end;

	function MoreStopwatches_StopwatchTemplateTicker_Update(stopwatchSelf, tickerSelf)
		local self;

		if ( stopwatchSelf ) then
			self = stopwatchSelf;
		elseif ( tickerSelf ) then
			self = tickerSelf:GetParent();
		end;

		local StopwatchTicker = _G[self:GetName().."StopwatchTicker"];

		local timer = abs(StopwatchTicker.timer);

		local hour = min(floor(timer*SEC_TO_HOUR_FACTOR), 99);
		local minute = mod(timer*SEC_TO_MINUTE_FACTOR, 60);
		local second = mod(timer, 60);

		local sign = { h="", m="", s="", };

		if ( StopwatchTicker.timer < 0 ) then
			sign.h = (hour > 0 and "-") or "";
			sign.m = (minute > 0 and "-") or "";
			sign.s = (second > 0 and "-") or "";
		end;

		local StopwatchTickerHour = _G[StopwatchTicker:GetName().."Hour"];
		local StopwatchTickerMinute = _G[StopwatchTicker:GetName().."Minute"];
		local StopwatchTickerSecond = _G[StopwatchTicker:GetName().."Second"];
		StopwatchTickerHour:SetFormattedText(sign.h .. STOPWATCH_TIME_UNIT, hour);
		StopwatchTickerMinute:SetFormattedText(sign.m .. STOPWATCH_TIME_UNIT, minute);
		StopwatchTickerSecond:SetFormattedText(sign.s .. STOPWATCH_TIME_UNIT, second);
	end;

	function MoreStopwatches_StopwatchTemplateResetButton_OnClick(self)
		MoreStopwatches_StopwatchTemplate_Clear(nil, self);
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF);
	end;

	function MoreStopwatches_StopwatchTemplatePlayPauseButton_OnClick(self)
		if ( self.playing ) then
			MoreStopwatches_StopwatchTemplate_Pause(self);
			PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF);
		else
			MoreStopwatches_StopwatchTemplate_Play(self);
			PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
		end;
	end;
end;
