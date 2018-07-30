-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

--- Public TSM API functions
-- @module TSM_API

local _, TSM = ...
TSM_API = {}



-- ============================================================================
-- UI
-- ============================================================================

--- Checks if a TSM UI is currently visible.
-- @tparam string uiName A string which represents the UI ("AUCTION", "CRAFTING", "MAILING", or "VENDORING")
-- @treturn boolean Whether or not the TSM UI is visible
function TSM_API.IsUIVisible(uiName)
	if uiName == "AUCTION" then
		return TSM.UI.AuctionUI.IsVisible()
	elseif uiName == "CRAFTING" then
		return TSM.UI.CraftingUI.IsVisible()
	elseif uiName == "MAILING" then
		return TSM.UI.MailingUI.IsVisible()
	elseif uiName == "VENDORING" then
		return TSM.UI.VendoringUI.IsVisible()
	else
		error("Invalid uiName: "..tostring(uiName), 2)
	end
end



-- ============================================================================
-- Groups
-- ============================================================================

--- Gets a current list of TSM group paths.
-- @tparam table result A table to store the result in
-- @treturn table The passed table, populated with group paths
function TSM_API.GetGroupPaths(result)
	if type(result) ~= "table" then
		error("Invalid 'result' argument type (must be a table): "..tostring(result), 2)
	end
	TSM.Groups:GetSortedGroupPathList(result)
	return result
end

--- Formats a TSM group path into a human-readable form
-- @tparam string path The group path to be formatted
-- @treturn string The formatted group path
function TSM_API.FormatGroupPath(path)
	if type(path) ~= "string" then
		error("Invalid 'path' argument type (must be a string): "..tostring(path), 2)
	elseif path == "" then
		error("Invalid 'path' argument (empty string)", 2)
	end
	return TSMAPI_FOUR.Groups.FormatPath(path)
end

--- Splits a TSM group path into its parent path and group name components.
-- @tparam string path The group path to be split
-- @?treturn string The path of the parent group or nil if the specified path has no parent
-- @treturn string The name of the group
function TSM_API.SplitGroupPath(path)
	if type(path) ~= "string" then
		error("Invalid 'path' argument type (must be a string): "..tostring(path), 2)
	elseif path == "" then
		error("Invalid 'path' argument (empty string)", 2)
	end
	local parentPath, groupName = TSMAPI_FOUR.Groups.SplitPath(path)
	if parentPath == TSM.CONST.ROOT_GROUP_PATH then
		parentPath = nil
	end
	return parentPath, groupName
end

--- Gets the path to the group which a specific item is in.
-- @tparam string|number item The item in either itemLink, itemString, or itemId representation
-- @?treturn string The path to the group which the item is in, or nil if it's not in a group
function TSM_API.GetGroupPathByItem(item)
	if type(item) ~= "string" and type(item) ~= "number" then
		error("Invalid 'item' argument type (must be a string or number): "..tostring(item), 2)
	end
	local path = TSMAPI_FOUR.Groups.GetPathByItem(item)
	return path ~= TSM.CONST.ROOT_GROUP_PATH and path or nil
end



-- ============================================================================
-- Profiles
-- ============================================================================

--- Gets a current list of TSM profiles.
-- @tparam table result A table to store the result in
-- @treturn table The passed table, populated with group paths
function TSM_API.GetProfiles(result)
	for _, profileName in TSM.db:ProfileIterator() do
		tinsert(result, profileName)
	end
	return result
end

--- Gets the active TSM profile.
-- @treturn string The name of the currently active profile
function TSM_API.GetActiveProfile()
	return TSM.db:GetCurrentProfile()
end

--- Sets the active TSM profile.
-- @tparam string profile The name of the profile to make active
function TSM_API.SetActiveProfile(profile)
	if type(profile) ~= "string" then
		error("Invalid 'profile' argument type (must be a string): "..tostring(profile), 2)
	elseif not TSM.db:ProfileExists(profile) then
		error("Profile does not exist: "..profile, 2)
	elseif profile == TSM.db:GetCurrentProfile() then
		error("Profile is already active: "..profile, 2)
	end
	return TSM.db:SetProfile(profile)
end
