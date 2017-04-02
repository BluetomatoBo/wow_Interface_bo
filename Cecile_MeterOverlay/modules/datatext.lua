----------------------------------------------------------------------------------------------------
-- datatext module, includes the floating datatext and functions to use in other addons datatext
--

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("datatext");

--get the locale
local L=Engine.Locale;

--debug
local debug = Engine.AddOn:GetModule("debug");

--sharemedia
local LSM = LibStub("LibSharedMedia-3.0");

--Version
local Version = Engine.AddOn:GetModule("version");

--mouse down in the datatext
function mod.DataTextDown(self,button)

	--if is not lock moving
	if not Engine.Profile.datatext.lock then
		self:GetParent():StartMoving();
	end

end

--mouse up in the datatext
function mod.DataTextUp(self,button)

	--if is not lock, we just stop moving and save position, ifnot left toggle, right config
	if button=="LeftButton" then
		if not Engine.Profile.datatext.lock then
			self:GetParent():StopMovingOrSizing();
			mod:SavePosition();
		else
			mod.meter:toggle();
		end
	elseif button=="RightButton" then
		if not Engine.Profile.datatext.lock then
			self:GetParent():StopMovingOrSizing();
			mod:SavePosition();
		end
		Engine.AddOn:ShowConfig();
	end


end

--display a table in the tooltip
function mod:DisplayTable(tooltip,mode,repotType,amount)

	--get the sorted result
	local StatsTable,totalsum, totalpersec = mod.meter.getSumtable(mode, repotType,true,Engine.SORT_RAW);

	--get the segment name
	local name = mod.meter.getSegmentName(mode);

	--display the table header
	if repotType == Engine.TYPE_DPS then

		tooltip:AddDoubleLine(L["DAMAGE_DONE"],name,Engine.colors["DAMAGE"].r,Engine.colors["DAMAGE"].g,Engine.colors["DAMAGE"].b,
			Engine.colors["HEADER"].r,Engine.colors["HEADER"].g,Engine.colors["HEADER"].b);

	elseif repotType == Engine.TYPE_HEAL then

		tooltip:AddDoubleLine(L["HEALING_DONE"],name,Engine.colors["HEAL"].r,Engine.colors["HEAL"].g,Engine.colors["HEAL"].b,
			Engine.colors["HEADER"].r,Engine.colors["HEADER"].g,Engine.colors["HEADER"].b);

	end

	--separation line
	tooltip:AddLine(" ");

	--count players
	local numofcombatants = #StatsTable;

	--check no data
	if numofcombatants == 0 then
		tooltip:AddLine(L["NO_DATA"])
	else

		--maximum amount to display
		if numofcombatants > amount then
			numofcombatants = amount
		end
		--get the value and value per sec from total
		local value = mod.meter:FormatNumber(totalsum);
		local vps = mod.meter:FormatNumber(totalpersec);
		local percent = 100;
		local classc = nil;

		--display total if is required
		if Engine.Profile.overlay.totals then
			tooltip:AddDoubleLine("00.Total",format("%s (%s) 100.0%%",value,vps));
		end

		--for every player
		for i = 1, numofcombatants do

			--get class color
			if StatsTable[i].enclass then
				classc = Engine.colors[StatsTable[i].enclass] or Engine.colors["OTHER"];
			else
				classc = Engine.colors["OTHER"];
			end

			--calcualte persec values
			if repotType == Engine.TYPE_DPS then
				value = mod.meter:FormatNumber(StatsTable[i].damage);
				vps = mod.meter:FormatNumber(StatsTable[i].dps);
				percent = (totalsum>0) and (math.floor(1000*StatsTable[i].damage/totalsum)/10) or 0;
			else
				value = mod.meter:FormatNumber(StatsTable[i].healing);
				vps = mod.meter:FormatNumber(StatsTable[i].hps);
				percent = (totalsum>0) and (math.floor(1000*StatsTable[i].healing/totalsum)/10) or 0;
			end

			--add that parcicipant to the tooltip
			tooltip:AddDoubleLine(string.format("%02d.%s",i,StatsTable[i].name),
				format("%s (%s) %03.1f%%",value,vps,percent),classc.r,classc.g,classc.b,classc.r,classc.g,classc.b);

		end
	end
