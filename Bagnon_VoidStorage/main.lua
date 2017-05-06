--[[
	main.lua
		The bagnon driver thingy
--]]

local MODULE =  ...
local ADDON, Addon = MODULE:match('[^_]+'), _G[MODULE:match('[^_]+')]
local Vault = Bagnon:NewModule('VoidStorage', Addon)

function Vault:OnEnable()
	self:RegisterEvent('VOID_STORAGE_CLOSE', 'OnClose')
end

function Vault:OnOpen()
	IsVoidStorageReady()
	Addon.Cache.AtVault = true
	Addon:ShowFrame('vault'):SetPlayer(nil)

	if not CanUseVoidStorage() then
		if Addon.VAULT_COST > GetMoney() then
			StaticPopup_Show(ADDON .. 'CANNOT_PURCHASE_VAULT')
		else
			StaticPopup_Show(ADDON .. 'VAULT_PURCHASE')
		end
	end
end

function Vault:OnClose()
	Addon.Cache.AtVault = nil
	Addon:HideFrame('vault')

	StaticPopup_Hide(ADDON .. 'CANNOT_PURCHASE_VAULT')
	StaticPopup_Hide(ADDON .. 'VAULT_PURCHASE')
end
