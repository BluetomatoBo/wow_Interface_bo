-- Author      : danina  Thrall-EU
-- Create Date : 40/05/2010 1:12:06 PM
-- RamUsage    : 2,3 kb

if (GetLocale() == "deDE") then
    NixZuReppen = "AutoRepair: Nix zu reparieren !";
    KannNichtreppen = "AutoRepair: Händler kann nicht reparieren !";
    Repariert	= "AutoRepair: Alle Items repariert. Kosten";
else
    -- for the rest, usually english since it's the default language
    NixZuReppen = "AutoRepair: Nothing to repair !";
    KannNichtreppen = "AutoRepair: Vendor can not repair !";
    Repariert	= "AutoRepair: All items repaired. Cost";
end


function AutoRepair_OnLoad()
	AutoRepair:RegisterEvent("MERCHANT_SHOW"); 
	--this:RegisterEvent("MERCHANT_CLOSED");
end

function AutoRepair_OnEvent(self, event, ...)
	if (event == "MERCHANT_SHOW") then
		if (CanMerchantRepair()) then
			local repairAllCost, canRepair = GetRepairAllCost()
			if (canRepair) then
				RepairAllItems(1);
				RepairAllItems();
												--Fuckin floor
												--12889											--12g 88s 99c
			Goldcost	= floor(repairAllCost / 10000)				--12
			Rest_One	= repairAllCost - (Goldcost*10000)			--8899
			SilverCost	= floor(Rest_One / 100)					--88
			CopperCost	= Rest_One - (SilverCost*100)				--99
				DEFAULT_CHAT_FRAME:AddMessage(Repariert..": "..Goldcost.."g "..SilverCost.."s "..CopperCost.."c !");
			--else
			--	DEFAULT_CHAT_FRAME:AddMessage(NixZuReppen);
			end
		--else
		--	DEFAULT_CHAT_FRAME:AddMessage(KannNichtreppen);
		end	
	end
end