local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

--Lua functions
local _G = _G
local strjoin = strjoin

local displayString = ""
local inRestrictedArea = false

local function Update(self, elapsed)
	if inRestrictedArea or not E.MapInfo.coordsWatching then return end

	self.timeSinceUpdate = (self.timeSinceUpdate or 0) + elapsed

	if self.timeSinceUpdate > 0.1 then
		self.text:SetFormattedText(displayString, E.MapInfo.xText or 0, E.MapInfo.yText or 0)
		self.timeSinceUpdate = 0
	end
end

local function OnEvent(self)
	E:MapInfo_Update()

	if E.MapInfo.x and E.MapInfo.y then
		inRestrictedArea = false
		self.text:SetFormattedText(displayString, E.MapInfo.xText or 0, E.MapInfo.yText or 0)
	else
		inRestrictedArea = true
		self.text:SetText('')
	end
end

local function Click()
	_G.ToggleFrame(_G.WorldMapFrame)
end

local function ValueColorUpdate(hex)
	displayString = strjoin("", hex, "%.2f|r", " , ", hex, "%.2f|r")
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext('Coords', {"ZONE_CHANGED","ZONE_CHANGED_INDOORS","ZONE_CHANGED_NEW_AREA"}, OnEvent, Update, Click, nil, nil, L["Coords"])
