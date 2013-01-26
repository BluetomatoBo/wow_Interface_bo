---------------------------------------------------------------------------------------------
-- QHLQuests Class
---------------------------------------------------------------------------------------------
QHLQuests = {}
QHLQuests.__index = QHLQuests;

function QHLQuests:new(id)

	-- Metatable
	local self = {};
	setmetatable(self, QHLQuests);
	
	-- Frame Variables
	self.id = id;

	-- Reference Variables
	self.obj = self;
	self.parent = nil;
	
	-- Coroutine Variables
	self.routine = nil;
	self.routine_elapsed = 0;
	self.routine_finish_func = nil;
	
	-- Quest Variables
	self.quests = {};
	self.quest_log_indexes = {};
	
	-- Global Quest Objectives
	self.ignored = {};
	self.objectives = {};
	self.objective_icons = {};
	self.objectives_need_update = false;
	
	-- Map Quest Objectives
	self.map_objectives = {};
	
	-- Path Variables
	self.path_nodes = {};
	self.path_next = {};
	self.path_current = {};
	self.path_objectives = {};
	self.path_distance = 0;
	self.path_player_world = 0;
	self.path_player_world_x = 0;
	self.path_player_world_y = 0;
	
	-- Ant Trail Variables
	self.ant_dots = {};
	self.ant_phase = 0.0;
	self.ant_cleared = true;
	
	-- Hook Local Blizzard Table
	self.QUEST_POI_BUTTONS_MAX = { };
	hooksecurefunc("QuestPOI_DisplayButton", function(parentName, buttonType, buttonIndex, questId) 
		local buttonName = "poi"..parentName..buttonType.."_"..buttonIndex;
		self.QUEST_POI_BUTTONS_MAX[parentName..buttonType] = buttonIndex;
	end);
	
	-- Return
     	return self;
end

---------------------------------------------------------------------------------------------
-- Table Functions
---------------------------------------------------------------------------------------------
local free_tables = 0;
local recycled_tables = {};
local function CreateTable()
	
	local objective = nil;
	if free_tables > 0 then
		free_tables = free_tables - 1;
		objective = tremove(recycled_tables);
	else
		objective = {};
	end
	return objective;
end

local function RecycleTable(table)

	if table then
		wipe(table);
		setmetatable(table, nil);
		tinsert(recycled_tables, table);
		free_tables = free_tables + 1;
	end
end

---------------------------------------------------------------------------------------------
-- Update Functions
---------------------------------------------------------------------------------------------
function QHLQuests:Update(elapsed, ...)

	if not self.initialized then
	
		-- Initialize Objectives
		self.initialized = true;
		self:UpdateQuests();
		self:SetQuestsForUpdate();
		self:UpdateQuestMaps();
	end
	
	if not InCombatLockdown() then
	
		-- Update Quests
		self:UpdateQuests();
	
		-- Find Shortest Path
		self:FindShortestPath();

		-- Update Quest Tracker
		self:UpdateQuestTracker();
	end
end

function QHLQuests:UpdateCoroutine(elapsed, ...)

	self.routine_elapsed = self.routine_elapsed + elapsed;
	if (self.routine_elapsed > QHL:GetSetting("update_interval")) then

		-- Check For Coroutine
		if self.routine and not InCombatLockdown() then

			-- Resume Coroutine
			if coroutine.resume(self.routine, self) then

				-- Check Coroutine Status
				if coroutine.status(self.routine) == "dead" then

					-- Call Finish Function
					self.routine_finish_func(self);
					self.routine_finish_func = nil;
					self.routine = nil;
				end
			else
				-- Error
				self.routine = nil;
				self.routine_finish_func = nil;

				QHL:PrintAll(1,0,0,"An error occured while QuestHelperLite was loading objectives!");
			end
		end
		self.routine_elapsed = 0;
	end
end

function QHLQuests:UpdateObjectives()

	-- Flag Objectives Changed
	self.objectives_need_update = true;
	
	-- Check Coroutine
	if not self.routine and not InCombatLockdown() then

		-- Create Coroutine
		self.routine = coroutine.create(self.UpdateGlobalObjectivesCoroutine);
		self.routine_finish_func = self.UpdateGlobalObjectives;
		
		-- Start Coroutine
		self.objectives_need_update = false;
		if not coroutine.resume(self.routine, self) then
		
			-- Error
			self.routine = nil;
			self.routine_finish_func = nil;
			
			QHL:PrintAll(1,0,0,"QuestHelperLite could not load objectives!");
		end
	end
end

---------------------------------------------------------------------------------------------
-- Quest Functions
---------------------------------------------------------------------------------------------
function QHLQuests:GetQuest(questId)
	if questId and self.quests then 
		return self.quests[questId];
	end
end

function QHLQuests:SetQuestForUpdate(questId)

	local quest = self.quests[questId];
	if not quest then
		quest = CreateTable();
		quest.questId = questId;
		quest.update_needed = 1;
		self.quests[questId] = quest;
	end
	quest.update_needed = quest.update_needed + 1;
	quest.update_complete = false;
end

function QHLQuests:SetQuestsForUpdate()

	for index, quest in pairs(self.quests) do
		quest.update_needed = quest.update_needed + 1;
		quest.update_complete = false;
	end
end

function QHLQuests:UpdateQuestMaps()

	local maps = CreateTable();
	local map_count = 0;
	
	-- Look For Quests In Other Maps
	for map,floors in pairs(self.map_objectives) do
	
		-- Iterate Through Floors
		for floor,objectives in pairs(floors) do

			-- Iterate Through Objectives
			for index, objective in ipairs(objectives) do

				-- Check For Quest Updates
				local quest = self.quests[objective.questId];
				if quest and quest.update_needed > 0 then
					
					-- Set Map For Update
					if not maps[objective.map] then
						map_count = map_count + 1;
						maps[objective.map] = CreateTable(); 
					end
					
					-- Set Floor For Update
					if not maps[objective.map][quest.floor] then 
						maps[objective.map][quest.floor] = true; 
					end
				end
			end
		end
	end
	
	-- Update Quests
	WorldMapFrame.blockWorldMapUpdate = true;
	for index, quest in pairs(self.quests) do

		if quest.update_needed > 0 then
		
			quest.map, quest.floor = GetQuestWorldMapAreaID(quest.questId);
			
			-- Maps With Floors Start At Floor 1 Instead of 0
			if quest.floor == 0 and QHL.Astrolabe:GetNumFloors(quest.map) > 0 then quest.floor = 1; end
			
			quest.update_needed = quest.update_needed - 1;
			
			-- Set Map For Update
			if not maps[quest.map] then
				map_count = map_count + 1;
				maps[quest.map] = CreateTable(); 
			end
			
			-- Set Floor For Update
			if not maps[quest.map][quest.floor] then 
				maps[quest.map][quest.floor] = true; 
			end
		end	
	end
	WorldMapFrame.blockWorldMapUpdate = nil;
	
	-- Update Maps
	self:UpdateMaps(maps, map_count);
	for map, floors in pairs(maps) do
		RecycleTable(floors);
	end
	RecycleTable(maps);
