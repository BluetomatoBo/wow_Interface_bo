-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

TSMAPI_FOUR.Modules = {}
local _, TSM = ...
local Modules = TSM:NewPackage("Modules")
-- a list of operation settings which may be stored as a string, but should be a number
local CLEAN_UP_OPERATION_SETTINGS = {
	Auctioning = {
		"stackSize",
		"postCap",
		"keepQuantity",
		"maxExpires",
		"keepPosted",
	},
	Crafting = {
		"minRestock",
		"maxRestock",
	},
	Mailing = {
		"maxQty",
		"keepQty",
	},
	Shopping = {
		"restockQuantity",
	},
	Sniper = {},
	Vendoring = {
		"restockQty",
		"keepQty",
		"sellAfterExpired",
	},
	Warehousing = {
		"moveQuantity",
		"keepBagQuantity",
		"keepBankQuantity",
		"restockQuantity",
		"stackSize",
		"restockKeepBankQuantity",
		"restockStackSize",
	},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Modules.OnInitialize()
	TSM.db:RegisterCallback("OnProfileUpdated", Modules.ProfileUpdated)
end

function Modules.OnEnable()
	Modules.ProfileUpdated()
	TSMAPI_FOUR.Delay.AfterTime(3, Modules.ProfileUpdated)
end

function Modules.ProfileUpdated()
	if Modules.ignoreProfileUpdated then
		return
	end

	-- fix groups with `` in their path from Sheyrah's export
	local didFix = true
	while didFix do
		didFix = false
		local fixes = TSMAPI_FOUR.Util.AcquireTempTable()
		for groupPath in pairs(TSM.db.profile.userData.groups) do
			if strmatch(groupPath, TSM.CONST.GROUP_SEP..TSM.CONST.GROUP_SEP) then
				fixes[groupPath] = gsub(groupPath, TSM.CONST.GROUP_SEP..TSM.CONST.GROUP_SEP, ",")
			end
		end
		for oldGroupPath, newGroupPath in pairs(fixes) do
			TSM:LOG_INFO("Fixing group path: "..oldGroupPath)
			local temp = TSM.db.profile.userData.groups[oldGroupPath]
			TSM.db.profile.userData.groups[oldGroupPath] = nil
			TSM.db.profile.userData.groups[newGroupPath] = temp
			didFix = true
		end
		wipe(fixes)
		for itemString, groupPath in pairs(TSM.db.profile.userData.items) do
			if strmatch(groupPath, TSM.CONST.GROUP_SEP..TSM.CONST.GROUP_SEP) then
				fixes[itemString] = gsub(groupPath, TSM.CONST.GROUP_SEP..TSM.CONST.GROUP_SEP, ",")
			end
		end
		for itemString, groupPath in pairs(fixes) do
			TSM.db.profile.userData.items[itemString] = groupPath
			didFix = true
		end
		TSMAPI_FOUR.Util.ReleaseTempTable(fixes)
	end
	TSM.Groups.RebuildDatabase()

	-- update operations
	TSM.operations = TSM.db.global.coreOptions.globalOperations and TSM.db.global.userData.operations or TSM.db.profile.userData.operations
	for _, moduleName in ipairs(TSM.Operations:GetModulesWithOperations()) do
		TSM.operations[moduleName] = TSM.operations[moduleName] or {}
		for _, groupOperations in pairs(TSM.db.profile.userData.groups) do
			groupOperations[moduleName] = groupOperations[moduleName] or {}
		end
	end

	-- remove operations which no longer exist from groups
	for groupPath, operations in pairs(TSM.db.profile.userData.groups) do
		for _, moduleName in ipairs(TSM.Operations:GetModulesWithOperations()) do
			operations[moduleName] = operations[moduleName] or {}
			local moduleOperations = operations[moduleName]
			if #moduleOperations > 1 or moduleOperations[1] ~= "" then
				for i = #moduleOperations, 1, -1 do
					local operationName = moduleOperations[i]
					if not TSM.operations[moduleName][operationName] then
						TSM:LOG_INFO("Removing invalid operation (%s->%s) from %s", moduleName, operationName, groupPath)
						tremove(moduleOperations, i)
					end
				end
			end
			if #moduleOperations == 0 then
				tinsert(moduleOperations, "")
			end
		end
	end

	for moduleName, operations in pairs(TSM.operations) do
		if TSMAPI_FOUR.Operations.ModuleHasOperations(moduleName) then
			if not TSM.db.profile.internalData.createdDefaultOperations and not operations["#Default"] then
				TSM.Operations.New(moduleName, "#Default")
			end
			for operationName, operation in pairs(operations) do
				operation.ignorePlayer = operation.ignorePlayer or {}
				operation.ignoreFactionrealm = operation.ignoreFactionrealm or {}
				operation.relationships = operation.relationships or {}

				-- clean up operation settings which should be numbers but are strings
				for _, key in ipairs(CLEAN_UP_OPERATION_SETTINGS[moduleName]) do
					if type(operation[key]) == "string" then
						TSM:LOG_INFO("Fixing %s -> %s -> %s", moduleName, operationName, key)
						operation[key] = tonumber(operation[key])
					end
				end
			end
			Modules:CheckOperationRelationships(moduleName)
		end
	end
	TSM.db.profile.internalData.createdDefaultOperations = true

	-- create the root group if it doesn't exist and assign default operations
	if not TSM.db.profile.userData.groups[TSM.CONST.ROOT_GROUP_PATH] then
		-- make sure all previously-top-level groups have the override flag set
		for groupPath, moduleOperations in pairs(TSM.db.profile.userData.groups) do
			if not strfind(groupPath, TSM.CONST.GROUP_SEP) then
				for moduleName in pairs(TSM.operations) do
					if TSMAPI_FOUR.Operations.ModuleHasOperations(moduleName) then
						moduleOperations[moduleName] = moduleOperations[moduleName] or {}
						moduleOperations[moduleName].override = true
					end
				end
			end
		end
		TSMAPI_FOUR.Groups.Create(TSM.CONST.ROOT_GROUP_PATH)
		for moduleName, operations in pairs(TSM.operations) do
			if TSMAPI_FOUR.Operations.ModuleHasOperations(moduleName) and operations["#Default"] then
				TSM.Groups:SetOperation(TSM.CONST.ROOT_GROUP_PATH, moduleName, "#Default", 1)
			end
		end
	end

	-- fix bad imports which contain operations but don't have the override flag set
	local groupList = TSMAPI_FOUR.Util.AcquireTempTable()
	for path in pairs(TSM.db.profile.userData.groups) do
		tinsert(groupList, path)
	end
	TSMAPI_FOUR.Groups.SortGroupList(groupList)
	assert(not TSM.db.profile.userData.groups[TSM.CONST.ROOT_GROUP_PATH] or groupList[1] == TSM.CONST.ROOT_GROUP_PATH)
	for _, path in ipairs(groupList) do
		local parentPath = TSMAPI_FOUR.Groups.SplitPath(path)
		local operations = TSM.db.profile.userData.groups[path]
		if parentPath then
			TSM.db.profile.userData.groups[parentPath] = TSM.db.profile.userData.groups[parentPath] or {}
			local parentOperations = TSM.db.profile.userData.groups[parentPath]
			for _, moduleName in ipairs(TSM.Operations:GetModulesWithOperations()) do
				operations[moduleName] = operations[moduleName] or {}
				parentOperations[moduleName] = parentOperations[moduleName] or {}
				local moduleOperations = operations[moduleName]
				local parentModuleOperations = parentOperations[moduleName]
				if not moduleOperations.override then
					if parentPath == TSM.CONST.ROOT_GROUP_PATH then
						local equalOperations = true
						for i = 1, max(#moduleOperations, #parentModuleOperations) do
							if moduleOperations[i] ~= parentModuleOperations[i] then
								equalOperations = false
								break
							end
						end
						if not equalOperations then
							-- just apply the root group operations to this group
							TSM:LOG_INFO("Applying root group operations to %s %s", path, moduleName)
							wipe(moduleOperations)
							for i, operationName in ipairs(parentModuleOperations) do
								moduleOperations[i] = operationName
							end
						end
					else
						local equalOperations = true
						for i = #moduleOperations, 1, -1 do
							if moduleOperations[i] == "" then
								tremove(moduleOperations, i)
							end
						end
						for i = #parentModuleOperations, 1, -1 do
							if parentModuleOperations[i] == "" then
								tremove(parentModuleOperations, i)
							end
						end
						for i = 1, max(#moduleOperations, #parentModuleOperations) do
							if moduleOperations[i] ~= parentModuleOperations[i] then
								equalOperations = false
								break
							end
						end
						if not equalOperations then
							TSM:LOG_INFO("Setting override for %s %s", path, moduleName)
							moduleOperations.override = true
						end
					end
				end
			end
		end
	end
	TSMAPI_FOUR.Util.ReleaseTempTable(groupList)
end

function Modules:IsOperationIgnored(module, operationName)
	local operationSettings = TSM.operations[module][operationName]
	if not operationSettings then return end
	local factionrealm = UnitFactionGroup("player").." - "..GetRealmName()
	local playerKey = UnitName("player").." - "..factionrealm
	return operationSettings.ignorePlayer[playerKey] or operationSettings.ignoreFactionrealm[factionrealm]
end

function Modules:CheckOperationRelationships(moduleName)
	for _, operation in pairs(TSM.operations[moduleName]) do
		for key, target in pairs(operation.relationships or {}) do
			if not TSM.operations[moduleName][target] then
				operation.relationships[key] = nil
			end
		end
	end
end
