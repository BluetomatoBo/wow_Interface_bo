-- Mini Dragon(projecteurs@gmail.com)
-- 夏一可
-- Blizzard Entertainment
-- Last update: 2018/05/12

if GetLocale() ~= "zhCN" then return end
local L

---------------------------
-- Taloc the Corrupted --
---------------------------
L= DBM:GetModLocalization(2168)

L:SetMiscLocalization({
	Aggro	 =	"有仇恨"
})

---------------------------
-- MOTHER --
---------------------------
L= DBM:GetModLocalization(2167)

---------------------------
-- Fetid Devourer --
---------------------------
L= DBM:GetModLocalization(2146)

---------------------------
-- Zek'vhozj --
---------------------------
L= DBM:GetModLocalization(2169)

L:SetMiscLocalization({
	CThunDisc	 =	"Disc accessed. C'thun data loading.",
	YoggDisc	 =	"Disc accessed. Yogg-Saron data loading.",
	CorruptedDisc =	"Disc accessed. Corrupted data loading."
})

---------------------------
-- Vectis --
---------------------------
L= DBM:GetModLocalization(2166)

L:SetOptionLocalization({
	ShowHighestFirst	 =	"将信息窗中持续感染的层数从高往低显示(默认从低到高)"
})

---------------
-- Mythrax the Unraveler --
---------------
L= DBM:GetModLocalization(2194)

---------------------------
-- Zul --
---------------------------
L= DBM:GetModLocalization(2195)

L:SetTimerLocalization({
	timerAddIncoming		= DBM_INCOMING
})

L:SetOptionLocalization({
	timerAddIncoming		= "计时条：当小怪可以进攻时"
})

------------------
-- G'huun --
------------------
L= DBM:GetModLocalization(2147)

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("UldirTrash")

L:SetGeneralLocalization({
	name =	"奥迪尔小怪"
})
