local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');

function H:ConstructTargetTargetFrame(frame,unit)
    frame.unit = unit
    frame.Health = self:ConstructHealth(frame)

    frame.Name = self:ConstructName(frame)

    frame.Power = self:ConstructPower(frame)
    frame.RaidIcon = self:ConstructRaidIcon(frame)

    frame.HealPrediction = self:ConstructHealComm(frame)
    
    frame:SetAlpha(self.db.alpha)
    H:HideOOC(frame)
    frame:Point("BOTTOMLEFT", ElvUF_TargetHud, "BOTTOMRIGHT", 110, 0)
    E:CreateMover(frame, frame:GetName()..'Mover', 'Target Target Hud Frame', nil, nil, nil, 'ALL,SOLO')
end
