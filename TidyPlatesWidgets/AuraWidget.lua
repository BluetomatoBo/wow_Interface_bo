

TidyPlatesWidgets.DebuffWidgetBuild = 2

local PlayerGUID = UnitGUID("player")
local PolledHideIn = TidyPlatesWidgets.PolledHideIn
local FilterFunction = function() return 1 end
local AuraMonitor = CreateFrame("Frame")
local WatcherIsEnabled = false
local WidgetList, WidgetGUID = {}, {}

local UpdateWidget

local TargetOfGroupMembers = {}
local DebuffColumns = 3
local DebuffLimit = 6
local inArena = false

local GetCombatEventResults = TidyPlatesUtility.GetCombatEventResults

local function DefaultPreFilterFunction() return true end
local function DefaultFilterFunction(aura, unit) if aura and aura.duration and (aura.duration < 30) then return true end end

local AuraPrefilterFunction = DefaultPreFilterFunction
local AuraFilterFunction = DefaultFilterFunction
local AuraHookFunction

local AURA_TARGET_HOSTILE = 1
local AURA_TARGET_FRIENDLY = 2

local AURA_TYPE_BUFF = 1
local AURA_TYPE_DEBUFF = 6

local _

local AuraType_Index = {
	["Buff"] = 1,
	["Curse"] = 2,
	["Disease"] = 3,
	["Magic"] = 4,
	["Poison"] = 5,
	["Debuff"] = 6,
}

local function SetFilter(func)
	if func and type(func) == "function" then
		FilterFunction = func
	end
end

local function GetAuraWidgetByGUID(guid)
	if guid then return WidgetGUID[guid] end
end

local function IsAuraShown(widget, aura)
		if widget and widget:IsShown() then
			return true
		end
end



local PlayerDispelCapabilities = {
	["Curse"] = false,
	["Disease"] = false,
	["Magic"] = false,
	["Poison"] = false,
}


local function UpdatePlayerDispelTypes()
	PlayerDispelCapabilities["Curse"] = IsSpellKnown(51886) or IsSpellKnown(475) or IsSpellKnown(2782)
	PlayerDispelCapabilities["Poison"] = IsSpellKnown(2782) or IsSpellKnown(32375) or IsSpellKnown(4987) or (IsSpellKnown(527) and IsSpellKnown(33167))
	PlayerDispelCapabilities["Magic"] = (IsSpellKnown(4987) and IsSpellKnown(53551)) or (IsSpellKnown(2782) and IsSpellKnown(88423)) or (IsSpellKnown(527) and IsSpellKnown(33167)) or (IsSpellKnown(51886) and IsSpellKnown(77130)) or IsSpellKnown(32375)
	PlayerDispelCapabilities["Disease"] = IsSpellKnown(4987) or IsSpellKnown(528)
end

local function CanPlayerDispel(debuffType)
	return PlayerDispelCapabilities[debuffType or ""]
end


-----------------------------------------------------
-- Default Filter
-----------------------------------------------------
local function DefaultFilterFunction(debuff)
	if (debuff.duration < 600) then
		return true
	end
end


-----------------------------------------------------
-- General Events
-----------------------------------------------------


local function EventUnitAura(unitid)
	local frame 

	if unitid then frame = WidgetList[unitid] end

	if frame then UpdateWidget(frame) end

end



-----------------------------------------------------
-- Function Reference Lists
-----------------------------------------------------

local AuraEvents = {
	--["UNIT_TARGET"] = EventUnitTarget,
	["UNIT_AURA"] = EventUnitAura,
}

local function AuraEventHandler(frame, event, ...)
	local unitid = ...

	if event then
		local eventFunction = AuraEvents[event]
		eventFunction(...)
	end

end

-------------------------------------------------------------
-- Widget Object Functions
-------------------------------------------------------------

local function UpdateWidgetTime(frame, expiration)
	if expiration == 0 then
		frame.TimeLeft:SetText("")
	else
		local timeleft = expiration-GetTime()
		if timeleft > 60 then
			frame.TimeLeft:SetText(floor(timeleft/60).."m")
		else
			frame.TimeLeft:SetText(floor(timeleft))
			--frame.TimeLeft:SetText(floor(timeleft*10)/10)
		end
	end
end


local function UpdateIcon(frame, texture, expiration, stacks, r, g, b)
	if frame and texture and expiration then
		-- Icon
		frame.Icon:SetTexture(texture)

		-- Stacks
		if stacks and stacks > 1 then frame.Stacks:SetText(stacks)
		else frame.Stacks:SetText("") end

		-- Highlight Coloring
		if r then
			frame.Highlight:SetVertexColor(r, g or 1, b or 1)
			frame.Highlight:Show()
			frame.Border:Hide()
		else frame.Highlight:Hide(); frame.Border:Show()	end

		-- Expiration
		UpdateWidgetTime(frame, expiration)
		frame:Show()
		if expiration ~= 0 then PolledHideIn(frame, expiration) end

	elseif frame then
		PolledHideIn(frame, 0)
	end
