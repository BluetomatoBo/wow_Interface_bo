----------------------------------------------------------------------------------------------------
-- Tukui module, to display datatex in Tukui
--

--if Tukui its not present, dont use this module
if not IsAddOnLoaded( "Tukui" )  then return; end

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("TukuiDataText");

--debug
local debug = Engine.AddOn:GetModule("debug");

--get locale
local L = Engine.Locale;

--not in use	
function mod.OnEvent(self, event)

end

--updata the datatext
function mod.OnUpdate(self, t)	
	mod.datatext:UpdateText(self.text,t);
	self:SetAllPoints(self.text);
end

--button click on the datatext, is always locked so left click toggle, right config
function mod.OnClick(self,button)
	if button=="LeftButton" then
		mod.datatext.meter:toggle();
	elseif button=="RightButton" then
		Engine.AddOn:ShowConfig();
	end
end


--mouse enter in the datatext
function mod.OnEnter(self)

	--get Tukui
	local T, C, _, G = unpack(_G.Tukui);
	
	local tooltip = nil;
	
	if not Engine.Profile.overlay.elvtukoverride then
		--get tooltip from Tukui
		tooltip = GameTooltip;				
	else
		--get our tooltip
		tooltip = mod.datatext.tooltip;		
	end
	
	--get the anchor
	local anchor, panel, xoff, yoff = T.DataTextTooltipAnchor(self.text);
	tooltip:SetOwner(panel, anchor, xoff, yoff);
				
	mod.datatext:OnEnter(self,tooltip);
	
	--if we need to add the tip to the overlay
	if (Engine.Profile.overlay.tip) then
		tooltip:AddLine(" ");
		tooltip:AddLine(L["TIP_LOCK"]);
	end
	
	if Engine.Profile.overlay.elvtukoverride then	
		--format the tooltip
		mod.datatext:FormatTooltip(tooltip);	
	end	
	--show the tooltip	
	tooltip:Show();
	
end

--mouse leaves out the datatext
function mod.OnLeave(self)

	local tooltip = nil;
	
	if not Engine.Profile.overlay.elvtukoverride then
		--get tooltip from Tukui
		tooltip = GameTooltip;				
	else
		--get our tooltip
		tooltip = mod.datatext.tooltip;		
	end
	
	mod.datatext:OnLeave(self,tooltip);
	
end	

--restore our values from TukUI config saved vars
function mod:RestoreTukuiConfig(C)

	--default value
	C["datatext"].cecilemeteroverlay = 0;
	
	--add our localization to the one use in TukUI config
	TukuiConfigUILocalization.datatextcecilemeteroverlay = L["TUKUI_CONFIG"];
	
	--get our player name and realm
	local myPlayerRealm = GetCVar("realmName");
	local myPlayerName  = UnitName("player");

	--if we do not have data yet, init
	if not _G.TukuiConfigAll then _G.TukuiConfigAll = {} end

	--get the saved vars
	local tca = _G.TukuiConfigAll;
	local private = _G.TukuiConfigPrivate;
	local public = _G.TukuiConfigPublic;
	
	--init data
	if not tca[myPlayerRealm] then tca[myPlayerRealm] = {}; end
	if not tca[myPlayerRealm][myPlayerName] then tca[myPlayerRealm][myPlayerName] = false; end

	if tca[myPlayerRealm][myPlayerName] == true and not private then return; end
	if tca[myPlayerRealm][myPlayerName] == false and not public then return; end

	--private or public
	local setting;
	if tca[myPlayerRealm][myPlayerName] == true then
		setting = private;
	else
		setting = public;
	end 
	
	--copy the value from saved var to the config
	if(setting["datatext"].cecilemeteroverlay) then
		C["datatext"].cecilemeteroverlay = setting["datatext"].cecilemeteroverlay;
	end
end


--initialize module registering in Tukui the datatext
function mod:OnInitialize()	
	
	--get Tukui
	local T, C, _, G = unpack(_G.Tukui);
	
	--restore the config
	mod:RestoreTukuiConfig(C);
	
	--if we have the datatext active
	if C["datatext"].cecilemeteroverlay and C["datatext"].cecilemeteroverlay > 0 then
		
		--create the panel
		local Stat = CreateFrame("Frame", "TukuiCecile_MeterOverlay");
	
		Stat:EnableMouse(true);
		Stat:SetFrameStrata("BACKGROUND");
		Stat:SetFrameLevel(3);
		Stat.Option = C.datatext.cecilemeteroverlay;
		Stat.Color1 = T.RGBToHex(unpack(C.media.datatextcolor1));
		Stat.Color2 = T.RGBToHex(unpack(C.media.datatextcolor2))
		G.DataText.cecilemeteroverlay = Stat;
		
		--create the text
		local Text  = Stat:CreateFontString("TukuiCecile_MeterOverlayText", "OVERLAY");
		Text:SetFont(C.media.font, C["datatext"].fontsize);
		T.DataTextPosition(C["datatext"].cecilemeteroverlay, Text);
		G.DataText.cecilemeteroverlay.Text = Text;
		mod.text = Text;
		Stat.text = Text;
		
		--set the scripts
		Stat:SetScript("OnUpdate", mod.OnUpdate)
		Stat:SetScript("OnMouseUp", mod.OnClick)
		Stat:SetScript("OnEnter", mod.OnEnter)
		Stat:SetScript("OnLeave", mod.OnLeave)
		Stat:SetScript("OnEvent", mod.OnEvent)
		
		--store our generic datatext module
		mod.datatext = Engine.AddOn:GetModule("datatext");
	
		debug("Tukui DataText registered");	
		
	end
		
	
end
