----------------------------------------------------------------------------------------------------
-- Addon media
--

--get the engine
local AddOnName,Engine = ...;

--get the lib
local LSM = LibStub("LibSharedMedia-3.0");

--add cecile font to shared media
LSM:Register("font", "Cecile", [[Interface\AddOns\]] .. AddOnName .. [[\media\fonts\OpenSans-CondBold.ttf]], 
	LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_western);