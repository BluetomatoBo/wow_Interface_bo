local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local A = E:GetModule('Auras');
local LSM = LibStub("LibSharedMedia-3.0")

local format = string.format
local twipe = table.wipe


A.DefaultIcons = {
	[1] = "Interface\\Icons\\Spell_Magic_GreaterBlessingofKings", -- Stats
	[2] = "Interface\\Icons\\Spell_Holy_WordFortitude", -- Stamina
	[3] = "Interface\\Icons\\INV_Misc_Horn_02", --Attack Power
	[4] = "Interface\\Icons\\INV_Helmet_08", --Attack Speed
	[5] = "Interface\\Icons\\Spell_Holy_MagicalSentry", --Spell Power
	[6] = "Interface\\Icons\\Spell_Shadow_SpectralSight", -- Spell Haste
	[7] = "Interface\\Icons\\ability_monk_prideofthetiger", -- Critical Strike
	[8] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofKings" --Mastery
}

function A:UpdateConsolidatedTime(elapsed)
	self.expiration = self.expiration - elapsed	
	if self.nextupdate > 0 then
		self.nextupdate = self.nextupdate - elapsed
		return
	end
	
	if(self.expiration <= 0) then
		self.timer:SetText("")
		self:SetScript("OnUpdate", nil)
		return
	end
	
	local timervalue, formatid
	timervalue, formatid, self.nextupdate = E:GetTimeInfo(self.expiration, 4)
	self.timer:SetFormattedText(("%s%s|r"):format(E.TimeColors[formatid], E.TimeFormats[formatid][1]), timervalue)
end

function A:UpdateReminder(event, unit)
	if (event == "UNIT_AURA" and unit ~= "player") then return end	
	local frame = self.frame
	for i = 1, NUM_LE_RAID_BUFF_TYPES do
		local spellName, rank, texture, duration, expirationTime, spellId, slot = GetRaidBuffTrayAuraInfo(i);
		local button = self.frame[i]
		
		if(spellName) then
			button.expiration = expirationTime - GetTime()
			button.duration = duration
			button.nextupdate = 0
			button.t:SetTexture(texture)

			if (duration == 0 and expirationTime == 0) or E.db.auras.consolidatedBuffs.durations ~= true then
				button.t:SetAlpha(0.3)
				button:SetScript('OnUpdate', nil)
				button.timer:SetText(nil)
				CooldownFrame_SetTimer(button.cd, 0, 0, 0)
			else
				CooldownFrame_SetTimer(button.cd, expirationTime - duration, duration, 1)
				button.t:SetAlpha(1)
				button:SetScript('OnUpdate', A.UpdateConsolidatedTime)
			end
			button.spellName = spellName
		else
			CooldownFrame_SetTimer(button.cd, 0, 0, 0)
			button.spellName = nil
			button.t:SetAlpha(1)
			button:SetScript('OnUpdate', nil)
			button.timer:SetText(nil)
			button.t:SetTexture(self.DefaultIcons[i])
		end
	end
end

function A:Button_OnEnter()
	GameTooltip:Hide()
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT", -3, self:GetHeight() + 2)
	GameTooltip:ClearLines()
	
	local parent = self:GetParent()
	local id = parent:GetID()
	if(parent.spellName) then
		GameTooltip:SetUnitConsolidatedBuff("player", id)
	else
		GameTooltip:AddLine(_G[("RAID_BUFF_%d"):format(id)])
	end
	
	GameTooltip:Show()
end

function A:Button_OnLeave()
	GameTooltip:Hide()
end

function A:CreateButton()
	local button = CreateFrame("Button", nil, ElvUI_ConsolidatedBuffs)
	button:SetTemplate('Default')
	
	button.t = button:CreateTexture(nil, "OVERLAY")
	button.t:SetTexCoord(unpack(E.TexCoords))
	button.t:SetInside()
	button.t:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
	
	button.cd = CreateFrame('Cooldown', nil, button, 'CooldownFrameTemplate')
	button.cd:SetInside()
	button.cd.noOCC = true;
	
	button.timer = button.cd:CreateFontString(nil, 'OVERLAY')
	button.timer:SetPoint('CENTER')
	
	return button
end

