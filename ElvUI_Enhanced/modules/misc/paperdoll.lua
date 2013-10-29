local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local PD = E:NewModule('PaperDoll', 'AceEvent-3.0', 'AceTimer-3.0');

local find = string.find
local initialized = false
local originalInspectFrameUpdateTabs
local updateTimer

local slots = {
	["HeadSlot"] = { true, true },
	["NeckSlot"] = { true, false },
	["ShoulderSlot"] = { true, true },
	["BackSlot"] = { true, false },
	["ChestSlot"] = { true, true },
	["WristSlot"] = { true, true },
	["MainHandSlot"] = { true, true },
	["SecondaryHandSlot"] = { true, true },
	["HandsSlot"] = { true, true },
	["WaistSlot"] = { true, true },
	["LegsSlot"] = { true, true },
	["FeetSlot"] = { true, true },
	["Finger0Slot"] = { true, false },
	["Finger1Slot"] = { true, false },
	["Trinket0Slot"] = { true, false },
	["Trinket1Slot"] = { true, false },
}

local levelAdjust = {
	["0"]=0,["1"]=8,["373"]=4,["374"]=8,["375"]=4,["376"]=4,
	["377"]=4,["379"]=4,["380"]=4,["445"]=0,["446"]=4,["447"]=8,
	["451"]=0,["452"]=8,["453"]=0,["454"]=4,["455"]=8,["456"]=0,
	["457"]=8,["458"]=0,["459"]=4,["460"]=8,["461"]=12,["462"]=16,
	["465"]=0,["466"]=4,["467"]=8,["468"]=0,["469"]=4,["470"]=8,
	["471"]=12,["472"]=16,["491"]=0,["492"]=4,["493"]=8,["494"]=0,
	["495"]=4,["496"]=8,["497"]=12,["498"]=16,
	
}

local levelColors = {
	[0] = "|cffff0000",
	[1] = "|cff00ff00",
	[2] = "|cffffff88",
}

-- From http://www.wowhead.com/items?filter=qu=7;sl=16:18:5:8:11:10:1:23:7:21:2:22:13:24:15:28:14:4:3:19:25:12:17:6:9;minle=1;maxle=1;cr=166;crs=3;crv=0
local heirlooms = {
	[80] = {
		44102,42944,44096,42943,42950,48677,42946,42948,42947,42992,
		50255,44103,44107,44095,44098,44097,44105,42951,48683,48685,
		42949,48687,42984,44100,44101,44092,48718,44091,42952,48689,
		44099,42991,42985,48691,44094,44093,42945,48716
	},
}

function PD:UpdatePaperDoll(inspect)
	if not initialized then return end
	
	if InCombatLockdown() then
		PD:RegisterEvent("PLAYER_REGEN_ENABLED", "UpdatePaperDoll", inspect)	
		return
	else
		PD:UnregisterEvent("PLAYER_REGEN_ENABLED")
 	end
 	
	local unit = (inspect and InspectFrame) and InspectFrame.unit or "player"
	if not unit then return end
	if unit and not CanInspect(unit, false) then return end
	
	local frame, slot, current, maximum, r, g, b
	local baseName = inspect and "Inspect" or "Character"
	local itemLink, itemLevel
	local	avgItemLevel, avgEquipItemLevel = GetAverageItemLevel()
	
	for k, info in pairs(slots) do
		frame = _G[("%s%s"):format(baseName, k)]

		slot = GetInventorySlotInfo(k)	
		if info[1] then
			frame.ItemLevel:SetText()
			if E.private.equipment.itemlevel.enable and info[1] then
				itemLink = GetInventoryItemLink(unit, slot)
				
        if itemLink then
      		itemLevel = self:GetItemLevel(unit, itemLink)
          if itemLevel and avgEquipItemLevel then
              frame.ItemLevel:SetFormattedText("%s%d|r", levelColors[(itemLevel < avgEquipItemLevel-10 and 0 or (itemLevel > avgEquipItemLevel + 10 and 1 or (2)))], itemLevel)
          end
        end
			end
		end

		if not inspect and info[2] then
			frame.DurabilityInfo:SetText()
			if  E.private.equipment.durability.enable then
				current, maximum = GetInventoryItemDurability(slot)
				if current and maximum and (not E.private.equipment.durability.onlydamaged or current < maximum) then
					r, g, b = E:ColorGradient((current / maximum), 1, 0, 0, 1, 1, 0, 0, 1, 0)
					frame.DurabilityInfo:SetFormattedText("%s%.0f%%|r", E:RGBToHex(r, g, b), (current / maximum) * 100)
				end
			end
		end	
	end	
