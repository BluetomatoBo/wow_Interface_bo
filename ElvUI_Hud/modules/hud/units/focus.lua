local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');

function H:ConstructFocusFrame(frame,unit)
    frame.unit = unit
    frame.Health = self:ConstructHealth(frame)

    frame.Name = self:ConstructName(frame)

    frame.Power = self:ConstructPower(frame)

    frame.Castbar = self:ConstructCastbar(frame)
    frame.Castbar.SafeZone = nil
    frame.RaidIcon = self:ConstructRaidIcon(frame)

    frame.Buffs = self:ConstructBuffs(frame)
    frame.Debuffs = self:ConstructDebuffs(frame)
    
    frame:SetAlpha(self.db.alpha)
    H:HideOOC(frame)
    frame:Point("BOTTOMLEFT", ElvUF_TargetTargetHud, "BOTTOMRIGHT", 110, 0)
    E:CreateMover(frame, frame:GetName()..'Mover', 'Focus Hud Frame', nil, nil, nil, 'ALL,SOLO')
end
