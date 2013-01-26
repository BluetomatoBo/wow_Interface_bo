
local STACKSIZE_TEXT = "Stack Size"
local ILEVEL_TEXT = "Item Level"

if GetLocale() == 'esES' then
	STACKSIZE_TEXT 	= "Tama\195\177o de la Pila"
	ILEVEL_TEXT 	= "Nivel del Objeto"
end

local name, link, quality, ilevel, reqlevel, itype, isubtype, maxstack, equipslot, texture

local function AddInfoToTooltip(tip, link)
	name, link, quality, ilevel, reqlevel, itype, isubtype, maxstack, equipslot, texture = GetItemInfo(link)
	if ilevel then
		tip:AddDoubleLine(ILEVEL_TEXT, tostring(ilevel), 0, .8, 1, .8, .8, .8)
		if maxstack and maxstack > 1 then
			tip:AddDoubleLine(STACKSIZE_TEXT, tostring(maxstack), 0, .8, 1, .8, .8, .8)
		end
		tip:Show()
	end
end


-- Tooltip hooking based on SellFish by Tuller.

local function IsBagSlot(slot)
	return slot >= 20 and slot <= 23 or slot >= 68
end

local hooks = {
	SetHyperlink = function(link)
		return link
	end,

	SetBagItem = function(bag, slot)
		if not MerchantFrame:IsVisible() then
			return GetContainerItemLink(bag, slot)
		end
	end,

	SetInventoryItem = function(unit, slot)
		return GetInventoryItemLink(unit, slot)
	end,

	SetLootItem = function(slot)
		if GetLootSlotType(slot) then
			return GetLootSlotType(slot)
		end
	end,

	SetLootRollItem = function(slot)
		return GetLootRollItemLink(slot)
	end,

	SetAuctionItem = function(type, index)
		return GetAuctionItemLink(type, index)
	end,

	SetAuctionSellItem = function()
		return select(2, GetItemInfo(GetAuctionSellItemInfo()))
	end,
--[[
	SetCraftItem = function(skill, id)
		return GetCraftReagentItemLink(skill, id)
	end,
]]--
	SetTradeSkillItem = function(skill, id)
		if id then
			return GetTradeSkillReagentItemLink(skill, id)
		end
		return GetTradeSkillItemLink(skill)
	end,

	SetQuestItem = function(type, index)
		return GetQuestItemLink(type, index)
	end,

	SetQuestLogItem = function(type, index)
		return GetQuestLogItemLink(type, index)
	end,

	SetTradePlayerItem = function(id)
		return GetTradePlayerItemLink(id)
	end,

	SetTradeTargetItem = function(id)
		return GetTradeTargetItemLink(id)
	end,

	SetInboxItem = function(id)
		return GetInboxItemLink(id)
	end,

	SetSendMailItem = function(id)
		return select(2, GetItemInfo(GetSendMailItem(id)))
	end,

	SetGuildBankItem = function(tab, slot)
		return GetGuildBankItemInfo(tab, slot)
	end,	
	
}

local function hookTip(tooltip, method, action)
	hooksecurefunc(tooltip, method, function(tip, ...)
		local link = action(...)
		if link then
			AddInfoToTooltip(tip, link)
		end
	end)
end

for method,func in pairs(hooks) do
	hookTip(GameTooltip, method, func)
end
hookTip(ItemRefTooltip, 'SetHyperlink', hooks.SetHyperlink)