end

function QHLQuests:UpdateQuest(questId, questLogIndex, questTitle, level, numObjectives, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily)

	local quest = self.quests[questId];
	if not quest then
		quest = CreateTable();
		quest.questId = questId;
		quest.update_needed = 1;
		self.quests[questId] = quest;
	end
	quest.questLogIndex = questLogIndex;
	quest.questTitle = questTitle;
	quest.level = level;
	quest.numObjectives = numObjectives;
	quest.questTag = questTag;
	quest.suggestedGroup = suggestedGroup;
	quest.isHeader = isHeader;
	quest.isCollapsed = isCollapsed;
	quest.isComplete = isComplete;
	quest.isDaily = isDaily;
	if not quest.map then
		WorldMapFrame.blockWorldMapUpdate = true;
		quest.map, quest.floor = GetQuestWorldMapAreaID(questId);
		WorldMapFrame.blockWorldMapUpdate = nil;
	end
end

function QHLQuests:UpdateQuests()

	-- Get Current Quests
	local quest_log_indexes = CreateTable();
	for n=1,GetNumQuestLogEntries() do
	
		-- Get Quest Info
		local questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, questId = GetQuestLogTitle(n);
		if not isHeader then
		
			local numObjectives = GetNumQuestLeaderBoards(n);
			local requiredMoney = GetQuestLogRequiredMoney(n);
		
			-- Blizzard isComplete Hack
			if ( isComplete and isComplete < 0 ) then
				isComplete = false;
			elseif ( numObjectives == 0 and GetMoney() >= requiredMoney ) then
				isComplete = true;
			end

			-- Update Quest Info
			quest_log_indexes[questId] = n;
			self:UpdateQuest(questId, n, questTitle, level, numObjectives, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily);
		end
	end
	
	-- Remove Old Quests
	for questId, questLogIndex in pairs(self.quest_log_indexes) do
		if not quest_log_indexes[questId] and self.quests[questId] then

			--QHL:PrintAll(1,1,1,"Removing Quest: ", questId);

			-- Remove Quest
			RecycleTable(self.quests[questId]);
			self.quests[questId] = nil;

			-- Remove Quest From Objectives
			self:RemoveQuestFromMapObjectives(questId);
			--self:RemoveQuestFromGlobalObjectives(questId);
			self:RemoveQuestFromPath(questId);
		end
	end
	
	-- Set New Quest Log Indexes
	RecycleTable(self.quest_log_indexes);
	self.quest_log_indexes = quest_log_indexes;

	-- Update Global Objectives
	self:UpdateGlobalObjectives();
end

---------------------------------------------------------------------------------------------
-- Objective Functions
---------------------------------------------------------------------------------------------
-- TODO:
function QHLQuests:GetNextObjective()

	return self.path_objectives[1];
end

function QHLQuests:IsObjectiveWithinRange(objective)

	-- Bad Objective
	if not objective or not objective.map then return false; end
	
	-- Check Map
	if QHL:GetSetting("track_by_zone") and objective.map ~= QHL.map then return false; end
	
	-- Check World
	if objective.world == QHL.world then return true; end
	
	-- Must Not Be Within Range
	return false;
end

function QHLQuests:IsObjectiveWithinGroup(objective)

	-- Bad Objective
	if not objective then return false; end
	
	-- Don't Care About Group
	if not QHL:GetSetting("track_by_group") then return true; end
	
	-- Get Group Member Count
	local party_members = GetNumSubgroupMembers();
	local raid_members = GetNumGroupMembers();
	if not UnitInRaid("player") then raid_members = 0; end
	
	-- Check For Dungeon
	if objective.questTag == "Dungeon" and (party_members <= 0 and raid_members <= 0) then 
		return false;
	end
	
	-- Check For Raid
	if objective.questTag == "Raid" and raid_members <= 0 then 
		return false;
	end
	
	-- Check For Group Quests
	if not objective.suggestedGroup or objective.suggestedGroup <= party_members + 1 then
		return true;
	end
	
	-- Must Not Be Within Group
	return false;
end

function QHLQuests:IsObjectiveWithinLevel(objective)

	-- Bad Objective
	if not objective or not objective.level then return false; end
	
	-- Don't Care About Level
	if not QHL:GetSetting("track_by_level") then return true; end
	
	-- Get Offset
	local level_offset = QHL:GetSetting("track_level_offset");
	if not level_offset then return true; end
	
	-- Check Level
	if (objective.level >= UnitLevel("player") - level_offset) 
	and (objective.level <= UnitLevel("player") + level_offset) then 
		return true;
	end
	
	-- Must Not Be Within Level
	return false;
end

function QHLQuests:IsObjectiveTrackable(objective)

	local tracked = false;

	-- Filter Objectives
	if self.quests[objective.questId] 
	and not self:IsObjectiveIgnored(objective) 
	and self:IsObjectiveWithinRange(objective) 
	and self:IsObjectiveWithinLevel(objective) 
	and self:IsObjectiveWithinGroup(objective) then
		tracked = true;
	end
	
	return tracked;
end

function QHLQuests:IgnoreQuest(questId)

	local objective = self:GetObjectiveByQuestID(questId);
	if objective then self:IgnoreObjective(objective); end
end

