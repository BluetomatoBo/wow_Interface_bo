-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

TSMAPI_FOUR.Groups = {}
local _, TSM = ...
local Groups = TSM:NewPackage("Groups")
local private = { itemDB = nil }
local GROUP_LEVEL_COLORS = {
	"FCF141",
	"BDAEC6",
	"06A2CB",
	"FFB85C",
	"51B599",
}
local ITEM_DB_SCHEMA = {
	fields = {
		itemString = "string",
		groupPath = "string",
	},
	fieldAttributes = {
		itemString = { "unique" },
		groupPath = { "index" },
	},
	fieldOrder = {
		"itemString",
		"groupPath",
	}
}



-- ============================================================================
-- New Modules Functions
-- ============================================================================

function Groups.OnInitialize()
	private.itemDB = TSMAPI_FOUR.Database.New(ITEM_DB_SCHEMA, "GROUP_ITEMS")
	Groups.RebuildDatabase()
end

function Groups.RebuildDatabase()
	-- fix up any invalid items
	local newPaths = TSMAPI_FOUR.Util.AcquireTempTable()
	for itemString, groupPath in pairs(TSM.db.profile.userData.items) do
		local newItemString = TSMAPI_FOUR.Item.ToItemString(itemString)
		if not newItemString then
			-- this itemstring is invalid
			TSM:LOG_INFO("Itemstring (%s) is invalid", tostring(itemString))
			TSM.db.profile.userData.items[itemString] = nil
		elseif groupPath == TSM.CONST.ROOT_GROUP_PATH or not TSM.db.profile.userData.groups[groupPath] then
			-- this group doesn't exist
			TSM:LOG_INFO("Group (%s) doesn't exist, so removing item (%s)", groupPath, itemString)
			TSM.db.profile.userData.items[itemString] = nil
		elseif newItemString ~= itemString then
			-- remove this invalid itemstring from this group
			TSM:LOG_INFO("Itemstring changed (%s -> %s), so removing it from group (%s)", itemString, newItemString, groupPath)
			TSM.db.profile.userData.items[itemString] = nil
			-- add this new item to this group if it's not already in one
			if not TSM.db.profile.userData.items[newItemString] then
				newPaths[newItemString] = groupPath
				TSM:LOG_INFO("Adding to group instead (%s)", groupPath)
			end
		end
	end
	for itemString, groupPath in pairs(newPaths) do
		TSM.db.profile.userData.items[itemString] = groupPath
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(newPaths)

	-- populate our database
	private.itemDB:SetQueryUpdatesPaused(true)
	private.itemDB:Truncate()
	private.itemDB:BulkInsertStart()
	for itemString, groupPath in pairs(TSM.db.profile.userData.items) do
		private.itemDB:BulkInsertNewRow(itemString, groupPath)
	end
	private.itemDB:BulkInsertEnd()
	private.itemDB:SetQueryUpdatesPaused(false)
end

function Groups.GetDBForJoin()
	return private.itemDB
end



-- ============================================================================
-- New TSMAPI Functions
-- ============================================================================

-- Creates a new group with the specified path
function TSMAPI_FOUR.Groups.Create(groupPath)
	if TSM.db.profile.userData.groups[groupPath] then return end
	local parentPath = TSMAPI_FOUR.Groups.SplitPath(groupPath)
	if parentPath and parentPath ~= TSM.CONST.ROOT_GROUP_PATH then
		TSMAPI_FOUR.Groups.Create(parentPath)
	end
	TSM.db.profile.userData.groups[groupPath] = {}
	for _, moduleName in ipairs(TSM.Operations:GetModulesWithOperations()) do
		TSM.db.profile.userData.groups[groupPath][moduleName] = TSM.db.profile.userData.groups[groupPath][moduleName] or {}
		if parentPath and parentPath ~= TSM.CONST.ROOT_GROUP_PATH then
			Groups:SetOperationOverride(groupPath, moduleName, nil, true)
		end
	end