end

--on enter the datatext
function mod:OnEnter(self,tooltip)

	if (not mod.meter.registered) then
		tooltip:AddLine(L["NO_METER"]);
	else
		--get the set
		local dataset = Engine.Profile.segment;
		local lines = Engine.Profile.overlay.lines;
		local type = Engine.Profile.overlay.type;

		--clear tooltip
		tooltip:ClearLines();

		--add meter header
		tooltip:AddLine(mod.meter.desc,Engine.colors["HEADER"].r,Engine.colors["HEADER"].g,Engine.colors["HEADER"].b);
		tooltip:AddLine(" ");


		--display the tables acording our configuration
		if type == Engine.OVERLAY_TYPE_BOTH then

			mod:DisplayTable(tooltip,dataset,Engine.TYPE_DPS,lines);

			tooltip:AddLine(" ");

			mod:DisplayTable(tooltip,dataset,Engine.TYPE_HEAL,lines);


		else

			mod:DisplayTable(tooltip,dataset, type,lines);

		end

	end


end

--on leave datatext just hide itt
function mod:OnLeave(self,tooltip)

	if Engine.Profile.overlay.hide==Engine.OVERLAY_HIDE_FADE then
		tooltip:FadeOut();
	else
		tooltip:Hide();
	end

end

--update the text value
function mod:UpdateTextValue()

	--if we have a damage meter
	if(mod.meter and mod.meter.registered) then

		--get time
		local now = time()

		--only update the data in the specific interval
		if (mod.lastSegment == nil) or (now - mod.lastSegment > Engine.Profile.interval) then

			mod.lastSegment = now;

			local dataset = Engine.Profile.segment;
			local format = Engine.Profile.datatext.customformat;

			--get the taged values
			mod.lastValue = mod.meter:GetValues(dataset,format)
		end
	else
		mod.lastValue = L["NO_DATA"];
	end

end

--update the datatext text
function mod:UpdateText(self,t)

	--update the text value
	mod:UpdateTextValue()

	--update the text
	self:SetText(mod.lastValue);

end



--control visibility
function mod:ControlVisibility()

	if Engine.Profile.datatext.enable then
		mod.frame:SetAlpha(1);
		mod.frame:Show();
		mod.frame:SetFrameStrata(Engine.Profile.datatext.strata);
		debug("floating datatext show");


		if Engine.Profile.datatext.background.enable then

			if(not mod.frame.bg) then
				local bg = mod.frame:CreateTexture(nil, "BACKGROUND");
				mod.frame.bg = bg;

				mod.frame:SetBackdrop({
						bgFile = nil,
						edgeFile = nil,
						tile = false,
						edgeSize = 0,
						tileSize = 0,
						insets = {
							left = 0,
							top = 0,
							right = 0,
							bottom = 0,
						}
					});
			end

			mod.frame.bg:SetAllPoints(mod.frame);
			mod.frame.bg:SetBlendMode("BLEND");


		  if Version.Legion then
  			mod.frame.bg:SetColorTexture(	Engine.Profile.datatext.background.color.r,
					Engine.Profile.datatext.background.color.g,
					Engine.Profile.datatext.background.color.b,
					Engine.Profile.datatext.background.color.a);

		  else
  			mod.frame.bg:SetTexture(	Engine.Profile.datatext.background.color.r,
					Engine.Profile.datatext.background.color.g,
					Engine.Profile.datatext.background.color.b,
					Engine.Profile.datatext.background.color.a);

		  end

		else
			if mod.frame.bg then
				mod.frame.bg:SetTexture(nil);
			end
		end

		--hide out of combat
		if Engine.Profile.datatext.hideOOC then

			local meter = Engine.AddOn:GetModule("meter");

			if meter.combat then
				mod.frame:SetAlpha(1);
				mod.frame:Show();
			else
				if (Engine.Profile.datatext.hideOCCMode == Engine.DATATEXT_HIDE_NORMAL) then
					mod.frame:Hide();
				else
					--:FadeOut();
					UIFrameFadeOut(mod.frame, 1.0, 1.0, 0.0)
				end
			end

		end


	else
		mod.frame:Hide();
		debug("floating datatext hide");
	end

