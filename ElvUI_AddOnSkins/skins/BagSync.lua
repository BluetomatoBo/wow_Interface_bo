local AS = ElvUI[1]:GetModule('AddOnSkins')

local name = 'BagSyncSkin'
function AS:SkinBagSync()
	BagSync_SearchFrame:SetTemplate("Transparent")

	AS:SkinEditBox(BagSync_SearchFrameEdit1)

	for i = 1, BagSync_SearchFrame:GetNumChildren() do
		local object = select(i, BagSync_SearchFrame:GetChildren())
		if object:GetObjectType() == 'Button' then
			AS:SkinCloseButton(object, true)
		end
	end
end

AS:RegisterSkin(name, AS.SkinBagSync)