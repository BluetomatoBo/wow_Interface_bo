-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Warehousing = TSM.Operations:NewPackage("Warehousing")
local private = {}
local L = TSM.L
local OPERATION_INFO = {
	moveQtyEnabled = { type = "boolean", default = false },
	moveQuantity = { type = "number", default = 1 },
	keepBagQtyEnabled = { type = "boolean", default = false },
	keepBagQuantity = { type = "number", default = 1 },
	keepBankQtyEnabled = { type = "boolean", default = false },
	keepBankQuantity = { type = "number", default = 1 },
	restockQtyEnabled = { type = "boolean", default = false },
	restockQuantity = { type = "number", default = 1 },
	stackSize = { type = "number", default = 5 },
	stackSizeEnabled = { type = "boolean", default = false },
	restockKeepBankQtyEnabled = { type = "boolean", default = false },
	restockKeepBankQuantity = { type = "number", default = 1 },
	restockStackSizeEnabled = { type = "boolean", default = false },
	restockStackSize = { type = "number", default = 5 },
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Warehousing.OnInitialize()
	TSM.Operations.Register("Warehousing", OPERATION_INFO, 12, private.GetOperationInfo)
end



-- ============================================================================
-- Private Helper Functions
-- ============================================================================

function private.GetOperationInfo(operationSettings)
	if (operationSettings.keepBagQtyEnabled or operationSettings.keepBankQtyEnabled) and not operationSettings.moveQtyEnabled then
		if operationSettings.keepBagQtyEnabled then
			if operationSettings.keepBankQtyEnabled then
				if operationSettings.restockQtyEnabled then
					return format(L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."], operationSettings.keepBagQuantity, operationSettings.keepBankQuantity, operationSettings.restockQuantity)
				else
					return format(L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."], operationSettings.keepBagQuantity, operationSettings.keepBankQuantity)
				end
			else
				if operationSettings.restockQtyEnabled then
					return format(L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."], operationSettings.keepBagQuantity, operationSettings.restockQuantity)
				else
					return format(L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."], operationSettings.keepBagQuantity)
				end
			end
		else
			if operationSettings.restockQtyEnabled then
				return format(L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."], operationSettings.keepBankQuantity, operationSettings.restockQuantity)
			else
				return format(L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."], operationSettings.keepBankQuantity)
			end
		end
	elseif (operationSettings.keepBagQtyEnabled or operationSettings.keepBankQtyEnabled) and operationSettings.moveQtyEnabled then
		if operationSettings.keepBagQtyEnabled then
			if operationSettings.keepBankQtyEnabled then
				if operationSettings.restockQtyEnabled then
					return format(L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."], operationSettings.moveQuantity, operationSettings.keepBagQuantity, operationSettings.keepBankQuantity, operationSettings.restockQuantity)
				else
					return format(L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."], operationSettings.moveQuantity, operationSettings.keepBagQuantity, operationSettings.keepBankQuantity)
				end
			else
				if operationSettings.restockQtyEnabled then
					return format(L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."], operationSettings.keepBankQuantity, operationSettings.restockQuantity)
				else
					return format(L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."], operationSettings.keepBankQuantity)
				end
			end
		else
			if operationSettings.restockQtyEnabled then
				return format(L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."], operationSettings.moveQuantity, operationSettings.keepBankQuantity, operationSettings.restockQuantity)
			else
				return format(L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."], operationSettings.moveQuantity, operationSettings.keepBankQuantity)
			end
		end
	elseif operationSettings.moveQtyEnabled then
		if operationSettings.restockQtyEnabled then
			return format(L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."], operationSettings.moveQuantity, operationSettings.restockQuantity)
		else
			return format(L["Warehousing will move a max of %d of each item in this group."], operationSettings.moveQuantity)
		end
	else
		if operationSettings.restockQtyEnabled then
			return format(L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."], operationSettings.restockQuantity)
		else
			return L["Warehousing will move all of the items in this group."]
		end
	end
end
