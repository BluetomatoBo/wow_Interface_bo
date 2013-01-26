--[[
	sFilter
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.
	Edited by ALZA
]]

--[[     Options start here     ]]
-- "true" means enabled, "false" means disabled
local configmode = false                -- In this mode all icons are shown and can be moved.
local FontSize = 17                     -- Font size for stacks text
local r, g, b = .8, .8, .8              -- Text color for stacks text More info: http://www.wowwiki.com/API_FontString_SetTextColor
local CountPoint = { "TOPLEFT" }            -- Stacks text position. More info: http://www.wowwiki.com/API_Region_SetPoint

--[[ More info about config mode:
You can move icons with left mouse button while holding Alt OR Shift. Changed position won't be saved between sessions.
After click on icon you will see in chat info about its position. This can be used to change setPoint attribute is spell list.
Clicking on icon with right mouse button will reset its position to default.
]]

--[[ Closer look at spell lists:
All classes have their own spell list.
Each entry in list creates a separate icon. Entry is a table with values in it:
- spellId - id of spell you want to track. If you don't know it - check wowhead.com - last number in any spell link is spellid (example: http://www.wowhead.com/?spell=55095, id is 55095)
- spellId2, spellId3, spellId4, spellId5 - optional entries, these are the spellids you want to track if primary spell is NOT active.
- size - icon size in pixels
- unitId - unit at which you wish to track selected spell(s). More info: http://www.wowwiki.com/UnitId
- isMine - this is filter. isMine = 1 means only  effects from units in MyUnits table will be shown (see below for this table. Note: isMine = "1" will NOT work, it should be number, not string. Any other value will show effect from any source
- filter - filter again =). Needs to be "HELPFUL" for buffs and "HARMFUL" for debuffs.
- setPoint - where to place the icon. It's a table with coordinates inside. More info: http://www.wowwiki.com/API_Region_SetPoint

I removed alpha settings and some other things, you can use original addon version for these features: http://toxila.googlecode.com/svn/zips/sFilter/
]]

