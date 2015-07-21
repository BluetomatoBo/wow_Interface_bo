﻿if GetLocale() ~= "ruRU" then return end
local L

---------------
-- Hellfire Assault --
---------------
L= DBM:GetModLocalization(1426)

L:SetTimerLocalization({
	timerSiegeVehicleCD		= "След. осад. машина %s",
})

L:SetOptionLocalization({
	timerSiegeVehicleCD =	"Отсчет времени до появления новой осадной машины"
})

L:SetMiscLocalization({
	AddsSpawn1		=	"Comin' in hot!",--Blizzard seems to have disabled these
	AddsSpawn2		=	"Fire in the hole!",--Blizzard seems to have disabled these
	BossLeaving		=	"Я вернусь..."
})

---------------------------
-- Iron Reaver --
---------------------------
L= DBM:GetModLocalization(1425)

---------------------------
-- Hellfire High Council --
---------------------------
L= DBM:GetModLocalization(1432)

L:SetMiscLocalization({
	Jubeideath		=	"Я - вечное пламя!"
})

------------------
-- Kormrok --
------------------
L= DBM:GetModLocalization(1392)

--------------
-- Kilrogg Deadeye --
--------------
L= DBM:GetModLocalization(1396)

L:SetMiscLocalization({
	BloodthirstersSoon		=	"Ко мне, братья! Ваша судьба ждет!"
})

--------------------
--Gorefiend --
--------------------
L= DBM:GetModLocalization(1372)

L:SetWarningLocalization({
	specWarnShadowofDeath	= "Тень смерти (%d) на вас"
})

L:SetTimerLocalization({
	SoDDPS		= "След. Тени (%s)",
	SoDTank		= "След. Тени (%s)",
	SoDHealer	= "След. Тени (%s)"
})

L:SetOptionLocalization({
	SoDDPS		= "Отсчет времени до след. $spell:179864 (дд)",
	SoDTank		= "Отсчет времени до след. $spell:179864 (танки)",
	SoDHealer	= "Отсчет времени до след. $spell:179864 (хилы)"
})

--------------------------
-- Shadow-Lord Iskar --
--------------------------
L= DBM:GetModLocalization(1433)

L:SetWarningLocalization({
	specWarnThrowAnzu =	"Бросьте Глаз Анзу %s!"
})

L:SetOptionLocalization({
	specWarnThrowAnzu =	"Спец-предупреждение когда вы должны кинуть $spell:179202"
})

--------------------------
-- Fel Lord Zakuun --
--------------------------
L= DBM:GetModLocalization(1391)

L:SetWarningLocalization({
	specWarnSeedPosition =	"Позиция для Семени: %s"
})

L:SetOptionLocalization({
	SeedsBehavior		= "Поведение крика для Семя разрушения (требуется лидер рейда)",
	Iconed				= "Звезда, Круг, Ромб, Треугольник, Луна. Применимо для любой стратегии, использующей метки на полу",--Default
	Numbered			= "1, 2, 3, 4, 5. Применимо для любой стратегии, использующей нумерованные позиции",
	DirectionLine		= "Лево, Слева от середины, Середина, Справа от середины, Право. Для стратегии в одну линию",
	FreeForAll			= "Свободное. Позиция не задается, используется обычный крик",
	--Currently these 3 below are unused unless I see anyone want/need them
	CrossPerception		= "Front, Back, Left, Right, Middle. Typical for Cross strat",--Unsure if viable with 5 targets/will remain
	CrossCardinal		= "North, South, East, West, Middle. Typical for Cross strat",--Unsure if viable 5 targets/will remain
	ExCardinal			= "NorthEast, Southeast, Northwest, Southwest, Middle. Typical for Ex strat"--Unsure if viable 5 targets/will remain
})

L:SetMiscLocalization({
	DBMConfigMsg		= "Конфигурация для Семя разрушения установлена в %s, чтобы соответствовать конфигурации рейд лидера.",
	BWConfigMsg			= "Рейд лидер использует Bigwigs, DBM автоматически настроен на использование нумерованных позиций"
	--TODO, talk to some guilds, maybe trim list above, add finalized directions here
})

--------------------------
-- Xhul'horac --
--------------------------
L= DBM:GetModLocalization(1447)

L:SetOptionLocalization({
	ChainsBehavior		= "Поведение предупреждения для Цепи Скверны",
	Cast				= "Выдавать только начальную цель в начале каста. Таймер синхронизируется по началу каста.",
	Applied				= "Выдавать цели в конце каста. Таймер синхронизируется по окончанию каста.",
	Both				= "Выдавать начальную цель в начале каста и другие цели в конце каста."
})

--------------------------
-- Socrethar the Eternal --
--------------------------
L= DBM:GetModLocalization(1427)

--------------------------
-- Tyrant Velhari --
--------------------------
L= DBM:GetModLocalization(1394)

--------------------------
-- Mannoroth --
--------------------------
L= DBM:GetModLocalization(1395)

L:SetMiscLocalization({
	felSpire		=	"начинает усиливать шпиль Скверны!"
})

--------------------------
-- Archimonde --
--------------------------
L= DBM:GetModLocalization(1438)

L:SetWarningLocalization({
	specWarnBreakShackle	= "Скованное страдание: разорвать связь %s!"
})

L:SetOptionLocalization({
	specWarnBreakShackle	= "Спец-предупреждение для $spell:184964. Это предупреждение автоматически назначает последовательность разрывания, чтобы минимизировать урон.",
	FilterOtherPhase		= "Фильтровать предупреждения для событий из другой фазы"
})

L:SetMiscLocalization({
	phase2point5		= "Узрите несметные войска Пылающего Легиона и осознайте всю тщетность борьбы!",--3 seconds faster than CLEU, used as primary, slower CLEU secondary
	First				= "Первый",
	Second				= "Второй",
	Third				= "Третий",
	Fourth				= "Четвертый",--Just in case, not sure how many targets in 30 man raid
	Fifth				= "Пятый"--Just in case, not sure how many targets in 30 man raid
})

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("HellfireCitadelTrash")

L:SetGeneralLocalization({
	name =	"ЦАП: Трэш"
})