end

--enable the module
function mod:OnEnable()

	mod:ControlVisibility();

end

--disable the module
function mod:OnDisable()

	mod:ControlVisibility();

end

--change the font
function mod:ChangeFont()

	--get the datatext font
	mod.datatextFont = LSM:Fetch("font", Engine.Profile.datatext.font)
	mod.frame.title.text:SetFont(mod.datatextFont, Engine.Profile.datatext.fontSize, nil)

	--get the overlay font
	mod.overlayFont = LSM:Fetch("font", Engine.Profile.overlay.font)

end

--we have been request to reset, options change
function mod:Reset()
	mod:RestorePosition();
	mod:Lock(Engine.Profile.datatext.lock);
	mod:ControlVisibility();
	mod:ChangeFont();
end

--format a tooltip line
function mod:FormatTooltipLine(textline)

	if textline then
		--if the font has change set the font and store it
		if	( 	(textline.customFont ~= Engine.Profile.overlay.font) or
				(textline.customFontSize ~= Engine.Profile.overlay.fontSize) ) then

			textline:SetFont(mod.overlayFont, Engine.Profile.overlay.fontSize, nil);
			textline.customFont = Engine.Profile.overlay.font;
			textline.customFontSize = Engine.Profile.overlay.fontSize;

		end
	end

end

--format the tooltip
function mod:FormatTooltip(tooltip)

	--go trought the lines
	local textline;
	for i = 1,tooltip:NumLines() do

		--get the left lines & format it
		mod:FormatTooltipLine(_G["CMODatatextTooltipTextLeft"..i]);
		mod:FormatTooltipLine(_G["CMODatatextTooltipTextRight"..i]);

	end

end