function QHLQuests:IgnoreObjective(objective)

	-- Ignore Objective If Not Already Ignored
	for index, ignored in ipairs(self.ignored) do
		if ignored.questId == objective.questId then return; end
	end
	
	-- Add Objective To Ignored
	local ignored_objective = CreateTable();
	ignored_objective.questLogIndex = objective.questLogIndex;
	ignored_objective.questId = objective.questId;
	ignored_objective.questTitle = objective.questTitle;
	ignored_objective.level = objective.level;
	ignored_objective.questTag = objective.questTag;
	ignored_objective.suggestedGroup = objective.suggestedGroup;
	ignored_objective.isComplete = objective.isComplete;
	ignored_objective.isDaily = objective.isDaily;
	ignored_objective.tracked = objective.tracked;
	ignored_objective.map = objective.map;
	ignored_objective.floor = objective.floor;
	ignored_objective.continent = objective.continent;
	ignored_objective.zone = objective.zone;
	ignored_objective.pos_x = objective.pos_x;
	ignored_objective.pos_y = objective.pos_y;
	ignored_objective.world = objective.world;
	ignored_objective.world_floor = objective.world_floor;
	ignored_objective.world_x = objective.world_x;
	ignored_objective.world_y = objective.world_y;
	ignored_objective.routeID = objective.routeID;
	tinsert(self.ignored, ignored_objective);
	
	-- Remove Objective From Path
	self:RemoveQuestFromPath(ignored_objective.questId);
end

function QHLQuests:UnignoreQuest(questId)

	local objective = self:GetObjectiveByQuestID(questId);
	if objective then self:UnignoreObjective(objective); end
end

function QHLQuests:UnignoreObjective(objective)

	-- Recycle Objectives
	local removed = 0;
	for i=1,#self.ignored do
		local index = i - removed;
		if index <= #self.ignored and objective.questId == self.ignored[index].questId then
			RecycleTable(self.ignored[index]);
			tremove(self.ignored, index);
			removed = removed + 1;
		end
	end
end

function QHLQuests:ResetIgnoredObjectives()

	-- Recycle Objectives
	for index, objective in ipairs(self.ignored) do
		RecycleTable(objective);
	end

	-- Wipe Ignored Objectives
	wipe(self.ignored);
end

function QHLQuests:IsQuestIgnored(questId)

	local objective = self:GetObjectiveByQuestID(questId);
	if objective then return self:IsObjectiveIgnored(objective); 
	else return false; end
end

function QHLQuests:IsObjectiveIgnored(objective)

	for index, ignored in ipairs(self.ignored) do
		if ignored.questId == objective.questId then return true; end
	end
	return false;
end

function QHLQuests:IsQuestOnPath(questId)

	local objective = self:GetObjectiveByQuestID(questId);
	if objective then return self:IsObjectiveOnPath(objective); 
	else return false; end
end

function QHLQuests:IsObjectiveOnPath(objective)

	for index, path_objective in ipairs(self.path_objectives) do
		if path_objective.questId == objective.questId then return true; end
	end
	return false;
end

-- TODO: Multiple?
function QHLQuests:GetObjectiveByRouteID(routeID)

	if self.objectives then
		for index, objective in ipairs(self.objectives) do
			if objective.routeID == routeID then return objective; end
		end
	end
	return nil;
end

-- TODO: Return Multiple
function QHLQuests:GetObjectiveByQuestID(questId)

	if self.objectives then
		for index, objective in ipairs(self.objectives) do
			if objective.questId == questId then return objective; end
		end
	end
	return nil;
end

function QHLQuests:AddGlobalObjective(objective)
	
	-- Create Global Objective
	local global_objective = CreateTable();
	global_objective.questLogIndex = objective.questLogIndex;
	global_objective.questId = objective.questId;
	global_objective.questTitle = objective.questTitle;
	global_objective.level = objective.level;
	global_objective.questTag = objective.questTag;
	global_objective.suggestedGroup = objective.suggestedGroup;
	global_objective.isComplete = objective.isComplete;
	global_objective.isDaily = objective.isDaily;
	global_objective.tracked = objective.tracked;
	global_objective.map = objective.map;
	global_objective.floor = objective.floor;
	global_objective.continent = objective.continent;
	global_objective.zone = objective.zone;
	global_objective.pos_x = objective.pos_x;
	global_objective.pos_y = objective.pos_y;
	global_objective.world = objective.world;
	global_objective.world_floor = objective.world_floor;
	global_objective.world_x = objective.world_x;
	global_objective.world_y = objective.world_y;
	global_objective.routeID = objective.routeID;
	
	-- Insert Global Objective
	tinsert(self.objectives, global_objective);
end

function QHLQuests:RemoveQuestFromGlobalObjectives(questId)
	
	-- Copy Objectives
	local global_objectives = CreateTable();
	local removed_objectives = CreateTable();
	for index, objective in pairs(self.objectives) do
		if objective.questId == questId then
			tinsert(removed_objectives, objective);
		else
			tinsert(global_objectives, objective);
		end
	end
	
	-- Recycle Old Objectives
	for index, objective in pairs(removed_objectives) do
		RecycleTable(objective);
	end
	
	-- Recycle Tables
	RecycleTable(removed_objectives);
	RecycleTable(self.objectives);
	self.objectives = global_objectives;
end

function QHLQuests:WipeGlobalObjectives()
	
	-- Recycle Objectives
	for index, objective in ipairs(self.objectives) do
		RecycleTable(objective);
	end
	
	-- Clear Global Objectives Table
	wipe(self.objectives);
end

function QHLQuests:AddPathObjective(objective)
	
	-- Create Global Objective
	local path_objective = CreateTable();
	path_objective.questLogIndex = objective.questLogIndex;
	path_objective.questId = objective.questId;
	path_objective.questTitle = objective.questTitle;
	path_objective.level = objective.level;
	path_objective.questTag = objective.questTag;
	path_objective.suggestedGroup = objective.suggestedGroup;
	path_objective.isComplete = objective.isComplete;
	path_objective.isDaily = objective.isDaily;
	path_objective.tracked = objective.tracked;
	path_objective.map = objective.map;
	path_objective.floor = objective.floor;
	path_objective.continent = objective.continent;
	path_objective.zone = objective.zone;
	path_objective.pos_x = objective.pos_x;
	path_objective.pos_y = objective.pos_y;
	path_objective.world = objective.world;
	path_objective.world_floor = objective.world_floor;
	path_objective.world_x = objective.world_x;
	path_objective.world_y = objective.world_y;
	path_objective.routeID = objective.routeID;
	
	-- Insert Path Objective
	tinsert(self.path_objectives, path_objective);
