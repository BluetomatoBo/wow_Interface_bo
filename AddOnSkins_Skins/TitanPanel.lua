﻿local AS = unpack(AddOnSkins)

if not AS:CheckAddOn('Titan') then return end

local name = 'TitanPanelSkin'
function AS:SkinTitanPanel()
	AS:SkinFrame(Titan_Bar__Display_Bar, 'Default')
	AS:SkinFrame(Titan_Bar__Display_Bar2, 'Default')
	AS:SkinFrame(Titan_Bar__Display_AuxBar, 'Default')
	AS:SkinFrame(Titan_Bar__Display_AuxBar2, 'Default')
end

AS:RegisterSkin(name, AS.SkinTitanPanel)