end

function TSMAPI_FOUR.Groups.CreateLikeName(groupPath)
	if TSM.db.profile.userData.groups[groupPath] then
		local num = 1
		while TSM.db.profile.userData.groups[groupPath.." "..num] do
			num = num + 1
		end
		groupPath = groupPath.." "..num
	end
	TSMAPI_FOUR.Groups.Create(groupPath)
	return groupPath
end

function TSMAPI_FOUR.Groups.IsItemInGroup(itemString)
	assert(itemString)
	return private.itemDB:GetUniqueRowField("itemString", itemString, "groupPath") and true or false
end

function TSMAPI_FOUR.Groups.GetPathByItem(itemString)
	itemString = TSMAPI_FOUR.Item.ToBaseItemString(itemString, true)
	assert(itemString)
	local groupPath = private.itemDB:GetUniqueRowField("itemString", itemString, "groupPath") or TSM.CONST.ROOT_GROUP_PATH
	assert(TSM.db.profile.userData.groups[groupPath])
	return groupPath
end

function TSMAPI_FOUR.Groups.FormatPath(groupPath, useColor)
	if not groupPath then return end
	local result = gsub(groupPath, TSM.CONST.GROUP_SEP, "->")
	if useColor then
		return "|cff99ffff"..result.."|r"
	else
		return result
	end
end

function TSMAPI_FOUR.Groups.JoinPath(...)
	if select("#", ...) == 2 then
		if select(1, ...) == "" then
			return select(2, ...)
		end
	end
	return strjoin(TSM.CONST.GROUP_SEP, ...)
end

-- Splits the given group path into the parent path and group name
-- Parent will be nil if there is no parent
function TSMAPI_FOUR.Groups.SplitPath(groupPath)
	local parent, groupName = strmatch(groupPath, "^(.+)"..TSM.CONST.GROUP_SEP.."([^"..TSM.CONST.GROUP_SEP.."]+)$")
	if parent then
		return parent, groupName
	elseif groupPath ~= TSM.CONST.ROOT_GROUP_PATH then
		return TSM.CONST.ROOT_GROUP_PATH, groupPath
	else
		return nil, groupPath
	end
end

function TSMAPI_FOUR.Groups.IsChild(groupPath, parentPath)
	if parentPath == TSM.CONST.ROOT_GROUP_PATH then
		return groupPath ~= TSM.CONST.ROOT_GROUP_PATH
	end
	return strmatch(groupPath, "^"..TSMAPI_FOUR.Util.StrEscape(parentPath)..TSM.CONST.GROUP_SEP) and true or false
end

function TSMAPI_FOUR.Groups.IteratorByOperation(moduleName, operationName)
	local groupList = TSMAPI_FOUR.Util.AcquireTempTable()
	for groupPath, modules in pairs(TSM.db.profile.userData.groups) do
		if modules[moduleName] and (groupPath == TSM.CONST.ROOT_GROUP_PATH or modules[moduleName].override) then
			for i = 1, #modules[moduleName] do
				if modules[moduleName][i] == operationName then
					tinsert(groupList, groupPath)
				end
			end
		end
	end
	return TSMAPI_FOUR.Util.TempTableIterator(groupList)
end

function TSMAPI_FOUR.Groups.RemoveOperationByName(groupPath, module, operation)
	local moduleOperations = TSM.db.profile.userData.groups[groupPath][module]
	for i = #moduleOperations, 1, -1 do
		if moduleOperations[i] == operation then
			local numOperations = #moduleOperations
			-- shift the latter operations down an index to preserve the order and remove the last one
			for j = i + 1, numOperations do
				Groups:SetOperation(groupPath, module, moduleOperations[j], j - 1)
			end
			-- remove the last one
			Groups:SetOperation(groupPath, module, nil, numOperations)
		end
	end
end

