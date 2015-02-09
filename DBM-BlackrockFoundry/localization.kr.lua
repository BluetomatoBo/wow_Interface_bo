﻿if GetLocale() ~= "koKR" then return end
local L

---------------
-- Gruul --
---------------
L= DBM:GetModLocalization(1161)

---------------------------
-- Oregorger, The Devourer --
---------------------------
L= DBM:GetModLocalization(1202)

---------------------------
-- The Blast Furnace --
---------------------------
L= DBM:GetModLocalization(1154)

------------------
-- Hans'gar And Franzok --
------------------
L= DBM:GetModLocalization(1155)

--------------
-- Flamebender Ka'graz --
--------------
L= DBM:GetModLocalization(1123)

L:SetMiscLocalization({
	TorrentYell	= "녹아내린 격류 %d초 후 사라짐!"
})

--------------------
--Kromog, Legend of the Mountain --
--------------------
L= DBM:GetModLocalization(1162)

--------------------------
-- Beastlord Darmac --
--------------------------
L= DBM:GetModLocalization(1122)

--------------------------
-- Operator Thogar --
--------------------------
L= DBM:GetModLocalization(1147)

L:SetMiscLocalization({
	Train			= "기차",
	lane			= "선로",
	oneTrain		= "무작위 선로 1곳: 열차",
	oneRandom		= "무작위 선로 1곳 등장",
	threeTrains		= "무작위 선로 3곳: 열차",
	threeRandom		= "무작위 선로 3곳 등장",
	helperMessage	= "이 전투는 'Thogar Assist' 애드온 또는 DBM 음성안내로 더 좋은 안내를 받으실 수 있습니다. 해당 애드온들은 Curse에서 다운로드 가능합니다."
})

--------------------------
-- The Iron Maidens --
--------------------------
L= DBM:GetModLocalization(1203)

L:SetMiscLocalization({
	shipMessage		= "주 대포를 쏠 준비를 합니다!"
})

--------------------------
-- Blackhand --
--------------------------
L= DBM:GetModLocalization(959)

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("BlackrockFoundryTrash")

L:SetGeneralLocalization({
	name =	"검은바위 용광로: 일반구간"
})
