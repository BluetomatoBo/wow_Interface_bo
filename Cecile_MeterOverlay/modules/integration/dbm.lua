----------------------------------------------------------------------------------------------------
-- DBM module, to enable encounter records
--

--if DBM its not present, dont use this module
if not IsAddOnLoaded( "DBM-Core" )  then return; end

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("dbm");

--debug
local debug = Engine.AddOn:GetModule("debug");

--get locale
local L = Engine.Locale;

--get kill callbacs from DBM
function mod.dbmCallback(event, dbmModule)

	debug("dbmCallback: %s %s", event, dbmModule.combatInfo.name);

	mod.encounters:recordEncounter(dbmModule.combatInfo.name);

end

--initialize module
function mod:OnInitialize()

	--store the encounters module
	mod.encounters = Engine.AddOn:GetModule("encounters");

	--if we don't have a boss mod
	if (not mod.encounters.hasBossMod) then

		--now we have it
		mod.encounters.hasBossMod = true;

		-- register DBM callbacks
		_G.DBM:RegisterCallback("kill", mod.dbmCallback);
		debug("DBM callback registered");

	end


	debug("DBM module loaded");
end