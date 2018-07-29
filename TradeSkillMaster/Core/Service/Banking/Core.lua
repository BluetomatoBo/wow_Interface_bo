-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Banking = TSM:NewPackage("Banking")
local L = TSM.L
local private = {
	moveThread = nil,
	moveItems = {},
	restoreItems = {},
	restoreFrame = nil,
	callback = nil,
	openFrame = nil,
	frameCallbacks = {},
}
local MOVE_WAIT_TIMEOUT = 2
local OPERATION_DEFAULTS = {
	moveQtyEnabled = nil,
	moveQuantity = 1,
	keepBagQtyEnabled = nil,
	keepBagQuantity = 1,
	keepBankQtyEnabled = nil,
	keepBankQuantity = 1,
	restockQtyEnabled = nil,
	restockQuantity = 1,
	stackSize = 5,
	stackSizeEnabled = nil,
	restockKeepBankQtyEnabled = nil,
	restockKeepBankQuantity = 1,
	restockStackSizeEnabled = nil,
	restockStackSize = 5,
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Banking.OnInitialize()
	TSM.Operations.Register("Warehousing", OPERATION_DEFAULTS, 12, private.GetOperationInfo)
	private.moveThread = TSMAPI_FOUR.Thread.New("BANKING_MOVE", private.MoveThread)

	TSMAPI_FOUR.Event.Register("BANKFRAME_OPENED", private.BankOpened)
	TSMAPI_FOUR.Event.Register("GUILDBANKFRAME_OPENED", private.GuildBankOpened)
	TSMAPI_FOUR.Event.Register("BANKFRAME_CLOSED", private.BankClosed)
	TSMAPI_FOUR.Event.Register("GUILDBANKFRAME_CLOSED", private.GuildBankClosed)
end

function Banking.RegisterFrameCallback(callback)
	tinsert(private.frameCallbacks, callback)
end

function Banking.IsGuildBankOpen()
	return private.openFrame == "GUILD_BANK"
end

function Banking.IsBankOpen()
	return private.openFrame == "BANK"
end

function Banking.MoveToBag(items, callback)
	assert(private.openFrame)
	local context = Banking.IsGuildBankOpen() and Banking.MoveContext.GetGuildBankToBag() or Banking.MoveContext.GetBankToBag()
	private.StartMove(items, context, callback)
end

function Banking.MoveToBank(items, callback)
	assert(private.openFrame)
	local context = Banking.IsGuildBankOpen() and Banking.MoveContext.GetBagToGuildBank() or Banking.MoveContext.GetBagToBank()
	private.StartMove(items, context, callback)
end

function Banking.EmptyBags(callback)
	assert(private.openFrame)
	local items = TSMAPI_FOUR.Util.AcquireTempTable()
	for _, _, _, itemString, quantity in Banking.Util.BagIterator(false) do
		items[itemString] = (items[itemString] or 0) + quantity
	end
	wipe(private.restoreItems)
	private.restoreFrame = private.openFrame
	private.callback = callback
	local context = Banking.IsGuildBankOpen() and Banking.MoveContext.GetBagToGuildBank() or Banking.MoveContext.GetBagToBank()
	private.StartMove(items, context, private.EmptyBagsThreadCallbackWrapper)
	TSMAPI_FOUR.Util.ReleaseTempTable(items)
end

function Banking.RestoreBags(callback)
	assert(private.openFrame)
	assert(Banking.CanRestoreBags())
	private.callback = callback
	local context = Banking.IsGuildBankOpen() and Banking.MoveContext.GetGuildBankToBag() or Banking.MoveContext.GetBankToBag()
	private.StartMove(private.restoreItems, context, private.RestoreBagsThreadCallbackWrapper)
end

function Banking.CanRestoreBags()
	assert(private.openFrame)
	return private.openFrame == private.restoreIsGuildBank
end

function Banking.PutByFilter(filterStr)
	if not private.openFrame then
		return
	end
	filterStr = TSMAPI_FOUR.Util.StrEscape(strlower(filterStr))

	local items = TSMAPI_FOUR.Util.AcquireTempTable()
	for _, _, _, itemString, quantity in Banking.Util.BagIterator(false) do
		items[itemString] = (items[itemString] or 0) + quantity
	end

	for itemString in pairs(items) do
		local name = strlower(TSMAPI_FOUR.Item.GetName(itemString) or "")
		if not strmatch(TSMAPI_FOUR.Item.ToBaseItemString(itemString), filterStr) and not strmatch(name, filterStr) then
			-- remove this item
			items[itemString] = nil
		end
	end

	Banking.MoveToBank(items, private.GetPutCallback)
	TSMAPI_FOUR.Util.ReleaseTempTable(items)
end

function Banking.GetByFilter(filterStr)
	if not private.openFrame then
		return
	end
	filterStr = TSMAPI_FOUR.Util.StrEscape(strlower(filterStr))

	local items = TSMAPI_FOUR.Util.AcquireTempTable()
	for _, _, _, itemString, quantity in Banking.Util.OpenBankIterator(false) do
		items[itemString] = (items[itemString] or 0) + quantity
	end

	for itemString in pairs(items) do
		local name = strlower(TSMAPI_FOUR.Item.GetName(itemString) or "")
		if not strmatch(TSMAPI_FOUR.Item.ToBaseItemString(itemString), filterStr) and not strmatch(name, filterStr) then
			-- remove this item
			items[itemString] = nil
		end
	end

	Banking.MoveToBag(items, private.GetPutCallback)
	TSMAPI_FOUR.Util.ReleaseTempTable(items)
end



-- ============================================================================
-- Threads
-- ============================================================================

function private.MoveThread(context, callback)
	local numMoves = 0
	local emptySlotIds = TSMAPI_FOUR.Thread.AcquireSafeTempTable()
	context:GetEmptySlotsThreaded(emptySlotIds)
	local slotIds = TSMAPI_FOUR.Thread.AcquireSafeTempTable()
	local slotItemString = TSMAPI_FOUR.Thread.AcquireSafeTempTable()
	local slotMoveQuantity = TSMAPI_FOUR.Thread.AcquireSafeTempTable()
	local slotEndQuantity = TSMAPI_FOUR.Thread.AcquireSafeTempTable()
	for itemString, numQueued in pairs(private.moveItems) do
		for _, slotId, quantity in context:SlotIdIterator(itemString) do
			if numQueued > 0 then
				-- find a suitable empty slot
				local targetSlotId = context:GetTargetSlotId(itemString, emptySlotIds)
				if targetSlotId then
					assert(not slotIds[slotId])
					slotIds[slotId] = targetSlotId
					slotItemString[slotId] = itemString
					slotMoveQuantity[slotId] = min(quantity, numQueued)
					slotEndQuantity[slotId] = max(quantity - numQueued, 0)
					numQueued = numQueued - slotMoveQuantity[slotId]
					numMoves = numMoves + 1
				else
					TSM:LOG_ERR("No target slot")
				end
			end
		end
		if numQueued > 0 then
			TSM:LOG_ERR("No slots with item (%s)", itemString)
		end
	end

	local numDone = 0
	while next(slotIds) do
		-- do all the pending moves
		for slotId, targetSlotId in pairs(slotIds) do
			context:MoveSlot(slotId, targetSlotId, slotMoveQuantity[slotId])
			TSMAPI_FOUR.Thread.Yield()
		end

		-- wait for at least one to finish or the timeout to elapse
		local didMove = false
		local timeout = GetTime() + MOVE_WAIT_TIMEOUT
		while not didMove and GetTime() < timeout do
			-- check which moves are done
			didMove = false
			for slotId in pairs(slotIds) do
				if context:GetSlotQuantity(slotId) <= slotEndQuantity[slotId] then
					didMove = true
					slotIds[slotId] = nil
					numDone = numDone + 1
					callback("MOVED", slotItemString[slotId], slotMoveQuantity[slotId])
				end
				TSMAPI_FOUR.Thread.Yield()
			end
			if didMove then
				callback("PROGRESS", numDone / numMoves)
			end
			TSMAPI_FOUR.Thread.Yield(true)
		end
	end

	TSMAPI_FOUR.Thread.ReleaseSafeTempTable(slotIds)
	TSMAPI_FOUR.Thread.ReleaseSafeTempTable(slotItemString)
	TSMAPI_FOUR.Thread.ReleaseSafeTempTable(slotMoveQuantity)
	TSMAPI_FOUR.Thread.ReleaseSafeTempTable(slotEndQuantity)
	TSMAPI_FOUR.Thread.ReleaseSafeTempTable(emptySlotIds)
	callback("DONE")
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

function private.BankOpened()
	assert(not private.openFrame)
	private.openFrame = "BANK"
	for _, callback in ipairs(private.frameCallbacks) do
		callback(private.openFrame)
	end
end

function private.GuildBankOpened()
	assert(not private.openFrame)
	private.openFrame = "GUILD_BANK"
	for _, callback in ipairs(private.frameCallbacks) do
		callback(private.openFrame)
	end
end

function private.BankClosed()
	if not private.openFrame then
		return
	end
	private.openFrame = nil
	private.StopMove()
	for _, callback in ipairs(private.frameCallbacks) do
		callback(private.openFrame)
	end
end

function private.GuildBankClosed()
	if not private.openFrame then
		return
	end
	private.openFrame = nil
	private.StopMove()
	for _, callback in ipairs(private.frameCallbacks) do
		callback(private.openFrame)
	end
end

function private.StartMove(items, context, callback)
	private.StopMove()
	wipe(private.moveItems)
	for itemString, quantity in pairs(items) do
		private.moveItems[itemString] = quantity
	end
	TSMAPI_FOUR.Thread.Start(private.moveThread, context, callback)
end

function private.StopMove()
	TSMAPI_FOUR.Thread.Kill(private.moveThread)
end

function private.EmptyBagsThreadCallbackWrapper(event, ...)
	if event == "MOVED" then
		local itemString, numMoved = ...
		private.restoreItems[itemString] = (private.restoreItems[itemString] or 0) + numMoved
	elseif event == "DONE" then
		if not next(private.restoreItems) then
			private.restoreFrame = private.openFrame
		end
	end
	private.callback(event, ...)
end

function private.RestoreBagsThreadCallbackWrapper(event, ...)
	if event == "DONE" then
		wipe(private.restoreItems)
		private.restoreFrame = nil
	end
	private.callback(event, ...)
end

function private.GetPutCallback(event)
	if event == "DONE" then
		TSM:Print(DONE)
	end
end
