local _G = _G
local ACCEPT = ACCEPT
local C_PetBattles = C_PetBattles
local C_PetBattles_GetAbilityInfoByID = C_PetBattles.GetAbilityInfoByID
local C_PetBattles_GetAttackModifier = C_PetBattles.GetAttackModifier
local C_PetBattles_GetPVPMatchmakingInfo = C_PetBattles.GetPVPMatchmakingInfo
local C_PetBattles_IsInBattle = C_PetBattles.IsInBattle
local C_PetJournal = C_PetJournal
local C_PetJournal_GetNumPetTypes = C_PetJournal.GetNumPetTypes
local C_PetJournal_GetPetInfoByPetID = C_PetJournal.GetPetInfoByPetID
local C_PetJournal_GetPetInfoBySpeciesID = C_PetJournal.GetPetInfoBySpeciesID
local C_PetJournal_GetPetLoadOutInfo = C_PetJournal.GetPetLoadOutInfo
local C_PetJournal_IsJournalUnlocked = C_PetJournal.IsJournalUnlocked
local C_PetJournal_SetAbility = C_PetJournal.SetAbility
local C_PetJournal_SetPetLoadOutInfo = C_PetJournal.SetPetLoadOutInfo
local CANCEL = CANCEL
local ChatEdit_FocusActiveWindow = ChatEdit_FocusActiveWindow
local ClearCursor = ClearCursor
local CreateFrame = CreateFrame
local CreateMacro = CreateMacro
local DeleteMacro = DeleteMacro
local EditMacro = EditMacro
local GameTooltip = GameTooltip
local GetMacroIndexByName = GetMacroIndexByName
local GetMouseFocus = GetMouseFocus
local GetNumMacros = GetNumMacros
local HideUIPanel = HideUIPanel
local hooksecurefunc = hooksecurefunc
local ipairs = ipairs
local Is64BitClient = Is64BitClient
local IsModifiedClick = IsModifiedClick
local math = math
local MAX_ACCOUNT_MACROS = MAX_ACCOUNT_MACROS or 36 -- LOD
local OKAY = OKAY
local pairs = pairs
local PickupMacro = PickupMacro
local print = print
local select = select
local StaticPopup_Hide = StaticPopup_Hide
local StaticPopup_Show = StaticPopup_Show
local StaticPopupDialogs = StaticPopupDialogs
local strlen = strlen
local table = table
local tonumber = tonumber
local type = type
local unpack = unpack