function TSMAPI_FOUR.Groups.HasOperationsByModule(groupPath, module)
	if not TSM.db.profile.userData.groups[groupPath][module] then
		return false
	end

	for _, operation in ipairs(TSM.db.profile.userData.groups[groupPath][module]) do
		if operation ~= "" and not TSM.Modules:IsOperationIgnored(module, operation) then
			return true
		end
	end

	return false
end

function TSMAPI_FOUR.Groups.AppendOperation(groupPath, module, operation)
	local index = #TSM.db.profile.userData.groups[groupPath][module]
	if TSM.db.profile.userData.groups[groupPath][module][index] ~= "" then
		index = index + 1
	end
	assert(index <= TSM.Operations.GetMaxOperations(module))
	Groups:SetOperation(groupPath, module, operation, index)
end

function TSMAPI_FOUR.Groups.SortGroupList(list)
	sort(list, private.GroupSortFunction)
end

function TSMAPI_FOUR.Groups.BaseName(groupPath)
	local _, name = TSMAPI_FOUR.Groups.SplitPath(groupPath)
	return name
end

function TSMAPI_FOUR.Groups.ItemIterator(groupPathFilter)
	assert(groupPathFilter ~= TSM.CONST.ROOT_GROUP_PATH)
	local query = private.itemDB:NewQuery()
		:Select("itemString", "groupPath")
	if groupPathFilter then
		query:Equal("groupPath", groupPathFilter)
	end
	return query:IteratorAndRelease()
end

function TSMAPI_FOUR.Groups.Exists(groupPath)
	return TSM.db.profile.userData.groups[groupPath] and true or false
end

function TSMAPI_FOUR.Groups.Move(groupPath, newPath)
	assert(groupPath ~= TSM.CONST.ROOT_GROUP_PATH)
	assert(TSM.db.profile.userData.groups[groupPath] and not TSM.db.profile.userData.groups[newPath])

	-- change the path of all subgroups and move items
	local changes = TSMAPI_FOUR.Util.AcquireTempTable()
	for path in pairs(TSM.db.profile.userData.groups) do
		if path == groupPath or TSMAPI_FOUR.Groups.IsChild(path, groupPath) then
			changes[path] = gsub(path, "^"..TSMAPI_FOUR.Util.StrEscape(groupPath), TSMAPI_FOUR.Util.StrEscape(newPath))
		end
	end
	for oldPath, changeNewPath in pairs(changes) do
		TSM.db.profile.userData.groups[changeNewPath] = TSM.db.profile.userData.groups[oldPath]
		TSM.db.profile.userData.groups[oldPath] = nil
		private.MoveGroupItems(oldPath, changeNewPath)
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(changes)

	for _, moduleName in ipairs(TSM.Operations:GetModulesWithOperations()) do
		TSM.db.profile.userData.groups[newPath][moduleName] = TSM.db.profile.userData.groups[newPath][moduleName] or {}
		if TSMAPI_FOUR.Groups.SplitPath(newPath) and not TSM.db.profile.userData.groups[newPath][moduleName].override then
			Groups:SetOperationOverride(newPath, moduleName, nil, true)
		end
	end
end

function TSMAPI_FOUR.Groups.Remove(groupPath)
	assert(groupPath ~= TSM.CONST.ROOT_GROUP_PATH and TSM.db.profile.userData.groups[groupPath])
	local parentPath = TSMAPI_FOUR.Groups.SplitPath(groupPath)
	assert(parentPath)
	if parentPath == TSM.CONST.ROOT_GROUP_PATH then
		parentPath = nil
	end

	-- delete this group and all subgroups
	for path in pairs(TSM.db.profile.userData.groups) do
		if path == groupPath or TSMAPI_FOUR.Groups.IsChild(path, groupPath) then
			TSM.db.profile.userData.groups[path] = nil
			private.MoveGroupItems(path, parentPath)
		end
	end
end

