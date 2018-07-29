-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local GroupSearch = TSM.Shopping:NewPackage("GroupSearch")
local L = TSM.L
local private = { groups = {}, itemList = {}, maxQuantity = {}, scanThreadId = nil }



-- ============================================================================
-- Module Functions
-- ============================================================================

function GroupSearch.OnInitialize()
	-- initialize thread
	private.scanThreadId = TSMAPI_FOUR.Thread.New("GROUP_SEARCH", private.ScanThread)
end

function GroupSearch.GetScanContext()
	return private.scanThreadId, private.MarketValueFunction
end



-- ============================================================================
-- Scan Thread
-- ============================================================================

function private.ScanThread(auctionScan, groupList)
	auctionScan:SetCustomFilterFunc(private.ScanFilter)

	-- create the list of items, and add filters for them
	wipe(private.itemList)
	wipe(private.maxQuantity)
	for _, groupPath in ipairs(groupList) do
		private.groups[groupPath] = true
		local _, operation = TSMAPI.Operations:GetFirstByGroup(groupPath, "Shopping")
		if operation then
			for _, itemString in TSMAPI_FOUR.Groups.ItemIterator(groupPath) do
				local isValid, err = TSMAPI_FOUR.CustomPrice.Validate(operation.maxPrice)
				if operation.restockQuantity > 0 then
					-- include mail and bags
					local numHave = TSMAPI_FOUR.Inventory.GetBagQuantity(itemString) + TSMAPI_FOUR.Inventory.GetMailQuantity(itemString)
					if operation.restockSources.bank then
						numHave = numHave + TSMAPI_FOUR.Inventory.GetBankQuantity(itemString) + TSMAPI_FOUR.Inventory.GetReagentBankQuantity(itemString)
					end
					if operation.restockSources.guild then
						numHave = numHave + TSMAPI_FOUR.Inventory.GetGuildQuantity(itemString)
					end
					local _, numAlts, numAuctions = TSMAPI_FOUR.Inventory.GetPlayerTotals(itemString)
					if operation.restockSources.alts then
						numHave = numHave + numAlts
					end
					if operation.restockSources.auctions then
						numHave = numHave + numAuctions
					end
					if numHave >= operation.restockQuantity then
						isValid = false
					else
						private.maxQuantity[itemString] = operation.restockQuantity - numHave
					end
				end
				if isValid then
					tinsert(private.itemList, itemString)
				elseif err then
					TSM:Printf(L["Invalid custom price source for %s. %s"], TSMAPI_FOUR.Item.GetLink(itemString), err)
				end
			end
		end
	end
	if #private.itemList == 0 then
		return false
	end
	auctionScan:AddItemListFiltersThreaded(private.itemList, private.maxQuantity)

	-- run the scan
	auctionScan:StartScanThreaded()
	return true
end

function private.ScanFilter(row)
	local itemBuyout = row:GetField("itemBuyout")
	if itemBuyout == 0 then
		return true
	end

	local itemString = row:GetField("itemString")
	local groupPath = TSMAPI_FOUR.Groups.GetPathByItem(itemString)
	if not groupPath or not private.groups[groupPath] then
		return true
	end

	local operation = TSM.Operations.GetFirstOptionsByItem("Shopping", itemString)
	if not operation then
		return true
	end

	if operation.evenStacks and row:GetField("stackSize") % 5 ~= 0 then
		return true
	end

	if not operation.showAboveMaxPrice then
		local maxPrice = TSMAPI_FOUR.CustomPrice.GetValue(operation.maxPrice, itemString)
		if not maxPrice or itemBuyout > maxPrice then
			return true
		end
	end

	return false
end

function private.MarketValueFunction(row)
	local itemString = row:GetField("itemString")
	local operation = TSM.Operations.GetFirstOptionsByItem("Shopping", itemString)
	if not operation then
		return
	end
	return TSMAPI_FOUR.CustomPrice.GetValue(operation.maxPrice, itemString)
end
