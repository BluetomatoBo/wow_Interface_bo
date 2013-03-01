local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');
local UF = E:GetModule('UnitFrames');

function H:ConstructPlayerFrame(frame,unit)
	frame.unit = unit
	frame.Health = self:ConstructHealth(frame)

	frame.Power = self:ConstructPower(frame)

	frame.Castbar = self:ConstructCastbar(frame)
	frame.Castbar.LatencyTexture:Show()

	frame.Name = self:ConstructName(frame)
		
	frame.DummyAuraBars = self:ConstructAuraBarHeader(frame)
	frame:DisableElement('AuraBars') -- disable it until its configured

	if E.myclass == "DRUID" then
		frame.EclipseBar = self:ConstructEclipseBar(frame)
		frame.WildMushroom = self:ConstructWildMushroomBar(frame)
	end

	if E.myclass == "WARLOCK" then
		frame.WarlockSpecBars = self:ConstructWarlockSpecBars(frame)
	end

	if E.myclass == "PALADIN" then
		frame.HolyPower = self:ConstructHolyPower(frame)
	end

	if E.myclass == "DEATHKNIGHT" then
		frame.Runes = self:ConstructRunes(frame)
	end

	if E.myclass == "SHAMAN" then
		frame.TotemBar = self:ConstructTotems(frame)
	end

	if E.myclass == "MONK" then
		frame.Harmony = self:ConstructHarmony(frame)
	end

	if E.myclass == "PRIEST" then
		frame.ShadowOrbsBar = self:ConstructShadowOrbBar(frame)
	end

	if E.myclass == "MAGE" then
		frame.ArcaneChargeBar = self:ConstructArcaneBar(frame)
	end

	if E.myclass == "ROGUE" or E.myclass == "DRUID" then
		frame.CPoints = self:ConstructComboPoints(frame)
	end
	
	frame.Buffs = self:ConstructBuffs(frame)
    frame.Debuffs = self:ConstructDebuffs(frame)
	frame.RaidIcon = self:ConstructRaidIcon(frame)
	frame.Resting = self:ConstructRestingIndicator(frame)
	frame.Combat = self:ConstructCombatIndicator(frame)
	frame.PvPText = self:ConstructPvPIndicator(frame)
	frame.HealPrediction = self:ConstructHealComm(frame)
	frame.GCD = self:ConstructGCD(frame)
	frame:SetAlpha(self.db.alpha)

    H:HideOOC(frame)
    frame:Point("RIGHT", E.UIParent, "CENTER", -275, 0) --Set to default position 
    E:CreateMover(frame, frame:GetName()..'Mover', 'Player Hud Frame', nil, nil, nil, 'ALL,SOLO')
end

