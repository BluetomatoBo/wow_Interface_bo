if GetLocale() ~= "koKR" then return end
local L

---------------------------
--  The Restless Cabal --
---------------------------
L= DBM:GetModLocalization(2328)

L:SetMiscLocalization({
	Zaxasj = "작사아즈",
	Fathuul = "파두울"
})

---------------------------
-- Uu'nat, Harbinger of the Void --
---------------------------
L= DBM:GetModLocalization(2332)

L:SetWarningLocalization({

})

L:SetTimerLocalization({

})

L:SetOptionLocalization({

})

L:SetMiscLocalization({
	Ocean = "바다",
	Storm = "폭풍",
	Void = "공허"
})

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("CrucibleofStormsTrash")

L:SetGeneralLocalization({
	name =	"폭풍의 용광로 일반몹"
})
