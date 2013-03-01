local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');
local UF = E:GetModule('UnitFrames');

function H:ConstructTargetFrame(frame,unit)
    frame.unit = unit
    frame.Health = self:ConstructHealth(frame)

    frame.Power = self:ConstructPower(frame)

    frame.Castbar = self:ConstructCastbar(frame)
    frame.Castbar.SafeZone = nil
    frame.Name = self:ConstructName(frame)
    
    frame.Buffs = self:ConstructBuffs(frame)
    frame.Debuffs = self:ConstructDebuffs(frame)
    frame.DummyAuraBars = self:ConstructAuraBarHeader(frame)
    frame:DisableElement('AuraBars') -- disable it until its configured

    if E.myclass == "DRUID" or E.myclass == "ROGUE" then
        frame.CPoints = self:ConstructComboPoints(frame)
    end

    frame.RaidIcon = self:ConstructRaidIcon(frame)
    
    frame:SetAlpha(self.db.alpha)
    H:HideOOC(frame)
    frame:Point("RIGHT", E.UIParent, "CENTER", 275, 0) --Set to default position
    E:CreateMover(frame, frame:GetName()..'Mover', 'Target Hud Frame', nil, nil, nil, 'ALL,SOLO')
end
