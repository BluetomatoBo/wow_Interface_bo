-- _NPCScan.Overlay.Broker  by Darkclaw of Hyjal
-- $Revision: 11 $
-- $Date: 2011-02-01 02:15:54 +0000 (Tue, 01 Feb 2011) $

LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("_NPCScan.Overlay.Broker", {
	type = "launcher",
	text = "_NPCScan.Overlay.Broker",
	icon = "Interface\\AddOns\\_NPCScan.Overlay.Broker\\icon",
	OnClick = function(_, msg)
		if msg == "LeftButton" then
			-- for LeftButton, toggle the module Enabled or Disabled
			if( IsControlKeyDown() ) then
				-- if Control Key down, toggle stuff on Main World Map
				if ( _NPCScan.Overlay.Options.Modules[ "WorldMap" ] ) then
					_NPCScan.Overlay.Modules.Disable( "WorldMap" );
					ChatFrame1:AddMessage( "_NPCScan.Overlay - World Map ".."|cffeda55f" .. "Disabled".."|r" );
				else
					_NPCScan.Overlay.Modules.Enable( "WorldMap" );
					ChatFrame1:AddMessage( "_NPCScan.Overlay - World Map ".."|cffeda55f" .. "Enabled".."|r" );
				end
			else
				-- else toggle Stuff Mini Map
				if ( _NPCScan.Overlay.Options.Modules[ "Minimap" ] ) then
					_NPCScan.Overlay.Modules.Disable( "Minimap" );
					ChatFrame1:AddMessage( "_NPCScan.Overlay - Mini Map ".."|cffeda55f" .. "Disabled".."|r" );
				else
					_NPCScan.Overlay.Modules.Enable( "Minimap" );
					ChatFrame1:AddMessage( "_NPCScan.Overlay - Mini Map ".."|cffeda55f" .. "Enabled".."|r" );
				end
			end
		elseif msg == "RightButton" then
			InterfaceOptionsFrame_OpenToCategory( _NPCScan.Overlay.Config );
		elseif msg == "MiddleButton" then
				if ( _NPCScan.Overlay.Options.Modules[ "Minimap" ] ) then
					_NPCScan.Overlay.Modules.Disable( "Minimap" );
					_NPCScan.Overlay.Modules.Disable( "WorldMap" );					
					ChatFrame1:AddMessage( "_NPCScan.Overlay - Mini Map and World Map ".."|cffeda55f" .. "Disabled".."|r" );
				else
					_NPCScan.Overlay.Modules.Enable( "Minimap" );
					_NPCScan.Overlay.Modules.Enable( "WorldMap" );
					ChatFrame1:AddMessage( "_NPCScan.Overlay - Mini Map and World Map ".."|cffeda55f" .. "Enabled".."|r" );
				end			
		end
	end,
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		tooltip:AddLine("|cffffee00 _NPCScan.Overlay.Broker |r")
		tooltip:AddLine("|cffd6ff00 Click: |r Toggles display of |cffffee00_NPCScan.Overlay's|r Mini Map layer")
		tooltip:AddLine("|cffd6ff00 CONTROL-Click: |r Toggle display of |cffffee00_NPCScan.Overlay's|r World Map layer")
		tooltip:AddLine("|cffaaf200 Middle-Click: |r Toggle display of Both |cffffee00_NPCScan.Overlay's|r Mini & World Map layers")	
		tooltip:AddLine("|cff6cff00 Right-Click: |r Open |cffffee00_NPCScan.Overlay's|r Configuration Options")
	end,
})
