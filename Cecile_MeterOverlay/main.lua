----------------------------------------------------------------------------------------------------
-- Main file, create the main addon
--

--create the addon and store in the engine
local AddOnName, Engine = ...;
local AddOn = LibStub(	"AceAddon-3.0"):NewAddon(AddOnName, 
						"AceEvent-3.0", 'AceTimer-3.0', 'AceHook-3.0',"AceComm-3.0");
Engine.Name  = AddOnName;
Engine.AddOn = AddOn;

--store locale in the engine
local L = LibStub("AceLocale-3.0"):GetLocale(Engine.Name);
Engine.Locale = L;

--store the engine global
_G[AddOnName] = Engine;

--register entering the world
function AddOn:OnEnable()
	 self:RegisterEvent("PLAYER_ENTERING_WORLD");
end

--on entering the world we show the load message, including version and slash commands
function AddOn:PLAYER_ENTERING_WORLD()

	--get version
	local Version = AddOn:GetModule("version");
	
	print(string.format(L["LOAD_MESSAGE"],Version.Title,Version.Label,Engine.slash1,Engine.slash2));
	
	self:UnregisterEvent("PLAYER_ENTERING_WORLD");
end

--init the addon
function AddOn:OnInitialize()
	
	--setup options
	AddOn:SetupOptions();
	
end
