local _, ns = ...
local oUF = ns.oUF or oUF

if not oUF then return end


local referenceSpells = {
	47541,			-- Death Coil (Death Knight)
	66215,			-- Blood Strike (Death Knight)
	1978,			-- Serpent Sting (Hunter)
	585,			-- Smite (Priest)
	19740,			-- Blessing of Might (Paladin)
	172,			-- Corruption (Warlock)
	42955,			-- Conjure Refreshment (Mage)
	34428,			-- Victory Rush (Warrior)
	403,			-- Lightning Bolt (Shaman)
	1752,			-- Sinister Strike (Rogue)
	5176,			-- Wrath (Druid)
	100780,			-- Jab (Monk)
}

local GetTime = GetTime
local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local GetSpellCooldown = GetSpellCooldown
local spellid = nil

local Init = function()
	for _, v in pairs(referenceSpells) do
		local isKnown = IsSpellKnown(v)

		if isKnown then
			spellid = v
		end
	end

	if spellid == nil then
		return
	end
	
	return spellid
end

local OnUpdateGCD = function(self)
	if self.duration == 0 or not self.duration then return end
	local perc = (GetTime() - self.starttime) / self.duration
	if perc > 1 then
		self:Hide()
	else
		self:SetValue(perc)
		self.Spark:SetPoint("CENTER",self,"BOTTOM", 0, perc * self:GetHeight())
	end
end

local OnHideGCD = function(self)
	self:SetScript("OnUpdate", nil)
end

local OnShowGCD = function(self)
	self:SetScript("OnUpdate", OnUpdateGCD)
end

local Update = function(self, event, unit)
	if self.GCD then
		if spellid == nil then
			if Init() == nil then
				return
			end
		end

		local start, dur = GetSpellCooldown(spellid)

		if (not start) then return end
		if (not dur) then dur = 0 end

		if (dur == 0) then
			self.GCD:Hide()
			self.GCD.Spark:Hide()
		else
			self.GCD.starttime = start
			self.GCD.duration = dur
			self.GCD:Show()
			self.GCD.Spark:Show()
		end
	end
end

local function Enable(self,unit)
	if (self.GCD) then
		self.GCD:Hide()
		self.GCD.Spark:Hide()
		self.GCD.starttime = 0
		self.GCD.duration = 0
		self.GCD:SetMinMaxValues(0, 1)

		self:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN", Update)
		self.GCD:SetScript("OnHide", OnHideGCD)
		self.GCD:SetScript("OnShow", OnShowGCD)
	end
end

local function Disable(self)
	if (self.GCD) then
		self:UnregisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
		self.GCD:Hide()  
	end
end

oUF:AddElement("GCD", Update, Enable, Disable)