local addonName = ...
local addon = CreateFrame("Frame")
local frameName = "BattlePetTabs"
local petJournalAddonName = "Blizzard_PetJournal"
local numTabs = 8 -- hardcoded tab limit (so they don't grow outside the journal frame)
BattlePetTabsDB2 = type(BattlePetTabsDB2) == "table" and BattlePetTabsDB2 or {} -- defaults

local watcher = CreateFrame("Frame")
local elapsed = 0

local LoadTeam
local Watcher_OnUpdate
local Update
local Initialize

local EMPTY_PET_X64 = "0x0000000000000000"
local EMPTY_PET_X86 = "0x00000000"
local EMPTY_PET = "0x0000"
local EMPTY_PET_DYNAMIC = EMPTY_PET_X64 -- Is64BitClient() and EMPTY_PET_X64 or EMPTY_PET_X86

local MAX_ACTIVE_PETS = 3
local MAX_ACTIVE_ABILITIES = 3
local MAX_PET_LEVEL = 25

local PET_EFFECTIVENESS_CHART = {
  [1] = {4, 5},  -- Humanoid    +Undead      -Critter
  [2] = {1, 3},  -- Dragon      +Humanoid    -Flying
  [3] = {6, 8},  -- Flying      +Magical     -Beast
  [4] = {5, 2},  -- Undead      +Critter     -Dragon
  [5] = {8, 1},  -- Critter     +Beast       -Humanoid
  [6] = {2, 9},  -- Magical     +Dragon      -Water
  [7] = {9, 10}, -- Elemental   +Water       -Mechanical
  [8] = {10, 1}, -- Beast       +Mechanical  -Humanoid
  [9] = {3, 4},  -- Water       +Flying      -Undead
  [10] = {7, 6}, -- Mechanical  +Elemental   -Magical
}

local InCombatLockdown
do
	local combat

	addon:HookScript("OnEvent", function(addon, event, ...)
		if event == "PLAYER_REGEN_DISABLED" then
			combat = 1
		elseif event == "PLAYER_REGEN_ENABLED" then
			combat = nil
		end
	end)

	function InCombatLockdown()
		return _G.InCombatLockdown() or combat
	end
end

do
	local isCoreLoaded, isJournalLoaded

	addon:HookScript("OnEvent", function(addon, event, ...)
		if event == "ADDON_LOADED" then
			if ... == addonName then
				isCoreLoaded = 1
			elseif ... == petJournalAddonName then
				isJournalLoaded = 1
			end
			if isCoreLoaded and isJournalLoaded then
				isCoreLoaded, isJournalLoaded = nil
				addon:UnregisterEvent(event)
				Initialize()
			end
		end
	end)

	addon:RegisterEvent("ADDON_LOADED")
end

local function GetStatIconString(i)
	return "|TInterface\\PetBattles\\BattleBar-AbilityBadge-" .. (i and "Strong" or "Weak") .. ":18:18:0:-2|t" -- 18:18 looks good
end

local function GetPetIconString(i, s) -- needs more work, the dimensions get weird when the image is too big and it creates too much padding
	return "|TInterface\\PetBattles\\PetIcon-" .. (type(i) == "string" and i or (type(i) == "number" and PET_TYPE_SUFFIX[i] or "NO_TYPE")) .. ":22:22:3:" .. (s and "2" or "4.25") .. ":128:256:62:128:102:168|t" -- 18:18 too small, 22:22 is better
end

local function BuildPetTooltipString(petId)
	local speciesId, customName, level, xp, maxXp, displayID, isFavorite, petName, petIcon, petType, creatureID, sourceText, description, isWild, canBattle, tradable, unique = C_PetJournal_GetPetInfoByPetID(petId)
	if not speciesId then
		speciesId, petName, petIcon = 0, "Unknown", "Interface\\Icons\\INV_Misc_QuestionMark.blp"
	elseif customName then
		petName = customName
	end
	if level then
		return GetPetIconString(select(3, C_PetJournal_GetPetInfoBySpeciesID(speciesId)), nil) .. "|T" .. petIcon .. ":18:18|t |cffCCCCCCL"..level.."|r " .. petName .. (maxXp > 0 and level < MAX_PET_LEVEL and " |cffCCCCCC("..math.floor(xp/maxXp*100).."% exp)|r" or "") -- 0:0 too small, 18:18 is better
	end
	return ""
end

local function BuildStrongWeakTooltip(petIds, isAttack, isWeak)
	local speciesId, abilityId, petType
	local modifier, matchStrong, matchWeak
	local temp = {strong = {}, weak = {}, sKeys = {}, wKeys = {}}
	for _, petData in pairs(petIds) do
		local petId = petData[1]
		speciesId = C_PetJournal_GetPetInfoByPetID(petId)
		if speciesId then
			abilityId = PET_BATTLE_PET_TYPE_PASSIVES[select(3, C_PetJournal_GetPetInfoBySpeciesID(speciesId))]
			petType = select(7, C_PetBattles_GetAbilityInfoByID(abilityId))
			if isAttack then
				if petType then
					for i = 1, C_PetJournal_GetNumPetTypes() do
						modifier = C_PetBattles_GetAttackModifier(petType, i)
						if modifier > 1 then
							temp.strong[PET_TYPE_SUFFIX[i]] = GetPetIconString(i, 1)
							table.insert(temp.sKeys, PET_TYPE_SUFFIX[i])
						elseif modifier < 1 then
							temp.weak[PET_TYPE_SUFFIX[i]] = GetPetIconString(i, 1)
							table.insert(temp.wKeys, PET_TYPE_SUFFIX[i])
						end
					end
				end
			else
				if petType then
					matchStrong, matchWeak = unpack(PET_EFFECTIVENESS_CHART[petType] or {})
					if matchStrong then
						temp.strong[matchStrong] = GetPetIconString(matchStrong, 1)
						table.insert(temp.sKeys, matchStrong)
					end
					if matchWeak then
						temp.weak[matchWeak] = GetPetIconString(matchWeak, 1)
						table.insert(temp.wKeys, matchWeak)
					end
				end
			end
		end
	end
	local lookup = isWeak and temp.wKeys or temp.sKeys
	local lookup2 = isWeak and temp.weak or temp.strong
	table.sort(lookup)
	local text = ""
	for _, key in ipairs(lookup) do
		text = text..lookup2[key]
	end
	return text:trim()
end

local function PetJournal_UpdateDisplay()
	if type(PetJournal_UpdatePetLoadOut) == "function" then
		PetJournal_UpdatePetLoadOut()
	elseif type(PetJournal_UpdateAll) == "function" then
		PetJournal_UpdateAll()
	end
end

local function GetTeamId(teamId)
	teamId = tonumber(teamId) or 0
	if teamId < 1 then
		teamId = tonumber(BattlePetTabsDB2.currentId) or 0
	end
	if teamId >= 1 then
		return teamId
	end
	return 1 -- fallback
end

local function ValidatePetId(petId, petCheck)
	if type(petId) == "string" and strlen(petId) >= 10 and (not Is64BitClient() or strlen(petId) >= 18) then -- x86 is 8+2 while x64 is 16+2
		if petCheck then
			return C_PetJournal_GetPetInfoByPetID(petId) and 1 or nil
		end
		return 1
	end
end

local function ValidateTeam(teamId, attemptFix)
	teamId = GetTeamId(teamId)
	if type(BattlePetTabsDB2[teamId]) == "table" then
		local team = BattlePetTabsDB2[teamId]
		if type(team.name) ~= "string" then
			return
		end
		if type(team.setup) ~= "table" then
			if attemptFix then
				team.setup = {}
			else
				return
			end
		end
		for index = 1, MAX_ACTIVE_PETS do
			local petData = team.setup[index]
			if type(petData) ~= "table" then
				if attemptFix then
					team.setup[index] = {EMPTY_PET_DYNAMIC, 0, 0, 0}
					petData = team.setup[index]
				else
					return
				end
			end
			local petId, ab1, ab2, ab3 = petData[1], petData[2], petData[3], petData[4]
			if not ValidatePetId(petId, 1) then
				if attemptFix then
					team.setup[index] = {EMPTY_PET_DYNAMIC, 0, 0, 0}
				else
					return
				end
			end
		end
		if type(team.icon) ~= "string" then
			team.icon = "Interface\\Icons\\INV_Misc_QuestionMark.blp"
		end
		BattlePetTabsDB2[teamId] = team
		return team
	end
end

local function ApplyRename(teamId, newName)
	teamId = GetTeamId(teamId)
	if teamId <= numTabs and type(newName) == "string" and strlen(newName) > 0 then
		BattlePetTabsDB2[teamId].name = newName
		GameTooltip:Hide()
		Update()
	end
end

local function ApplyDelete(teamId)
	teamId = GetTeamId(teamId)
	if teamId <= numTabs then
		table.wipe(BattlePetTabsDB2[teamId])
		if teamId - 1 >= 1 then
			BattlePetTabsDB2.currentId = teamId - 1
		elseif BattlePetTabsDB2.currentId > 1 then
			BattlePetTabsDB2.currentId = BattlePetTabsDB2.currentId - 1
		else
			BattlePetTabsDB2.currentId = 1
		end
		GameTooltip:Hide()
		LoadTeam()
		Update()
	end
end

local function GetTeamMacroName(teamId)
	teamId = GetTeamId(teamId)
	if teamId then
		return "BattlePetTeam" .. teamId
	end
end

local function CreateTeamMacro(macroName, teamId, teamData)
	teamId = GetTeamId(teamId)
	if type(macroName) ~= "string" then
		return
	end
	if type(teamId) ~= "number" then
		return
	end
	if type(teamData) ~= "table" then
		return
	end
	if InCombatLockdown() then
		return -- can't work with macros in combat
	end
	if GetNumMacros() >= MAX_ACCOUNT_MACROS then
		return print("Can't create macro for team #" .. teamId .. " because you don't have any more available macro slots in your General category.")
	end
	if MacroFrame then
		HideUIPanel(MacroFrame)
	end
	local iconFile = teamData.icon:lower():gsub(".-\\.-\\(.-)%.blp", "%1") -- need only the filename, the API is strict and doesn't anyway let you define paths outside the Interface\Icons folder
	local macroBody = "#showtooltip\n/run PetJournal_LoadUI()if\"RightButton\"==GetMouseButtonClicked()then TogglePetJournal(2)else local i,b=tonumber("..(teamId or 0)..")b=_G[\""..frameName.."Tab\"..i..\"Button\"]if b then if not b.newTeam then b:Click()end else print\""..frameName.." not loaded!\"end end"
	if GetMacroIndexByName(macroName) == 0 then
		CreateMacro(macroName, 0, macroBody, nil)
	end
	return EditMacro(GetMacroIndexByName(macroName), macroName, iconFile, macroBody)
end

local function IntegrityCheck()
	local lastId = 0
	if type(BattlePetTabsDB2) == "table" then
		local temp = {}
		for index, team in ipairs(BattlePetTabsDB2) do
			team = ValidateTeam(index, 1)
			if team then
				table.insert(temp, team)
			end
		end
		temp.currentId = BattlePetTabsDB2.currentId
		BattlePetTabsDB2 = temp
		lastId = #temp
	end
	if not InCombatLockdown() then
		if lastId == 0 then
			for i = 1, numTabs do
				if ValidateTeam(i, 1) then
					lastId = lastId + 1
				else
					lastId = lastId - 1
				end
			end
		end
		for i = 1, numTabs do
			local macroName = GetTeamMacroName(i)
			if macroName then
				if lastId > 0 and i <= lastId then
					local macroIndex = GetMacroIndexByName(macroName)
					if macroIndex > 0 then
						CreateTeamMacro(macroName, i, BattlePetTabsDB2[i])
					end
				else
					DeleteMacro(macroName)
				end
			end
		end
	end
end

local function UpdateCurrentTeam(teamId)
	teamId = GetTeamId(teamId)
	if type(BattlePetTabsDB2[teamId]) ~= "table" then
		BattlePetTabsDB2[teamId] = {}
	end
	local team = BattlePetTabsDB2[teamId]
	if type(team.name) ~= "string" then
		team.name = "Team " .. teamId
	end
	if type(team.setup) ~= "table" then
		team.setup = {}
	end
	table.wipe(team.setup)
	for i = 1, MAX_ACTIVE_PETS do
		local petId, ab1, ab2, ab3, locked = C_PetJournal_GetPetLoadOutInfo(i)
		if petId then
			table.insert(team.setup, {petId, ab1, ab2, ab3})
		end
	end
	for i = MAX_ACTIVE_PETS - #team.setup, 1, -1 do
		table.insert(team.setup, {EMPTY_PET_DYNAMIC, 0, 0, 0})
	end
	team.icon = nil
	for _, petData in ipairs(team.setup) do
		if not team.icon then
			team.icon = select(9, C_PetJournal_GetPetInfoByPetID(petData[1]))
		else
			break
		end
	end
	if not team.icon then
		team.icon = "Interface\\Icons\\INV_Misc_QuestionMark.blp"
	end
	Update()
end

local function UpdateTeamLoadOut(slotId, petId, skipUpdating, ...)
	if skipUpdating ~= addonName then
		UpdateCurrentTeam()
	end
end

local function UpdateTeamLoadOutAbilities(slotId, abilitySlot, abilityId, skipUpdating, ...)
	if skipUpdating ~= addonName then
		UpdateCurrentTeam()
	end
end

function LoadTeam(teamId)
	teamId = GetTeamId(teamId)
	if type(BattlePetTabsDB2[teamId]) ~= "table" or type(BattlePetTabsDB2[teamId].setup) ~= "table" or not ValidateTeam(teamId, 1) then
		return
	end
	local team = BattlePetTabsDB2[teamId]
	local pets, count, unhook = {}, 0
	for i = 1, MAX_ACTIVE_PETS do
		local petData = team.setup[i]
		if type(petData) == "table" then
			local petId, ab1, ab2, ab3 = petData[1], petData[2], petData[3], petData[4]
			if petId == C_PetJournal_GetPetLoadOutInfo(i) or ((petId == "" or petId == EMPTY_PET_X64 or petId == EMPTY_PET_X86 or petId == EMPTY_PET) and not C_PetJournal_GetPetLoadOutInfo(i)) then
				count = count + 1
			elseif ValidatePetId(petId, 1) then
				C_PetJournal_SetPetLoadOutInfo(i, petId, addonName)
			else
				C_PetJournal_SetPetLoadOutInfo(i, EMPTY_PET_DYNAMIC, addonName)
			end
			table.insert(pets, petData)
		end
	end
	if count == MAX_ACTIVE_PETS then
		unhook = 1
		count = 0
		for i, petData in ipairs(pets) do
			if petData[1] == "" or petData[1] == EMPTY_PET_X64 or petData[1] == EMPTY_PET_X86 or petData[1] == EMPTY_PET then
				count = count + MAX_ACTIVE_ABILITIES
			else
				for j = 1, MAX_ACTIVE_ABILITIES do
					if petData[1 + j] == 0 or petData[1 + j] == select(1 + j, C_PetJournal_GetPetLoadOutInfo(i)) then
						count = count + 1
					else
						C_PetJournal_SetAbility(i, j, petData[1 + j], addonName)
					end
				end
			end
		end
		if count ~= MAX_ACTIVE_PETS * MAX_ACTIVE_ABILITIES then
			unhook = nil
		end
		if unhook then
			watcher:SetScript("OnUpdate", nil)
			elapsed = 0
			PetJournal_UpdateDisplay()
		else
			watcher:SetScript("OnUpdate", Watcher_OnUpdate)
		end
	else
		watcher:SetScript("OnUpdate", Watcher_OnUpdate)
	end
	Update()
end

function Watcher_OnUpdate(watcher, elapse)
	elapsed = elapsed + elapse
	if elapsed > .1 then
		elapsed = 0
		LoadTeam()
	end
end

local function onGameTooltipShow(self)
	local text, tabButton = _G[self:GetName() .. "TextLeft1"]:GetText()
	for i = 1, numTabs do
		if text and text == GetTeamMacroName(i) then
			tabButton = _G[frameName .. "Tab" .. i .. "Button"]
			if tabButton and tabButton.tooltip and not tabButton.newTeam then
				self:ClearLines()
				if type(tabButton.tooltip) == "table" then
					for _, line in ipairs(tabButton.tooltip) do
						self:AddLine(line)
					end
				else
					self:AddLine(tabButton.tooltip)
				end
				self:AddLine("|cff999999Right-click to open the Pet Journal|r")
				self:Show()
			end
			break
		end
	end
end

local function UpdateLock()
	local tabButton, tabTexture
	for i = 1, numTabs do
		tabButton = _G[frameName .. "Tab" .. i .. "Button"]
		tabTexture = _G[frameName .. "Tab" .. i .. "ButtonIconTexture"]
		if not C_PetJournal_IsJournalUnlocked() or C_PetBattles_GetPVPMatchmakingInfo() or C_PetBattles_IsInBattle() then
			tabButton:Disable()
			tabTexture:SetDesaturated(true)
			tabButton.tooltip2 = {"|cffFFFFFFLocked|r", "You are either queued for a match\nor caught up in a pet battle."}
		else
			tabButton:Enable()
			tabTexture:SetDesaturated(false)
			tabButton.tooltip2 = nil
		end
	end
end

function Update()
	IntegrityCheck()
	local shownNewTeam
	for i = 1, numTabs do
		local team = BattlePetTabsDB2[i] or {}
		local tab = _G[frameName .. "Tab" .. i]
		local tabButton = _G[frameName .. "Tab" .. i .. "Button"]
		if shownNewTeam then
			tab:Hide()
		else
			local tabTexture = _G[frameName .. "Tab" .. i .. "ButtonIconTexture"]
			if type(team.setup) ~= "table" then
				tabTexture:SetTexture("Interface\\GuildBankFrame\\UI-GuildBankFrame-NewTab")
				tabButton.tooltip = "New Team"
				tabButton.newTeam = 1
				shownNewTeam = 1
			else
				tabTexture:SetTexture(team.icon)
				tabButton.tooltip = {}
				table.insert(tabButton.tooltip, team.name)
				tabButton.newTeam = nil
				for _, petData in ipairs(team.setup) do
					table.insert(tabButton.tooltip, BuildPetTooltipString(petData[1]))
				end
				table.insert(tabButton.tooltip, "Atk." .. GetStatIconString(1) .. "vs " .. BuildStrongWeakTooltip(team.setup, 1))
				table.insert(tabButton.tooltip, "Atk." .. GetStatIconString() .. "vs " .. BuildStrongWeakTooltip(team.setup, 1, 1))
				table.insert(tabButton.tooltip, "Def." .. GetStatIconString(1) .. "vs " .. BuildStrongWeakTooltip(team.setup, nil, 1))
				table.insert(tabButton.tooltip, "Def." .. GetStatIconString() .. "vs " .. BuildStrongWeakTooltip(team.setup))
			end
			if not tabButton.newTeam and i == GetTeamId() then
				tabButton:SetChecked(1)
			else
				tabButton:SetChecked(nil)
			end
			tab:Show()
		end
	end
	UpdateLock()
	local focus = GetMouseFocus() -- the tooltip stays the same when we add or remove teams, so this helps update that tooltip automatically by checking what we are currently hovering over and triggering the mechanism is appropriate
	if type(focus) == "table" and type(focus.GetObjectType) == "function" and focus:GetObjectType() == "CheckButton" and type(focus.GetScript) == "function" then
		(focus:GetScript("OnEnter") or function() end)(focus)
	end
	PetJournal_UpdateDisplay()
end

function BattlePetTab_OnClick(self, button, currentId)
	if button == "LeftButton" then
		StaticPopup_Hide("BATTLETABS_TEAM_RENAME")
		StaticPopup_Hide("BATTLETABS_TEAM_DELETE")
	end
	if not self.newTeam or button == "LeftButton" then
		BattlePetTabsDB2.currentId = currentId
		if button == "LeftButton" then
			if self.newTeam then
				UpdateCurrentTeam()
			end
			LoadTeam()
		elseif button == "RightButton" and not self.newTeam then
			LoadTeam()
			if IsModifiedClick() then
				StaticPopup_Show("BATTLETABS_TEAM_RENAME", BattlePetTabsDB2[currentId].name, nil, currentId)
			else
				StaticPopup_Show("BATTLETABS_TEAM_DELETE", BattlePetTabsDB2[currentId].name, nil, currentId)
			end
		end
	end
	Update()
end

function BattlePetTab_OnDrag(self, button, currentId)
	if not InCombatLockdown() and not self.newTeam then
		local macroName = GetTeamMacroName(currentId)
		if macroName then
			local macroId = CreateTeamMacro(macroName, currentId, BattlePetTabsDB2[currentId])
			if macroId then
				ClearCursor()
				PickupMacro(macroId)
			end
		end
	end
end

function Initialize()
	Initialize = function() end

	-- conversion between old and new structure
	-- [[
	do
		if type(BattlePetTabsDB) == "table" then
			for index = 1, numTabs do
				local team = BattlePetTabsDB[index]
				if type(team) == "table" then
					local newTeam = {}
					local emptyPets = 0
					if type(team.name) == "string" then
						newTeam.name = team.name
					else
						newTeam.name = "Team " .. index
					end
					newTeam.setup = {}
					if type(team.team) == "table" then
						for i = 1, MAX_ACTIVE_PETS do
							local petId = team.team[i]
							if ValidatePetId(petId, 1) then
								newTeam.setup[i] = {petId, 0, 0, 0}
							else
								newTeam.setup[i] = {EMPTY_PET_DYNAMIC, 0, 0, 0}
								emptyPets = emptyPets + 1
							end
						end
						if type(team.team2) == "table" then
							for i = 1, MAX_ACTIVE_PETS do
								if type(team.team2[i]) == "table" then
									for j = 1, MAX_ACTIVE_ABILITIES do
										newTeam.setup[i][1 + j] = tonumber(team.team2[i][j]) or 0
									end
								end
							end
						end
					else
						for i = 1, MAX_ACTIVE_PETS do
							newTeam.setup[i] = {EMPTY_PET_DYNAMIC, 0, 0, 0}
							emptyPets = emptyPets + 1
						end
					end
					if type(team.icon) == "string" then
						newTeam.icon = team.icon
					else
						for _, petData in ipairs(newTeam.setup) do
							local petId = petData[1]
							if ValidatePetId(petId, 1) then
								newTeam.icon = select(9, C_PetJournal_GetPetInfoByPetID(petId))
								if newTeam.icon then
									break
								end
							end
						end
						if not newTeam.icon then
							newTeam.icon = "Interface\\Icons\\INV_Misc_QuestionMark.blp"
						end
					end
					if emptyPets < 3 then
						BattlePetTabsDB2[index] = newTeam
					end
				end
			end
			BattlePetTabsDB2.currentId = tonumber(BattlePetTabsDB.currentId) or 1
			BattlePetTabsDB = nil
		end
	end
	-- ]]

	StaticPopupDialogs["BATTLETABS_TEAM_RENAME"] = {
		text = "What do you wish to rename |cffffd200%s|r to?",
		button1 = ACCEPT,
		button2 = CANCEL,
		hasEditBox = 1,
		maxLetters = 30,
		OnAccept = function(self)
			ApplyRename(self.data, self.editBox:GetText())
		end,
		EditBoxOnEnterPressed = function(self)
			local parent = self:GetParent()
			ApplyRename(parent.data, parent.editBox:GetText())
			parent:Hide()
		end,
		OnShow = function(self)
			self.editBox:SetFocus()
		end,
		OnHide = function(self)
			ChatEdit_FocusActiveWindow()
			self.editBox:SetText("")
		end,
		timeout = 0,
		exclusive = 1,
		hideOnEscape = 1,
	}

	StaticPopupDialogs["BATTLETABS_TEAM_DELETE"] = {
		text = "Are you sure you want to delete team |cffffd200%s|r?",
		button1 = OKAY,
		button2 = CANCEL,
		OnAccept = function(self)
			ApplyDelete(self.data)
		end,
		timeout = 0,
		exclusive = 1,
		hideOnEscape = 1,
	}

	local tabs = CreateFrame("Frame", frameName, PetJournal)
	tabs:SetSize(42, 50)
	tabs:SetPoint("TOPLEFT", "$parent", "TOPRIGHT", -1, -17)
	tabs:HookScript("OnShow", Update)

	local tab
	for i = 1, numTabs do
		tabs[i] = CreateFrame("Frame", "$parentTab" .. i, tabs, "BattlePetTabTemplate") -- requires core.xml to be loaded by the toc-file
		tabs[i]:SetID(i)
		tabs[i]:SetPoint("TOPLEFT", tab or "$parent", "BOTTOMLEFT", 0, 0)
		tab = "$parentTab" .. i
	end

	do
		local function onClick(...)
			if InCombatLockdown() then
				return
			end
			PetJournalPetLoadoutDragButton_OnClick(...)
		end

		local function onDragStart(...)
			if InCombatLockdown() then
				return
			end
			PetJournalDragButton_OnDragStart(...)
		end

		for i = 1, MAX_ACTIVE_PETS do
			local button = _G["PetJournalLoadoutPet" .. i]
			button.dragButton:SetScript("OnClick", onClick)
			button.dragButton:SetScript("OnDragStart", onDragStart)
		end
	end

	hooksecurefunc(C_PetJournal, "SetPetLoadOutInfo", UpdateTeamLoadOut)
	hooksecurefunc(C_PetJournal, "SetAbility", UpdateTeamLoadOutAbilities)
	GameTooltip:HookScript("OnShow", onGameTooltipShow)

	addon:RegisterEvent("COMPANION_UPDATE")
	addon:RegisterEvent("LFG_LOCK_INFO_RECEIVED")
	addon:RegisterEvent("LFG_UPDATE_RANDOM_INFO")
	addon:RegisterEvent("PET_BATTLE_CLOSE")
	addon:RegisterEvent("PET_BATTLE_OPENING_START")
	addon:RegisterEvent("PET_BATTLE_QUEUE_STATUS")
	addon:RegisterEvent("PLAYER_REGEN_DISABLED")
	addon:RegisterEvent("PLAYER_REGEN_ENABLED")

	addon:HookScript("OnEvent", Update)

	-- (bonus feature) allows you to modify right-click the avatar of the pets in the loadout and confirm their removal from the team (allows you to have a true 2v or 1v teams)
	-- [[
	do
		StaticPopupDialogs["BATTLETABS_REMOVE_MEMBER"] = {
			text = "Are you sure you wish to remove |cffffd200%s|r from the team?",
			button1 = ACCEPT,
			button2 = CANCEL,
			OnAccept = function(self)
				C_PetJournal_SetPetLoadOutInfo(self.data, EMPTY_PET_DYNAMIC)
				UpdateCurrentTeam()
			end,
			timeout = 0,
			exclusive = 1,
			hideOnEscape = 1,
		}

		hooksecurefunc("PetJournalPetLoadoutDragButton_OnClick", function(self, button)
			local loadout = self:GetParent()
			if button == "RightButton" and loadout.petID and IsModifiedClick() then
				local slot = loadout:GetID()
				local _, customName, _, _, _, _, _, name = C_PetJournal_GetPetInfoByPetID(C_PetJournal_GetPetLoadOutInfo(slot))
				local alone = 1
				for i = 1, MAX_ACTIVE_PETS do
					if i ~= slot and C_PetJournal_GetPetLoadOutInfo(i) then
						alone = nil
						break
					end
				end
				if not alone then
					PetJournal_HidePetDropdown()
					StaticPopup_Show("BATTLETABS_REMOVE_MEMBER", customName or name, nil, slot)
				end
			end
		end)
	end
	-- ]]

	Update()
end