end


local function AuraSortFunction(a,b) 
	return a.priority < b.priority 
end


local function UpdateIconGrid(frame, unitid)

		if not unitid then return end

		local unitReaction
		if UnitIsFriend("player", unitid) then unitReaction = AURA_TARGET_FRIENDLY
		else unitReaction = AURA_TARGET_HOSTILE end

		local AuraIconFrames = frame.AuraIconFrames
		local storedAuras = {}
		local storedAuraCount = 0

		-- Cache displayable auras
		------------------------------------------------------------------------------------------------------
		-- This block will go through the auras on the unit and make a list of those that should
		-- be displayed, listed by priority.
		local auraIndex = 0
		local moreAuras = true

		local searchedDebuffs, searchedBuffs = false, false
		local auraFilter = "HARMFUL"

		--print(UnitName(unitid), unitid )
		repeat 

			auraIndex = auraIndex + 1

			local aura = {}

			do
				local name, _, icon, stacks, auraType, duration, expiration, caster, _, _, spellid = UnitAura(unitid, auraIndex, auraFilter)		-- UnitaAura
			
				aura.name = name
				aura.texture = icon
				aura.stacks = stacks
				aura.type = auraType
				aura.effect = auraFilter
				aura.duration = duration
				aura.reaction = unitReaction
				aura.expiration = expiration
				aura.caster = caster
				aura.spellid = spellid
				aura.unit = unitid 		-- unitid of the plate
			end
			

			-- Auras are evaluated by an external function
			-- Pre-filtering before the icon grid is populated
			if aura.name then
				local show, priority, r, g, b = AuraFilterFunction(aura)
				--print(aura.name, show, priority)
				--show = true
				-- Store Order/Priority
				if show then

					aura.priority = priority or 10
					aura.r, aura.g, aura.b = r, g, b

					storedAuraCount = storedAuraCount + 1
					storedAuras[storedAuraCount] = aura
				end
			else
				if auraFilter == "HARMFUL" then 
					searchedDebuffs = true 
					auraFilter = "HELFUL"
					auraIndex = 0
				else
					searchedBuffs = true
				end
			end

		until (searchedDebuffs and searchedBuffs)


		-- Display Auras
		------------------------------------------------------------------------------------------------------
		local AuraSlotCount = 1
		if storedAuraCount > 0 then
			frame:Show()
			sort(storedAuras, AuraSortFunction)

			for index = 1,  storedAuraCount do
				if AuraSlotCount > DebuffLimit then break end
				local aura = storedAuras[index]
				if aura.spellid and aura.expiration then

					UpdateIcon(AuraIconFrames[AuraSlotCount], aura.texture, aura.expiration, aura.stacks, aura.r, aura.g, aura.b)
					AuraSlotCount = AuraSlotCount + 1
					frame.currentAuraCount = index
				end
			end

		end

		-- Clear Extra Slots
		for AuraSlotEmpty = AuraSlotCount, DebuffLimit do UpdateIcon(AuraIconFrames[AuraSlotEmpty]) end

end

function UpdateWidget(frame)
		local unitid = frame.unitid

		UpdateIconGrid(frame, unitid)

--[[
		if frame.currentAuraCount ~= frame.previousAuraCount then
			frame.previousAuraCount = frame.currentAuraCount
			--TidyPlates:RequestDelegateUpdate()		-- Delegate Update, For Debuff Widget-Controlled Scale and Opacity Functions
			--TidyPlates:RequestDelegateUpdate(frame:GetParent().PlateParent)		-- Delegate Update, For Debuff Widget-Controlled Scale and Opacity Functions
		end
		--]]
end

-- Context Update (mouseover, target change)
local function UpdateWidgetContext(frame, unit)
	local unitid = unit.unitid
	frame.unitid = unitid

	WidgetList[unitid] = frame

	UpdateWidget(frame)
end

local function ClearWidgetContext(frame)
	
	-- fix me!
	--WidgetList[frame.unitid] = nil
end

local function ExpireFunction(icon)
	UpdateWidget(icon.Parent)
end

-------------------------------------------------------------
-- Widget Frames
-------------------------------------------------------------
local WideArt = "Interface\\AddOns\\TidyPlatesWidgets\\Aura\\AuraFrameWide"
local SquareArt = "Interface\\AddOns\\TidyPlatesWidgets\\Aura\\AuraFrameSquare"
local WideHighlightArt = "Interface\\AddOns\\TidyPlatesWidgets\\Aura\\AuraFrameHighlightWide"
local SquareHighlightArt = "Interface\\AddOns\\TidyPlatesWidgets\\Aura\\AuraFrameHighlightSquare"
local AuraFont = "FONTS\\ARIALN.TTF"

