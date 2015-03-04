--[[
	item.lua
		A guild item slot button
--]]

local ItemSlot = Bagnon:NewClass('GuildItemSlot', 'Button', Bagnon.ItemSlot)
ItemSlot.nextID = 0
ItemSlot.unused = {}


--[[ Constructor ]]--

function ItemSlot:Create()
	local item = Bagnon.ItemSlot.Create(self)
	item:SetScript('OnReceiveDrag', self.OnReceiveDrag)
	item:SetScript('OnDragStart', self.OnDragStart)
	item:SetScript('OnClick', self.OnClick)
	item:RegisterForDrag('LeftButton')
	item:RegisterForClicks('anyUp')
	return item
end

function ItemSlot:Construct(id)
	return CreateFrame('Button', 'BagnonGuildItemSlot' .. id, nil, 'ContainerFrameItemButtonTemplate')
end

function ItemSlot:GetBlizzard()
end


--[[ Events ]]--

function ItemSlot:OnClick(button)
	if HandleModifiedItemClick(self:GetItem()) or self:IsCached() then
		return
	end

	if IsModifiedClick('SPLITSTACK') then
		if not self:IsLocked() then
			self.SplitStack = ItemSlot.SplitStack -- have no idea why is necessary
			OpenStackSplitFrame(select(2, self:GetInfo()), self, 'BOTTOMLEFT', 'TOPLEFT')
		end
		return
	end

	local type, money = GetCursorInfo()
	if type == 'money' then
		DepositGuildBankMoney(money)
		ClearCursor()
	elseif type == 'guildbankmoney' then
		DropCursorMoney()
		ClearCursor()
	elseif button == 'RightButton' then
		AutoStoreGuildBankItem(self:GetSlot())
	else
		PickupGuildBankItem(self:GetSlot())
	end
end

function ItemSlot:OnDragStart(button)
	if not self:IsCached() then
		PickupGuildBankItem(self:GetSlot())
	end
end

function ItemSlot:OnReceiveDrag(button)
	if not self:IsCached() then
		PickupGuildBankItem(self:GetSlot())
	end
end

function ItemSlot:OnEnter()
	if self:GetItem() then
 		self:AnchorTooltip()
		self:UpdateTooltip()
	end
end


--[[ Updaters ]]--

function ItemSlot:UpdateTooltip()
	if self:IsCached() then
		local dummySlot = self:GetDummySlot()
		dummySlot:SetParent(self)
		dummySlot:SetAllPoints(self)
		dummySlot:Show()
	else
		local pet = {GameTooltip:SetGuildBankItem(self:GetSlot())}
		if pet[1] and pet[1] > 0 then
			BattlePetToolTip_Show(unpack(pet))
		end

		GameTooltip:Show()
	end
end

function ItemSlot:SplitStack(split)
	local tab, slot = self:GetSlot()
	SplitGuildBankItem(tab, slot, split)
end

function ItemSlot:UpdateCooldown() end


--[[ Accessors ]]--

function ItemSlot:GetInfo()
	return Bagnon.Cache:GetItemInfo(self:GetPlayer(), 'guild' .. tostring(self:GetBag()), self:GetID())
end

function ItemSlot:GetSlot()
	return self:GetBag(), self:GetID()
end

function ItemSlot:GetBag()
	return GetCurrentGuildBankTab()
end

function ItemSlot:IsQuestItem() end
function ItemSlot:IsNew() end