end

function PD:DelayUpdateInfo(inspect)
	if (updateTimer == 0 or PD:TimeLeft(updateTimer) == 0) then
		updateTimer = PD:ScheduleTimer("UpdatePaperDoll", .2, inspect)
	end
end


function PD:GetItemLevel(unit, itemLink)
	local rarity, itemLevel = select(3, GetItemInfo(itemLink))    
	if rarity == 7 then -- heirloom adjust
	  itemLevel = self:HeirLoomLevel(unit, itemLink)
	end
	local upgrade = itemLink:match(":(%d+)\124h%[")
	if itemLevel and upgrade and levelAdjust[upgrade] then
	  itemLevel = itemLevel + levelAdjust[upgrade]
	end
	return itemLevel
end

--[[heirloom ilvl equivalents
Vanilla: 1-60 = 60 / 60 = scales by 1 ilvl per player level
TBC rares: 85-115 = 30 / 10 = scales by 3 ilvl per player level
WLK rares: 130-190(200) = 60 / 10 = scales by 6 ilvl per player level
CAT rares: 272-333 = 61 / 5 = scales by 12.2 ilvl per player level
MOP rares: 364-450 = 86 / 5 = scales by 17.2 ilvl per player level (guesswork)
]]
function PD:HeirLoomLevel(unit, itemLink)
	local level = UnitLevel(unit)

  if level > 85 then level = 85 end 	
	if level > 80 then
		local _, _, _, _, itemId = find(itemLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")
		--print(itemId)
		itemId = tonumber(itemId);
		for _, id in pairs(heirlooms[80]) do
			if id == itemId then
				level = 80
				break
			end
		end
	end

	if level > 80 then -- CAT heirloom scaling kicks in at 81
	  return (( level - 81) * 12.2) + 272;
	elseif level > 67 then -- WLK heirloom scaling kicks in at 68
	  return (( level - 68) * 6) + 130;
	elseif level > 59 then -- TBC heirloom scaling kicks in at 60
	  return (( level - 60) * 3) + 85;
	else
	  return level
	end
end

function PD:InspectFrame_UpdateTabsComplete()
	originalInspectFrameUpdateTabs()
	PD:DelayUpdateInfo(true)
end

function PD:InitialUpdatePaperDoll()
	PD:UnregisterEvent("PLAYER_ENTERING_WORLD")

	LoadAddOn("Blizzard_InspectUI")

	self:BuildInfoText("Character")
	self:BuildInfoText("Inspect")

	-- hook to inspect frame update
	originalInspectFrameUpdateTabs = _G.InspectFrame_UpdateTabs
	_G.InspectFrame_UpdateTabs = PD.InspectFrame_UpdateTabsComplete
	
	-- update player info
	self:ScheduleTimer("UpdatePaperDoll", 10, false)

	initialized = true
end

function PD:BuildInfoText(name)
	for k, info in pairs(slots) do
		frame = _G[("%s%s"):format(name, k)]

		if info[1] then
			frame.ItemLevel = frame:CreateFontString(nil, "OVERLAY")
			frame.ItemLevel:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 1, 1)
			frame.ItemLevel:FontTemplate(E.media.font, 12, "THINOUTLINE")
		end
		
		if name == "Character" and info[2] then
			frame.DurabilityInfo = frame:CreateFontString(nil, "OVERLAY")
			frame.DurabilityInfo:SetPoint("TOP", frame, "TOP", 0, -4)
			frame.DurabilityInfo:FontTemplate(E.media.font, 12, "THINOUTLINE")
		end
	end
end

function PD:Initialize()
	local frame
	
	PD:RegisterEvent("UPDATE_INVENTORY_DURABILITY", "UpdatePaperDoll", false)	
	PD:RegisterEvent("PLAYER_EQUIPMENT_CHANGED", "UpdatePaperDoll", false)
	PD:RegisterEvent("SOCKET_INFO_UPDATE", "UpdatePaperDoll", false)
	PD:RegisterEvent("COMBAT_RATING_UPDATE", "UpdatePaperDoll", false)
	PD:RegisterEvent("MASTERY_UPDATE", "UpdatePaperDoll", false)
	
	PD:RegisterEvent("PLAYER_ENTERING_WORLD", "InitialUpdatePaperDoll")
end

E:RegisterModule(PD:GetName())