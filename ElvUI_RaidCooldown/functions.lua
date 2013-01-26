--------------------------------------------------------
-- System Settable Variables --
--------------------------------------------------------
local E, L, V, P, G =  unpack(ElvUI);
local RC = E:NewModule('RaidCooldown', 'AceEvent-3.0', 'AceTimer-3.0');
--------------------------------------------------------

--------------------------------------------------------
-- Cooldowns --
--------------------------------------------------------
RC.cooldowns = {
	     -- Paladin
	{ -- Devotion Aura
		spellID = 31821,
		name = "DA",
		succ = "SPELL_CAST_SUCCESS",
		CD = 180,
		class = "PALADIN",
	},
	{ -- Hand of Sacrifice
		spellID = 6940,
		name = "HOS",
		succ = "SPELL_CAST_SUCCESS",
		CD = 120,
		class = "PALADIN",
	},
	     -- Priest
	{ -- Power Word: Barrier 
		spellID = 62618,
		succ = "SPELL_CAST_SUCCESS",
		name = "PWB",
		CD = 180,
		class = "PRIEST", 
		cast_time = 10,
		spec = 256,
	},
	{ -- Pain Suppression  
		spellID = 33206,
		succ = "SPELL_CAST_SUCCESS",
		name = "PS",
		CD = 180,
		class = "PRIEST", 
		cast_time = 8,
		spec = 256,
	},
	{ -- Divine Hymn
	
		spellID = 64843,
		succ = "SPELL_CAST_SUCCESS",
		name = "DH",
		CD = 180,
		class = "PRIEST", 
		cast_time = 8,
		spec = 257,
	},	
	{ -- Guardian Spirit 
		spellID = 47788,
		succ = "SPELL_CAST_SUCCESS",
		name = "GS",
		CD = 180,
		class = "PRIEST", 
		cast_time = 10,
		spec = 257,
	},	
	{ -- Void Shift
		spellID = 108968,
		succ = "SPELL_CAST_SUCCESS",
		name = "VS",
		CD = 360,
		class = "PRIEST",
	},
	{ -- Hymn Of Hope
		spellID = 64901,
		succ = "SPELL_CAST_SUCCESS",
		name = "HH",
		CD = 360,
		class = "PRIEST", 
		cast_time = 8,	
	},
		
		 -- Druid
	{ -- Tranquility
		spellID = 740,
		succ = "SPELL_CAST_SUCCESS",
		name = "T",
		CD = 180,
		class = "DRUID",
		spec = 105,
	},
	{ -- Ironbark
		spellID = 102342,
		succ = "SPELL_CAST_SUCCESS",
		name = "FE",
		CD = 120,
		class = "DRUID",
		spec = 105,
	},
	{ -- Rebirth
		spellID = 20484,
		succ = "SPELL_CAST_START",
		name = "R",
		cd = 600,
		class = "DRUID",
	},
	{ -- Innervate
		spellID = 29166,
		succ = "SPELL_CAST_SUCCESS",
		name = "I",
		CD = 180,
		class = "DRUID",
	},
	
		-- Shaman
	{ -- Spirit Link Totem
		spellID = 98008,
		succ = "SPELL_CAST_SUCCESS",
		name = "SLT",
		CD = 180,
		class = "SHAMAN", 
		cast_time = 6,
		spec = 264,
	},
	{ -- Mana Tide Totem
		spellID = 16190,
		succ = "SPELL_CAST_SUCCESS",
		name = "MTT",
		CD = 180,
		class = "SHAMAN",
		cast_time = 12,
		spec = 264,
	},
	{ -- Healing Tide Totem
		spellID = 108280,
		succ = "SPELL_CAST_SUCCESS",
		name = "HTT",
		CD = 180,
		class = "SHAMAN",
		talent = 108280,
	},
	{ -- Stormlash Totem
		spellID = 120668,
		succ = "SPELL_CAST_SUCCESS",
		name = "ST",
		CD = 300,
		class = "SHAMAN",
	},
	 
		 -- Monk
	{	-- Zen Meditation
		spellID = 115176,
		succ = "SPELL_CAST_SUCCESS",
		name = "ZEN",
		CD = 180,
		class = "MONK",
	},
	{	-- Life Cocoon
		spellID = 116849,
		succ = "SPELL_CAST_SUCCESS",
		name = "LIFE",
		CD = 120,
		class = "MONK",
		spec = 270,
	},
	{	-- Revival
		spellID = 115310,
		succ = "SPELL_CAST_SUCCESS",
		name = "REV",
		CD = 180,
		class = "MONK",
		spec = 270,
	},
	
		 -- Warlock
	{ -- Soulstone Resurrection
		spellID = 20707,
		succ = "SPELL_CAST_START",
		name = "SR",
		CD = 900,
		class = "WARLOCK",
	},
	
	     -- Death Knight
	{ -- Raise Ally
		spellID = 61999,
		succ = "SPELL_CAST_SUCCESS", 
		name = "RA",
		CD = 600,
		class = "DEATHKNIGHT",
	},
	{ -- Anti-Magic Zone
		spellID = 51052,
		succ = "SPELL_CAST_SUCCESS",
		name = "AMZ",
		CD = 120,
		class = "DEATHKNIGHT",
		talent = 51052,
	},
	
	     -- Warrior
	{ -- Rallying Cry
		spellID = 97462,
		succ = "SPELL_CAST_SUCCESS",
		name = "RC",
		CD = 180,
		class = "WARRIOR",
	},
	{ -- Demoralizing Banner
		spellID = 114203,
		succ = "SPELL_CAST_SUCCESS",
		name = "DB",
		CD = 180,
		class = "WARRIOR",
	},
}

