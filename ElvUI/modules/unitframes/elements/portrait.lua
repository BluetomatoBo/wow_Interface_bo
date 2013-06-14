local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');

function UF:Construct_Portrait(frame, type)
	local portrait
	
	if type == 'texture' then
		local backdrop = CreateFrame('Frame',nil,frame)
		portrait = frame:CreateTexture(nil, 'OVERLAY')
		portrait:SetTexCoord(0.15,0.85,0.15,0.85)
		backdrop:SetOutside(portrait)
		backdrop:SetFrameLevel(frame:GetFrameLevel())
		backdrop:SetTemplate('Default')
		portrait.backdrop = backdrop	
	else
		portrait = CreateFrame("PlayerModel", nil, frame)
		portrait:SetFrameStrata('LOW')
		portrait:CreateBackdrop('Default')
	end
	
	portrait.PostUpdate = self.PortraitUpdate

	portrait.overlay = CreateFrame("Frame", nil, frame)
	portrait.overlay:SetFrameLevel(frame:GetFrameLevel() - 5)
	
	return portrait
end

function UF:PortraitUpdate(unit)
	local db = self:GetParent().db
	
	if not db then return end
	
	local portrait = db.portrait
	if portrait.enable and portrait.overlay then
		self:SetAlpha(0); 
		self:SetAlpha(0.35);
	else
		self:SetAlpha(1)
	end
	
	if self:GetObjectType() ~= 'Texture' then
		local model = self:GetModel()
		if model and model.find and model:find("worgenmale") then
			self:SetCamera(1)
		end	
		
		if self:GetFacing() ~= (portrait.rotation / 60) then
			self:SetFacing(portrait.rotation / 60)
		end

		self:SetCamDistanceScale(portrait.camDistanceScale)
	end
end