local sFilter_Spells = {
    ["DEATHKNIGHT"] = {
    -- Ebon Plague
    {spellId = 65142, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 0}},
    -- Frost Fever
    {spellId = 59921, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 0}},
    -- Blood Plague
    {spellId = 59879, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 0}},
    -- Unholy Blight
    {spellId = 49194, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 0}},
	-- Killing Machine
	{spellId = 51124, size = 64, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 148, -54}},
	-- Rime (Freezing Fog), Unholy Frenzy on self(Unholy) 
	{spellId = 59052, spellId2 = 49016, size = 64, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 222, -54}},
	-- Desolation
	{spellId = 66803, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 37}},
	-- Icebond Fortitude
	{spellId = 48792, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 37}},
	-- Vampiric Blood, Unbreakable Armor, Bone Shield 
	{spellId = 55233, spellId2 = 51271, spellId3 = 49222, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
	-- Shadow Infusion (Unholy)
	{spellId = 91342, size = 32, unitId = "pet", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
	-- Anti-magic shield and zone
	{spellId = 48707, spellId2 = 50461, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 37}},

    },
    ["DRUID"] = {
    -- Moonfire, Lacirate, Rake
    {spellId = 8921, spellId2 = 33745, spellId3 = 1822, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 0}},
    -- Insect Swarm, Rip
	{spellId = 5570, spellId2 = 1079, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 0}},
    -- Mangle
    {spellId = 33878, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 0}},    
	-- Entangling Roots
    {spellId = 339, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 0}},
	-- Shooting Stars (Starsurge instant) 
	{spellId = 93400, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 37}},
    -- CoE, Ebon Plague, Earth and Moon
    {spellId = 1490, spellId2 = 65142, spellId3 = 60433, size = 32, unitId = "target", isMine = "all", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 37}},
    -- Eclipse Solar, Eclipse Lunar
    {spellId = 48517, spellId2 = 48518, size = 64, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 148, -54}},
    -- Barkskin
    {spellId = 22812, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 37}},
    -- Survival Instincts
    {spellId = 61336, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
    -- Savage roar
    {spellId = 52610, size = 32, unitId = "player", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 37}},
	-- Faerie Fire (Feral), Faerie Fire
    {spellId = 91565, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, -37}},
	-- Lunar Shower (Balance)
    {spellId = 81192, size = 32, unitId = "player", isMine = 1, filter = "helpful", setPoint = {"CENTER", UIParent, "CENTER", 243, -37}},	
	
    },
    ["HUNTER"] = {
    -- Hunter's Mark, Marked for Death
    {spellId = 1130, spellId2 = 88691, size = 32, unitId = "target", isMine = "all", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 0}},
    -- Serpent Sting
    {spellId = 1978, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 0}},
    -- Black Arrow
    {spellId = 3674, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 0}},
    -- Explosive Shot debuff
    {spellId = 53301, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 0}},
	-- Frenzy Effect (Beastmaster)
    {spellId = 19615, size = 32, unitId = "pet", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
    -- Lock and Load 
    {spellId = 56453, size = 64, unitId = "player", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 148, -54}},
	-- Bestial Wrath (Beastmaster)
	{spellId = 19574, size = 32, unitId = "pet", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 37}},
	-- Ready, Set, Aim ... (Marksman)
	{spellId = 82925, size = 32, unitId = "player", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 37}},	
	-- Focus Fire (Beastmaster), Improved Steady Shot (Marksman), Sniper Training (Survival) 
    {spellId = 82692,  spellId2 = 53220, spellId3 = 64420, size = 32, unitId = "player", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 37}},
		
	},
    ["MAGE"] = {
    -- Living Bomb
    {spellId = 44457, size = 64, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 222, -54}},
    -- Fingers of Frost (Frost), Arcane Missiles! (Arcane), Hot Streak (Fire)
    {spellId = 44544, spellId2 = 79683, spellId3 = 48108, size = 64, unitId = "player", isMine = all, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 148, -54}},
    -- Invocation (Arcane), Pyromaniac (Fire)
    {spellId = 87098, spellid2 = 83582, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
    -- Clear Casting
    {spellId = 12536, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 0}},
    -- Fiery Payback (Fire)  
    {spellId = 64346, size = 32, unitId = "target", isMine = "all", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 37}},
	-- Deep Freeze (Frost)
	{spellId = 44572, size = 32, unitId = "target", isMine = "all", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 37}},
    -- Impact
    {spellId = 12358, size = 32, unitId = "target", isMine = "all", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
    -- Arcane Blast debuff 
    {spellId = 36032, size = 32, unitId = "player", isMine = "all", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 0}},
	-- Blazing Speed (Fire), Improved Blink (Arcane)
	{spellId = 31643, spellId2 = 47000, size = 32, unitId = "player", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 37}},
    -- Winter's Chill (Frost), Improved Scorch (Fire)
    {spellId = 28593, spellId2 = 22959, size = 32, unitId = "target", isMine = "1", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 0}},  
    -- Polymorph - Sheep, Pig, Turkey, Black Cat, Rabbit, Turtle, 
    {spellId = 118, spellId2 = 28272, spellId3 = 61780, spellId4 = 61305, spellId5 = 61721, spellId6 = 28271, size = 32, unitId = "target", isMine = "1", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 37}},
    -- Slow (Arcane), Ignite (Fire), Frostbite (Frost)
    {spellId = 31589, spellId2 = 12848, spellId3 = 12497, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 0}},

    },
    ["PALADIN"] = {
    -- Hand of Light (Retrobution), Grand Crusader (Protection) 
	{spellId = 90174, spellId2 = 85416, size = 64, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 148, -54}},
    -- Speed of Light (Holy)
    {spellId = 85497, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 0}},
	-- Daybreak (Holy), Holy Shield (Protection)
	{spellId = 88819, spellId2 = 20925, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 0}},
	-- Infusion of Light (Holy), Guarded by the light (Protection)
	{spellId = 54149, spellId2 = 88063, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 0}},
 	-- Divine Plea
	{spellId = 54428 , size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 0}},
	-- Denounce (Holy), 
	{spellId = 85509, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
	-- Censore (SoT debuff)
	{spellId = 31803, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
	-- Art of War (Retrobution), Judgements of the Pure (Holy)
    {spellId = 59578, spellId2 = 53657, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 37}},
	-- Forbearance
	{spellId = 25771, size = 32, unitId = "player", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 37}},
		
	},
    ["PRIEST"] = {
    -- Power Word:Shield on self
    {spellId = 17, size = 32, unitId = "player", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, -37}},
    -- Renew on target
    {spellId = 139, size = 32, unitId = "target", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, -37}},
	-- Serendipity (Rank 1,2) (Holy), Mind Melt (Shadow)
	{spellId = 63731, spellId2 = 63735, spellId3 = 81292, size = 32, unitId = "player", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 37}},
	-- Chakra, Chakra States: Heal, Renew, Prayer of Healing, Smite
	{spellId = 14751, spellId2 = 81208, spellId3 = 81207, spellId4 = 81206, spellId5 = 81209, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
    -- Surge of Light (Holy), Borrowed Time (Discipline)
    {spellId = 88690, spellId2 = 59889, size = 32, unitId = "player", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 37}},
	-- Power Infusion on self
	{spellId = 10060, size = 32, unitId = "player", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, -72}},
    -- Shadow Word:Pain
    {spellId = 589, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 0}},
    -- Vampiric Touch
    {spellId = 34914, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 0}},
    -- Devouring Plague
    {spellId = 2944, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 0}},
	-- Evangelism, Dark Evangelism 
	{spellId = 81660, spellId2 = 87117, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 0}},
	-- Archangel, Dark Archangel 
	{spellId = 81700, spellId2 = 87153, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 37}},
	-- Spirit of Redemption (Holy)
	{spellId = 27827, size = 64, unitId = "player", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 222, -54}},
	
    },
    ["ROGUE"] = {
	-- Deadly Poison
    {spellId = 67710, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, -37}},
	-- Wound Poison 
    {spellId = 13218, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, -37}},
   	-- Crippling Poison 
	{spellId = 3409, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, -37}},
    -- Mind-numbing Poison
    {spellId = 5760, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, -37}},
	-- Slice and Dice
	{spellId = 5171, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 0}},
	-- Rupture
	{spellId = 1943, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 0}},
	-- Revealing Strike
	{spellId = 84617, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 0}},
	-- Bandit's Guile (Combat) Shallow Insight, Vendetta (Assassination)
	{spellId = 84745, spellId2 = 79140, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 0}},	
	},
	
    ["SHAMAN"] = {
    -- Hex
    {spellId = 51514, size = 32, unitId = "target", isMine = "all", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 37}},
    -- Water Shield, Earth Shield, Lightning Shield
    {spellId = 52127, spellId2 = 974, spellId3 = 324, size = 32, unitId = "player", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 0}},
    -- Flame Shock, Frost Shock
    {spellId = 8050, spellId2 = 8056, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 0}},
	-- Tidal Waves, Maelstrom Weapon, Elemental Mastery (haste, damage)
    {spellId = 53390, spellId2 = 53817, spellId3 = 64701, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 0}},
	-- Earth Shield on target 
    {spellId = 974, size = 32, unitId = "target", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, -37}},
    -- Riptide
    {spellId = 61295, size = 32, unitId = "target", isMine = "all", filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, -37}},
	-- Searing Flame (Enhancement Searing Totem)
	{spellId = 77661, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
 
	},
    ["WARLOCK"] = {
    -- CoE, Ebon Plague, Earth and Moon
    {spellId = 1490, spellId2 = 65142, spellId3 = 60433, size = 32, unitId = "target", isMine = "all", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 0}},
    -- CoT, CoEx, CoW
    {spellId = 1714, spellId2 = 18223, spellId3 = 702, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 0}},
    -- Molten Core (Demonology), Shadow Trance (Affliction), Improved Soulfire (Destruction)
    {spellId = 47383, spellId2 = 18095, spellId3 = 85383, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 0}},
    -- Decimation (Demonology), Backdraft (Destruction), Eradication (Affliction)
    {spellId = 63158, spellId2 = 54277, spellId3 = 47195, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 0}},
    -- Immolation, Unstable Affliction (Affliction)
    {spellId = 348, spellId2 = 30108, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, -37}},
    -- Corruption, SoC
    {spellId = 172, spellId2 = 27243, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, -37}},
    -- BoA, BoD, BoH (Destruction)
    {spellId = 980, spellId2 = 603, spellId3 = 80240, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, -37}},
    -- Haunt, Demonic Rebirth (Demonology)
	{spellId = 48181, spellId2 = 88448, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, -37}},
	-- Backlash
	{spellId = 34939, size = 64, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 148, 54}},
	-- Fear, Nightmare 
	{spellId = 5782, spellId2 = 1714, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 37}},
	-- Empowered Imp (Destruction)
	{spellId = 47283, size = 64, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 148, -54}},

	},
    ["WARRIOR"] = {
    -- Sword and Board (Protection)
    {spellId = 50227, size = 64, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 148, -54}},
    -- Bloodsurge (Fury), Sudden Death (Arms)
    {spellId = 46916, spellId2 = 52437, size = 64, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 148, -54}},
	-- Taste of Blood (Arms) 
	{spellId = 60503, size = 64, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 222, -54}},
    -- Hamstring, Piercing Howl
    {spellId = 1715, spellId2 = 12323, size = 32, unitId = "target", isMine = "all", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 0}},
    -- Rend
    {spellId = 94009, size = 32, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 0}},
	-- Rude Interruption (Fury), Jaggernaut (Arms) 
    {spellId = 86663, spellId2 = 65156, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 0}},
	-- Enrage 
	{spellId = 12880, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 206, 37}},
	-- Stuns: Throwdown, Charge, Intercept, Concussion Blow
	{spellId = 85388, spellId2 = 7922, spellId3 = 20253, spellId4 = 12809, size = 32, unitId = "target", isMine = "all", filter = "HARMFUL", setPoint = {"CENTER", UIParent, "CENTER", 243, 0}},
	-- Last Stand, Die by the Sword
	{spellId = 12975, spellId2 = 85386, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 169, 37}},
	-- Shield Wall
	{spellId = 871, size = 32, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", 132, 37}},
 
	},
}

