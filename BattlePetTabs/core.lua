-- TODO: I love this addon, but would it be possible to add an option to lock the tabs we dont want to change?
-- TODO: So with that in mind I came up with this suggestion.  Creating a grouping function with a drop-down menu-maybe located near the revive pet.  Each grouping would still allow up to 8 tabs.  Then each grouping would allow for naming by the user.  A player (like myself) could then have Panderia/Northrend Tamers as one group and Misc Tamers as another group then naming each team either the zone or the tamer name for quick selection.  Another grouping might be PVP, becuase it's good to have mulitple teams if you happen to end up fighting the same 2-3 people due to the time of day/night you are battling.  A Leveling group would be good because of the changes in 5.2 with XP being used based on the highest level pet in the group (so I won't be power leveling with my 25's anymore).  This type of combinations leads to easily over 8 tabs but it would keep your UI clean which is the impression I have from reading some of your posts.

local _G = _G
local ACCEPT = ACCEPT
local C_PetBattles = C_PetBattles
local C_PetJournal = C_PetJournal
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
local IsAddOnLoaded = IsAddOnLoaded
local IsModifiedClick = IsModifiedClick
local math = math
local MAX_ACCOUNT_MACROS = MAX_ACCOUNT_MACROS or 36 -- LOD
local next = next
local OKAY = OKAY
local pairs = pairs
local PET_BATTLE_PET_TYPE_PASSIVES = PET_BATTLE_PET_TYPE_PASSIVES
local PET_TYPE_SUFFIX = PET_TYPE_SUFFIX
local PickupMacro = PickupMacro
local print = print
local select = select
local StaticPopup_Hide = StaticPopup_Hide
local StaticPopup_Show = StaticPopup_Show
local StaticPopupDialogs = StaticPopupDialogs
local table = table
local tonumber = tonumber
local type = type
local unpack = unpack

local addonName = ...
local addon = CreateFrame("Frame")
local frameName = "BattlePetTabs"
local watcher, numTabs, numPets, numPets2, elapsed = CreateFrame("Frame"), 8, 0, 0, 0
BattlePetTabsDB = type(BattlePetTabsDB) == "table" and BattlePetTabsDB or {} -- populated later

local combatLockdown
local function InCombatLockdown()
  return _G.InCombatLockdown() or combatLockdown
end

local MAX_ACTIVE_PETS = 3
local MAX_ACTIVE_ABILITIES = 3
local MAX_PET_LEVEL = 25

