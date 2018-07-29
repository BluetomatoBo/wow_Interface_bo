-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

--- Exporter TSMAPI_FOUR Functions
-- Constraints:
-- Work like TSM3 exporter
-- except: can export multiple groups
-- Operation export / import should apply all operations.
-- Inherited operations MUST be exported to support this.
-- @module Exporter

TSMAPI_FOUR.Exporter = {}
local _, TSM = ...
local LibAceSerializer = LibStub:GetLibrary("AceSerializer-3.0")
local Exporter = TSMAPI_FOUR.Class.DefineClass("Exporter")
local private = {}



-- ============================================================================
-- Class definition
-- ============================================================================

function Exporter.__init(self)
	self.options = {
		["includeAttachedOperations"] = true
	}
	self.groups = {}
	self.operations = {}
	self.groupOperations = {}
	self.operationsBlacklist = {}
	self.groupTargets = {}
	for _, module in ipairs(TSM.Operations:GetModulesWithOperations()) do
		self.groupOperations[module] = {}
		self.operationsBlacklist[module] = {}
		self.operations[module] = {}
	end
end

--- Blacklist the given operation from being included with the export
-- @tparam self the exporter
-- @tparam module the operation belongs to
-- @tparam name of the operation
function Exporter.BlacklistOperation(self, module, name)
	self.operationsBlacklist[module][name] = true
end

--- Reset the selected groups and drop the cached copies of the operations
-- @tparam self the exporter
function Exporter.ResetSelection(self)
	wipe(self.groups)
	wipe(self.groupOperations)
	for _, module in ipairs(TSM.Operations:GetModulesWithOperations()) do
		wipe(self.operations[module])
	end
end

--- Add the path to the current selected groups
-- @tparam self the exporter
-- @tparam string path the group to add
function Exporter.SelectGroup(self, path)
	if path ~= TSM.CONST.ROOT_GROUP_PATH then
		tinsert(self.groups, path)
		for _, module in ipairs(TSM.Operations:GetModulesWithOperations()) do
			for operationName, operationSettings in TSMAPI_FOUR.Operations.Iterator(module, path) do
				if not self.operationsBlacklist[module][operationName] then
					self.operations[module][operationName] = operationSettings
				end
			end
		end
	end
end

--- Finishes bookkeeping when the group selection changes
-- @tparam self the exporter
function Exporter.FinalizeGroupSelections(self)
	TSMAPI_FOUR.Groups.SortGroupList(self.groups)
	self:_SetupGroupTargets()
	for _, path in ipairs(self.groups) do
		self:_SaveGroupOperations(path)
	end
end

--- gets a string that is the exported groups with the selected options
-- @tparam self the exporter
function Exporter.GetExportString(self)
	local items = {}
	local selectedGroups = {}

	for _, group in ipairs(self.groups) do
		selectedGroups[group] = true
		self:_SaveGroupOperations(group)
	end

	self:_SaveItems(selectedGroups, items)

	local groupExport = table.concat(items, ",")
	if not self.options.includeAttachedOperations then
		return groupExport
	end
	return LibAceSerializer:Serialize({groupExport=groupExport, groupOperations=self.groupOperations, operations=self.operations})
end

function Exporter._SaveGroupOperations(self, group)
	if not self.options.includeAttachedOperations then
		return
	end
	local relPath = self.groupTargets[group]
	self.groupOperations[relPath] = TSM.db.profile.userData.groups[group]
	for _, module in ipairs(TSM.Operations:GetModulesWithOperations()) do
		local operationInfo = self.groupOperations[relPath][module]
		for _, operation in ipairs(operationInfo) do
			if operation ~= "" then
				local data = CopyTable(TSM.operations[module][operation])
				data.ignorePlayer = nil
				data.ignoreFactionrealm = nil
				data.relationships = nil
				self.operations[module] = self.operations[module] or {}
				self.operations[module][operation] = data
			end
		end
	end
end

function Exporter._SaveItems(self, selectedGroups, saveItems)
	local temp = TSMAPI_FOUR.Util.AcquireTempTable()

	for _, itemString, groupPath in TSMAPI_FOUR.Groups.ItemIterator() do
		if selectedGroups[groupPath] then
			tinsert(temp, itemString)
		end
	end

	sort(temp, private.GroupsThenItemsSortFunc)

	local currentPath = ""
	for _, itemString in pairs(temp) do
		local rawPath = TSMAPI_FOUR.Groups.GetPathByItem(itemString)
		local relPath = self.groupTargets[rawPath]
		if relPath ~= currentPath then
			tinsert(saveItems, "group:"..relPath)
			currentPath = relPath
		end
		tinsert(saveItems, itemString)
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(temp)
end

function Exporter._SetupGroupTargets(self)
	wipe(self.groupTargets)
	if #self.groups < 1 then
		return
	end
	local knownRoots = {}
	for _, groupPath in ipairs(self.groups) do
		local root, leaf = TSMAPI_FOUR.Groups.SplitPath(groupPath)
		leaf = gsub(leaf, ",", TSM.CONST.GROUP_SEP..TSM.CONST.GROUP_SEP)
		if knownRoots[root] then
			self.groupTargets[groupPath] = leaf
		else
			if self.groupTargets[root] then
				self.groupTargets[groupPath] = TSMAPI_FOUR.Groups.JoinPath(self.groupTargets[root], leaf)
			else
				knownRoots[root] = true
				self.groupTargets[groupPath] = leaf
			end
		end
	end
end



-- ============================================================================
-- Private Functions
-- ============================================================================

function private.GroupsThenItemsSortFunc(a, b)
	local groupA = strlower(gsub(TSMAPI_FOUR.Groups.GetPathByItem(a), TSM.CONST.GROUP_SEP, "\001"))
	local groupB = strlower(gsub(TSMAPI_FOUR.Groups.GetPathByItem(b), TSM.CONST.GROUP_SEP, "\001"))
	if groupA == groupB then
		return a < b
	end
	return groupA < groupB
end



-- ============================================================================
-- New TSMAPI Functions
-- ============================================================================

function TSMAPI_FOUR.Exporter.New()
	return Exporter()
end
