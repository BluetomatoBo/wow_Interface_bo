function ItemLevel_AddInfo(tooltip, link)
	if tooltip and link then
		local found, _, id = string.find(link, "item:(%d+)%:%d+%:%d+%:%d+");
		if found then
			local name, link, rarity, level, requiredlevel, class, subclass, stacksize, inventorytype, icon = GetItemInfo(id);
			
			if name then
				tooltip:AddLine("ItemLevel: ".. level);
				tooltip:Show();
			end
		end
	end
end

function ItemLevel_SetBagItem(tooltip, bag, itemslot)
	local hasCooldown, repairCost = tooltip:ItemLevel_SetBagItem(bag, itemslot);
	local link = GetContainerItemLink(bag, itemslot);

	ItemLevel_AddInfo(tooltip, link);

	return hasCooldown, repairCost;
end

function ItemLevel_SetHyperlink(tooltip, link)
	tooltip:ItemLevel_SetHyperlink(link);

	ItemLevel_AddInfo(tooltip, link);
end

function ItemLevel_SetInventoryItem(tooltip, unit, slot)
	local hasItem, hasCooldown, repairCost = tooltip:ItemLevel_SetInventoryItem(unit, slot);
	local link = GetInventoryItemLink(unit, slot);
	
	ItemLevel_AddInfo(tooltip, link);

	return hasItem, hasCooldown, repairCost; 
end

function ItemLevel_SetAuctionItem(tooltip, type, index)
	tooltip:ItemLevel_SetAuctionItem(type, index);
	local link = GetAuctionItemLink(type, index);
	ItemLevel_AddInfo(tooltip, link);	
	
end

function ItemLevel_SetLootItem(tooltip, slot)
	tooltip:ItemLevel_SetLootItem(slot);
	local link = GetLootSlotLink(slot);
	ItemLevel_AddInfo(tooltip, link);
end

function ItemLevel_SetMerchantItem(tooltip, index)
	tooltip:ItemLevel_SetMerchantItem(index);
	local link = GetMerchantItemLink(index);
	ItemLevel_AddInfo(tooltip, link);	
end

ItemRefTooltip.ItemLevel_SetHyperlink = ItemRefTooltip.SetHyperlink;
ItemRefTooltip.SetHyperlink = ItemLevel_SetHyperlink;

GameTooltip.ItemLevel_SetHyperlink = GameTooltip.SetHyperlink;
GameTooltip.SetHyperlink = ItemLevel_SetHyperlink;

GameTooltip.ItemLevel_SetBagItem = GameTooltip.SetBagItem;
GameTooltip.SetBagItem = ItemLevel_SetBagItem;
	
GameTooltip.ItemLevel_SetInventoryItem = GameTooltip.SetInventoryItem;
GameTooltip.SetInventoryItem = ItemLevel_SetInventoryItem;

GameTooltip.ItemLevel_SetAuctionItem = GameTooltip.SetAuctionItem;
GameTooltip.SetAuctionItem = ItemLevel_SetAuctionItem;

GameTooltip.ItemLevel_SetLootItem = GameTooltip.SetLootItem;
GameTooltip.SetLootItem = ItemLevel_SetLootItem;

GameTooltip.ItemLevel_SetMerchantItem = GameTooltip.SetMerchantItem;
GameTooltip.SetMerchantItem = ItemLevel_SetMerchantItem;