end

function QHLQuests:RemoveQuestFromPath(questId)
	
	-- Copy Objectives
	local path_objectives = CreateTable();
	local removed_objectives = CreateTable();
	for index, objective in pairs(self.path_objectives) do
		if objective.questId == questId then
			tremove(self.path_current, index);
			tinsert(removed_objectives, objective);
		else
			tinsert(path_objectives, objective);
		end
	end

	-- Recycle Old Objectives
	for index, objective in pairs(removed_objectives) do
		RecycleTable(objective);
	end

	-- Recycle Tables
	RecycleTable(removed_objectives);
	RecycleTable(self.path_objectives);
	self.path_objectives = path_objectives;
end

function QHLQuests:WipePathObjectives()
	
	-- Recycle Objectives
	for index, objective in ipairs(self.path_objectives) do
		RecycleTable(objective);
	end
	
	-- Clear Global Objectives Table
	wipe(self.path_objectives);
end

function QHLQuests:AddMapObjective(questLogIndex, questId, questTitle, level, questTag, suggestedGroup, isComplete, isDaily, tracked, continent, zone, pos_x, pos_y, map, floor)

	if continent and zone then

		-- Create Zone Objective
		local zone_objective = CreateTable();
		zone_objective.questLogIndex = questLogIndex;
		zone_objective.questId = questId;
		zone_objective.questTitle = questTitle;
		zone_objective.level = level;
		zone_objective.questTag = questTag;
		zone_objective.suggestedGroup = suggestedGroup;
		zone_objective.isComplete = isComplete;
		zone_objective.isDaily = isDaily;
		zone_objective.tracked = tracked;
		zone_objective.map = map;
		zone_objective.floor = floor;
		zone_objective.continent = continent;
		zone_objective.zone = zone;
		zone_objective.pos_x = pos_x;
		zone_objective.pos_y = pos_y;
		zone_objective.world, zone_objective.world_floor, zone_objective.world_x, zone_objective.world_y = QHL:GetWorldPosition(map, floor, pos_x, pos_y);
		zone_objective.routeID = QHL.TSP:getID(zone_objective.world_x, zone_objective.world_y);

		-- Create Map Objective Table
		if not self.map_objectives[map] then 
			self.map_objectives[map] = {};
		end

		-- Create Floor Objective Table
		if not self.map_objectives[map][floor] then 
			self.map_objectives[map][floor] = {};
		end

		-- Insert Zone Objective
		tinsert(self.map_objectives[map][floor], zone_objective);
	end
end

function QHLQuests:RemoveQuestFromMapObjectives(questId)

	-- Look For Quests In Other Maps
	for map,floors in pairs(self.map_objectives) do

		-- Iterate Through Floors
		for floor,objectives in pairs(floors) do

			-- Check For Objectives
			if self.map_objectives[map] and self.map_objectives[map][floor] then

				-- Copy Objectives
				local zone_objectives = CreateTable();
				local removed_objectives = CreateTable();
				for index, objective in ipairs(self.map_objectives[map][floor]) do
					if objective.questId == questId then
						tinsert(removed_objectives, objective);
					else
						tinsert(zone_objectives, objective);
					end
				end

				-- Recycle Old Objectives
				for index, objective in pairs(removed_objectives) do
					RecycleTable(objective);
				end

				-- Recycle Tables
				RecycleTable(removed_objectives);
				RecycleTable(self.map_objectives[map][floor]);
				self.map_objectives[map][floor] = zone_objectives;
			end
		end
	end
end

function QHLQuests:WipeMapObjectives(map, floor)

	if self.map_objectives[map] then
	
		if not floor then
		
			-- Wipe Every Floor
			for floor, objectives in pairs(self.map_objectives[map]) do
				for index, objective in ipairs(objectives) do
					RecycleTable(objective);
				end

				-- Clear Floor Objectives Table
				wipe(self.map_objectives[map][floor]);
			end
		
			-- Clear Map Objectives Table
			wipe(self.map_objectives[map]);
			
		elseif self.map_objectives[map][floor] then

			-- Wipe Objectives On Floor
			for index, objective in ipairs(self.map_objectives[map][floor]) do
				RecycleTable(objective);
			end
			
			-- Clear Floor Objectives Table
			wipe(self.map_objectives[map][floor]);
		end
	end
end

function QHLQuests:WipeZoneObjectives(continent, zone)

	local map = QHL.Astrolabe:GetMapID(continent, zone);

	if self.map_objectives[map] then
	
		-- Recycle Objectives
		for floor, objectives in pairs(self.map_objectives[map]) do
			for index, objective in ipairs(objectives) do
				RecycleTable(objective);
			end

			-- Clear Floor Objectives Table
			wipe(self.map_objectives[map][floor]);
		end

		-- Clear Map Objectives Table
		wipe(self.map_objectives[map]);
	end
end

local showobjectives_backup;
local battlefieldminimap_update_backup;
local function BackupMapSettings()
	
	-- Hook Battlefield Minimap Update To Prevent Updates
	battlefieldminimap_update_backup = BattlefieldMinimap_Update;
	BattlefieldMinimap_Update = function() end;
	
	-- Backup Settings
	showobjectives_backup = WorldMapQuestShowObjectives:GetChecked();

	-- Show World Objectives
	WorldMapQuestShowObjectives:SetChecked(true);
	SetCVar("questPOI", WorldMapQuestShowObjectives:GetChecked());
	WorldMapQuestShowObjectives_Toggle();
	if ( WORLDMAP_SETTINGS.size == WORLDMAP_WINDOWED_SIZE ) then
		WatchFrame_GetCurrentMapQuests();
		WatchFrame_Update();
	end
	WorldMapFrame_DisplayQuests();
end

