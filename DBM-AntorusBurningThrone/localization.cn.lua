-- Mini Dragon(projecteurs@gmail.com)
-- 夏一可
-- Blizzard Entertainment
-- Last update: 2017/12/07

if GetLocale() ~= "zhCN" then return end
local L

---------------------------
-- Garothi Worldbreaker --
---------------------------
L= DBM:GetModLocalization(1992)

L:SetTimerLocalization({
})

L:SetOptionLocalization({
})

L:SetMiscLocalization({
})

---------------------------
-- Hounds of Sargeras --
---------------------------
L= DBM:GetModLocalization(1987)

L:SetOptionLocalization({
	SequenceTimers =	"采用预判技能排序来检测boss下一个技能，而不是在线检测 (1-2秒 提前)"
})

---------------------------
-- War Council --
---------------------------
L= DBM:GetModLocalization(1997)

---------------------------
-- Eonar, the Lifebinder --
---------------------------
L= DBM:GetModLocalization(2025)

L:SetTimerLocalization({
	timerObfuscator		=	"下一个 邪能干扰器 (%s)",
	timerDestructor 	=	"下一个 注邪毁灭者 (%s)",
	timerPurifier 		=	"下一个 邪能净化者 (%s)"
})

L:SetMiscLocalization({
	Obfuscators =	"邪能干扰器", --需要T
	Destructors =	"注邪毁灭者", --减速
	Purifiers	=	"邪能净化者"
})

---------------------------
-- Portal Keeper Hasabel --
---------------------------
L= DBM:GetModLocalization(1985)

L:SetOptionLocalization({
	ShowAllPlatforms =	"忽略玩家的平台位置显示所有警告"
})

---------------------------
-- Imonar the Soulhunter --
---------------------------
L= DBM:GetModLocalization(2009)

---------------------------
-- Kin'garoth --
---------------------------
L= DBM:GetModLocalization(2004)

L:SetOptionLocalization({
	InfoFrame =	"为战斗总览显示信息窗"
})

---------------------------
-- Varimathras --
---------------------------
L= DBM:GetModLocalization(1983)

---------------------------
-- The Coven of Shivarra --
---------------------------
L= DBM:GetModLocalization(1986)

L:SetTimerLocalization({
	timerBossIncoming		= DBM_INCOMING
})

L:SetOptionLocalization({
	timerBossIncoming		= "为下一次Boss交换显示计时条"
})

---------------------------
-- Aggramar --
---------------------------
L= DBM:GetModLocalization(1984)

---------------------------
-- Argus the Unmaker --
---------------------------
L= DBM:GetModLocalization(2031)

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("AntorusTrash")

L:SetGeneralLocalization({
	name =	"安托鲁斯小怪"
})