--init the datatext
function mod:OnInitialize()

	--get the generic meter
	mod.meter = Engine.AddOn:GetModule("meter")

	--create datatext frame
	mod.frame = CreateFrame("Frame", nil, UIParent)
	local frame = mod.frame

	-- The main frame.
	frame:EnableMouse();

	frame:SetWidth(Engine.Profile.datatext.w);
	frame:SetHeight(Engine.Profile.datatext.h);

	frame:SetPoint("CENTER", UIParent);
	frame:SetFrameStrata(Engine.Profile.datatext.strata);
	frame:SetBackdropColor(0, 0, 0, 1);

	-- The titlebar/drag bar.
	frame:SetMovable(true);
	frame:SetClampedToScreen(true);

	--our floating datatext
	frame.title = CreateFrame("Button", nil, frame);
	frame.title:SetNormalFontObject("GameFontNormal");

	frame.title.text = frame.title:CreateFontString(nil, 'OVERLAY');

	frame.title.text:SetShadowOffset(0.2,-0.2);
	frame.title.text:SetTextColor(1,1,1,1);

	frame.title.text:SetAllPoints();

	frame.title.text:SetJustifyH("CENTER");
	frame.title.text:SetJustifyV("middle");

	frame.title:SetAllPoints(frame);
	frame.title.text:SetAllPoints(frame);

	--events
	frame.title:SetScript("OnMouseDown",mod.DataTextDown);
	frame.title:SetScript("OnMouseUp",mod.DataTextUp);

	frame.title:SetScript("OnEnter",function(self)

			local tooltip = mod.tooltip;

			--calculate anchor relative to where we are in the screen
			local anchor="";
			if(self:GetTop()*2>GetScreenHeight()) then
				anchor = "ANCHOR_BOTTOM";
			else
				anchor = "ANCHOR_TOP";
			end

			tooltip:SetOwner(self, anchor);

			mod:OnEnter(self,tooltip);

			--if we need to display the tip display acording if we are lock or unlock
			if (Engine.Profile.overlay.tip) then
				tooltip:AddLine(" ");
				if Engine.Profile.datatext.lock then
					tooltip:AddLine(L["TIP_LOCK"]);
				else
					tooltip:AddLine(L["TIP_UNLOCK"]);
				end
			end

			--format the tooltip
			mod:FormatTooltip(tooltip);

			--show the tooltip
			tooltip:Show();
		end)

	--leaving
	frame.title:SetScript("OnLeave",function(self)

			local tooltip = mod.tooltip;

			mod:OnLeave(self,mod.tooltip);
		end)

	--update the datatext
	frame.title:SetScript("OnUpdate",function(self,t)
			mod:UpdateText(frame.title.text,t);
		end)

	--our tooltip
	mod.tooltip = CreateFrame("GameTooltip", "CMODatatextTooltip", UIParent, "GameTooltipTemplate")

	--hook for style the tooltipe
	mod.tooltip:HookScript("OnShow",function (self)

			if(not self.bg) then
				local bg = self:CreateTexture(nil, "BACKGROUND");
				self.bg = bg;

				self:SetBackdrop({
						bgFile = nil,
						edgeFile = nil,
						tile = false,
						edgeSize = 0,
						tileSize = 0,
						insets = {
							left = 0,
							top = 0,
							right = 0,
							bottom = 0,
						}
					});
			end

			self.bg:SetAllPoints(self);
			self.bg:SetBlendMode("BLEND");

			if Version.Legion then

				self.bg:SetColorTexture(	Engine.Profile.overlay.color.r,
					Engine.Profile.overlay.color.g,
					Engine.Profile.overlay.color.b,
					Engine.Profile.overlay.color.a);

  		else

				self.bg:SetTexture(	Engine.Profile.overlay.color.r,
					Engine.Profile.overlay.color.g,
					Engine.Profile.overlay.color.b,
					Engine.Profile.overlay.color.a);

  		end

		end)


	--will show and restore position, font, etc.
	mod:Reset();

end

--save the position
function mod:SavePosition()

	local f = mod.frame;
	local x,y = f:GetLeft(), f:GetTop();
	local s = 1;

	x,y = x*s,y*s;

	local opt =  Engine.Profile.datatext;

	opt.x = x;
	opt.y = y;

	opt.w = f:GetWidth();
	opt.h = f:GetHeight();

	debug("save position %d,%d %d-%d",opt.x,opt.y,opt.h,opt.w);

end

--restore the position
function mod:RestorePosition()

	local f = mod.frame;

	local opt = Engine.Profile.datatext;

	debug("restore position %d,%d %d-%d",opt.x,opt.y,opt.h,opt.w);

	local x = opt.x;
	local y = opt.y;

	local s = 1;

	--default position
	if not x or not y then

		f:ClearAllPoints();
		f:SetPoint("CENTER", UIParent,"CENTER",0,(GetScreenHeight()/2)-(opt.h));
		mod:SavePosition();

	else

		x,y = x/s,y/s;

		f:ClearAllPoints();
		f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y);

	end

	--set width & height
	f:SetWidth(opt.w);
	f:SetHeight(opt.h);

	--the text will ahve the parent position
	f.title:SetAllPoints(f);
	f.title.text:SetAllPoints(f);

end

--lock the datatext
function mod:Lock(value)

	local f = mod.frame;

	if value then

		f.title:SetHighlightTexture(nil);
		f:SetBackdropColor(0, 0, 0, 0);
		debug("DataText lock");

	else

		f.title:SetHighlightTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar");
		f:SetBackdropColor(0, 0, 0, 1);
		debug("DataText unlock");

	end

end