function TSMAPI_FOUR.Groups.AddItem(itemString, groupPath)
	assert(groupPath ~= TSM.CONST.ROOT_GROUP_PATH and TSM.db.profile.userData.groups[groupPath])
	assert(not TSMAPI_FOUR.Groups.IsItemInGroup(itemString))

	private.itemDB:NewRow()
		:SetField("itemString", itemString)
		:SetField("groupPath", groupPath)
		:Create()
	TSM.db.profile.userData.items[itemString] = groupPath
end

function TSMAPI_FOUR.Groups.MoveItem(itemString, groupPath)
	assert(groupPath ~= TSM.CONST.ROOT_GROUP_PATH and TSM.db.profile.userData.groups[groupPath])
	assert(TSMAPI_FOUR.Groups.IsItemInGroup(itemString))

	local row = private.itemDB:GetUniqueRow("itemString", itemString)
	row:SetField("groupPath", groupPath)
		:Update()
	row:Release()
	TSM.db.profile.userData.items[itemString] = groupPath
end

function TSMAPI_FOUR.Groups.AddOrMoveItems(items, groupPath)
	private.itemDB:SetQueryUpdatesPaused(true)
	for _, itemString in ipairs(items) do
		if TSMAPI_FOUR.Groups.IsItemInGroup(itemString) then
			TSMAPI_FOUR.Groups.MoveItem(itemString, groupPath)
		else
			TSMAPI_FOUR.Groups.AddItem(itemString, groupPath)
		end
	end
	private.itemDB:SetQueryUpdatesPaused(false)
end

function TSMAPI_FOUR.Groups.RemoveItem(itemString)
	assert(TSMAPI_FOUR.Groups.IsItemInGroup(itemString))

	local row = private.itemDB:GetUniqueRow("itemString", itemString)
	private.itemDB:DeleteRow(row)
	row:Release()
	TSM.db.profile.userData.items[itemString] = nil
end



-- ============================================================================
-- Module Functions
-- ============================================================================

function Groups:GetSortedGroupPathList(list)
	list = list or {}
	for groupPath in pairs(TSM.db.profile.userData.groups) do
		if groupPath ~= TSM.CONST.ROOT_GROUP_PATH then
			tinsert(list, groupPath)
		end
	end
	Groups:SortGroupList(list)
	return list
end

function Groups:GetGroupPathList(module)
	if not module then
		return Groups:GetSortedGroupPathList()
	end
	local list, disabled = {}, {}
	for groupPath in pairs(TSM.db.profile.userData.groups) do
		if groupPath ~= "" then
			if module then
				local operations = Groups:GetGroupOperations(groupPath, module)
				if not operations then
					disabled[groupPath] = true
				end
			end
			tinsert(list, groupPath)
		end
	end

	for groupPath in pairs(TSM.db.profile.userData.groups) do
		if groupPath ~= "" and not disabled[groupPath] then
			local path = nil
			for _, part in TSMAPI_FOUR.Util.VarargIterator(strsplit(TSM.CONST.GROUP_SEP, groupPath)) do
				path = path and (path..TSM.CONST.GROUP_SEP..part) or part
				if path ~= groupPath then
					disabled[path] = nil
				end
			end
		end
	end

	Groups:SortGroupList(list)
	return list, disabled
end

function Groups:GetGroupOperations(path, module)
	if not TSM.db.profile.userData.groups[path] then return end

	if module and TSM.db.profile.userData.groups[path][module] then
		local operations = CopyTable(TSM.db.profile.userData.groups[path][module])
		for i = #operations, 1, -1 do
			if not operations[i] or operations[i] == "" or TSM.Modules:IsOperationIgnored(module, operations[i]) then
				tremove(operations, i)
			end
		end
		if #operations > 0 then
			return operations
		end
	end
end

