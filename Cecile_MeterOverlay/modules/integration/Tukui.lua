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

-- not in use
function mod.OnEvent()

end

--updata the Tukui datatext using our generic module
function mod.OnUpdate(self, t)	
	mod.datatext:UpdateText(self.Text,t);
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
	
	local tooltip = nil;
		
	if not Engine.Profile.overlay.elvtukoverride then
		--get tooltip from Tukui
		tooltip = GameTooltip;	
	
	else
		--get our tooltip
		tooltip = mod.datatext.tooltip;

	end

	--anchor to tukui datatext panel
	local Panel, Anchor, xOff, yOff = self:GetTooltipAnchor()
	tooltip:SetOwner(Panel, Anchor, xOff, yOff)		
	
	--get text from generic module
	mod.datatext:OnEnter(self,tooltip);
	
	--if we need to add the tip to the overlay
	if (Engine.Profile.overlay.tip) then
		tooltip:AddLine(" ");
		tooltip:AddLine(L["TIP_LOCK"]);
	end
	
	--if we have our own tooltip format it
	if Engine.Profile.overlay.elvtukoverride then	
		--format the tooltip
		mod.datatext:FormatTooltip(tooltip);	
	end
	
	--show the overlay
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



--initialize module registering in Tukui the datatext
function mod:OnInitialize()	
		
	--get Tukui datatext module
	local T, C = Tukui:unpack();
	
	mod.TukDT = T['DataTexts'];
	
	--store our generic datatext module
	mod.datatext = Engine.AddOn:GetModule("datatext");	
	
	-- enable datatext
	local OnEnable = function(self)

		self:RegisterEvent('PLAYER_ENTERING_WORLD');
		self:SetScript('OnUpdate', mod.OnUpdate);
		self:SetScript('OnMouseDown', mod.OnClick);
		self:SetScript('OnEnter', mod.OnEnter);
		self:SetScript('OnLeave', mod.OnLeave);
		self:Update();

	end

	-- disable datatext
	local OnDisable = function(self)

		self.Text:SetText('');
		self:SetScript('OnEvent', nil);
		self:UnregisterAllEvents();

	end		

	
	--register in Tukui
	mod.TukDT:Register(L["CONFIG_NAME"],  OnEnable, OnDisable, OnUpdate);
	
	debug("Tukui DataText registered");	
	
end