local function RestoreMapSettings()

	-- Unhook Battlefield Minimap Updates
	BattlefieldMinimap_Update = battlefieldminimap_update_backup;

	-- Restore Settings
	WorldMapQuestShowObjectives:SetChecked(showobjectives_backup);
	SetCVar("questPOI", WorldMapQuestShowObjectives:GetChecked());
	WorldMapQuestShowObjectives_Toggle();
	if ( WORLDMAP_SETTINGS.size == WORLDMAP_WINDOWED_SIZE ) then
		WatchFrame_GetCurrentMapQuests();
		WatchFrame_Update();
	end
	WorldMapFrame_DisplayQuests();
end

function QHLQuests:UpdateGlobalObjectives()

	-- Wipe Global Objectives
	self:WipeGlobalObjectives();
	
	-- Look For Quests In Other Maps
	for map,floors in pairs(self.map_objectives) do

		-- Iterate Through Floors
		for floor,objectives in pairs(floors) do

			-- Copy Objectives To Global Objectives
			for index, objective in ipairs(objectives) do
			
				self:AddGlobalObjective(objective);
			end
		end
	end
	
	--QHL:PrintAll(1,1,1,"Completed Updating Objectives");
end

function QHLQuests:UpdateGlobalObjectivesCoroutine()

	-- Iterate Through Continents
	for continent=1,select('#', GetMapContinents()) do

		-- Iterate Through Zones
		for zone=1,select("#", GetMapZones(continent)) do
		
			-- Must Wait For Map and Quest Logs To Close
			while QHL.Astrolabe.WorldMapVisible or QuestFrame:IsVisible() or QuestLogFrame:IsVisible() do 
				coroutine.yield(); 
			end

			-- Backup Settings
			BackupMapSettings();

			-- Update Zone Objectives
			self:UpdateZoneObjectives(continent, zone);

			-- Restore Settings
			RestoreMapSettings();

			-- Yield
			coroutine.yield();
		end
	end
end

function QHLQuests:UpdateZoneObjectives(continent, zone)

	if not QHL.Astrolabe.WorldMapVisible then
	
		-- Wipe Zone Objectives
		self:WipeZoneObjectives(continent, zone);
		
		-- Set Map to Zone
		SetMapZoom(continent, zone);
		
		-- Update POIs
		local numEntries = QuestMapUpdateAllQuests();
		QuestPOIUpdateIcons();
		
		local map, floor = GetCurrentMapAreaID(), GetCurrentMapDungeonLevel();
		for i = 1, numEntries do
			
			-- Get Quest Info
			local questId, questLogIndex = QuestPOIGetQuestIDByVisibleIndex(i);
			local questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(questLogIndex);
			local numObjectives = GetNumQuestLeaderBoards(questLogIndex);
			local requiredMoney = GetQuestLogRequiredMoney(questLogIndex);
			
			-- Blizzard isComplete Hack
			if ( isComplete and isComplete < 0 ) then
				isComplete = false;
			elseif ( numObjectives == 0 and GetMoney() >= requiredMoney ) then
				isComplete = true;
			end
			
			-- Get Objective Location
			local _, x, y, objective = QuestPOIGetIconInfo(questId);
			if x and y then
			
				-- Add Objective
				self:AddMapObjective(questLogIndex, questId, questTitle, level, questTag, suggestedGroup, isComplete, isDaily, IsQuestWatched(questLogIndex), continent, zone, x, y, map, floor);
			end
		end
		
		return true;
	else
		return false;
	end
end

function QHLQuests:UpdateMapObjectives(map, floor, force)

	if map > 0 and (force or not QHL.Astrolabe.WorldMapVisible or (map == GetCurrentMapAreaID() and floor == GetCurrentMapDungeonLevel())) then
		
		-- Set Map
		if map ~= GetCurrentMapAreaID() or floor ~= GetCurrentMapDungeonLevel() then 
			SetMapByID(map); 
			if floor ~= 0 then SetDungeonMapLevel(floor); end
		end
		local continent, zone = GetCurrentMapContinent(), GetCurrentMapZone();
		
		-- Wipe Zone Objectives
		self:WipeMapObjectives(map, floor);
		
		-- Update POIs
		local numEntries = QuestMapUpdateAllQuests();
		QuestPOIUpdateIcons();
		
		--QHL:PrintAll(1,1,1,"Updating Map: ", map, " - ", numEntries, " (", continent, ":", zone, ")");
		for i = 1, numEntries do
			
			-- Get Quest Info
			local questId, questLogIndex = QuestPOIGetQuestIDByVisibleIndex(i);
			local questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(questLogIndex);
			local numObjectives = GetNumQuestLeaderBoards(questLogIndex);
			local requiredMoney = GetQuestLogRequiredMoney(questLogIndex);
	
			-- Blizzard isComplete Hack
			if ( isComplete and isComplete < 0 ) then
				isComplete = false;
			elseif ( numObjectives == 0 and GetMoney() >= requiredMoney ) then
				isComplete = true;
			end
			
			-- Get Objective Location
			local _, x, y, objective = QuestPOIGetIconInfo(questId);
			if x and y then
			
				-- Add Objective
				--QHL:PrintAll(1,1,1,questTitle,":",map);
				self:AddMapObjective(questLogIndex, questId, questTitle, level, questTag, suggestedGroup, isComplete, isDaily, IsQuestWatched(questLogIndex), continent, zone, x, y, map, floor);
			end
		end
				
		return true;
	else
		return false;
	end
end

function QHLQuests:UpdateMaps(maps, map_count)

	if map_count > 0 then
	
		-- Backup Settings
		BackupMapSettings();
		
		-- Update Zone Objectives
		local map_string = "";
		WorldMapFrame.blockWorldMapUpdate = true;
		for map, floors in pairs(maps) do
		
			map_string = QHL:Concat(map_string, map, ",");
			for floor, update in pairs(floors) do
				self:UpdateMapObjectives(map, floor, true);
			end
		end
		WorldMapFrame.blockWorldMapUpdate = nil;
		
		--QHL:PrintAll(1,1,1,"Updated Maps: ",map_string);

		-- Update Global Objectives
		self:UpdateGlobalObjectives();
		
		-- Restore Settings
		RestoreMapSettings();
	end