local petTypePassiveChart = {
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

local function PetJournal_UpdateDisplay()
  if PetJournal_UpdatePetLoadOut then
    PetJournal_UpdatePetLoadOut()
  elseif PetJournal_UpdateAll then
    PetJournal_UpdateAll()
  else
    --print("Fatal error, couldn't update Pet Journal UI!")
  end
end

local function GetStatIconString(i)
  return "|TInterface\\PetBattles\\BattleBar-AbilityBadge-" .. (i and "Strong" or "Weak") .. ":18:18:0:-2|t" -- 18:18 looks good
end

local function GetPetIconString(i, s) -- needs more work, the dimensions get weird when the image is too big and it creates too much padding
  return "|TInterface\\PetBattles\\PetIcon-" .. (type(i) == "string" and i or (type(i) == "number" and PET_TYPE_SUFFIX[i] or "NO_TYPE")) .. ":22:22:3:" .. (s and "2" or "4.25") .. ":128:256:62:128:102:168|t" -- 18:18 too small, 22:22 is better
end

local function BuildPetTooltipString(petId)
  local speciesId, customName, level, xp, maxXp, displayID, isFavorite, petName, petIcon, petType, creatureID, sourceText, description, isWild, canBattle, tradable, unique = C_PetJournal.GetPetInfoByPetID(petId)
  if not speciesId then
    speciesId, petName, petIcon = 0, "Unknown", "Interface\\Icons\\INV_Misc_QuestionMark"
  elseif customName then
    petName = customName
  end
  if level then
    return GetPetIconString(select(3, C_PetJournal.GetPetInfoBySpeciesID(speciesId)), nil) .. "|T" .. petIcon .. ":18:18|t |cffCCCCCCL"..level.."|r " .. petName .. (maxXp > 0 and level < MAX_PET_LEVEL and " |cffCCCCCC("..math.floor(xp/maxXp*100).."% exp)|r" or "") -- 0:0 too small, 18:18 is better
  end
  return ""
end

local function BuildStrongWeakTooltip(petIds, isAttack, isWeak)
  local speciesId, abilityId, petType
  local modifier, matchStrong, matchWeak
  local temp = {strong = {}, weak = {}, sKeys = {}, wKeys = {}}
  for _, petId in pairs(petIds) do
    speciesId = C_PetJournal.GetPetInfoByPetID(petId)
    if speciesId then
      abilityId = PET_BATTLE_PET_TYPE_PASSIVES[select(3, C_PetJournal.GetPetInfoBySpeciesID(speciesId))]
      petType = select(7, C_PetBattles.GetAbilityInfoByID(abilityId))
      if isAttack then
        if petType then
          for i = 1, C_PetJournal.GetNumPetTypes() do
            modifier = C_PetBattles.GetAttackModifier(petType, i)
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
          matchStrong, matchWeak = unpack(petTypePassiveChart[petType] or {})
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

local function ApplyRename(teamId, newName)
  if type(newName) == "string" and newName:len() > 0 then
    teamId = tonumber(teamId) or 0
    if teamId > 0 and teamId <= numTabs then
      BattlePetTabsDB[teamId].name = newName
      GameTooltip:Hide()
      BattlePetTabs_Update()
    end
  end
end

local function ApplyDelete(teamId)
  teamId = tonumber(teamId) or 0
  if teamId > 0 and teamId <= numTabs then
    table.wipe(BattlePetTabsDB[teamId])
    GameTooltip:Hide()
    BattlePetTabsReorganizeDB()
    BattlePetTab_LoadTeamId(BattlePetTabsDB.currentId)
    BattlePetTabs_Update()
  end
end

local function GetTeamMacroName(teamId)
  teamId = tonumber(teamId)
  if teamId then
    return "BattlePetTeam"..teamId
  end
end

local function CreateTeamMacro(macroName, teamId, teamData)
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
  if GetNumMacros() >= (MAX_ACCOUNT_MACROS or 36) then -- it's a LOD addon but I don't care to add a bunch of code just for one variable, so I hardcoded it!
    print("Can't create macro for team #" .. teamId .. " because you don't have any more available macro slots in your General category.")
    return
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

local function ValidateTeamData(petIds)
  if type(petIds) == "table" then
    local temp = {}
    for i = 1, MAX_ACTIVE_PETS do
      local petId = petIds[i]
      if type(petId) == "string" and strlen(petId) >= 18 and C_PetJournal.GetPetInfoByPetID(petId) then -- trying to avoid more errors by feeding it corrupt data, checking that the petId is infact up-to-date hex guid of a pet! a valid hex guid consists of a 16 hex in lenght and the prefix, making it 18 characters long.
        table.insert(temp, petId)
      end
    end
    for i = MAX_ACTIVE_PETS - #temp, 1, -1 do
      table.insert(temp, "0x0000000000000000")
    end
    return next(temp) and temp or nil
  end
end

local function Watcher_OnUpdate(self, elapse)
  elapsed = elapsed + elapse
  if elapsed > .25 then
    elapsed = 0
    if type(BattlePetTabsDB) ~= "table" or type(BattlePetTabsDB.currentId) ~= "number" then
      self:SetScript("OnUpdate", nil)
    else
      BattlePetTab_LoadTeamId(BattlePetTabsDB.currentId)
    end
  end
end

function BattlePetTabsReorganizeDB()
  if not addon.loadedCore then
    return -- only runs when the addon has properly loaded (to avoid saved variable deletion)
  end
  if type(BattlePetTabsDB) ~= "table" then
    return -- only runs when this is a table
  end
  local temp, lastId, data = {}, 0
  for i = 1, numTabs do
    if type(BattlePetTabsDB[i]) == "table" then
      if #(BattlePetTabsDB[i].team or {}) > 0 then
        data = BattlePetTabsDB[i]
        data.team = ValidateTeamData(data.team)
        table.insert(temp, data)
        lastId = lastId + 1
      end
    end
  end
  for i = lastId + 1, numTabs do
    if type(temp[i]) == "table" then
      table.wipe(temp[i])
    else
      temp[i] = {}
    end
  end
  if type(BattlePetTabsDB.currentId) ~= "number" or BattlePetTabsDB.currentId > lastId then
    temp.currentId = lastId
  else
    temp.currentId = BattlePetTabsDB.currentId
  end
  BattlePetTabsDB = temp
  -- fix orphan macros and update existing teams (only outside of combat)
  if not InCombatLockdown() then
    local macroName, macroIndex
    for i = 1, numTabs do
      macroName = GetTeamMacroName(i)
      if macroName then
        if i <= lastId then
          macroIndex = GetMacroIndexByName(macroName)
          if macroIndex > 0 then
            CreateTeamMacro(macroName, i, BattlePetTabsDB[i])
          end
        else
          DeleteMacro(macroName)
        end
      end
    end
  end
end

function BattlePetTabs_UpdateLock()
  local tabButton, tabTexture
  for i = 1, numTabs do
    tabButton = _G[frameName.."Tab"..i.."Button"]
    tabTexture = _G[frameName.."Tab"..i.."ButtonIconTexture"]
    if not C_PetJournal.IsJournalUnlocked() or C_PetBattles.GetPVPMatchmakingInfo() or C_PetBattles.IsInBattle() then
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

function BattlePetTabs_Update()
  local tabData, tabTab, tabButton, tabTexture, shownNewTeam
  for i = 1, numTabs do
    if type(BattlePetTabsDB[i]) ~= "table" then
      BattlePetTabsDB[i] = {}
    end
    tabData = BattlePetTabsDB[i]
    tabTab = _G[frameName.."Tab"..i]
    tabButton = _G[frameName.."Tab"..i.."Button"]
    if shownNewTeam then
      tabTab:Hide()
    else
      tabTexture = _G[frameName.."Tab"..i.."ButtonIconTexture"]
      if not tabData.team then
        tabTexture:SetTexture("Interface\\GuildBankFrame\\UI-GuildBankFrame-NewTab")
        tabButton.tooltip = "New Team"
        tabButton.newTeam = 1
        shownNewTeam = 1
      else
        tabTexture:SetTexture(tabData.icon)
        tabButton.tooltip = {}
        table.insert(tabButton.tooltip, tabData.name)
        tabButton.newTeam = nil
        for _, petId in ipairs(tabData.team) do
          table.insert(tabButton.tooltip, BuildPetTooltipString(petId))
        end
        table.insert(tabButton.tooltip, "Atk."..GetStatIconString(1).."vs: "..BuildStrongWeakTooltip(tabData.team, 1))
        table.insert(tabButton.tooltip, "Atk."..GetStatIconString().."vs: "..BuildStrongWeakTooltip(tabData.team, 1, 1))
        table.insert(tabButton.tooltip, "Def."..GetStatIconString(1).."vs: "..BuildStrongWeakTooltip(tabData.team, nil, 1))
        table.insert(tabButton.tooltip, "Def."..GetStatIconString().."vs: "..BuildStrongWeakTooltip(tabData.team))
      end
      if i == BattlePetTabsDB.currentId then
        tabButton:SetChecked(1)
      else
        tabButton:SetChecked(nil)
      end
      tabTab:Show()
    end
  end
  BattlePetTabs_UpdateLock() -- update lock status as well
  local focus = GetMouseFocus() -- the tooltip stays the same when we add or remove teams, so this helps update that tooltip automatically by checking what we are currently hovering over and triggering the mechanism is appropriate
  if type(focus) == "table" and type(focus.GetObjectType) == "function" and focus:GetObjectType() == "CheckButton" and type(focus.GetScript) == "function" then
    (focus:GetScript("OnEnter") or function()end)(focus)
  end
  PetJournal_UpdateDisplay()
end

function BattlePetTab_SetCurentTeamAsTab(teamId)
  if type(BattlePetTabsDB[teamId]) ~= "table" then
    BattlePetTabsDB[teamId] = {}
  end
  local team, petId, ab1, ab2, ab3, locked = BattlePetTabsDB[teamId]
  if type(team.name) ~= "string" then
    team.name = "Team "..teamId
  end
  team.team = {}
  team.team2 = {}
  for i = 1, MAX_ACTIVE_PETS do
    petId, ab1, ab2, ab3, locked = C_PetJournal.GetPetLoadOutInfo(i)
    if petId then
      table.insert(team.team, petId)
      team.team2[#team.team] = {ab1, ab2, ab3}
    end
  end
  for i = MAX_ACTIVE_PETS - #team.team, 1, -1 do
    table.insert(team.team, "0x0000000000000000")
    team.team2[#team.team] = {0, 0, 0}
  end
  team.icon = nil -- refresh icon
  for _, petId in ipairs(team.team) do
    team.icon = select(9, C_PetJournal.GetPetInfoByPetID(petId))
    if team.icon then
      break
    end
  end
  if not team.icon then
    team.icon = "Interface\\Icons\\INV_Misc_QuestionMark"
  end
  BattlePetTabsReorganizeDB()
end

function BattlePetTab_LoadTeamId(teamId)
  if type(BattlePetTabsDB) == "table" and type(BattlePetTabsDB[teamId]) == "table" and type(BattlePetTabsDB[teamId].team) == "table" then
    local pets, count, unhook, abilities = {}, 0, nil, nil
    for i = 1, MAX_ACTIVE_PETS do
      pets[i] = BattlePetTabsDB[teamId].team[i]
      pets[i] = type(pets[i]) == "string" and pets[i] or ""
      if pets[i] == "" or pets[i] == C_PetJournal.GetPetLoadOutInfo(i) or ((pets[i] == "0x0000" or pets[i] == "0x0000000000000000") and not C_PetJournal.GetPetLoadOutInfo(i)) then
        count = count + 1
      else
        C_PetJournal.SetPetLoadOutInfo(i, pets[i], addonName)
      end
    end
    if count == MAX_ACTIVE_PETS then
      unhook = 1
      if type(BattlePetTabsDB[teamId].team2) == "table" then -- legacy support (when team doesn't have abilities table, this avoids lua errors)
        abilities = BattlePetTabsDB[teamId].team2
        count = 0
        for i = 1, MAX_ACTIVE_PETS do
          local petId = pets[i]
          if type(abilities[i]) == "table" then
            for j = 1, MAX_ACTIVE_ABILITIES do
              if abilities[i][j] == 0 or abilities[i][j] == select(j + 1, C_PetJournal.GetPetLoadOutInfo(i)) then
                count = count + 1
              else
                C_PetJournal.SetAbility(i, j, abilities[i][j], addonName)
              end
            end
          else
            count = count + MAX_ACTIVE_ABILITIES -- trick it to think we equipped the spells we need (since this bugged it means there are no spells in the cache anyway, so we need to make the player re-pick their choices and hopefully this will fix the bug, if not we need to debug some more!)
          end
        end
        if count ~= MAX_ACTIVE_PETS * MAX_ACTIVE_ABILITIES then
          unhook = nil
        end
      end
      if unhook then
        watcher:SetScript("OnUpdate", nil)
        PetJournal_UpdateDisplay()
      else
        watcher:SetScript("OnUpdate", Watcher_OnUpdate)
      end
    else
      watcher:SetScript("OnUpdate", Watcher_OnUpdate)
    end
  end
end

function BattlePetTab_OnClick(self, button, currentId)
  if button == "LeftButton" then
    StaticPopup_Hide("BATTLETABS_TEAM_RENAME")
    StaticPopup_Hide("BATTLETABS_TEAM_DELETE")
  end
  if not (button ~= "LeftButton" and self.newTeam) then
    BattlePetTabsDB.currentId = currentId
    if button == "LeftButton" then
      if self.newTeam then
        BattlePetTab_SetCurentTeamAsTab(currentId, 1)
      else
        BattlePetTab_LoadTeamId(currentId)
      end
    elseif button == "RightButton" and (not self.newTeam) then
      BattlePetTab_LoadTeamId(currentId)
      if IsModifiedClick() then
        StaticPopup_Show("BATTLETABS_TEAM_RENAME", BattlePetTabsDB[currentId].name, nil, currentId)
      else
        StaticPopup_Show("BATTLETABS_TEAM_DELETE", BattlePetTabsDB[currentId].name, nil, currentId)
      end
    end
  end
  BattlePetTabs_Update()
end

function BattlePetTab_OnDrag(self, button, currentId)
  if (not InCombatLockdown()) and (not self.newTeam) then -- can't work with macros in combat
    local macroName = GetTeamMacroName(currentId)
    if macroName then
      local macroId = CreateTeamMacro(macroName, currentId, BattlePetTabsDB[currentId])
      if macroId then
        ClearCursor()
        PickupMacro(macroId)
      end
    end
  end
end

local function UpdateCurrentTeamLoadOut(slotId, petId, skipUpdating, ...)
  if skipUpdating ~= addonName then
    BattlePetTabs_OnEvent(addon, addonName)
  end
end

local function UpdateCurrentTeamLoadOut2(slotId, abilitySlot, abilityId, skipUpdating, ...)
  if skipUpdating ~= addonName then
    BattlePetTabs_OnEvent(addon, addonName)
  end
end

local function onGameTooltipShow(self)
  local text, tabButton = _G[self:GetName().."TextLeft1"]:GetText()
  for i = 1, numTabs do
    if text and text == GetTeamMacroName(i) then
      tabButton = _G[frameName.."Tab"..i.."Button"]
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

function BattlePetTabs_OnEvent(addon, event, name)
  if event == "ADDON_LOADED" then
    if name == "Blizzard_PetJournal" then
      addon.PetJournal = 1

      -- create the tabs parent
      local tabs = CreateFrame("Frame", frameName, PetJournal)
      tabs:SetSize(42, 50)
      tabs:SetPoint("TOPLEFT", "$parent", "TOPRIGHT", -1, -17)

      -- create each tab
      local lastTab
      for i = 1, numTabs do
        tabs[i] = CreateFrame("Frame", "$parentTab"..i, tabs, "BattlePetTabTemplate")
        tabs[i]:SetID(i)
        tabs[i]:SetPoint("TOPLEFT", lastTab or "$parent", "BOTTOMLEFT", 0, 0)
        lastTab = "$parentTab"..i
      end

      -- (bonus feature) allows you to modify click the avatar of the pets in the loadout and confirm their removal from the team (allows you to have a true 2v or 1v teams)
      -- [[
      do
        StaticPopupDialogs["BATTLETABS_REMOVE_MEMBER"] = {
          text = "Are you sure you wish to remove |cffffd200%s|r from the team?",
          button1 = ACCEPT,
          button2 = CANCEL,
          OnAccept = function(self)
            C_PetJournal.SetPetLoadOutInfo(self.data, "0x0000000000000000")
            BattlePetTabs_Update()
          end,
          timeout = 0,
          exclusive = 1,
          hideOnEscape = 1,
        }

        hooksecurefunc("PetJournalPetLoadoutDragButton_OnClick", function(self, button)
          local loadout = self:GetParent()
          if button == "RightButton" and loadout.petID and IsModifiedClick() then
            local slot = loadout:GetID()
            local _, customName, _, _, _, _, _, name = C_PetJournal.GetPetInfoByPetID(C_PetJournal.GetPetLoadOutInfo(slot))
            local alone = 1
            for i = 1, MAX_ACTIVE_PETS do
              if i ~= slot and C_PetJournal.GetPetLoadOutInfo(i) then
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
      --]]

    elseif name == addonName then
      addon.BattlePetTabs = 1

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

      -- forcefully load the pet journal (if it isn't already loaded)
      if not addon.PetJournal then
        if IsAddOnLoaded("Blizzard_PetJournal") then
          BattlePetTabs_OnEvent(addon, "ADDON_LOADED", "Blizzard_PetJournal")
        else
          --PetJournal_LoadUI() -- commented out, this causes an issue with Squire2's loading process (need to iron out some stuff for now, only side effect is tooltips don't load until PetJournal loads properly)
        end
      end
    end

    -- properly unregister once all is loaded
    if addon.PetJournal and addon.BattlePetTabs then
      addon:UnregisterEvent("ADDON_LOADED")

      if not addon.loadedCore then
        -- hook supporting functions
        hooksecurefunc(C_PetJournal, "SetPetLoadOutInfo", UpdateCurrentTeamLoadOut)
        hooksecurefunc(C_PetJournal, "SetAbility", UpdateCurrentTeamLoadOut2)
        GameTooltip:HookScript("OnShow", onGameTooltipShow)

        -- properly update upon certain events
        addon:RegisterEvent("LFG_LOCK_INFO_RECEIVED")
        addon:RegisterEvent("LFG_UPDATE_RANDOM_INFO")
        addon:RegisterEvent("PET_BATTLE_CLOSE")
        addon:RegisterEvent("PET_BATTLE_OPENING_START")
        addon:RegisterEvent("PET_BATTLE_QUEUE_STATUS")
        addon:RegisterEvent("PET_JOURNAL_LIST_UPDATE")
        addon:RegisterEvent("COMPANION_UPDATE")

        -- combat locking
        addon:RegisterEvent("PLAYER_REGEN_DISABLED")
        addon:RegisterEvent("PLAYER_REGEN_ENABLED")

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
            local button = _G["PetJournalLoadoutPet"..i]
            button.dragButton:SetScript("OnClick", onClick)
            button.dragButton:SetScript("OnDragStart", onDragStart)
          end
        end
      end

      addon.loadedCore = 1
    end

  elseif addon.loadedCore then
    if event == addonName then
      BattlePetTabsReorganizeDB()
      BattlePetTab_SetCurentTeamAsTab(BattlePetTabsDB.currentId)

    elseif event == "PLAYER_REGEN_DISABLED" then
      combatLockdown = 1

    elseif event == "PLAYER_REGEN_ENABLED" then
      combatLockdown = nil

    elseif event == "PET_JOURNAL_LIST_UPDATE" then
      numPets = select(2, C_PetJournal.GetNumPets(true)) -- wild pets only
      if numPets ~= numPets2 then
        numPets2 = numPets
        BattlePetTabsReorganizeDB()
      end

    else
      BattlePetTabs_UpdateLock()
    end

    if event == "COMPANION_UPDATE" and name == "CRITTER" then
      PetJournal_UpdateDisplay()
    end

    -- update and load our default team (as long the loaded data is valid, and it should be)
    if type(BattlePetTabsDB) == "table" and type(BattlePetTabsDB.currentId) == "number" then
      BattlePetTabs_Update()

      if not addon.loadedLoadout then
        addon.loadedLoadout = 1
        BattlePetTab_LoadTeamId(BattlePetTabsDB.currentId)
      end
    end
  end

  --print(addon.PetJournal and 1 or 0, addon.BattlePetTabs and 1 or 0, addon.loadedCore and 1 or 0, addon.loadedLoadout and 1 or 0, "=", event, name, "") -- DEBUG
end

addon:SetScript("OnEvent", BattlePetTabs_OnEvent)
addon:RegisterEvent("ADDON_LOADED")
