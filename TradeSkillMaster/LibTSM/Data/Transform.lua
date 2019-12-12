-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Transform = TSM.Init("Data.Transform")
local private = {}



-- ============================================================================
-- Transform Data
-- ============================================================================

local DATA = {
	-- =========================================== Essences ========================================
	["i:52719"] = {
		["i:52718"] = 1/3, -- Greater Celestial Essence
	},
	["i:52718"] = {
		["i:52719"] = 3, -- Lesser Celestial Essence
	},
	["i:34055"] = {
		["i:34056"] = 1/3, -- Greater Cosmic Essence
	},
	["i:34056"] = {
		["i:34055"] = 3, -- Lesser Cosmic Essence
	},
	["i:22446"] = {
		["i:22447"] = 1/3, -- Greater Planar Essence
	},
	["i:22447"] = {
		["i:22446"] = 3, -- Lesser Planar Essence
	},
	["i:16203"] = {
		["i:16202"] = 1/3, -- Greater Eternal Essence
	},
	["i:16202"] = {
		["i:16203"] = 3, -- Lesser Eternal Essence
	},
	["i:11175"] = {
		["i:11174"] = 1/3, -- Greater Nether Essence
	},
	["i:11174"] = {
		["i:11175"] = 3, -- Lesser Nether Essence
	},
	["i:11135"] = {
		["i:11134"] = 1/3, -- Greater Mystic Essence
	},
	["i:11134"] = {
		["i:11135"] = 3, -- Lesser Mystic Essence
	},
	["i:11082"] = {
		["i:10998"] = 1/3, -- Greater Astral Essence
	},
	["i:10998"] = {
		["i:11082"] = 3, -- Lesser Astral Essence
	},
	["i:10939"] = {
		["i:10938"] = 1/3, -- Greater Magic Essence
	},
	["i:10938"] = {
		["i:10939"] = 3, -- Lesser Magic Essence
	},
	-- ============================================ Shards =========================================
	["i:52721"] = {
		["i:52720"] = 1/3, -- Heavenly Shard
	},
	["i:34052"] = {
		["i:34053"] = 1/3, -- Dream Shard
	},
	["i:74247"] = {
		["i:74252"] = 1/3, -- Ethereal Shard
	},
	["i:111245"] = {
		["i:115502"] = 0.1, -- Luminous Shard
	},
	-- =========================================== Crystals ========================================
	["i:113588"] = {
		["i:115504"] = 0.1, -- Temporal Crystal
	},
	-- ======================================== Primals / Motes ====================================
	["i:21885"] = {
		["i:22578"] = 0.1, -- Water
	},
	["i:22456"] = {
		["i:22577"] = 0.1, -- Shadow
	},
	["i:22457"] = {
		["i:22576"] = 0.1, -- Mana
	},
	["i:21886"] = {
		["i:22575"] = 0.1, -- Life
	},
	["i:21884"] = {
		["i:22574"] = 0.1, -- Fire
	},
	["i:22452"] = {
		["i:22573"] = 0.1, -- Earth
	},
	["i:22451"] = {
		["i:22572"] = 0.1, -- Air
	},
	-- ===================================== Crystalized / Eternal =================================
	["i:37700"] = {
		["i:35623"] = 10, -- Air
	},
	["i:35623"] = {
		["i:37700"] = 0.1, -- Air
	},
	["i:37701"] = {
		["i:35624"] = 10, -- Earth
	},
	["i:35624"] = {
		["i:37701"] = 0.1, -- Earth
	},
	["i:37702"] = {
		["i:36860"] = 10, -- Fire
	},
	["i:36860"] = {
		["i:37702"] = 0.1, -- Fire
	},
	["i:37703"] = {
		["i:35627"] = 10, -- Shadow
	},
	["i:35627"] = {
		["i:37703"] = 0.1, -- Shadow
	},
	["i:37704"] = {
		["i:35625"] = 10, -- Life
	},
	["i:35625"] = {
		["i:37704"] = 0.1, -- Life
	},
	["i:37705"] = {
		["i:35622"] = 10, -- Water
	},
	["i:35622"] = {
		["i:37705"] = 0.1, -- Water
	},
	-- ========================================= Wod Fish ==========================================
	["i:109137"] = {
		["i:111601"] = 4, -- Enormous Crescent Saberfish
		["i:111595"] = 2, -- Crescent Saberfish
		["i:111589"] = 1, -- Small Crescent Saberfish
	},
	["i:109138"] = {
		["i:111676"] = 4, -- Enormous Jawless Skulker
		["i:111669"] = 2, -- Jawless Skulker
		["i:111650"] = 1, -- Small Jawless Skulker
	},
	["i:109139"] = {
		["i:111675"] = 4, -- Enormous Fat Sleeper
		["i:111668"] = 2, -- Fat Sleeper
		["i:111651"] = 1, -- Small Fat Sleeper
	},
	["i:109140"] = {
		["i:111674"] = 4, -- Enormous Blind Lake Sturgeon
		["i:111667"] = 2, -- Blind Lake Sturgeon
		["i:111652"] = 1, -- Small Blind Lake Sturgeon
	},
	["i:109141"] = {
		["i:111673"] = 4, -- Enormous Fire Ammonite
		["i:111666"] = 2, -- Fire Ammonite
		["i:111656"] = 1, -- Small Fire Ammonite
	},
	["i:109142"] = {
		["i:111672"] = 4, -- Enormous Sea Scorpion
		["i:111665"] = 2, -- Sea Scorpion
		["i:111658"] = 1, -- Small Sea Scorpion
	},
	["i:109143"] = {
		["i:111671"] = 4, -- Enormous Abyssal Gulper Eel
		["i:111664"] = 2, -- Abyssal Gulper Eel
		["i:111659"] = 1, -- Small Abyssal Gulper Eel
	},
	["i:109144"] = {
		["i:111670"] = 4, -- Enormous Blackwater Whiptail
		["i:111663"] = 2, -- Blackwater Whiptail
		["i:111662"] = 1, -- Small Blackwater Whiptail
	},
	-- ========================================== Aromatic Fish Oil (BFA) ===========================
	["i:160711"] = {
		["i:152545"] = 1, -- Frenzied Fangtooth
		["i:152547"] = 1, -- Great Sea Catfish
		["i:152546"] = 1, -- Lane Snapper
		["i:152549"] = 1, -- Redtail Loach
		["i:152543"] = 1, -- Sand Shifter
		["i:152544"] = 1, -- Slimy Mackerel
		["i:152548"] = 1, -- Tiragarde Perch
	},
	-- ========================================== Ore Nuggets =======================================
	["i:2771"] = {
		["i:108295"] = 0.1, -- Tin Ore
	},
	["i:2772"] = {
		["i:108297"] = 0.1, -- Iron Ore
	},
	["i:2775"] = {
		["i:108294"] = 0.1, -- Silver Ore
	},
	["i:2776"] = {
		["i:108296"] = 0.1, -- Gold Ore
	},
	["i:3858"] = {
		["i:108300"] = 0.1, -- Mithril Ore
	},
	["i:7911"] = {
		["i:108299"] = 0.1, -- Truesilver Ore
	},
	["i:10620"] = {
		["i:108298"] = 0.1, -- Thorium Ore
	},
	["i:23424"] = {
		["i:108301"] = 0.1, -- Fel Iron Ore
	},
	["i:23425"] = {
		["i:108302"] = 0.1, -- Adamantite Ore
	},
	["i:23426"] = {
		["i:108304"] = 0.1, -- Khorium Ore
	},
	["i:23427"] = {
		["i:108303"] = 0.1, -- Eternium Ore
	},
	["i:36909"] = {
		["i:108305"] = 0.1, -- Cobalt Ore
	},
	["i:36910"] = {
		["i:108391"] = 0.1, -- Titanium Ore
	},
	["i:36912"] = {
		["i:108306"] = 0.1, -- Saronite Ore
	},
	["i:52183"] = {
		["i:108309"] = 0.1, -- Pyrite Ore
	},
	["i:52185"] = {
		["i:108308"] = 0.1, -- Elementium Ore
	},
	["i:53038"] = {
		["i:108307"] = 0.1, -- Obsidium Ore
	},
	["i:72092"] = {
		["i:97512"] = 0.1, -- Ghost Iron Ore
	},
	["i:109119"] = {
		["i:109991"] = 0.1, -- True Iron Ore
	},
	-- =========================================== Herb Parts ======================================
	["i:2449"] = {
		["i:108319"] = 0.1, -- Earthroot
	},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Transform.TargetItemIterator()
	return private.TableKeyIterator, DATA, nil
end

function Transform.SourceItemIterator(targetItemString)
	return private.TableKeyIterator, DATA[targetItemString], nil
end

function Transform.GetRate(targetItemString, sourceItemString)
	return DATA[targetItemString][sourceItemString]
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.TableKeyIterator(tbl, index)
	index = next(tbl, index)
	return index
end