function A:EnableCB()
	ElvUI_ConsolidatedBuffs:Show()
	BuffFrame:RegisterUnitEvent('UNIT_AURA', "player")
	self:RegisterEvent("UNIT_AURA", 'UpdateReminder')
	self:RegisterEvent("GROUP_ROSTER_UPDATE", 'UpdateReminder');
	self:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED", 'UpdateReminder');
	E.RegisterCallback(self, "RoleChanged", "Update_ConsolidatedBuffsSettings")	
	self:UpdateReminder()
end

function A:DisableCB()
	ElvUI_ConsolidatedBuffs:Hide()
	BuffFrame:UnregisterEvent('UNIT_AURA')
	self:UnregisterEvent("UNIT_AURA")
	self:UnregisterEvent("GROUP_ROSTER_UPDATE");
	self:UnregisterEvent("PLAYER_SPECIALIZATION_CHANGED");
	E.UnregisterCallback(self, "RoleChanged", "Update_ConsolidatedBuffsSettings")	
end

local ignoreIcons = {}
function A:Update_ConsolidatedBuffsSettings(isCallback)
	local frame = self.frame
	frame:Width(E.ConsolidatedBuffsWidth)

	twipe(ignoreIcons)
	if E.db.auras.consolidatedBuffs.filter then
		if E.role == 'Caster' then
			ignoreIcons[3] = true -- it will never attempt to anchor here
			ignoreIcons[4] = 2
		else
			ignoreIcons[5] = 3
			ignoreIcons[6] = 4
		end
	end

	for i = 1, NUM_LE_RAID_BUFF_TYPES do
		local button = frame[i]
		button.t:SetAlpha(1)
		button:ClearAllPoints()
		button:Size(E.ConsolidatedBuffsWidth - (E.PixelMode and 1 or 4)) -- 4 needs to be 1
		
		if i == 1 then
			button:Point("TOP", ElvUI_ConsolidatedBuffs, "TOP", 0, -(E.PixelMode and 0 or 2))
		else
			button:Point("TOP", frame[ignoreIcons[i - 1] or (i - 1)], "BOTTOM", 0, (E.PixelMode and 1 or -1))
		end

		if i == NUM_LE_RAID_BUFF_TYPES then
			button:Point("BOTTOM", ElvUI_ConsolidatedBuffs, "BOTTOM", 0, (E.PixelMode and 0 or 2)) --2 needs to be 0
		end		

		if(ignoreIcons[i]) then
			button:Hide()
		else
			button:Show()
		end

		if(E.db.auras.consolidatedBuffs.durations) then
			button.cd:SetAlpha(1)
		else
			button.cd:SetAlpha(0)
		end
		
		local font = LSM:Fetch("font", E.db.auras.consolidatedBuffs.font)
		button.timer:FontTemplate(font, E.db.auras.consolidatedBuffs.fontSize, E.db.auras.consolidatedBuffs.fontOutline)	
		
		local buffIcon = _G[("ConsolidatedBuffsTooltipBuff%d"):format(i)]
		buffIcon:ClearAllPoints()
		buffIcon:SetAllPoints(frame[i])
		buffIcon:SetParent(frame[i])
		buffIcon:SetAlpha(0)
		buffIcon:SetScript("OnEnter", A.Button_OnEnter)
		buffIcon:SetScript("OnLeave", A.Button_OnLeave)		
	end
	
	if(not isCallback) then
		if E.db.auras.consolidatedBuffs.enable and E.private.general.minimap.enable then
			E:GetModule('Auras'):EnableCB()
		else
			E:GetModule('Auras'):DisableCB()
		end
	end
end

function A:Construct_ConsolidatedBuffs()
	local frame = CreateFrame('Frame', 'ElvUI_ConsolidatedBuffs', Minimap)
	frame:SetTemplate('Default')
	frame:Width(E.ConsolidatedBuffsWidth)
	frame:Point('TOPLEFT', Minimap.backdrop, 'TOPRIGHT', (E.PixelMode and -1 or 1), 0)
	frame:Point('BOTTOMLEFT', Minimap.backdrop, 'BOTTOMRIGHT', (E.PixelMode and -1 or 1), 0)
	self.frame = frame
	
	for i=1, NUM_LE_RAID_BUFF_TYPES do
		frame[i] = self:CreateButton()
		frame[i]:SetID(i)
	end
	
	self:Update_ConsolidatedBuffsSettings()
end

E:RegisterModule(A:GetName())