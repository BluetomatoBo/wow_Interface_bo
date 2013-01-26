local __FILE__=tostring(debugstack(1,2,0):match("(.*):1:")) -- MUST BE LINE 1
local MAJOR_VERSION = ("AlarShared-3.0.localization")
local MINOR_VERSION = 500 + tonumber(string.sub("$Revision: 48 $", 12, -3))
local lib,old=LibStub:NewLibrary(MAJOR_VERSION,MINOR_VERSION)
if not lib then return end
local me, ns = ...
--[===[@debug@
print("Loading",__FILE__," inside ",me)
--@end-debug@]===]
local l=LibStub("AceLocale-3.0")
local function getLocale(lang,default)
	local me="AlarShared"
	local L=l:GetLocale(me,lang)
	if (L) then
		L=l:NewLocale(me)
	else
		L=l:NewLocale(me,lang,default,default)
	end
	return L
end
local L=getLocale("enUS",true)
L["Description"] = true
L["DoublecClick to shrink"] = true
L["Drag to move"] = true
L["Libraries"] = true
L["Release Notes"] = true
L["RightClick to rescale"] = true
L["Toggles"] = true

L=getLocale("frFR")
if (L) then
L["Description"] = "Description" -- Requires localization
L["DoublecClick to shrink"] = "DoublecClick to shrink" -- Requires localization
L["Drag to move"] = "Drag to move" -- Requires localization
L["Libraries"] = "Libraries" -- Requires localization
L["Release Notes"] = "Release Notes" -- Requires localization
L["RightClick to rescale"] = "RightClick to rescale" -- Requires localization
L["Toggles"] = "Toggles" -- Requires localization

end
L=getLocale("deDE")
if (L) then
L["Description"] = "Description" -- Requires localization
L["DoublecClick to shrink"] = "DoublecClick to shrink" -- Requires localization
L["Drag to move"] = "Drag to move" -- Requires localization
L["Libraries"] = "Libraries" -- Requires localization
L["Release Notes"] = "Release Notes" -- Requires localization
L["RightClick to rescale"] = "RightClick to rescale" -- Requires localization
L["Toggles"] = "Toggles" -- Requires localization

end
L=getLocale("koKR")
if (L) then
L["Description"] = "Description" -- Requires localization
L["DoublecClick to shrink"] = "DoublecClick to shrink" -- Requires localization
L["Drag to move"] = "Drag to move" -- Requires localization
L["Libraries"] = "Libraries" -- Requires localization
L["Release Notes"] = "Release Notes" -- Requires localization
L["RightClick to rescale"] = "RightClick to rescale" -- Requires localization
L["Toggles"] = "Toggles" -- Requires localization

end
L=getLocale("esMX")
if (L) then
L["Description"] = "Description" -- Requires localization
L["DoublecClick to shrink"] = "DoublecClick to shrink" -- Requires localization
L["Drag to move"] = "Drag to move" -- Requires localization
L["Libraries"] = "Libraries" -- Requires localization
L["Release Notes"] = "Release Notes" -- Requires localization
L["RightClick to rescale"] = "RightClick to rescale" -- Requires localization
L["Toggles"] = "Toggles" -- Requires localization

end
L=getLocale("ruRU")
if (L) then
L["Description"] = "Description" -- Requires localization
L["DoublecClick to shrink"] = "DoublecClick to shrink" -- Requires localization
L["Drag to move"] = "Drag to move" -- Requires localization
L["Libraries"] = "Libraries" -- Requires localization
L["Release Notes"] = "Release Notes" -- Requires localization
L["RightClick to rescale"] = "RightClick to rescale" -- Requires localization
L["Toggles"] = "Toggles" -- Requires localization

end
L=getLocale("zhCN")
if (L) then
L["Description"] = "Description" -- Requires localization
L["DoublecClick to shrink"] = "DoublecClick to shrink" -- Requires localization
L["Drag to move"] = "Drag to move" -- Requires localization
L["Libraries"] = "Libraries" -- Requires localization
L["Release Notes"] = "Release Notes" -- Requires localization
L["RightClick to rescale"] = "RightClick to rescale" -- Requires localization
L["Toggles"] = "Toggles" -- Requires localization

end
L=getLocale("esES")
if (L) then
L["Description"] = "Description" -- Requires localization
L["DoublecClick to shrink"] = "DoublecClick to shrink" -- Requires localization
L["Drag to move"] = "Drag to move" -- Requires localization
L["Libraries"] = "Libraries" -- Requires localization
L["Release Notes"] = "Release Notes" -- Requires localization
L["RightClick to rescale"] = "RightClick to rescale" -- Requires localization
L["Toggles"] = "Toggles" -- Requires localization

end
L=getLocale("zhTW")
if (L) then
L["Description"] = "Description" -- Requires localization
L["DoublecClick to shrink"] = "DoublecClick to shrink" -- Requires localization
L["Drag to move"] = "Drag to move" -- Requires localization
L["Libraries"] = "Libraries" -- Requires localization
L["Release Notes"] = "Release Notes" -- Requires localization
L["RightClick to rescale"] = "RightClick to rescale" -- Requires localization
L["Toggles"] = "Toggles" -- Requires localization

end