end

---------------------------------------------------------------------------------------------
-- Pathing Functions
---------------------------------------------------------------------------------------------
local function InsertPathNode(path, node)

	for index, path_node in ipairs(path) do
		if path_node == node then return; end
	end
	tinsert(path, node);
end

local function PathsHaveSameNodes(path_1, path_2)

	if #path_1 ~= #path_2 then return false; end
	for n=2,#path_1 do
		local found = false;
		for i=2,#path_2 do
			if path_1[n] == path_2[i] then 
				found = true; 
				break; 
			end
		end
		if not found then return false; end
	end
	return true;
end

local function PathsHaveSameQuests(path_1, path_2)

	if #path_1 ~= #path_2 then return false; end
	for n=2,#path_1 do
		local found = false;
		local objective_1 = QHL.quests:GetObjectiveByRouteID(path_1[n]);
		if objective_1 then
			for i=2,#path_2 do
				local objective_2 = QHL.quests:GetObjectiveByRouteID(path_2[i]);
				if objective_2 and objective_1.questId == objective_2.questId then 
					found = true; 
					break; 
				end
			end
		end
		if not found then return false; end
	end
	return true;
end

function QHLQuests:FindShortestPath()

	if QHL.InBrokenInstance then
	
		-- Wipe Current Path
		wipe(self.path_current);

		-- Set Path Variables
		self.path_distance = 0;
		self.path_player_world_x, self.path_player_world_y = 0, 0;

		-- Wipe Path Objectives
		self:WipePathObjectives();

	elseif not QHL.TSP:IsTSPRunning() and not QHL.InBrokenMap then
			
		-- Wipe Route Nodes
		wipe(self.path_next);
		wipe(self.path_nodes);
		
		-- Insert Objectives
		for index, objective in pairs(self.objectives) do

			-- Filter Objectives
			if self:IsObjectiveTrackable(objective) then
				InsertPathNode(self.path_nodes, objective.routeID);
			end
		end
		
		-- Check For Path Nodes
		if #self.path_nodes > 0 then
		
			-- Insert Current Player Position
			self.path_player_world = QHL.world;
			tinsert(self.path_nodes, 1, QHL.TSP:getID(QHL.world_x, QHL.world_y));
		else
			-- Wipe Pathing
			wipe(self.path_nodes);
			wipe(self.path_current);
			self:WipePathObjectives();
			self.path_distance = 0;
			self.path_player_world = QHL.world;
			self.path_player_world_x = QHL.world_x;
			self.path_player_world_y = QHL.world_y;
			
			-- Nothing To Path
			return;
		end

		-- Start Background TSP Processing
		local zone_width, zone_height = QHL:GetMapWidthAndHeight(QHL.world, QHL.world_floor);
		local running, errormsg = QHL.TSP:SolveTSPBackground(self.path_nodes, nil, nil, zone_width, zone_height, nil, self.path_next);
		if (running == 1) then

			-- Set Finish Instructions
			QHL.TSP:SetFinishFunction(function(output, meta, length, iter, timetaken)
			
				-- Compute Current Path Distance (may have changed since last update)
				if QHL.world == self.path_player_world and PathsHaveSameNodes(output, self.path_current) then
				
					if self.path_current[1] then
					
						-- Update Current Path Player Position
						self.path_current[1] = QHL.TSP:getID(QHL.world_x, QHL.world_y);
						
						-- Get Current Path Distance
						local zone_width, zone_height = QHL:GetMapWidthAndHeight(QHL.world, QHL.world_floor);
						self.path_distance = QHL.TSP:PathLength(self.path_current, zone_width, zone_height);
						
						-- Check If New Path Is Shorter (if not don't change paths)
						if self.path_distance <= length + QHL:GetSetting("track_change_offset") then return; end; --QHL:PrintAll(1,1,1,"No Change: ", self.path_distance," <= ", length); return; end
					end
				end
				
				--QHL:PrintAll(1,1,1,"Route Change: ", self.path_distance," -> ", length);

				-- Wipe Current Path
				wipe(self.path_current);
				
				-- Copy New Path Nodes
				for _,node in ipairs(output) do tinsert(self.path_current, node); end
				
				-- Set Path Variables
				self.path_distance = length;
				self.path_player_world_x, self.path_player_world_y = QHL.TSP:getXY(output[1]);
				
				-- Wipe Old Path Objectives
				self:WipePathObjectives();
				
				-- Set New Path Objectives
				for n=2,#self.path_current do
					local objective = self:GetObjectiveByRouteID(self.path_current[n]);
					if objective then self:AddPathObjective(objective); end
				end				
			end);
		end
	end
end

---------------------------------------------------------------------------------------------
-- Quest Tracker Functions
---------------------------------------------------------------------------------------------
function QHLQuests:UpdateQuestTracker()

	if QHL:GetSetting("track_quests") and not QHL.InBrokenInstance then
		
		-- Set Manual Sort Order
		WatchFrame_SetSorting(nil, WATCHFRAME_SORT_MANUAL);

		-- Remove Quests Out of Range
		for n=GetNumQuestWatches(),1,-1 do

			local index = GetQuestIndexForWatch(n);
			if self.path_objectives[n] then
				local quest = self:GetQuest(self.path_objectives[n].questId);
				if not quest or quest.questLogIndex ~= index then 
					RemoveQuestWatch(index);
				end
			else
				RemoveQuestWatch(index);
			end
		end

		-- Add Quests in Order
		for index, objective in ipairs(self.path_objectives) do
			local quest = self:GetQuest(objective.questId);
			if quest then AddQuestWatch(quest.questLogIndex); end
		end
		if self.path_objectives[1] then SetSuperTrackedQuestID(self.path_objectives[1].questId); end
	end
	
	-- Force Minimap Tracker To Always Show Next Quest
	if not self.minimap_hooked then

		-- Store Original Version
		self.minimap_hooked = true;
		self.SetSuperTrackedQuestID = SetSuperTrackedQuestID;

		-- Set New Function
		SetSuperTrackedQuestID = function(questId)

			if QHL:GetSetting("track_quests") and QHL.quests.path_objectives[1] and questId == QHL.quests.path_objectives[1].questId then

				-- Update Minimap Tracker
				return QHL.quests.SetSuperTrackedQuestID(QHL.quests.path_objectives[1].questId);
			end
		end
	end
end

---------------------------------------------------------------------------------------------
-- Ant Trail Functions
---------------------------------------------------------------------------------------------
local function ClampLine(x1, y1, x2, y2)
  if x1 and y1 and x2 and y2 then
    local x_div, y_div = (x2-x1), (y2-y1)
    local x_0 = y1-x1/x_div*y_div
    local x_1 = y1+(1-x1)/x_div*y_div
    local y_0 = x1-y1/y_div*x_div
    local y_1 = x1+(1-y1)/y_div*x_div
    
    if y1 < 0 then
      x1 = y_0
      y1 = 0
    end
    
    if y2 < 0 then
      x2 = y_0
      y2 = 0
    end
    
    if y1 > 1 then
      x1 = y_1
      y1 = 1
    end
    
    if y2 > 1 then
      x2 = y_1
      y2 = 1
    end
    
    if x1 < 0 then
      y1 = x_0
      x1 = 0
    end
    
    if x2 < 0 then
      y2 = x_0
      x2 = 0
    end
    
    if x1 > 1 then
      y1 = x_1
      x1 = 1
    end
    
    if x2 > 1 then
      y2 = x_1
      x2 = 1
    end
    
    if x1 >= 0 and x2 >= 0 and y1 >= 0 and y2 >= 0 and x1 <= 1 and x2 <= 1 and y1 <= 1 and y2 <= 1 then
      return x1, y1, x2, y2
    end
  end
end

function QHLQuests:ClearAntTrail()

	if not self.ant_cleared then
		for index, dot in ipairs(self.ant_dots) do
			dot:ClearAllPoints();
			dot:Hide();
		end
	end
end

local function CreateDotTexture(parent, id)
	
	local icon = parent:CreateTexture();

	local w, h = 1/8, 1/8;
	local x, y = ((id-1)%8)*w, math.floor((id-1)/8)*h;

	icon:SetTexture("Interface\\AddOns\\QuestHelperLite\\Art\\Icons.tga");
	icon:ClearAllPoints();
	icon:SetDrawLayer("ARTWORK");
	icon:SetBlendMode("BLEND");
	icon:SetTexCoord(x, x+w, y, y+h);
	icon:SetWidth(5);
	icon:SetHeight(5);
	icon:SetVertexColor(0, 0, 0, 0.35);
	icon:Show();
	
	return icon;
end

function QHLQuests:UpdateAntTrail(elapsed)

	if QHL:GetSetting("trail_show") and QHL.Astrolabe.WorldMapVisible and not QHL.InBrokenMap then
	
		local out = 0;
		
		-- Clear Ant Trail
		self:ClearAntTrail();
		self.ant_cleared = false;

		-- Update Phase
		self.ant_phase = self.ant_phase + elapsed + 0.005;
		while self.ant_phase > 1 do self.ant_phase = self.ant_phase - 1; end
		local remainder = self.ant_phase;

		-- Get Map Info
		local w, h = QHL.map_overlay:GetWidth(), -QHL.map_overlay:GetHeight();
		local c, z, m, f = GetCurrentMapContinent(), GetCurrentMapZone(), GetCurrentMapAreaID(), GetCurrentMapDungeonLevel();
		if c and c == 0 then m = 0; end

		-- Get Player Position
		local last_x, last_y = QHL.Astrolabe:TranslateWorldMapPosition(QHL.map, QHL.floor, QHL.pos_x, QHL.pos_y, m, f);

		-- Draw Trails To Each Objective
		for index, objective in ipairs(self.path_objectives) do
		
			-- Get Objective Position
			local new_x, new_y = QHL.Astrolabe:TranslateWorldMapPosition(objective.map, objective.floor, objective.pos_x, objective.pos_y, m, f);
			local x1, y1, x2, y2 = ClampLine(last_x, last_y, new_x, new_y);
			last_x, last_y = new_x, new_y;
			
			if x1 then
			
				local len = math.sqrt((x1-x2)*(x1-x2)*16/9+(y1-y2)*(y1-y2));
				if len > 0.0001 then
				
					local interval = .025/len;
					local p = remainder*interval;
					while p < 1 do
					
						-- Get Dot Texture
						out = out + 1;
						local dot = self.ant_dots[out];
						if not dot then
						
							-- Create New Dot
							dot = CreateDotTexture(QHL.map_overlay, 13);
							dot:SetDrawLayer("BACKGROUND");
							self.ant_dots[out] = dot;
						end
						
						-- Set Dot Position
						dot:Show();
						dot:ClearAllPoints();
						dot:SetPoint("CENTER", QHL.map_overlay, "TOPLEFT", x1*w*(1-p)+x2*w*p, y1*h*(1-p)+y2*h*p);
						p = p + interval;
					end
					remainder = (p-1)/interval;
				end
			end
		end
	else
		-- Clear Ant Trail
		self:ClearAntTrail();
		self.ant_cleared = true;
	end
end

---------------------------------------------------------------------------------------------
-- POI Icon Functions
---------------------------------------------------------------------------------------------
local function POI_GetQuestFrame(questId)
	for i = 1, MAX_NUM_QUESTS do
		local questFrame = _G["WorldMapQuestFrame"..i];
		if ( questFrame and questFrame.questId == questId ) then
			return questFrame;
		end
	end
end

local function POI_FindButtonByQuestId(parentName, questId)

	local poiButton;
	local numButtons;
	
	-- Iterate Through Rest
	for i = 1, 4 do
		numButtons = QHL.quests.QUEST_POI_BUTTONS_MAX[parentName..i];
		if ( numButtons ) then
			for j = 1, numButtons do
				poiButton = _G["poi"..parentName..i.."_"..j];
				if ( poiButton and poiButton.questId == questId ) then
					return poiButton;
				end
			end
		end
	end
end

local function PopulatePOIMenu(menu, quest)

	local hide = QHL:CreateMenuItem(menu, QHL:GetSetting("arrow") and QHL_LOCALE_MENU_ARROW_HIDE or QHL_LOCALE_MENU_ARROW_SHOW);
	hide:SetFunction(function () QHL:ToggleArrow() end);

	if quest then 
		if QHL.quests:IsQuestIgnored(quest.questId) then
			QHL:CreateMenuItem(menu, QHL_LOCALE_MENU_OBJECTIVE_UNIGNORE):SetFunction(function () QHL.quests:UnignoreQuest(quest.questId); end)
		else
			QHL:CreateMenuItem(menu, QHL_LOCALE_MENU_OBJECTIVE_IGNORE):SetFunction(function () QHL.quests:IgnoreQuest(quest.questId); end)
		end
	end
end

local function POI_OnClick(self, button, ...)

	local quest = QHL.quests:GetQuest(self.questId);
	if quest and button == "RightButton" then
		local menu = QHL:CreateMenu();
		QHL:CreateMenuTitle(menu, quest.questTitle);
		PopulatePOIMenu(menu, quest);
		menu:ShowAtCursor();
	else
		if WorldMapQuestShowObjectives:GetChecked() and self.quest then
			WorldMapQuestPOI_OnClick(self);
		end
	end
end

function POI_OnEnter(self)
	WorldMapPOIFrame.allowBlobTooltip = false;
	local quest = QHL.quests:GetQuest(self.questId);
	if quest then 
		WorldMapQuestPOI_SetTooltip(self, quest.questLogIndex);
	end
end

function POI_OnLeave(self)
	WorldMapPOIFrame.allowBlobTooltip = true;
end

local function WorldMapPOI_OnClick(self, button, ...)

	local quest = QHL.quests:GetQuest(self.questId);
	if quest and button == "RightButton" then
		local menu = QHL:CreateMenu();
		QHL:CreateMenuTitle(menu, quest.questTitle);
		PopulatePOIMenu(menu, quest);
		menu:ShowAtCursor();
	else
		WorldMapQuestPOI_OnClick(self, button, ...);
	end
end

local function DisplayPOI_Icon(icons, parent, name, buttonType, buttonIndex, offsetIndex, questId)

	local buttonName = name.."_"..buttonIndex;
	local poiButton = icons[buttonIndex];
	
	if ( not poiButton ) then
	
		poiButton = CreateFrame("Button", buttonName, _G[parent:GetName()], "QuestPOITemplate");
		poiButton.name = name;
		
		-- frame-specific stuff
		poiButton:RegisterForClicks("LeftButtonUp", "RightButtonUp");
		if ( name == "WatchFrameLines" ) then
		
			poiButton:SetScale(0.9);
			poiButton:SetScript("OnClick", POI_OnClick);
			
		elseif ( name == "QuestHelperLite_POI" ) then
		
			poiButton:SetScript("OnEnter", POI_OnEnter);
			poiButton:SetScript("OnLeave", POI_OnLeave);
			poiButton:SetScript("OnClick", POI_OnClick);
		end
		
		icons[buttonIndex] = poiButton;
	end
	
	poiButton.index = buttonIndex;
	poiButton.type = buttonType;
	poiButton.questId = questId;
	poiButton.quest = POI_GetQuestFrame(questId);

	if ( buttonType == QUEST_POI_COMPLETE_IN) then
	
		poiButton.turnin:Show();
		poiButton.number:Hide();
		
	elseif ( buttonType == QUEST_POI_COMPLETE_OUT or buttonType == QUEST_POI_COMPLETE_SWAP ) then
	
		poiButton.turnin:Show();
		poiButton.number:Hide();
		poiButton.normalTexture:SetTexCoord(0.500, 0.625, 0.875, 1.0);
		poiButton.pushedTexture:SetTexCoord(0.375, 0.500, 0.875, 1.0);
		poiButton.highlightTexture:SetTexCoord(0.625, 0.750, 0.375, 0.5);
		
	elseif ( buttonType == QUEST_POI_NUMERIC ) then
	
		poiButton.turnin:Hide();
		poiButton.number:Show();
		buttonIndex = buttonIndex - offsetIndex - 1;
		local yOffset = 0.5 + floor(buttonIndex / QUEST_POI_ICONS_PER_ROW) * QUEST_POI_ICON_SIZE;
		local xOffset = mod(buttonIndex, QUEST_POI_ICONS_PER_ROW) * QUEST_POI_ICON_SIZE;
		poiButton.number:SetTexCoord(xOffset, xOffset + QUEST_POI_ICON_SIZE, yOffset, yOffset + QUEST_POI_ICON_SIZE);
	end
	
	if ( poiButton.isSelected ) then
		QuestPOI_DeselectButton(poiButton);
	end
	
	poiButton:Show();
	return poiButton;
end

function QHLQuests:UpdateObjectiveIcons()

	local zone = GetCurrentMapZone();
	
	-- Show POI Icons
	local completed = 0;
	for index, objective in ipairs(self.path_objectives) do

		local icon;
		if objective.isComplete then

			completed = completed + 1;
			icon = DisplayPOI_Icon(self.objective_icons, QHL.map_overlay, "QuestHelperLite_POI", QUEST_POI_COMPLETE_IN, index, 0, objective.questId);
		else
			icon = DisplayPOI_Icon(self.objective_icons, QHL.map_overlay, "QuestHelperLite_POI", QUEST_POI_NUMERIC, index, completed, objective.questId);
		end

		QHL.Astrolabe:PlaceIconOnWorldMap(QHL.map_overlay, icon, objective.map, objective.floor, objective.pos_x, objective.pos_y);
		--icon:SetFrameLevel(100 + #self.path_objectives - index);
	end

	-- Hide Unused Icons
	for n=#self.path_objectives+1,#self.objective_icons do
		local icon = self.objective_icons[n];
		if icon then icon:Hide(); end
	end

	-- Hide Default Objective Icon
	for index, objective in ipairs(self.objectives) do
		local poiButton = POI_FindButtonByQuestId("WorldMapPOIFrame", objective.questId);
		if poiButton then
			if not self:IsObjectiveTrackable(objective) then
				poiButton:RegisterForClicks("LeftButtonUp", "RightButtonUp");
				poiButton:SetScript("OnClick", WorldMapPOI_OnClick);
				poiButton:Show(); 
			else 
				poiButton:Hide(); 
			end
		end
	end
end