function RC:GetPartyType()
    return ((select(2, IsInInstance()) == "pvp" and "battleground") or (select(2, IsInInstance()) == "arena" and "battleground") or (IsInRaid() and "raid") or (GetNumSubgroupMembers() > 0 and "party") or "none") 
end

function RC:ClassColorString (class)
    return string.format ("|cFF%02x%02x%02x",
        RAID_CLASS_COLORS[class].r * 255,
        RAID_CLASS_COLORS[class].g * 255,
        RAID_CLASS_COLORS[class].b * 255)
end

function RC:InRaid()
    local grouptype = RC:GetPartyType()
    if(grouptype == "none") then
        ElvUI_RaidCooldownBase:Hide()
    else
        ElvUI_RaidCooldownBase:Show()
    end
end

function RC:IsInRaid(player)
	return IsInRaid()
end
--------------------------------------------------------

--------------------------------------------------------
-- Misc Functions --
--------------------------------------------------------

function RC:OnEnter(self, cooldown)
    local parent = self:GetParent()
	GameTooltip:Hide()
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT",3, 14)
	GameTooltip:ClearLines()
	GameTooltip:AddSpellByID(cooldown['spellID'])
	GameTooltip:Show()
end

function RC:OnLeave(self)
    GameTooltip:Hide()
end

function RC:Scale()
    ElvUI_RaidCooldownBase:Height(((28*#RC.cooldowns)+(1*#RC.cooldowns+3))*E.db.raidcooldown.scale);
    for i=1,#RC.cooldowns do
        _G['RaidCooldown'..i]:Height(28*E.db.raidcooldown.scale);
        _G['RaidCooldownIcon'..i]:Size(28*E.db.raidcooldown.scale);
    end
end
 
function RC:MoverSize()
	ElvUI_RaidCooldownBase.mover:SetWidth(E.db.raidcooldown.scale * ElvUI_RaidCooldownBase:GetWidth())
	ElvUI_RaidCooldownBase.mover:SetHeight(E.db.raidcooldown.scale * ElvUI_RaidCooldownBase:GetHeight() + 1);
end
--------------------------------------------------------

E:RegisterModule(RC:GetName());