local function Enable()
	AuraMonitor:SetScript("OnEvent", AuraEventHandler)

	for event in pairs(AuraEvents) do AuraMonitor:RegisterEvent(event) end

	TidyPlatesUtility:EnableGroupWatcher()
	WatcherIsEnabled = true

	if not TidyPlatesWidgetData.CachedAuraDurations then
		TidyPlatesWidgetData.CachedAuraDurations = {}
	end
end

local function Disable()
	AuraMonitor:SetScript("OnEvent", nil)
	AuraMonitor:UnregisterAllEvents()
	WatcherIsEnabled = false
end

-- Create a Wide Aura Icon
local function CreateWideAuraIconFrame(parent)
	local frame = CreateFrame("Frame", nil, parent)
	frame.unit = nil
	frame.Parent = parent
	frame:SetWidth(26.5); frame:SetHeight(14.5)
	-- Icon
	frame.Icon = frame:CreateTexture(nil, "BACKGROUND")
	frame.Icon:SetAllPoints(frame)
	--frame.Icon:SetTexCoord(.07, 1-.07, .23, 1-.23)  -- obj:SetTexCoord(left,right,top,bottom)
	frame.Icon:SetTexCoord(.07, 1-.07, .23, 1-.23)  -- obj:SetTexCoord(left,right,top,bottom)
	-- Border
	frame.Border = frame:CreateTexture(nil, "ARTWORK")
	frame.Border:SetWidth(32); frame.Border:SetHeight(32)
	frame.Border:SetPoint("CENTER", 1, -2)
	frame.Border:SetTexture(WideArt)
	-- Highlight
	frame.Highlight = frame:CreateTexture(nil, "ARTWORK")
	frame.Highlight:SetAllPoints(frame.Border)
	frame.Highlight:SetTexture(WideHighlightArt)
	--  Time Text
	frame.TimeLeft = frame:CreateFontString(nil, "OVERLAY")
	frame.TimeLeft:SetFont(AuraFont ,9, "OUTLINE")
	frame.TimeLeft:SetShadowOffset(1, -1)
	frame.TimeLeft:SetShadowColor(0,0,0,1)
	frame.TimeLeft:SetPoint("RIGHT", 0, 8)
	frame.TimeLeft:SetWidth(26)
	frame.TimeLeft:SetHeight(16)
	frame.TimeLeft:SetJustifyH("RIGHT")
	--  Stacks
	frame.Stacks = frame:CreateFontString(nil, "OVERLAY")
	frame.Stacks:SetFont(AuraFont,10, "OUTLINE")
	frame.Stacks:SetShadowOffset(1, -1)
	frame.Stacks:SetShadowColor(0,0,0,1)
	frame.Stacks:SetPoint("RIGHT", 0, -6)
	frame.Stacks:SetWidth(26)
	frame.Stacks:SetHeight(16)
	frame.Stacks:SetJustifyH("RIGHT")
	-- Information about the currently displayed aura
	frame.AuraInfo = {
		Name = "",
		Icon = "",
		Stacks = 0,
		Expiration = 0,
		Type = "",
	}
	--frame.Poll = UpdateWidgetTime
	frame.Expire = ExpireFunction
	-- UpdateWidget(frame)
	frame.Poll = parent.PollFunction
	frame:Hide()
	return frame
end


-- Create a Square Aura Icon
local function CreateSquareAuraIconFrame(parent)
	local frame = CreateFrame("Frame", nil, parent)
	frame.Parent = parent
	frame:SetWidth(16.5); frame:SetHeight(14.5)
	-- Icon
	frame.Icon = frame:CreateTexture(nil, "BACKGROUND")
	frame.Icon:SetAllPoints(frame)
	frame.Icon:SetTexCoord(.10, 1-.07, .12, 1-.12)  -- obj:SetTexCoord(left,right,top,bottom)
	-- Border
	frame.Border = frame:CreateTexture(nil, "ARTWORK")
	frame.Border:SetWidth(32); frame.Border:SetHeight(32)
	frame.Border:SetPoint("CENTER", 0, -2)
	frame.Border:SetTexture(SquareArt)
	-- Highlight
	frame.Highlight = frame:CreateTexture(nil, "ARTWORK")
	frame.Highlight:SetAllPoints(frame.Border)
	frame.Highlight:SetTexture(SquareHighlightArt)
	--  Time Text
	frame.TimeLeft = frame:CreateFontString(nil, "OVERLAY")
	frame.TimeLeft:SetFont(AuraFont ,9, "OUTLINE")
	frame.TimeLeft:SetShadowOffset(1, -1)
	frame.TimeLeft:SetShadowColor(0,0,0,1)
	frame.TimeLeft:SetPoint("RIGHT", 0, 8)
	frame.TimeLeft:SetWidth(26)
	frame.TimeLeft:SetHeight(16)
	frame.TimeLeft:SetJustifyH("RIGHT")
	--  Stacks
	frame.Stacks = frame:CreateFontString(nil, "OVERLAY")
	frame.Stacks:SetFont(AuraFont,10, "OUTLINE")
	frame.Stacks:SetShadowOffset(1, -1)
	frame.Stacks:SetShadowColor(0,0,0,1)
	frame.Stacks:SetPoint("RIGHT", 0, -6)
	frame.Stacks:SetWidth(26)
	frame.Stacks:SetHeight(16)
	frame.Stacks:SetJustifyH("RIGHT")
	-- Information about the currently displayed aura
	frame.AuraInfo = {
		Name = "",
		Icon = "",
		Stacks = 0,
		Expiration = 0,
		Type = "",
	}
	--frame.Poll = UpdateWidgetTime
	frame.Expire = ExpireFunction
	frame.Poll = parent.PollFunction
	frame:Hide()
	return frame
