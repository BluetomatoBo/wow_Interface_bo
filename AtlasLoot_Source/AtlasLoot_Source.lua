AtlasLoot_Source = LibStub("AceAddon-3.0"):NewAddon("AtlasLoot_Source", "AceHook-3.0")
local BabbleBoss = AtlasLoot_Source_GetLocaleLibBabble("LibBabble-Boss-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot_Source");

-- Saves item details temporary
local cache = {}

-- Saved Variables
local db
AtlasLoot_SourceDB = {}
AtlasLoot_SourceDBDefaults = {
	profile = {
		
		enableItemID = false,
		itemIDColor = {
			r = 1.0,
			g = 0.549,
			b = 0.0,
		},

		enableDropLocation = true,
		dropLocationColor = {
			r = 0.407,
			g = 0.513,
			b = 0.545,
		},

		enableFactionInfo = true,
		factionInfoColor = {
			r = 0.117,
			g = 0.564,
			b = 1.0,
		},
		
		enablePriceInfo = true,
		priceInfoColor = {
			r = 0.498,
			g = 1.0,
			b = 0.831,
		},
		
		enableCraftingInfo = true,
		addSpellIntoTT = true,
		replaceItemWithSpellTT = false,
	},
}

-- Tooltip for professions
local AtlasLoot_Source_Tooltip = CreateFrame("GAMETOOLTIP","AtlasLoot_Source_Tooltip",nil,"GameTooltipTemplate")
AtlasLoot_Source_Tooltip:SetOwner(UIParent, "ANCHOR_NONE")

local AtlasLoot_Source_IniModus = {
	[1] = "Normal",
	[2] = "Heroic",
	[3] = "25 Man",
	[4] = "25 Man Heroic",
}

local AtlasLoot_Source_PriceFormat = {
	["#C#"] = "|TInterface\\AddOns\\AtlasLoot\\Images\\bronze:0|t",				-- copper
	["#S#"] = "|TInterface\\AddOns\\AtlasLoot\\Images\\silver:0|t",				-- silver
	["#G#"] = "|TInterface\\AddOns\\AtlasLoot\\Images\\gold:0|t",				-- gold
	["#GC#"] = "|TInterface\\Icons\\INV_Mushroom_02:0|t",						-- glowcap
	["#ST#"] = "|TInterface\\Icons\\INV_Jewelry_FrostwolfTrinket_04:0|t",		-- Spiritshard
	["#BR#"] = GetItemIcon(37829),		-- Brewfest
	["#VA#"] = GetItemIcon(49927),		-- Valentineday
	["#MS#"] = GetItemIcon(23247),		-- Midsummer
	["#NB#"] = GetItemIcon(44791),		-- Nobelgarden
	["#DJW#"] = 61,			-- Dalaran Jewelcrafter's Token
	["#DCK#"] = 81,			-- Dalaran Cooking Award
	["#CS#"] = 241,			-- Champion's Seal
	["#IJW#"] = 361,		-- Illustrious Jewelcrafter's Token
	["#CQT#"] = 390, 		-- Conquest Points
	["#TB#"] = 391,			-- Tol Barad Commendation
	["#H#"] = 392,			-- Honor Points	
	["#J#"] = 395,			-- Justice Points
	["#V#"] = 396,			-- Valor Points
	["#CW#"] = 402,			-- Chef's Award
	["#WT#"] = 416,			-- Mark of the World Tree
}

local AtlasLoot_Source_FormatOrder = {
	"IBD",
	"FAC",
	"PRI",
	"PROF",
}