function Groups:ColorName(groupName, level)
	local color = GROUP_LEVEL_COLORS[(level-1) % #GROUP_LEVEL_COLORS + 1]
	return "|cFF"..color..groupName.."|r"
end

function Groups:SetOperation(path, module, operation, index)
	if not TSM.db.profile.userData.groups[path] then return end
	if not TSM.db.profile.userData.groups[path][module] then return end
	TSM.db.profile.userData.groups[path][module][index] = operation
	private.UpdateGroupOperations(module, path)
end

function Groups:AddOperation(path, module)
	if not TSM.db.profile.userData.groups[path] then return end
	tinsert(TSM.db.profile.userData.groups[path][module], "")
	private.UpdateGroupOperations(module, path)
end

function Groups:RemoveOperation(path, module, index)
	if not TSM.db.profile.userData.groups[path] then return end
	TSMAPI_FOUR.Groups.RemoveOperationByName(path, module, TSM.db.profile.userData.groups[path][module][index])
end

function Groups:SetOperationOverride(path, module, override, force)
	if not TSM.db.profile.userData.groups[path] or (not force and TSM.db.profile.userData.groups[path][module] and TSM.db.profile.userData.groups[path][module].override == override) then return end

	-- clear all operations for this path/module
	TSM.db.profile.userData.groups[path][module] = {override=(override or nil)}
	private.UpdateGroupOperations(module, path)
	if not override then
		-- set this group's (and all applicable subgroups') operation to the parent's
		local parentPath = TSMAPI_FOUR.Groups.SplitPath(path)
		if parentPath then
			private.UpdateGroupOperations(module, parentPath)
		end
	end
end

function Groups:SortGroupList(list)
	sort(list, private.GroupSortFunction)
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.UpdateGroupOperations(module, parentPath)
	local groupList = TSMAPI_FOUR.Util.AcquireTempTable()
	Groups:GetSortedGroupPathList(groupList)
	for _, path in ipairs(groupList) do
		if parentPath == TSM.CONST.ROOT_GROUP_PATH or TSMAPI_FOUR.Groups.IsChild(path, parentPath) then
			TSM.db.profile.userData.groups[path][module] = TSM.db.profile.userData.groups[path][module] or {}
			if not TSM.db.profile.userData.groups[path][module].override then
				wipe(TSM.db.profile.userData.groups[path][module])
				local parentGroupPath = TSMAPI_FOUR.Groups.SplitPath(path)
				-- assign all the parent group's operations to this subgroup
				for i, operationName in ipairs(TSM.db.profile.userData.groups[parentGroupPath][module]) do
					TSM.db.profile.userData.groups[path][module][i] = operationName
				end
			end
		end
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(groupList)
end

function private.GroupSortFunction(a, b)
	return strlower(gsub(a, TSM.CONST.GROUP_SEP, "\001")) < strlower(gsub(b, TSM.CONST.GROUP_SEP, "\001"))
end

function private.MoveGroupItems(groupPath, newGroupPath)
	assert(newGroupPath ~= TSM.CONST.ROOT_GROUP_PATH)
	assert(not newGroupPath or TSM.db.profile.userData.groups[newGroupPath])
	local query = private.itemDB:NewQuery()
		:Select("itemString")
		:Equal("groupPath", groupPath)
	private.itemDB:SetQueryUpdatesPaused(true)
	for _, itemString in query:Iterator() do
		if newGroupPath then
			-- move all items from this group into the new group
			TSMAPI_FOUR.Groups.MoveItem(itemString, newGroupPath)
		else
			-- remove all items from this group
			TSMAPI_FOUR.Groups.RemoveItem(itemString)
		end
	end
	query:Release()
	private.itemDB:SetQueryUpdatesPaused(false)
end

function private.DBBulkInsertIterator(_, index)
	index = next(TSM.db.profile.userData.items, index)
	if index == nil then
		return
	end
	local itemString = index
	local groupPath = TSM.db.profile.userData.items[itemString]
	return index, itemString, groupPath
end
