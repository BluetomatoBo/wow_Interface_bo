----------------------------------------------------------------------------------------------------
-- ElvUI module, to display datatex in ElvUI
--

--if ElvUI its not present, dont use this module
if not IsAddOnLoaded( "ElvUI" )  then return; end

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("ElvUIDataText");

--debug
local debug = Engine.AddOn:GetModule("debug");

--get locale
local L = Engine.Locale;

--not in use	
function mod.OnEvent()

end

--updata the ElvUI datatext using our generic module
function mod.OnUpdate(self, t)	
	mod.datatext:UpdateText(self.text,t);
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
		--get tooltip from elvui
		tooltip = mod.ElvDT.tooltip;	
		mod.ElvDT:SetupTooltip(self);	
	else
		--get our tooltip
		local parent = self:GetParent();
		tooltip = mod.datatext.tooltip;
		tooltip:SetOwner(parent, parent.anchor, parent.xOff, parent.yOff);		
	end
	
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
	
	--show the overlay
	tooltip:Show();	
	
end

--mouse leaves out the datatext
function mod.OnLeave(self)

	local tooltip = nil;
	
	if not Engine.Profile.overlay.elvtukoverride then
		--get tooltip from elvui
		tooltip = mod.ElvDT.tooltip;	
	else
		--get our tooltip
		tooltip = mod.datatext.tooltip;		
	end
	
	mod.datatext:OnLeave(self,tooltip);
	
end

--initialize module registering in ElvUI the datatext
function mod:OnInitialize()

	--get ElvUI datatext module
	local E = select(1,unpack(ElvUI));	
	mod.ElvDT = E:GetModule('DataTexts')
	
	--store our generic datatext module
	mod.datatext = Engine.AddOn:GetModule("datatext");
	
	--register in ElvUI
	mod.ElvDT:RegisterDatatext(L["CONFIG_NAME"], { "PLAYER_ENTERING_WORLD" } , mod.OnEvent, mod.OnUpdate, mod.OnClick,mod.OnEnter,mod.OnLeave);
	
	debug("ElvUI DataText registered");
	
end
