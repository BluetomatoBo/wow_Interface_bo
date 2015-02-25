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

L:SetWarningLocalization({
	warnRegulators		= "열기 조절 장치 남음: %d",
	warnBlastFrequency	= "폭파 시전 빈도 증가됨: 약 %d초 마다 시전"
})

L:SetOptionLocalization({
	warnRegulators		= "열기 조절 장치 남은숫자 알림 보기",
	warnBlastFrequency	= "$spell:155209 시전 빈도 증가시 알림 보기",
	VFYellType			= "변덕스러운 불 대화 알림 방식 선택(신화 난이도)",
	Countdown			= "남은시간 초세기",
	Apply				= "받을때만 알리기"
})

L:SetMiscLocalization({
	heatRegulator		= "열기 조절 장치"
})

------------------
-- Hans'gar And Franzok --
------------------
L= DBM:GetModLocalization(1155)

L:SetTimerLocalization({
	timerStamperDodge			= DBM_CORE_AUTO_TIMER_TEXTS.nextcount:format("압축기 회피")
})

L:SetOptionLocalization({
	timerStamperDodge			= "다음 압축기 회피 바 보기"
})

--------------
-- Flamebender Ka'graz --
--------------
L= DBM:GetModLocalization(1123)

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

L:SetWarningLocalization({
	specWarnSplitSoon	= "10초 안에 공격대 상하로 분리하세요!"
})

L:SetOptionLocalization({
	specWarnSplitSoon	= "공격대 분리 10초 전에 특수 경고 보기"
})

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

L:SetWarningLocalization({
	specWarnReturnBase	= "지금 본진으로 복귀!"
})

L:SetOptionLocalization({
	specWarnReturnBase	= "무쌍호에서 안전하게 본진으로 복귀할 수 있을때 특수 경고 보기"
})

L:SetMiscLocalization({
	shipMessage			= "주 대포를 쏠 준비를 합니다!"
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
