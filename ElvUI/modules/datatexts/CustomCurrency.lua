local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

--Cache global variables
--Lua functions
local select, pairs = select, pairs
local format = string.format
--WoW API / Variables
local GetCurrencyInfo = GetCurrencyInfo

local CustomCurrencies = {}
local CurrencyListNameToIndex = {}
local currency, currencyAmount

local function OnEvent(self)
	currency = CustomCurrencies[self.name]
	if currency then
		currencyAmount = select(2, GetCurrencyInfo(currency.ID))
		if currency.DISPLAY_STYLE == "ICON" then
			self.text:SetFormattedText("%s %d", currency.ICON, currencyAmount)
		elseif currency.DISPLAY_STYLE == "ICON_TEXT" then
			self.text:SetFormattedText("%s %s %d", currency.ICON, currency.NAME, currencyAmount)
		else --ICON_TEXT_ABBR
			self.text:SetFormattedText("%s %s %d", currency.ICON, E:AbbreviateString(currency.NAME), currencyAmount)
		end
	end
end

local function OnEnter(self)
	local index = CurrencyListNameToIndex[self.name]
	if not index then return; end

	DT:SetupTooltip(self)
	DT.tooltip:SetCurrencyToken(index)
	DT.tooltip:Show()
end

local function AddCurrencyNameToIndex(name)
	for index = 1, GetCurrencyListSize() do
		local currencyName = GetCurrencyListInfo(index)
		if currencyName == name then
			CurrencyListNameToIndex[name] = index
			break;
		end
	end
end

local function RegisterNewDT(currencyID)
	local name, _, icon = GetCurrencyInfo(currencyID)

	if name then
		--Add to internal storage, stored with name as key
		CustomCurrencies[name] = {NAME = name, ID = currencyID, ICON = format("\124T%s:%d:%d:0:0:64:64:4:60:4:60\124t", icon, 16, 16), DISPLAY_STYLE = "ICON"}
		--Register datatext
		DT:RegisterDatatext(name, {'PLAYER_ENTERING_WORLD', 'CHAT_MSG_CURRENCY', 'CURRENCY_DISPLAY_UPDATE'}, OnEvent, nil, nil, (E.global.datatexts.useCustomCurrencyTooltip and OnEnter or nil))
		--Save info to persistent storage, stored with ID as key
		E.global.datatexts.customCurrencies[currencyID] = CustomCurrencies[name]
		--Get the currency index for this currency, so we can use it for a tooltip
		AddCurrencyNameToIndex(name)
	end
end

function DT:RegisterCustomCurrencyDT(currencyID)
	if currencyID then
		--We added a new datatext through the config
		RegisterNewDT(currencyID)
	else
		--We called this in DT:Initialize, so load all the stored currency datatexts
		for currencyID, info in pairs(E.global.datatexts.customCurrencies) do
			CustomCurrencies[info.NAME] = {NAME = info.NAME, ID = info.ID, ICON = info.ICON, DISPLAY_STYLE = info.DISPLAY_STYLE}
			DT:RegisterDatatext(info.NAME, {'PLAYER_ENTERING_WORLD', 'CHAT_MSG_CURRENCY', 'CURRENCY_DISPLAY_UPDATE'}, OnEvent, nil, nil, (E.global.datatexts.useCustomCurrencyTooltip and OnEnter or nil))
			--Get the currency index for this currency, so we can use it for a tooltip
			AddCurrencyNameToIndex(info.NAME)
		end
	end
end

function DT:SetCustomCurrencyDisplayStyle(name, displayStyle)
	if not name or not displayStyle then return; end

	CustomCurrencies[name].DISPLAY_STYLE = displayStyle
end

function DT:RemoveCustomCurrency(name)
	--Remove from internal storage
	CustomCurrencies[name] = nil
end