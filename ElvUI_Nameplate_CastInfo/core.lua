-- Idea taken from KuiNameplates by Kesava

local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local NPCI = E:NewModule('CastInfo', 'AceEvent-3.0')
local NP = E:GetModule('NamePlates')

local 	strsplit, pairs = 
		strsplit, pairs
local bband = bit.band

local warningEvents = {
	['SPELL_CAST_START']    = true,
	['SPELL_CAST_SUCCESS']  = true,
	['SPELL_INTERRUPT']     = true,
	['SPELL_HEAL']          = true,
	['SPELL_PERIODIC_HEAL'] = true
}

local function SetCW(self, spellName, spellSchool)
	self.CW.ag:Stop()

	if	spellName == nil then
		-- hide the warning instantly when interrupted  (not sure if working)
		self.CW:SetAlpha(0)
	else
		local col = COMBATLOG_DEFAULT_COLORS.schoolColoring[spellSchool] or
			{r = 1, g = 1, b = 1}

		self.CW:SetText(spellName)
		self.CW:SetTextColor(col.r, col.g, col.b)
		self.CW:SetAlpha(1)

		self.CW.ag:Play()
	end
end

local function SetHW(self, amount)
	if amount == 0 then return end
	self.HW.ag:Stop()

	if amount > 0 then
		-- healing
		amount = '+'..amount
		self.HW:SetTextColor(0, 1, 0)
	end
	
	self.HW:SetText(amount)

	self.HW:SetAlpha(1)
	self.HW.ag.fade:SetEndDelay(.5)

	self.HW.ag:Play()
end

function NPCI:SearchNameplateByName(sourceName)
	if not sourceName then return; end
	local SearchFor = strsplit("-", sourceName)
	for frame, _ in pairs(NP.Handled) do
		frame = _G[frame]:GetChildren()
		if frame and frame:IsVisible() and frame.hp.name:GetText() == SearchFor then --and frame.isPlayer then
			return frame
		end
	end
end

function NPCI:WEvent(...)
	local castTime, event, _, guid, name, srcFlags, _, targetGUID, targetName
		= ...
	if not (bband(srcFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) == COMBATLOG_OBJECT_CONTROL_PLAYER) then return end
	
	if warningEvents[event] then
		if	event == 'SPELL_HEAL' or
			event == 'SPELL_PERIODIC_HEAL'
		then
			-- Only searching by name atm
			guid, name = targetGUID, targetName
		end
		
		--guid, name = UnitGUID('target'), GetUnitName('target')
		local frame = NPCI:SearchNameplateByName(name)
		
		if frame then
			local spName, spSch = select(13, ...)

			if	event == 'SPELL_HEAL' or
				event == 'SPELL_PERIODIC_HEAL'
			then
				local amount = select(15, ...)
				frame:SetHW(amount)
			elseif event == 'SPELL_INTERRUPT' then
				--Not sure if working with current events
				frame:SetCW(nil)
			else
				frame:SetCW(spName, spSch)
			end
		end
	end
end







local NPCIFrame = CreateFrame('Frame', 'NPCI')
	NPCIFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	NPCIFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	
	NPCIFrame:SetScript("OnEvent",function(self, event, ...)
		if event == "PLAYER_ENTERING_WORLD" then
			hooksecurefunc(NP, "SkinPlate", NP.CreateWarning)
		end
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			NPCI:WEvent(...)
		end
	NPCIFrame:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)

function NP:CreateWarning(frame)
		-- for spells/abilities
		if frame.CW then return end
		frame.CW = frame:CreateFontString(nil, 'ARTWORK')
		frame.CW:FontTemplate(nil, 9, 'OUTLINE')
		frame.CW:SetParent(frame.hp)
		frame.CW:SetPoint('TOPLEFT', frame.hp, 'BOTTOMLEFT', 0, 2)
		--frame.CW:SetText("cast")
		frame.CW:Hide()

		frame.CW.ag 	= frame.CW:CreateAnimationGroup()
		frame.CW.fade	= frame.CW.ag:CreateAnimation('Alpha')
		frame.CW.fade:SetSmoothing('IN')
		frame.CW.fade:SetDuration(3)
		frame.CW.fade:SetChange(-1)

		frame.CW.ag:SetScript('OnPlay', function(self)
			self:GetParent():Show()
		end)
		
		frame:HookScript('OnHide', function(self)
			self.CW:SetText("")
		end)

		frame.CW.ag:SetScript('OnFinished', function(self)
			self:Stop()
			self:GetParent():Hide()
		end)

		-- For healing
		if frame.HW then return end
		frame.HW = frame:CreateFontString(nil, 'OVERLAY')
		frame.HW:FontTemplate(nil, 9, 'OUTLINE')
		frame.HW:SetParent(frame.hp)
		frame.HW:SetPoint('TOPRIGHT', frame.hp, 'BOTTOMRIGHT', 0, 2)
		--frame.HW:SetText("heal")
		frame.HW:Hide()

		frame.HW.ag 	 = frame.HW:CreateAnimationGroup()
		frame.HW.ag.fade = frame.HW.ag:CreateAnimation('Alpha')
		frame.HW.ag.fade:SetSmoothing('IN')
		frame.HW.ag.fade:SetDuration(.5)
		frame.HW.ag.fade:SetChange(-.5)

		frame.HW.ag:SetScript('OnPlay', function(self)
			self:GetParent():Show()
		end)

		frame.HW.ag:SetScript('OnFinished', function(self)
			if self.fade:GetEndDelay() > 0 then
				-- fade out fully
				self:GetParent():SetAlpha(.5)
				self.fade:SetEndDelay(0)
				self:Play()
			else
				self:GetParent():Hide()
			end
		end)

		-- handlers
		frame.SetCW = SetCW
		frame.SetHW = SetHW
end

E:RegisterModule(NPCI:GetName())