local L = LibStub("AceLocale-3.0"):GetLocale("Mendeleev")
local PT = LibStub("LibPeriodicTable-3.1")

-- We cache the results, so that we don't have to do a PT lookup for every item.
local cache = {}

Mendeleev = LibStub("AceAddon-3.0"):NewAddon("Mendeleev", "AceHook-3.0", "AceEvent-3.0")
local Mendeleev     = Mendeleev
local GetItemCount  = GetItemCount
local GetItemIcon   = GetItemIcon
local GetItemInfo   = GetItemInfo
local GetSpellInfo  = GetSpellInfo

local skillcolor = {
	[-1] = "|cffff0000",
	[0] = "|cff7f7f7f",
	[1] = "|cff3fbf3f",
	[2] = "|cffffff00",
	[3] = "|cffff7f3f",
}

local options = {
	type = "group",
	get = function(info) return Mendeleev.db.profile[info[#info]] end,
	set = function(info, value) Mendeleev.db.profile[info[#info]] = value end,
	args = {
		showItemLevel = {
			type = "toggle",
			name = L["Show item level"],
			desc = L["Toggle showing the item level in the tooltip."],
			width = "full",
			order = 1,
		},
		showItemID = {
			type = "toggle",
			name = L["Show item identifier"],
			desc = L["Toggle showing the item identifier in the tooltip."],
			width = "full",
			order = 2,
		},
		showItemCount = {
			type = "toggle",
			name = L["Show item count"],
			desc = L["Toggle showing the item count in the tooltip."],
			width = "full",
			order = 3,
		},
		showStackSize = {
			type = "toggle",
			name = L["Show stack size"],
			desc = L["Toggle showing the stack size in the tooltip."],
			width = "full",
			order = 4,
		},
		showUsedInTree = {
			type = "toggle",
			name = L["Show 'used in' tree"],
			desc = L["Toggle showing the 'used in' tree in the tooltip."],
			width = "full",
			order = 5,
		},
		UsedInTreeIcons = {
			type = "toggle",
			name = L["Show icons in 'used in' tree"],
			desc = L["Toggle showing of icons in the 'used in' tree."],
			width = "full",
			order = 6,
		},
		UsedInTreeMinSkill = {
			type = "select",
			name = L["Minimal skill for 'used in' tree"],
			desc = L["Minimal skill advance for an item to show up in the 'used in' tree."],
			values = {[-1] = skillcolor[-1]..L["TRADESKILL_UNKNOWN"].."|r", [0] = skillcolor[0]..L["TRADESKILL_TRIVIAL"].."|r", [1] = skillcolor[1]..L["TRADESKILL_EASY"].."|r", [2] = skillcolor[2]..L["TRADESKILL_MEDIUM"].."|r", [3] = skillcolor[3]..L["TRADESKILL_OPTIMAL"].."|r"},
			width = "full",
			order = 7,
		},
		UsedInTreeMinSkillShift = {
			type = "select",
			name = L["Minimal skill for 'used in' tree (shift)"],
			desc = L["Minimal skill advance for an item to show up in the 'used in' tree if Shift is held."],
			values = {[-1] = skillcolor[-1]..L["TRADESKILL_UNKNOWN"].."|r", [0] = skillcolor[0]..L["TRADESKILL_TRIVIAL"].."|r", [1] = skillcolor[1]..L["TRADESKILL_EASY"].."|r", [2] = skillcolor[2]..L["TRADESKILL_MEDIUM"].."|r", [3] = skillcolor[3]..L["TRADESKILL_OPTIMAL"].."|r"},
			width = "full",
			order = 8,
		},
	},
}

function Mendeleev:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("MendeleevDB", {
		profile = {
			showItemLevel = false,
			showItemID = false,
			showItemCount = false,
			showStackSize = true,
			showUsedInTree = true,
			UsedInTreeIcons = true,
			UsedInTreeMinSkill = 0,
			UsedInTreeMinSkillShift = -1,
			sets = {},
		}
	}, true)

	local t = {
		name = L["Toggle sets."],
		desc = L["Toggle sets from showing information in the tooltip."],
		type = "group",
		get = function(info) return not self.db.profile.sets[info[#info]] end,
		set = function(info, value)
			self.db.profile.sets[info[#info]] = not value
			wipe(cache)
		end,
		args = {},
	}

	for _, v in next, MENDELEEV_SETS do
		local key = v.setindex
		local parent = key:match("^([^%.]*)")
		key = key:gsub(" ", "_")
		if not t.args[parent] then
			t.args[parent] = {
				name = L[parent],
				desc = L["Toggle sets in the %s category."]:format(L[parent]),
				type = "group",
				args = {},
			}
		end
		t.args[parent].args[key] = {
			name = v.name,
			desc = L["Toggle %s."]:format(v.name),
			type = "toggle",
		}
	end
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Mendeleev", options)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Mendeleev-Sets", t)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Mendeleev", "Mendeleev")
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Mendeleev-Sets", "Sets", "Mendeleev")
end

local firstLoad = true
function Mendeleev:OnEnable()
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

	if firstLoad then
		-- load our sets into the cache
		for _,v in next, MENDELEEV_SETS do
			PT:GetSetTable(v.setindex)
		end
		collectgarbage()
		firstLoad = nil
	end

	self:RegisterEvent("TRADE_SKILL_SHOW", "ScanTradeSkill")
end

-- function Mendeleev:OnDisable()
-- end

function Mendeleev:GetUsedInTable(skill, reagentid)
	local ret
	local ptrmr = PT:GetSetTable("TradeskillResultMats.Reverse." .. skill)
	if PT:IsSetMulti("TradeskillResultMats.Reverse." .. skill) then
		for k, v in ipairs(ptrmr) do
			if type(v) == "table" then
				local guit = self:GetUsedInTable(v.set, reagentid)
				if guit then
					if not ret then 
						ret = {}
					end
					for k, v in pairs(guit) do
						ret[k] = v
					end
				end
			end
		end
	else
		local usedin = ptrmr and ptrmr[tonumber(reagentid)]
		if usedin then
			for item, num in usedin:gmatch("(%-?%d+)x(%d+)") do
				item = tonumber(item)
				num = tonumber(num)
				if not ret then 
					ret = {}
				end
				ret[item] = num
			end
		end
	end
	return ret
end

local tradeskillNames = {
	["Alchemy"] = GetSpellInfo(2259),
	["Blacksmithing"] = GetSpellInfo(2018),
	["Cooking"] = GetSpellInfo(2550),
	["Enchanting"] = GetSpellInfo(7411),
	["Engineering.Basic"] = GetSpellInfo(4036),
	["Engineering.Gnomish"] = GetSpellInfo(20220),
	["Engineering.Goblin"] = GetSpellInfo(20221),
	["First Aid"] = GetSpellInfo(3273),
	["Inscription"] = GetSpellInfo(45357),
	["Jewelcrafting"] = GetSpellInfo(25229),
	["Leatherworking"] = GetSpellInfo(2108),
	["Poisons"] = GetSpellInfo(2842),
	["Smelting"] = GetSpellInfo(2575),
	["Tailoring"] = GetSpellInfo(3908),
}

function Mendeleev:GetLinesForTradeskillReagent(skill, reagent)
	if type(skill) ~= "string" or type(reagent) ~= "string" then return end
	local id = reagent:match("^|c%x+|Hitem:(%d+):")
	local count = 0
	for item, num in pairs(self:GetUsedInTable(skill, id) or {}) do
		count = count + 1
	end
	if count > 0 then
		return ("%s (%d)"):format(tradeskillNames[skill], count)
	end
end

local cacheUsedInFull = {}

local id2skill = setmetatable({}, {__index = function(self, key) local value = -1; self[key] = value; return value end})
--local id2skill = {}

local tradeskills = {
	"Alchemy",
	"Blacksmithing",
	"Cooking",
	"Enchanting",
	"Engineering.Basic",
	"Engineering.Gnomish",
	"Engineering.Goblin",
	"First Aid",
	"Inscription",
	"Jewelcrafting",
	"Leatherworking",
	"Poisons",
	"Smelting",
	"Tailoring",
}

local function SortUsedInTree(a,b)
	if (not a or not b) then
		return true
	end
-- 3 -> skill
	if (a[3] > b[3]) then
		return true
	end
	if (a[3] < b[3]) then
		return false
	end
-- 2 -> name
	if (a[2] and (not b[2] or a[2] < b[2])) then
		return true
	end
	if b[2] then -- not a[2] or a[2] > b[2]
		return false
	end
-- 1 -> id
	return a[1] < b[1]
end

function Mendeleev:GetUsedInFullTable(id)
	if cacheUsedInFull[id] == nil then
		for _, skill in next, tradeskills do
			local usedin = self:GetUsedInTable(skill, id)
			if usedin then
				for item, num in pairs(usedin) do
					 if not cacheUsedInFull[id] then 
						cacheUsedInFull[id] = {}
					end
					cacheUsedInFull[id][item] = num
				end
			end
		end
		if not cacheUsedInFull[id] then
			cacheUsedInFull[id] = false
		end
	end
	return cacheUsedInFull[id]
end

function Mendeleev:GetUsedInTree(id, history)
	local data = {}
	local skill = id2skill[id] or 0
	local usedin = self:GetUsedInFullTable(id)
	if usedin then
		for k, v in pairs(usedin) do
			if history:find(">"..k.."<") then
				if k < 0 then
					data[#data+1] = {k, GetSpellInfo(-k) or false, id2skill[k], "..."}
				else
					data[#data+1] = {k, GetItemInfo(k) or false, id2skill[k], "..."}
				end
			else
				local tdata, tskill = self:GetUsedInTree(k, history..">"..k.."<")
				if tskill > skill then
					skill = tskill
				end
				data[#data+1] = tdata
			end
		end
	end
	table.sort(data, SortUsedInTree)
	table.insert(data, 1, id)
	if id < 0 then
		table.insert(data, 2, GetSpellInfo(-id) or false)
	else
		table.insert(data, 2, GetItemInfo(id) or false)
	end
	table.insert(data, 3, skill)
	return data, skill
end

function Mendeleev:GetUsedInList(tree, level, counttable, countmult)
	local UsedInTreeIcons         = self.db.profile.UsedInTreeIcons
	local UsedInTreeMinSkill      = self.db.profile.UsedInTreeMinSkill
	local UsedInTreeMinSkillShift = self.db.profile.UsedInTreeMinSkillShift

	local list = {}
	local didpoints = false
	for i = 4, #tree do
		local v = tree[i]
		if v[3] >= UsedInTreeMinSkill or (IsShiftKeyDown() and v[3] >= UsedInTreeMinSkillShift) then
			if UsedInTreeIcons then
				local icontag = (v[1] < 0) and select(3, GetSpellInfo(-v[1])) or GetItemIcon(v[1])
				icontag = icontag and "|T"..icontag..":18|t " or ""
				list[#list+1] = string.rep("    ", level).."- "..skillcolor[id2skill[v[1]] or -1]..icontag..(v[2] or ((v[1] < 0) and ("spell:"..(-v[1])) or ("item:"..v[1]))).."|r"
			else
				list[#list+1] = string.rep("    ", level).."- "..skillcolor[id2skill[v[1]] or -1]..(v[2] or ((v[1] < 0) and ("spell:"..(-v[1])) or ("item:"..v[1]))).."|r"
			end
			list[#list+1] = countmult * counttable[v[1]]
			if type(v[4]) == "table" then
				local slist = self:GetUsedInList(v, level+1, cacheUsedInFull[v[1]], countmult * counttable[v[1]])
				if #slist > 0 then
					for _, line in pairs(slist) do
						list[#list+1] = line
					end
				end
			elseif v[4] == "..." then
				list[#list+1] = string.rep("    ", level+1).."..."
				list[#list+1] = ""
			end
		elseif not didpoints then
			list[#list+1] = string.rep("    ", level).."- "..skillcolor[v[3]].."...|r"
			list[#list+1] = ""
			didpoints = true
		end
	end
	return list
end

local skillquals = {trivial = 0, easy = 1, medium = 2, optimal = 3}

function Mendeleev:ScanTradeSkill()
	local isLink, unit = IsTradeSkillLinked()
	if unit and not UnitIsUnit(unit, "player") then return end
	for i = 1, GetNumTradeSkills() do
		local skillName, skillType = GetTradeSkillInfo(i)
		if skillType ~= "header" and skillName then
			local item = GetTradeSkillItemLink(i)
			if item then
				local id = tonumber(item:match("item:(%d+)")) or -tonumber(item:match("enchant:(%d+)"))
				if id then
					id2skill[tonumber(id)] = skillquals[skillType]
				end
			end
		end
	end
end

function Mendeleev:OnTooltipSetItem(tooltip, ...)
	local item = select(2, tooltip:GetItem())
	if tooltip.Mendeleev_data_added or not item or not GetItemInfo(item) then return end
	local quality,iLevel,_,_,_,stack = select(3, GetItemInfo(item))
	local db = self.db.profile

	if cache[item] == nil then
		for _,v in next, MENDELEEV_SETS do
			if not db.sets[v.setindex] and quality >= v.quality then
				local lines = nil
				local c = v.colour or "|cffffffff"
				for set,desc in pairs(v.sets) do
					local val = PT:ItemInSet(item,set)
					if val then
						if not lines then lines = {} end
						if type(v.descfunc) == "function" then
							local ret = v.descfunc(desc, item, val)
							if type(ret) == "table" then
								for i, v in next, ret do
									lines[#lines+1] = c .. ret[i] .. "|r"
								end
							elseif type(ret) == "string" then
								lines[#lines+1] = c .. ret .. "|r"
							end
						else
							lines[#lines+1] = c .. desc .. (type(val) ~= "boolean" and v.useval and v.useval(val) or "") .. "|r"
						end
					end
				end
				if lines then
					table.sort(lines)
					if not cache[item] then cache[item] = {} end
					cache[item][v.setindex] = {c .. v.header .. "|r", lines}
				end
			end
		end
		if cache[item] then
			local indextable = {}
			for k in pairs(cache[item]) do
				indextable[#indextable+1] = k
			end
			table.sort(indextable)
			cache[item]["_index"] = indextable
		else
			cache[item] = false
		end
	end

	if cache[item] then
		for _, k in next, cache[item]["_index"] do
			local v = cache[item][k]
			local first = 1
			for i, line in next, v[2] do
				if first == 1 then
					tooltip:AddDoubleLine(v[1], line)
					first = 0
				else
					tooltip:AddDoubleLine(" ", line)
				end
			end
		end
	end

	if db.showItemCount then
		local count = GetItemCount(item, false)
		local bankcount = GetItemCount(item, true) - count
		if count + bankcount > 0 then
			tooltip:AddDoubleLine(L["You have"], count..(bankcount > 0 and (" (+"..bankcount..")") or ""))
		end
	end

	if stack and stack > 1 and db.showStackSize then
		tooltip:AddDoubleLine(L["Stacksize"], stack)
	end

	if db.showItemID then
		local id = item:match("^|%x+|Hitem:(%d+):")
		if id then
			tooltip:AddDoubleLine(L["Item ID"], id)
		end
	end

	if iLevel and db.showItemLevel then
		tooltip:AddDoubleLine(L["iLevel"], iLevel)
	end

	if db.showUsedInTree then
		local id = tonumber(item:match("^|%x+|Hitem:(%d+):"))
		local t = Mendeleev:GetUsedInTree(id, ">"..id.."<")
		local l = Mendeleev:GetUsedInList(t, 1, cacheUsedInFull[id], 1)
		local header = L["Used in"]
		for i = 1, #l, 2 do
			if header then
				tooltip:AddLine(header)
				header = nil
			end
			tooltip:AddDoubleLine(l[i], l[i+1])
		end
	end

	tooltip.Mendeleev_data_added = true
end

function Mendeleev:OnTooltipCleared(tooltip, ...)
	tooltip.Mendeleev_data_added = nil
end