local AtlasLoot_Source_Format = {
	["IBD"] = {
		"(%d+):(%d+):(%d+):(%d+);",			-- Boss:Ini:Modus(Hero):Dropchance
		function(tab)						-- Format Table	
			local cacheTab = {
				["ini"] = {},
				["boss"] = {},
				["_cache"] = {},
			}
			local rettab = {}
			local ini, boss, mod, drop = "","","",""
			for k,v in ipairs(tab) do
				ini = AtlasLoot_Source_ID[tonumber(v[2])]
				boss = AtlasLoot_Source_ID[tonumber(v[1])]
				mod = tonumber(v[3])
				drop = tonumber(v[4])
				
				if ini and boss and ini ~= "?" then
					if drop and drop > 0 then
						drop = drop / 100
					else
						drop = nil
					end
					if boss and drop then
						--boss = string.format("%s (%d%%)", boss, drop)
						boss = boss.." ("..drop.."%)"
					end
					if ini and mod and AtlasLoot_Source_IniModus[mod] then
						--ini = string.format("%s (%s)", ini, AtlasLoot_Source_IniModus[mod])
					end
					cacheTab["boss"][boss] = v
					if not cacheTab["_cache"][ini] then
						cacheTab["ini"][#cacheTab["ini"] + 1] = ini
						cacheTab["_cache"][ini] = {}
					end
					cacheTab["_cache"][ini][#cacheTab["_cache"][ini] + 1] = boss
				end
			end
			if #cacheTab["ini"] == 0 then return nil end
			table.sort(cacheTab["ini"])
			for k,v in ipairs(cacheTab["ini"]) do
				rettab[k] = {
					["_info"] = v
				}
				table.sort(cacheTab["_cache"][v])
				for kb, vb in ipairs(cacheTab["_cache"][v]) do
					if not rettab[k][tonumber(cacheTab["boss"][vb][3])] then
						rettab[k][tonumber(cacheTab["boss"][vb][3])] = {}
					end
					rettab[k][tonumber(cacheTab["boss"][vb][3])][#rettab[k][tonumber(cacheTab["boss"][vb][3])] + 1] = vb
				end
			end
			cacheTab = nil
			tab = nil
			--printTab(rettab)
			return rettab
		end,
		function(tooltip, tab)				-- Tooltip erstellen
			if not db.enableDropLocation then return end
			tooltip:AddLine(" ")
			for k,v in ipairs(tab) do
				for ka, va in ipairs(AtlasLoot_Source_IniModus) do
					if v[ka] then
						for kb, vb in ipairs(v[ka]) do
							if kb == 1 then
								if v["_info"] and ka and AtlasLoot_Source_IniModus[ka] and ka > 1 then
									tooltip:AddDoubleLine(string.format("%s (%s)", v["_info"], AtlasLoot_Source_IniModus[ka]), vb, db.dropLocationColor.r, db.dropLocationColor.g, db.dropLocationColor.b, db.dropLocationColor.r, db.dropLocationColor.g, db.dropLocationColor.b)
								else
									tooltip:AddDoubleLine(v["_info"], vb, db.dropLocationColor.r, db.dropLocationColor.g, db.dropLocationColor.b, db.dropLocationColor.r, db.dropLocationColor.g, db.dropLocationColor.b)
								end
							--	tooltip:AddDoubleLine(v["_info"], vb)
							else
								tooltip:AddDoubleLine(" ", vb, db.dropLocationColor.r, db.dropLocationColor.g, db.dropLocationColor.b, db.dropLocationColor.r, db.dropLocationColor.g, db.dropLocationColor.b)
							end
						end
					end
				end
			end
		end,
	},		-- Items Ini/Boss
	["PRI"] = {
		"(%d+)-([%d#A-Z]+);",			-- Boss:Ini:Modus(Hero):Dropchance
		function(tab)
			local rettab = {}

			for ka,va in ipairs(tab) do
				
				local priceString = ""
				local tmp = ""
				for k,v in pairs(AtlasLoot_Source_PriceFormat) do
					tmp = string.match(va[2], "(%d+)"..k)
					if tmp then
						if type(v) == "number" then
							AtlasLoot_Source_PriceFormat[k] = select(3, GetCurrencyInfo(v))
							AtlasLoot_Source_PriceFormat[k] = "|TInterface\\Icons\\"..AtlasLoot_Source_PriceFormat[k]..":0|t"
						end
						
						if priceString ~= "" then
							priceString = priceString..", "..tmp.." "..AtlasLoot_Source_PriceFormat[k]
						else
							priceString = tmp.." "..AtlasLoot_Source_PriceFormat[k]
						end
					end
				end
				if AtlasLoot_Source_ID[tonumber(va[1])] and priceString then
					rettab[#rettab + 1] = { AtlasLoot_Source_ID[tonumber(va[1])], priceString }
				end
			end
			table.sort(rettab, function(x,y) return (x[1] > y[1]) end)
			
			return rettab
		end,
		function(tooltip, tab)
			if not db.enablePriceInfo then return end
			tooltip:AddLine(" ")
			for k,v in ipairs(tab) do
				tooltip:AddDoubleLine(v[1], v[2], db.priceInfoColor.r, db.priceInfoColor.g, db.priceInfoColor.b, db.priceInfoColor.r, db.priceInfoColor.g, db.priceInfoColor.b )
			end
		end,
	},		-- Item Price (PvP)
	["FAC"] = {
		"(%d+)#(%d+);",
		function(tab)
			local rettab = {}

			for k,v in ipairs(tab) do
				rettab[#rettab + 1] = {AtlasLoot_Source_ID[tonumber(v[1])] , AtlasLoot_Source_ID[tonumber(v[2])]}
			end
			table.sort(rettab, function(x,y) return (x[1] > y[1]) end)
			
			return rettab
		end,
		function(tooltip, tab)		
			if not db.enableFactionInfo then return end
			tooltip:AddLine(" ")
			for k,v in ipairs(tab) do
				tooltip:AddDoubleLine(v[1], v[2], db.factionInfoColor.r, db.factionInfoColor.g, db.factionInfoColor.b, db.factionInfoColor.r, db.factionInfoColor.g, db.factionInfoColor.b )
			end
		end,
	},		-- Fraktionen
	["PROF"] = {
		"#(%d+):(%d+)#;",
		function(tab)
			local rettab = {}
			
			if tab[1] then
				rettab = { tonumber(tab[1][1]), tonumber(tab[1][2]) }
			end
			
			return rettab
		end,
		function(tooltip, tab)
			if not db.enableCraftingInfo then return end
			if tab then
				if db.replaceItemWithSpellTT then
					tooltip:ClearLines()
					tooltip:SetSpellByID(tab[1])
				else
					if db.addSpellIntoTT then
						AtlasLoot_Source_Tooltip:SetOwner(UIParent, "ANCHOR_NONE")
						AtlasLoot_Source_Tooltip:ClearLines();
						AtlasLoot_Source_Tooltip:SetSpellByID(tab[1])
						AtlasLoot_Source_Tooltip:Show()
						tooltip:AddLine(" ")
						for i=1,AtlasLoot_Source_Tooltip:NumLines() do
							if i == 1 then
								tooltip:AddLine(string.format("%s (%s %d)", string.match(_G["AtlasLoot_Source_TooltipTextLeft"..i]:GetText(), "([%w ]+):"), L["Skill Required:"], tab[2] or 1), _G["AtlasLoot_Source_TooltipTextLeft"..i]:GetTextColor())
							elseif string.match(_G["AtlasLoot_Source_TooltipTextLeft"..i]:GetText(), SPELL_REAGENTS) then
								tooltip:AddLine(_G["AtlasLoot_Source_TooltipTextLeft"..i]:GetText(), _G["AtlasLoot_Source_TooltipTextLeft"..i]:GetTextColor())
							end
						end
						AtlasLoot_Source_Tooltip:Hide()
					end
					if db.placeCraftingTTUnderItem then
						AtlasLoot_Source_Tooltip:SetOwner(GameTooltip, "ANCHOR_BOTTOM")
						AtlasLoot_Source_Tooltip:SetSpellByID(tab[1])
						AtlasLoot_Source_Tooltip:AddLine(string.format("\n%s %d", L["Skill Required:"], tab[2] or 1))
						AtlasLoot_Source_Tooltip:Show()
					end
				end
			end
		end,
	},	-- Professions
}

function AtlasLoot_Source:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("AtlasLoot_SourceDB")
    self.db:RegisterDefaults(AtlasLoot_SourceDBDefaults);
    db = self.db.profile
    
    -- Speicherbereinigung freischalten
    setmetatable(cache, {__mode = "v"})
    
end

function AtlasLoot_Source:ResetCache()
	collectgarbage("collect")
end

function AtlasLoot_Source:OnEnable()
	self:SecureHookScript(GameTooltip, "OnTooltipSetItem")
	self:SecureHookScript(GameTooltip, "OnTooltipCleared")
	self:SecureHookScript(ItemRefTooltip, "OnTooltipSetItem")
	self:SecureHookScript(ItemRefTooltip, "OnTooltipCleared")
	self:SecureHookScript(ShoppingTooltip1, "OnTooltipSetItem")
	self:SecureHookScript(ShoppingTooltip1, "OnTooltipCleared")
	self:SecureHookScript(ShoppingTooltip2, "OnTooltipSetItem")
	self:SecureHookScript(ShoppingTooltip2, "OnTooltipCleared")
	self:SecureHookScript(ShoppingTooltip3, "OnTooltipSetItem")
	self:SecureHookScript(ShoppingTooltip3, "OnTooltipCleared")
	
	AtlasLoot_Source_PriceFormat["#BR#"] = "|T"..tostring(GetItemIcon(37829) or "")..":0|t"
	AtlasLoot_Source_PriceFormat["#VA#"] = "|T"..tostring(GetItemIcon(49927) or "")..":0|t"
	AtlasLoot_Source_PriceFormat["#MS#"] = "|T"..tostring(GetItemIcon(23247) or "")..":0|t"
	AtlasLoot_Source_PriceFormat["#NB#"] = "|T"..tostring(GetItemIcon(44791) or "")..":0|t"

	self:OptionsInitialize()

	collectgarbage("collect")
end


local function formatString(str, form)
	if form then
		local rettab = {}
		local func = str:gmatch(form)
		local var
		while true do
			var = { func() }
			if not var or #var == 0 then break end
			table.insert(rettab, var)
		end
		func = nil
		if #rettab <= 0 then return nil end
		return rettab
	end
end

function AtlasLoot_Source:GetItemInfoTable(itemID)
	if cache[itemID] then
		return cache[itemID]
	end
	if AtlasLoot_Source_Item and AtlasLoot_Source_Item[itemID] then
		cache[itemID] = {}
		local tab
		for k,v in pairs(AtlasLoot_Source_Format) do
			tab = formatString(AtlasLoot_Source_Item[itemID], v[1])
			if tab then
				if v[2] then tab = v[2](tab) end
				cache[itemID][k] = tab
			end
		end
		
		return cache[itemID]
	end
	return nil
end

function AtlasLoot_Source:OnTooltipSetItem(tooltip, ...)
	local item = select(2, tooltip:GetItem())
	if item then
		local itemid = item:match("^|%x+|Hitem:(%d+):")
		if itemid then itemid = tonumber(itemid) end
		if itemid then
			if db.enableItemID then
				tooltip:AddLine(string.format("%s: %d", L["ItemID"], itemid), db.itemIDColor.r, db.itemIDColor.g, db.itemIDColor.b)
			end

			local itemtab = AtlasLoot_Source:GetItemInfoTable(itemid)
			if itemtab then
				for k,v in pairs(AtlasLoot_Source_FormatOrder) do
					if itemtab[v] then
						AtlasLoot_Source_Format[v][3](tooltip, itemtab[v])
					end
				end
			end
		end
	end
end

function AtlasLoot_Source:OnTooltipCleared(tooltip, ...)
	AtlasLoot_Source_Tooltip:Hide()
end

function AtlasLoot_Source:EJ_GetBossName(babbleBossName, encounterID)
	if encounterID and EJ_GetEncounterInfo(encounterID) then
		babbleBossName = EJ_GetEncounterInfo(encounterID)
	elseif babbleBossName and BabbleBoss[babbleBossName] then
		babbleBossName = BabbleBoss[babbleBossName]
	elseif not name then
		-- do nothing
	else
		babbleBossName = ""
	end
	return babbleBossName
end
	

