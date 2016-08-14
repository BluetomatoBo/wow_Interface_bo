----------------------------------------------------------------------------------------------------
-- BigWigs module, to enable encounter records
--

--if BigWigs its not present, dont use this module
if not IsAddOnLoaded( "BigWigs" )  then return; end

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("bigwigs");

--debug
local debug = Engine.AddOn:GetModule("debug");

--get locale
local L = Engine.Locale;

--get kill callbacs from BigWigs
function mod.bwCallback(event, bwModule)

	debug("bwCallback: %s %s", event, bwModule.displayName);

	mod.encounters:recordEncounter(bwModule.displayName);

end

--initialize module
function mod:OnInitialize()

	--store the encounters module
	mod.encounters = Engine.AddOn:GetModule("encounters");

	--if we don't have a boss mod
	if (not mod.encounters.hasBossMod) then

		--now we have it
		mod.encounters.hasBossMod = true;

		-- register BigWigs callbacks
		_G.BigWigsLoader.RegisterMessage(mod, "BigWigs_OnBossWin", mod.bwCallback);
		debug("BigWigs message listener registered");

	end

	debug("BigWigs module loaded");
end