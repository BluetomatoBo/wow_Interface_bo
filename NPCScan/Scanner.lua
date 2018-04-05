-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
-- Functions
local pairs = _G.pairs
local tostring = _G.tostring
local time = _G.time

-- Libraries
local table = _G.table

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local AddOnFolderName, private = ...

local LibStub = _G.LibStub
local NPCScan = LibStub("AceAddon-3.0"):GetAddon(AddOnFolderName)

local HereBeDragons = LibStub("HereBeDragons-1.0")
local LibSharedMedia = LibStub("LibSharedMedia-3.0")

-- ----------------------------------------------------------------------------
-- Constants.
-- ----------------------------------------------------------------------------
local scannerData = {
	continentID = -1,
	mapID = -1,
	NPCCount = 0,
	NPCs = {},
}

private.scannerData = scannerData

-- ----------------------------------------------------------------------------
-- Helpers.
-- ----------------------------------------------------------------------------
-- These functions are used for situations where an npcID needs to be removed from scannerData.NPCs while iterating it.
local QueueNPCForUntracking, UntrackQueuedNPCs
do
	local npcRemoveList = {}

	function QueueNPCForUntracking(npcID)
		npcRemoveList[#npcRemoveList + 1] = npcID
	end

	function UntrackQueuedNPCs()
		if #npcRemoveList == 0 then
			return
		end

		for index = 1, #npcRemoveList do
			local npcID = npcRemoveList[index]

			scannerData.NPCs[npcID] = nil
			scannerData.NPCCount = scannerData.NPCCount - 1
			private.Overlays.Remove(npcID)
		end

		table.wipe(npcRemoveList)

		_G.NPCScan_SearchMacroButton:UpdateMacroText()
	end
end

local ProcessDetection
do
	local throttledNPCs = {}

	function ProcessDetection(data)
		local npcID = data.npcID
		local profile = private.db.profile
		local detection = profile.detection
		local throttleTime = throttledNPCs[npcID]
		local now = time()

		if not scannerData.NPCs[npcID] or (throttleTime and now < throttleTime + detection.intervalSeconds) or (not detection.whileOnTaxi and _G.UnitOnTaxi("player")) then
			return
		end

		throttledNPCs[npcID] = now

		data.npcName = data.npcName or NPCScan:GetNPCNameFromID(npcID)
		data.unitClassification = data.unitClassification or "rare"

		NPCScan:Pour(_G.ERR_ZONE_EXPLORED:format(("%s %s"):format(data.npcName, _G.PARENS_TEMPLATE:format(data.sourceText))), 0, 1, 0)
		NPCScan:DispatchSensoryCues()
		NPCScan:SendMessage("NPCScan_DetectedNPC", data)

		-- TODO: Make the Overlays object listen for the NPCScan_DetectedNPC message and run its own methods
		private.Overlays.Found(npcID)
		private.Overlays.Remove(npcID)
	end
end

local function ProcessUnit(unitToken, sourceText)
	if _G.UnitIsUnit("player", unitToken) then
		return
	end

	local npcID = private.UnitTokenToCreatureID(unitToken)

	if npcID then
		local unitIsDead = _G.UnitIsDead(unitToken)

		if private.db.profile.detection.ignoreDeadNPCs and unitIsDead then
			return
		end

		local detectionData = {
			isDead = unitIsDead,
			npcID = npcID,
			npcName = _G.UnitName(unitToken),
			sourceText = sourceText,
			unitClassification = _G.UnitClassification(unitToken),
			unitCreatureType = _G.UnitCreatureType(unitToken),
			unitLevel = _G.UnitLevel(unitToken),
			unitToken = unitToken,
		}

		ProcessDetection(detectionData)

		NPCScan:SendMessage("NPCScan_UnitInformationAvailable", detectionData)
	end
end

local function CanAddToScanList(npcID)
	local profile = private.db.profile

	if profile.blacklist.npcIDs[npcID] then
		private.Debug("Skipping %s (%d) - blacklisted.", NPCScan:GetNPCNameFromID(npcID), npcID)
		return false
	end

	local npcData = private.NPCData[npcID]
	if npcData then
		if npcData.factionGroup == private.PlayerFactionGroup then
			private.Debug("Skipping %s (%d) - same faction group.", NPCScan:GetNPCNameFromID(npcID), npcID)
			return false
		end

		local isTameable = npcData.isTameable
		local detection = profile.detection

		if isTameable and not detection.tameables then
			private.Debug("Skipping %s (%d) - not tracking tameables.", NPCScan:GetNPCNameFromID(npcID), npcID)
			return false
		end

		if not isTameable and not detection.rares then
			private.Debug("Skipping %s (%d) - not tracking rares.", NPCScan:GetNPCNameFromID(npcID), npcID)
			return false
		end

		local achievementID = npcData.achievementID
		if achievementID then
			if detection.achievementIDs[achievementID] == private.DetectionGroupStatus.Disabled then
				private.Debug("Skipping %s (%d) - not tracking the achievement.", NPCScan:GetNPCNameFromID(npcID), npcID)
				return false
			end

			if detection.ignoreCompletedAchievementCriteria and (private.AchievementData[achievementID].isCompleted or npcData.isCriteriaCompleted) then
				private.Debug("Skipping %s (%d) - criteria already met or achievement completed.", NPCScan:GetNPCNameFromID(npcID), npcID)
				return false
			end
		end

		if detection.ignoreCompletedQuestObjectives and private.IsNPCQuestComplete(npcID) then
			private.Debug("Skipping %s (%d) - already killed.", NPCScan:GetNPCNameFromID(npcID), npcID)
			return false
		end
	end

	return true
end

local function MergeUserDefinedWithScanList(npcList)
	if npcList and private.db.profile.detection.userDefined then
		for npcID in pairs(npcList) do
			scannerData.NPCs[npcID] = true
		end
	end
end


function NPCScan:UpdateScanList(eventName, mapID)
	if mapID then
		scannerData.mapID = mapID
		scannerData.continentID = HereBeDragons:GetCZFromMapID(mapID)
	end

	if not scannerData.mapID or not scannerData.continentID then
		private.Debug("No mapID or no continentID.")
		return
	end

	private.Debug("eventName: %s scannerData.mapID: %d scannerData.continentID: %d", eventName or _G.NONE, scannerData.mapID, scannerData.continentID)

	for npcID in pairs(scannerData.NPCs) do
		private.Overlays.Remove(npcID)
	end

	table.wipe(scannerData.NPCs)

	local profile = private.db.profile
	local userDefined = profile.userDefined

	-- No zone or continent specified, so always look for these.
	MergeUserDefinedWithScanList(userDefined.npcIDs)

	if profile.blacklist.mapIDs[scannerData.mapID] or profile.detection.continentIDs[scannerData.continentID] == private.DetectionGroupStatus.Disabled then
		private.Debug("continentID or mapID is blacklisted; terminating update.")

		_G.NPCScan_SearchMacroButton:ResetMacroText()

		return
	end

	local zoneNPCCount = 0
	local npcList = private.MapNPCs[scannerData.mapID]

	if npcList then
		for npcID in pairs(npcList) do
			if CanAddToScanList(npcID) then
				scannerData.NPCs[npcID] = true
				zoneNPCCount = zoneNPCCount + 1;
				private.Overlays.Add(npcID)
			end
		end

		scannerData.NPCCount = zoneNPCCount
	end

	MergeUserDefinedWithScanList(userDefined.continentNPCs[scannerData.continentID])
	MergeUserDefinedWithScanList(userDefined.mapNPCs[scannerData.mapID])

	_G.NPCScan_SearchMacroButton:UpdateMacroText()
end

-- ----------------------------------------------------------------------------
-- Events.
-- ----------------------------------------------------------------------------
local function UpdateScanListAchievementCriteria()
	for npcID in pairs(scannerData.NPCs) do
		local npcData = private.NPCData[npcID]

		if npcData and npcData.achievementID and npcData.achievementCriteriaID and not npcData.isCriteriaCompleted then
			local _, _, isCompleted = _G.GetAchievementCriteriaInfoByID(npcData.achievementID, npcData.achievementCriteriaID)

			if isCompleted then
				npcData.isCriteriaCompleted = isCompleted

				private.GetOrUpdateNPCOptions()

				if private.db.profile.detection.ignoreCompletedAchievementCriteria then
					QueueNPCForUntracking(npcID)
				end
			end
		end
	end

	UntrackQueuedNPCs()
end

private.UpdateScanListAchievementCriteria = UpdateScanListAchievementCriteria

local function UpdateScanListQuestObjectives()
	if private.db.profile.detection.ignoreCompletedQuestObjectives then
		for npcID in pairs(scannerData.NPCs) do
			if private.IsNPCQuestComplete(npcID) then
				QueueNPCForUntracking(npcID)
			end
		end

		UntrackQueuedNPCs()
	end
end

private.UpdateScanListQuestObjectives = UpdateScanListQuestObjectives

function NPCScan:ACHIEVEMENT_EARNED(_, achievementID)
	if private.AchievementData[achievementID] then
		private.AchievementData[achievementID].isCompleted = true

		if private.db.profile.detection.ignoreCompletedAchievementCriteria then
			-- Disable tracking for the achievement, since the above setting implies it.
			private.db.profile.detection.achievementIDs[achievementID] = private.DetectionGroupStatus.Disabled
		end

		UpdateScanListAchievementCriteria()
	end
end

function NPCScan:CRITERIA_UPDATE()
	UpdateScanListAchievementCriteria()
end

-- Apparently some vignette NPC daily quests are only flagged as complete after looting...
function NPCScan:LOOT_CLOSED()
	UpdateScanListQuestObjectives()
end

function NPCScan:NAME_PLATE_UNIT_ADDED(_, unitToken)
	ProcessUnit(unitToken, _G.UNIT_NAMEPLATES)
end

function NPCScan:PLAYER_TARGET_CHANGED()
	ProcessUnit("target", _G.TARGET)
end

function NPCScan:UPDATE_MOUSEOVER_UNIT()
	local mouseoverID = private.UnitTokenToCreatureID("mouseover")

	if mouseoverID ~= private.UnitTokenToCreatureID("target") then
		ProcessUnit("mouseover", _G.MOUSE_LABEL)
	end
end

do
	local function ProcessQuestDetection(questID, sourceText)
		for npcID in pairs(private.QuestNPCs[questID]) do
			ProcessDetection({
				npcID = npcID,
				sourceText = sourceText
			})
		end
	end

	local function ProcessVignetteNameDetection(vignetteName, sourceText)
		for npcID in pairs(private.VignetteNPCs[vignetteName]) do
			if scannerData.NPCs[npcID] then
				ProcessDetection({
					npcID = npcID,
					sourceText = sourceText
				})
			end
		end
	end

	local function ProcessVignette(vignetteName, sourceText)
		local questID = private.QuestIDFromName[vignetteName]
		if questID then
			ProcessQuestDetection(questID, sourceText)
			return true
		elseif sourceText == _G.WORLD_MAP then
			return false
		end

		if private.VignetteNPCs[vignetteName] then
			ProcessVignetteNameDetection(vignetteName, sourceText)
			return true
		end

		local npcID = private.NPCIDFromName[vignetteName]
		if npcID then
			ProcessDetection({
				npcID = npcID,
				sourceText = sourceText
			})

			return true
		end

		return false
	end

	local VIGNETTE_SOURCE_TO_PREFERENCE = {
		[_G.MINIMAP_LABEL] = "ignoreMiniMap",
		[_G.WORLD_MAP] = "ignoreWorldMap",
	}

	local function IsIgnoringSource(sourceText)
		return private.db.profile.detection[VIGNETTE_SOURCE_TO_PREFERENCE[sourceText]]
	end

	function NPCScan:VIGNETTE_ADDED(_, instanceID)
		if IsIgnoringSource(_G.MINIMAP_LABEL) then
			return
		end

		local _, _, vignetteName, iconID = _G.C_Vignettes.GetVignetteInfoFromInstanceID(instanceID)

		if not ProcessVignette(vignetteName, _G.MINIMAP_LABEL) then
			private.Debug("Unknown vignette: %s with iconID %s", vignetteName or _G.UNKNOWN, tostring(iconID))
		end
	end

	function NPCScan:WORLD_MAP_UPDATE()
		if IsIgnoringSource(_G.WORLD_MAP) then
			return
		end

		for landmarkIndex = 1, _G.GetNumMapLandmarks() do
			local _, landmarkName = _G.C_WorldMap.GetMapLandmarkInfo(landmarkIndex)

			ProcessVignette(landmarkName, _G.WORLD_MAP)
		end
	end
end -- do-block

-- ----------------------------------------------------------------------------
-- Sensory cues.
-- ----------------------------------------------------------------------------
do
	local MAX_FLASH_LOOPS = 3

	local flashFrame = _G.CreateFrame("Frame")
	flashFrame:Hide()
	flashFrame:SetAllPoints()
	flashFrame:SetAlpha(0)
	flashFrame:SetFrameStrata("FULLSCREEN_DIALOG")

	local flashTexture = flashFrame:CreateTexture()
	flashTexture:SetBlendMode("ADD")
	flashTexture:SetAllPoints()

	local fadeAnimationGroup = flashFrame:CreateAnimationGroup()
	fadeAnimationGroup:SetLooping("BOUNCE")

	fadeAnimationGroup:SetScript("OnLoop", function(self, loopState)
		if loopState == "FORWARD" then
			self.LoopCount = self.LoopCount + 1

			if self.LoopCount >= MAX_FLASH_LOOPS then
				self:Stop()
				flashFrame:Hide()
			end
		end
	end)

	fadeAnimationGroup:SetScript("OnPlay", function(self)
		self.LoopCount = 0
	end)

	local fadeAnimIn = private.CreateAlphaAnimation(fadeAnimationGroup, 0, 1, 0.5)
	fadeAnimIn:SetEndDelay(0.25)

	local ALERT_SOUND_THROTTLE_INTERVAL_SECONDS = 2
	local lastSoundTime = time()

	function NPCScan:PlayFlashAnimation(texturePath, color)
		flashTexture:SetTexture(LibSharedMedia:Fetch("background", texturePath))
		flashTexture:SetVertexColor(color.r, color.g, color.b, color.a)
		flashFrame:Show()

		fadeAnimationGroup:Pause() -- Forces OnPlay to fire again if it was already playing
		fadeAnimationGroup:Play()
	end

	local PlayAlertSounds
	do
		local SOUND_RESTORE_INTERVAL_SECONDS = 5
		local soundsAreOverridden

		local StoredSoundCVars = {}
		local SoundChannelCVars = {
			Ambience = "Sound_EnableAmbience",
			Master = "Sound_EnableAllSound",
			Music = "Sound_EnableMusic",
			SFX = "Sound_EnableSFX",
		}

		local function ResetStoredSoundCVars()
			for cvar, value in pairs(StoredSoundCVars) do
				_G.SetCVar(cvar, value)
			end

			soundsAreOverridden = nil
		end

		function PlayAlertSounds(overrideSoundCVars)
			local soundPreferences = private.db.profile.alert.sound

			if overrideSoundCVars and not soundsAreOverridden then
				local channelCVar = SoundChannelCVars[soundPreferences.channel]

				StoredSoundCVars[channelCVar] = _G.GetCVar(channelCVar)
				_G.SetCVar(channelCVar, 1)

				StoredSoundCVars.Sound_EnableSoundWhenGameIsInBG = _G.GetCVar("Sound_EnableSoundWhenGameIsInBG")
				_G.SetCVar("Sound_EnableSoundWhenGameIsInBG", 1)

				soundsAreOverridden = true
				NPCScan:ScheduleTimer(ResetStoredSoundCVars, SOUND_RESTORE_INTERVAL_SECONDS)
			end

			for soundName in pairs(soundPreferences.sharedMediaNames) do
				if soundPreferences.sharedMediaNames[soundName] ~= false then
					_G.PlaySoundFile(LibSharedMedia:Fetch("sound", soundName), soundPreferences.channel)
				end
			end
		end

		private.PlayAlertSounds = PlayAlertSounds
	end

	function NPCScan:DispatchSensoryCues()
		local alert = private.db.profile.alert
		local now = time()

		if alert.screenFlash.isEnabled then
			self:PlayFlashAnimation(alert.screenFlash.texture, alert.screenFlash.color)
		end

		if alert.sound.isEnabled and now > lastSoundTime + ALERT_SOUND_THROTTLE_INTERVAL_SECONDS then
			PlayAlertSounds(alert.sound.ignoreMute)

			lastSoundTime = now
		end
	end
end
