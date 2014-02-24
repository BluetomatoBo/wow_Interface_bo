local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local VUF = E:GetModule('VerticalUnitFrames');
local UF = E:GetModule('UnitFrames');

function VUF:ConstructPlayerFrame(frame,unit)
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
		frame.ClassBar = 'EclipseBar'
	end

	if E.myclass == "WARLOCK" then
		frame.ShardBar = self:ConstructShardBar(frame)
		frame.ClassBar = 'ShardBar'
	end

	if E.myclass == "PALADIN" then
		frame.HolyPower = self:ConstructHolyPower(frame)
		frame.ClassBar = 'HolyPower'
	end

	if E.myclass == "DEATHKNIGHT" then
		frame.Runes = self:ConstructRunes(frame)
		frame.ClassBar = 'Runes'
	end

	if E.myclass == "MONK" then
		frame.Harmony = self:ConstructHarmony(frame)
		frame.ClassBar = 'Harmony'
	end

	if E.myclass == "PRIEST" then
		frame.ShadowOrbs = self:ConstructShadowOrbBar(frame)
		frame.ClassBar = 'ShadowOrbs'
	end

	if E.myclass == "MAGE" then
		frame.ArcaneChargeBar = self:ConstructArcaneBar(frame)
		frame.ClassBar = 'ArcaneChargeBar'
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
	frame.Portrait = self:ConstructPortrait(frame)
	frame.ResurrectIcon = self:ConstructResurrectIcon(frame)
	frame:SetAlpha(self.db.alpha)

    frame:Point("RIGHT", E.UIParent, "CENTER", -275, 0) --Set to default position 
    E:CreateMover(frame, frame:GetName()..'Mover', 'Player Vertical Unit Frame', nil, nil, nil, 'ALL,SOLO')
end

