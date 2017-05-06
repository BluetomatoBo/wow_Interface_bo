--[[
	frame.lua
		A specialized version of the bagnon frame for void storage
--]]

local MODULE =  ...
local ADDON, Addon = MODULE:match('[^_]+'), _G[MODULE:match('[^_]+')]
local Frame = Addon:NewClass('VaultFrame', 'Frame', Addon.Frame)

Frame.Title = LibStub('AceLocale-3.0'):GetLocale(ADDON).TitleVault
Frame.ItemFrame = Addon.VaultItemFrame
Frame.MoneyFrame = Addon.TransferButton
Frame.Bags = {'vault'}

Frame.OpenSound = 'UI_EtherealWindow_Open'
Frame.CloseSound = 'UI_EtherealWindow_Close'
Frame.MoneySpacing = 30
Frame.BrokerSpacing = 2


--[[ Modifications ]]--

function Frame:New(id)
	local f = Addon.Frame.New(self, id)

	f.deposit = self.ItemFrame:New(f, {DEPOSIT}, DEPOSIT)
	f.deposit:SetPoint('TOPLEFT', 10, -50)
	f.deposit:Hide()

	f.withdraw = self.ItemFrame:New(f, {WITHDRAW}, WITHDRAW)
	f.withdraw:SetPoint('TOPLEFT', f.deposit, 'BOTTOMLEFT')
	f.withdraw:Hide()

	return f
end

function Frame:RegisterMessages()
	Addon.Frame.RegisterMessages(self)
	self:RegisterFrameMessage('TRANFER_TOGGLED', 'OnTransferToggled')
end

function Frame:OnHide()
	Addon.Frame.OnHide(self)
	CloseVoidStorageFrame()
end

function Frame:OnTransferToggled(_, transfering)
	self.deposit:SetShown(transfering)
	self.withdraw:SetShown(transfering)
	self.itemFrame:SetShown(not transfering)

	if transfering then
		StaticPopup_Show(ADDON .. 'COMFIRM_TRANSFER').data = self
	else
		StaticPopup_Hide(ADDON .. 'COMFIRM_TRANSFER')
	end
end


--[[ Properties ]]--

function Frame:GetItemInfo(bag, slot)
	local id, icon, locked = self:GetRawInfo(bag, slot)
	local link, quality
	if id then
		link, quality = select(2, GetItemInfo(id))
	end

	return icon, 1, locked and bag == 'vault', quality, nil, nil, link
end

function Frame:GetRawInfo(bag, slot)
	if bag == 'vault' then
		return Addon.Cache:GetItemInfo(self.player, bag, slot)
	else
		local get = bag == DEPOSIT and GetVoidTransferDepositInfo or GetVoidTransferWithdrawalInfo

		for i = 1,9 do
			if get(i) then
				slot = slot - 1
				if slot == 0 then
					return get(i)
				end
			end
		end
	end
end

function Frame:IsBagFrameShown() end
function Frame:HasSortButton() end
function Frame:HasBagToggle() end
function Frame:HasMoneyFrame()
	return true
end
