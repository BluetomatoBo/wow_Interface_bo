local LibPetJournal = LibStub("LibPetJournal-2.0")
local addonTitle = "|cFF5cb4f8 Battle Pet - Quality Notifier|r"
local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PET_BATTLE_OPENING_DONE")
EventFrame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded

SLASH_BPQN1 = '/bpqn'
SLASH_BPQN2 = '/battlepetqualitynotifier'

local function options(msg, editbox)
 local command, rest = msg:match("^(%S*)%s*(.-)$");
 if command == "display" and rest ~= "" then
	if rest == "default" then
		BattlePetQualityNotifier["display"] = "default"
		print(addonTitle..": Displaying text in the default chat window.")
	elseif rest == "current" then
		BattlePetQualityNotifier["display"] = "current"
		print(addonTitle..": Displaying text in the current chat window.")
	end
elseif command == "display" and rest == "" then
	print(addonTitle," Display: ",BattlePetQualityNotifier["display"])
else
  -- If not handled above, display some sort of help message
  print(addonTitle..": Syntax: |cFFeeb814/bpqn display default|current|r (Display text in default|current chat window)");
end
end

local function returnHighestJournalPetQuality(SpeciesId)
	local MaxQuality = -1
    for i,petid in LibPetJournal:IteratePetIDs() do 
        local speciesID, customName, level, xp, maxXp, displayID, name, icon,
               petType, creatureID, sourceText, description, isWild, canBattle,
               tradable, unique = C_PetJournal.GetPetInfoByPetID(petid)
        if speciesID == SpeciesId then -- Pet exists in journal
			local _, _, _, _, Quality = C_PetJournal.GetPetStats(petid)
			if MaxQuality < Quality then
                MaxQuality = Quality
            end
		end
    end
	if MaxQuality == -1 then
		return false
	end
	return MaxQuality
end



local function returnJournalPetQuality(petName)
	local MaxQuality = {}
    for i,petid in LibPetJournal:IteratePetIDs() do 
        local speciesID, customName, level, xp, maxXp, displayID, name, icon,
               petType, creatureID, sourceText, description, isWild, canBattle,
               tradable, unique = C_PetJournal.GetPetInfoByPetID(petid)
        if name == petName then -- Pet exists in journal
			local _, _, _, _, Quality = C_PetJournal.GetPetStats(petid)
			table.insert(MaxQuality, (_G.ITEM_QUALITY_COLORS[Quality-1].hex).._G["ITEM_QUALITY"..(Quality-1).."_DESC"].."|cFFffffff("..level..")|r")
		end
    end
	if table.getn(MaxQuality)<1 then
		return false
	end
	MaxQuality = table.concat(MaxQuality,",")
	return MaxQuality
end

local function createToolTip(tooltip,name)
	local owned = returnJournalPetQuality(name)
	if owned then
		tooltip:AddLine("|cffff9000In Journal: |r"..owned)
	else
		tooltip:AddLine("|cffff9000In Journal: |r |cffff3232None|r")
	end
end


EventFrame:SetScript("OnEvent", function(self,event,...) 
	if event == "PET_BATTLE_OPENING_DONE" then
		if BattlePetQualityNotifier["display"] == "current" then
			ChatFrame = SELECTED_CHAT_FRAME
		end
		if BattlePetQualityNotifier["display"] == "default" then
			ChatFrame = DEFAULT_CHAT_FRAME
		end
		if C_PetBattles.IsWildBattle(2,i) then
			ChatFrame:AddMessage("|cFF5cb4f8 Battle Pet - Quality Notifier|r")
			--print("|cFF5cb4f8 Battle Pet - Quality Notifier|r")
			 for i=1,C_PetBattles.GetNumPets(2) do 
				local Quality = C_PetBattles.GetBreedQuality(2,i)
				local SpeciesId = C_PetBattles.GetPetSpeciesID(2,i)
				local Extra = " "
				local HasPet = returnHighestJournalPetQuality(SpeciesId)
				if not HasPet then
					Extra = "|cFFccff00 (Not Owned)|r"
				else
					if HasPet < C_PetBattles.GetBreedQuality(2, i) then
					Extra = "|cFFff5a00 (Upgrade) |r"
					end
				end
				ChatFrame:AddMessage("|cFFf9eb77 Wild Pet "..
				i..
				":|r "..
				_G.ITEM_QUALITY_COLORS[Quality-1].hex..
				C_PetBattles.GetName(2,i)..
				"|r"..
				Extra)
				
				--[[print("|cFFf9eb77 Wild Pet "..
				i..
				":|r "..
				_G.ITEM_QUALITY_COLORS[Quality-1].hex..
				C_PetBattles.GetName(2,i)..
				"|r",
				Extra)]]-- 
			 end
		 end
	 end
	 if event == "ADDON_LOADED" then
		-- If shared global isn't created, create
		if BattlePetQualityNotifier == nil or not BattlePetQualityNotifier then
			BattlePetQualityNotifier = {}
		end
		if BattlePetQualityNotifier["display"] == nil or not BattlePetQualityNotifier["display"] then
			BattlePetQualityNotifier["display"] = "default"
		end
	end
	if event == "PLAYER_LOGOUT"  then
		if BattlePetQualityNotifier["display"] == nil or not BattlePetQualityNotifier["display"] then
			BattlePetQualityNotifier["display"] = "default"
		end
	end
end)

GameTooltip:HookScript("OnTooltipSetUnit", function(self)
	
	if not _G.UnitIsWildBattlePet("mouseover") then
		return
	end
	local name, unit = self:GetUnit()
	if not unit then
		return
	end
		createToolTip(self,name)
end)

--Assign slash handlers
SlashCmdList["BPQN"] = options

