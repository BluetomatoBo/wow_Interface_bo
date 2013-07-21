local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

local displayString = '';
local lastPanel;
local self = lastPanel
local vengeance = GetSpellInfo(93098) or GetSpellInfo(76691)
local value, tooltip, tooltiptext
tooltip = CreateFrame("GameTooltip", "VengeanceTooltip", E.UIParent, "GameTooltipTemplate")
tooltiptext = _G[tooltip:GetName().."TextLeft2"]
tooltip:SetOwner(E.UIParent, "ANCHOR_NONE")
tooltiptext:SetText("")

local join = string.join
local match = string.match

local function OnEvent(self, event, ...)
	if VengeanceTooltip and not VengeanceTooltip:IsShown() then
		tooltiptext = _G[tooltip:GetName().."TextLeft2"]
		tooltip:SetOwner(E.UIParent, "ANCHOR_NONE")
		tooltiptext:SetText("")
	end
	
	local name = UnitAura("player", vengeance, nil, "PLAYER|HELPFUL")
	
	if name then
		tooltip:ClearLines()
		tooltip:SetUnitBuff("player", name)
		value = (tooltiptext:GetText() and tonumber(match(tostring(tooltiptext:GetText()), "%d+"))) or -1
	else
		value = 0
	end
	
	self.text:SetFormattedText(displayString, vengeance, value);
	lastPanel = self
end

local function ValueColorUpdate(hex, r, g, b)
	displayString = join("", "%s: ", hex, "%s|r")
	
	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc, onLeaveFunc)
	
	name - name of the datatext (required)
	events - must be a table with string values of event names to register 
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
	onLeaveFunc - function to fire OnLeave, if not provided one will be set for you that hides the tooltip.
]]
DT:RegisterDatatext("Vengeance", {"UNIT_AURA", "PLAYER_ENTERING_WORLD", "CLOSE_WORLD_MAP"}, OnEvent)