end

local CreateIconFrame = CreateWideAuraIconFrame

-- Create the Main Widget Body and Icon Array
local function CreateAuraWidget(parent, style)
	--if not WatcherIsEnabled then Enable() end
	-- Create Base frame
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetWidth(128); frame:SetHeight(32); frame:Show()
	-- Create Icon Array
	frame.PollFunction = UpdateWidgetTime
	frame.AuraIconFrames = {}
	local AuraIconFrames = frame.AuraIconFrames

	for index = 1, DebuffLimit do AuraIconFrames[index] = CreateIconFrame(frame);  end
	-- Set Anchors
	AuraIconFrames[1]:SetPoint("LEFT", frame)
	for index = 2, DebuffColumns do AuraIconFrames[index]:SetPoint("LEFT", AuraIconFrames[index-1], "RIGHT", 5, 0) end
	AuraIconFrames[DebuffColumns+1]:SetPoint("BOTTOMLEFT", AuraIconFrames[1], "TOPLEFT", 0, 8)
	for index = (DebuffColumns+2), DebuffLimit do AuraIconFrames[index]:SetPoint("LEFT", AuraIconFrames[index-1], "RIGHT", 5, 0) end
	-- Functions
	frame._Hide = frame.Hide
	frame.Hide = function() ClearWidgetContext(frame); frame:_Hide() end
	--frame:SetScript("OnHide", function() for index = 1, 4 do PolledHideIn(AuraIconFrames[index], 0) end end)
	frame.Filter = nil
	frame.UpdateContext = UpdateWidgetContext
	frame.Update = UpdateWidgetContext
	frame.UpdateTarget = UpdateWidgetTarget
	return frame
end

local function UseSquareDebuffIcon()
	CreateIconFrame = CreateSquareAuraIconFrame
	DebuffColumns = 5
	DebuffLimit = DebuffColumns * 2
	TidyPlates:ForceUpdate()
end

local function UseWideDebuffIcon()
	CreateIconFrame = CreateWideAuraIconFrame
	DebuffColumns = 3
	DebuffLimit = DebuffColumns * 2
	TidyPlates:ForceUpdate()
end

local function SetPrefilter(func)
	if func and type(func) == 'function' then
		AuraPrefilterFunction = func or DefaultPrefilterFunction
	end
end

local function SetAuraFilter(func)
	if func and type(func) == 'function' then
		AuraFilterFunction = func
	end
end

local function SetAuraHook(func)
	if func and type(func) == 'function' then
		AuraHookFunction = func
	end
end

-----------------------------------------------------
-- External
-----------------------------------------------------
TidyPlatesWidgets.GetAuraWidgetByGUID = GetAuraWidgetByGUID
TidyPlatesWidgets.IsAuraShown = IsAuraShown
TidyPlatesWidgets.CanPlayerDispel = CanPlayerDispel

TidyPlatesWidgets.UseSquareDebuffIcon = UseSquareDebuffIcon
TidyPlatesWidgets.UseWideDebuffIcon = UseWideDebuffIcon
TidyPlatesWidgets.SetAuraPrefilter = SetPrefilter
TidyPlatesWidgets.SetDebuffPrefilter = SetPrefilter				-- Will be deprecated; "Debuff" is now "Aura"
TidyPlatesWidgets.SetAuraFilter = SetAuraFilter
TidyPlatesWidgets.SetAuraHook = SetAuraHook

TidyPlatesWidgets.CreateAuraWidget = CreateAuraWidget

TidyPlatesWidgets.EnableAuraWatcher = Enable
TidyPlatesWidgets.EnableAuraWatcherTargetOnly = EnableForTargetOnly
TidyPlatesWidgets.DisableAuraWatcher = Disable


