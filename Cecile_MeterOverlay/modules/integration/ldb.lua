----------------------------------------------------------------------------------------------------
-- LDB module, to display datatex in usign LDB
--

--if Tukui its present, dont use this module
if IsAddOnLoaded( "Tukui" )  then return; end

--if ElvUI its present, dont use this module
if IsAddOnLoaded( "ElvUI" )  then return; end

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("LDB");

--debug
local debug = Engine.AddOn:GetModule("debug");

--get locale
local L = Engine.Locale;

--get LDB library
local ldb = LibStub:GetLibrary("LibDataBroker-1.1")

--initialize module registering in Tukui the datatext
function mod:OnInitialize()	
	
	--store our generic datatext module
	mod.datatext = Engine.AddOn:GetModule("datatext");	
	
	--register the LDB object
	mod.dataobj = ldb:NewDataObject(L["CONFIG_NAME"], {
			type = "data source", 
			text = "",
			OnTooltipShow = function (tooltip)

				--get text from generic module
				mod.datatext:OnEnter(self,tooltip);
				
				--if we need to add the tip to the overlay
				if (Engine.Profile.overlay.tip) then
					tooltip:AddLine(" ");
					tooltip:AddLine(L["TIP_LOCK"]);
				end


			end,
			OnClick = function (self, button)

				if button=="LeftButton" then
					mod.datatext.meter:toggle();
				elseif button=="RightButton" then
					Engine.AddOn:ShowConfig();
				end				

			end,
		})

	--if we have been registered correctly
	if mod.dataobj then
		--frame to get updates
		local f = CreateFrame("frame")

		f:SetScript("OnUpdate", mod.OnUpdate)

		debug("LDB DataText registered");	
	end
	
end

--updata the datatext using our generic module
function mod.OnUpdate(self, t)	

	--get the value updated
	mod.datatext:UpdateTextValue();

	--display the value
	mod.dataobj.text = mod.datatext.lastValue
	
end

