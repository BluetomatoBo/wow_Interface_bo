local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');

local _, ns = ...
local ElvUF = ns.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")

function UF:Construct_PowerBar(frame, bg, text, textPos, lowtext)
	local power = CreateFrame('StatusBar', nil, frame)
	UF['statusbars'][power] = true

	power:SetFrameStrata("LOW")
	power.PostUpdate = self.PostUpdatePower

	if bg then
		power.bg = power:CreateTexture(nil, 'BORDER')
		power.bg:SetAllPoints()
		power.bg:SetTexture(E["media"].blankTex)
		power.bg.multiplier = 0.2
	end
	
	if text then
		power.value = frame.RaisedElementParent:CreateFontString(nil, 'OVERLAY')	
		UF:Configure_FontString(power.value)
		power.value:SetParent(frame)
		
		local x = -2
		if textPos == 'LEFT' then
			x = 2
		end
		
		power.value:Point(textPos, frame.Health, textPos, x, 0)
	end
	
	if lowtext then
		power.LowManaText = power:CreateFontString(nil, 'OVERLAY')
		UF:Configure_FontString(power.LowManaText)
		power.LowManaText:SetParent(frame.RaisedElementParent)
		power.LowManaText:Point("BOTTOM", frame.Health, "BOTTOM", 0, 7)
		power.LowManaText:SetTextColor(0.69, 0.31, 0.31)
	end
	
	power.colorDisconnected = false
	power.colorTapping = false
	power:CreateBackdrop('Default')

	return power
end	

local tokens = { [0] = "MANA", "RAGE", "FOCUS", "ENERGY", "RUNIC_POWER" }
function UF:PostUpdatePower(unit, min, max)
	local pType, _, altR, altG, altB = UnitPowerType(unit)
	local parent = self:GetParent()
	
	if parent.isForced then
		min = random(1, max)
		pType = random(0, 4)
		self:SetValue(min)
		local color = ElvUF['colors'].power[tokens[pType]]
		
		if not self.colorClass then
			self:SetStatusBarColor(color[1], color[2], color[3])
			local mu = self.bg.multiplier or 1
			self.bg:SetVertexColor(color[1] * mu, color[2] * mu, color[3] * mu)
		end
	end	
	
	local db = parent.db
	if self.LowManaText and db then
		if pType == 0 and not UnitIsDeadOrGhost(unit)
		and (max == 0 and 0 or floor(min / max * 100)) <= db.lowmana then
			self.LowManaText:SetText(LOW..' '..MANA)
			E:Flash(self.LowManaText, 0.6)
		else
			self.LowManaText:SetText()
			E:StopFlash(self.LowManaText)
		end
	end
	
	if db and db.power and db.power.hideonnpc then
		UF:PostNamePosition(parent, unit)
	end	
end