local MyUnits = {
    player = true,
    vehicle = true,
    pet = true,
}

--[[        Options end         ]]

local backdrop = {
	bgFile = [=[Interface\ChatFrame\ChatFrameBackground]=],
	edgeFile = [=[Interface\ChatFrame\ChatFrameBackground]=], edgeSize = 1,
	insets = {top = 0, left = 0, bottom = 0, right = 0},
}

local CreateBG = CreateBG or function(parent)
	local bg = CreateFrame("Frame", nil, parent)
	bg:SetPoint("TOPLEFT", -1, 1)
	bg:SetPoint("BOTTOMRIGHT", 1, -1)
	bg:SetFrameLevel(parent:GetFrameLevel() - 1)
	bg:SetBackdrop(backdrop)
	bg:SetBackdropColor(0, 0, 0, 0.5)
	bg:SetBackdropBorderColor(0, 0, 0, 1)
	return bg
end

local function sFilter_CreateFrame(data)
    local spellName, _, spellIcon = GetSpellInfo(data.spellId)
    local frame = CreateFrame("Frame", "sFilter_" .. data.unitId .. "_" .. data.spellId, UIParent)
    frame:SetWidth(data.size - 2)
    frame:SetHeight(data.size - 2)
    frame:SetPoint(unpack(data.setPoint))
    frame:RegisterEvent("UNIT_AURA")
    frame:RegisterEvent("PLAYER_TARGET_CHANGED")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    frame:SetScript("OnEvent", function(self, event, ...)
        local unit = ...
        if(data.unitId==unit or event=="PLAYER_TARGET_CHANGED" or event=="PLAYER_ENTERING_WORLD") then
            self.found = false
            self:SetAlpha(1)
            for i=1, 40 do
                local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable = UnitAura(data.unitId, i, data.filter)
                if((data.isMine~=1 or MyUnits[caster]) and (name==GetSpellInfo(data.spellId) or (data.spellId2 and name==GetSpellInfo(data.spellId2)) or (data.spellId3 and name==GetSpellInfo(data.spellId3)))) then
                    self.found = true
                    self.icon:SetTexture(icon)
                    self.count:SetText(count>1 and count or "")
                    if(duration>0) then
                        self.cooldown:Show()
                        CooldownFrame_SetTimer(self.cooldown, expirationTime-duration, duration, 1)
                    else
                        self.cooldown:Hide()
                    end
                    break
                end
            end

            if(not self.found) then
                self:SetAlpha(0)
                self.icon:SetTexture(spellIcon)
                self.count:SetText("")
                self.cooldown:Hide()
            end
        end

        if(configmode==true) then
            self:SetAlpha(1)
            self.count:SetText(9)
        end
    end)

    if(configmode==true) then
        frame:SetMovable(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton", "RightButton")
        frame:SetScript("OnMouseDown", function(self)
            if(arg1=="LeftButton") then
                if(IsShiftKeyDown() or IsAltKeyDown()) then
                    self:StartMoving()
                end
            else
                self:ClearAllPoints()
                self:SetPoint(unpack(data.setPoint))
            end
        end)
        frame:SetScript("OnMouseUp", function(self) 
            self:StopMovingOrSizing()
            if(arg1=="LeftButton") then
                local x, y = self:GetCenter()
                print(format("|cffff00ffs|rFilter: setPoint for %s (%s): {\"%s\", UIParent, \"%s\", %s, %s}", data.spellId, spellName, "CENTER", "BOTTOMLEFT", floor(x + 0.5), floor(y + 0.5)))
            end
        end)
    end

    frame.icon = frame:CreateTexture("$parentIcon", "OVERLAY")
    frame.icon:SetAllPoints()
    frame.icon:SetTexture(spellIcon)
    frame.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)

    frame.count = frame:CreateFontString(nil, "OVERLAY")
    frame.count:SetFont("Fonts\\FRIZQT__.TTF", FontSize, "OUTLINE")
    frame.count:SetTextColor(r, g, b)
    frame.count:SetPoint(unpack(CountPoint))
    frame.count:SetJustifyH("CENTER")

    frame.cooldown = CreateFrame("Cooldown", nil, frame, "CooldownFrameTemplate")
    frame.cooldown:SetPoint("TOPLEFT")
    frame.cooldown:SetPoint("BOTTOMRIGHT")
    frame.cooldown:SetReverse()

    frame.bg =  CreateBG(frame)

end

local class = select(2, UnitClass("player"))
if(sFilter_Spells and sFilter_Spells[class]) then
    for index in pairs(sFilter_Spells) do
        if(index~=class) then
            sFilter_Spells[index] = nil
        end
    end
    for i=1, #sFilter_Spells[class], 1 do
        sFilter_CreateFrame(sFilter_Spells[class][i])
    end
end