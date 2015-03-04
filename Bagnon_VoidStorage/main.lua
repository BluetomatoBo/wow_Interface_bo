--[[
	main.lua
		The bagnon driver thingy
--]]

local Vault = Bagnon:NewModule('Vault', 'AceEvent-3.0')

function Vault:OnEnable()
	self:RegisterEvent('VOID_STORAGE_CLOSE')
	self:RegisterEvent('VOID_STORAGE_OPEN')
end

function Vault:VOID_STORAGE_OPEN()
	IsVoidStorageReady()
	Bagnon.Cache.AtVault = true
	Bagnon:ShowFrame('vault')
	
	if not CanUseVoidStorage() then
		if Bagnon.VAULT_COST > GetMoney() then
			StaticPopup_Show('BAGNON_CANNOT_PURCHASE_VAULT')
		else
			StaticPopup_Show('BAGNON_VAULT_PURCHASE')
		end
	end
end

function Vault:VOID_STORAGE_CLOSE()
	Bagnon.Cache.AtVault = nil
	Bagnon:HideFrame('vault')
end
