local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local VUF = E:GetModule('VerticalUnitFrames');

function VUF:ConstructPetFrame(frame,unit)
    frame.unit = unit
    frame.Health = self:ConstructHealth(frame)

    frame.Name = self:ConstructName(frame)

    frame.Power = self:ConstructPower(frame)

    frame.Castbar = self:ConstructCastbar(frame)
    frame.Castbar.SafeZone = nil
    frame.RaidIcon = self:ConstructRaidIcon(frame)

    frame.Buffs = self:ConstructBuffs(frame)
    frame.Debuffs = self:ConstructDebuffs(frame)

    frame.HealPrediction = self:ConstructHealComm(frame)
    
    frame:SetAlpha(self.db.alpha)

    frame:Point("BOTTOMRIGHT", ElvUF_PlayerVerticalUnitFrame, "BOTTOMLEFT", -110, 0)
    E:CreateMover(frame, frame:GetName()..'Mover', 'Pet Vertical Unit Frame', nil, nil, nil, 'ALL,SOLO')
end
