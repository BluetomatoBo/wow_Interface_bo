if not IsAddOnLoaded( "ElvUI" )  then return; end

local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local DT = E:GetModule('DataTexts')

local message = [[
|cffff2020The AddOn|r |cff1784d1ElvUI Meter Overlay|r|cffff2020 is discontinued.

Please download the new improved version, with more features:|r 

|cffffffffCecile|r_|cfffff569MeterOverlay|r
]];

local function ShowMessage()

	if( not StaticPopupDialogs["ElvUI_MeterOverlayMSG"]) then
	
		StaticPopupDialogs["ElvUI_MeterOverlayMSG"] = {
			text = message,
			button1 = "Ok",
			whileDead = 1,
			hideOnEscape = 1,
			timeout = 0,
			preferredIndex = STATICPOPUP_NUMDIALOGS,
		}
	end
	
	StaticPopup_Show("ElvUI_MeterOverlayMSG");
	
end

local messageShow = false;

local function OnEvent(self, event, ...)

	if (not messageShow) then
		ShowMessage();
		messageShow = true;
	end
	
end


local function OnUpdate(self, t)
	self.text:SetFormattedText("Disabled");
end

local function OnEnter(self)

	DT:SetupTooltip(self)
	DT.tooltip:AddLine(message)
	DT.tooltip:Show()

end

function OnLeave(self)
	DT.tooltip:Hide();
end

local function OnClick(self,btn)
	ShowMessage();
end

--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc)

	name - name of the datatext (required)
	events - must be a table with string values of event names to register
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
]]
DT:RegisterDatatext('Damage Meter Overlay', { "PLAYER_ENTERING_WORLD" }, OnEvent, OnUpdate, OnClick,OnEnter,OnLeave)