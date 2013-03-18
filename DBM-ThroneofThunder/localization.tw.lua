﻿if GetLocale() ~= "zhTW" then return end
local L

--------------------------
-- Jin'rokh the Breaker --
--------------------------
L= DBM:GetModLocalization(827)

L:SetWarningLocalization({
	SpecWarnJSA			= ">>> 注意減傷 <<<"
})

L:SetOptionLocalization({
	SoundWOP			= "語音警告：重要技能",
	SpecWarnJSA			= "特殊警告：注意減傷",
	dr1					= "減傷提示：$spell:137313 1-1 [開始時提示]",
	dr2					= "減傷提示：$spell:137313 1-2 [八秒時提示]",
	dr3					= "減傷提示：$spell:137313 2-1",
	dr4					= "減傷提示：$spell:137313 2-2",
	dr5					= "減傷提示：$spell:137313 3-1",
	dr6					= "減傷提示：$spell:137313 3-2",
	dr7					= "減傷提示：$spell:137313 4-1",
	dr8					= "減傷提示：$spell:137313 4-2",
	RangeFrame			= "距離監視"
})

--------------
-- Horridon --
--------------
L= DBM:GetModLocalization(819)

L:SetWarningLocalization({
	warnAdds		= "%s",
	specWarnOrb		= ">>控獸寶珠<<"
})

L:SetTimerLocalization({
	timerDoor		= "下一個部族大门開啟",
	timerAdds		= "下一次 %s"
})

L:SetOptionLocalization({
	SoundWOP			= "語音警告：重要技能",
	ccsoon				= "語音警告：即將$spell:136767(當你是首領目標時無視此選項)",
	ddyls				= "語音警告：打斷$spell:136797",
	SoundDB				= "語音警告：$spell:136741",
	SoundOrb			= "語音警告：$journal:7092",
	specWarnOrb			= "特別警告：$journal:7092",
	warnAdds			= "警告：新一組小怪刷新",
	timerDoor			= "計時器：下一个部族大门開啟",
	timerAdds			= "計時器：下一組小怪刷新"
})

L:SetMiscLocalization({
	newForces		= "的門蜂擁而出!",--Farraki forces pour from the Farraki Tribal Door!
	controlOrb		= "掉下了一顆控獸寶珠",
	chargeTarget	= "用力拍動尾巴!"--Horridon sets his eyes on Eraeshio and stamps his tail!
})

---------------------------
-- The Council of Elders --
---------------------------
L= DBM:GetModLocalization(816)

L:SetWarningLocalization({
	specWarnDDL 	= ">> 下一次 到你斷 <<",
	specWarnPossessed		= "%s 在 %s - 轉換目標"
})

L:SetOptionLocalization({
	SoundWOP		= "語音警告：重要技能",
	SoundLs			= "倒計時：$spell:136521",	
	SoundHs			= "倒計時：$spell:136990",
	Soundspirit		= "倒計時：女祭司的各種魂靈",
	HudMAP			= "高級定位監視(HUD)：$spell:136992",
	HudMAP2			= "高級定位監視(HUD)：$spell:136922",
	optDD			= "沙王打斷鏈",
	nodd			= "我不打斷",
	DD1				= "打斷1",
	DD2				= "打斷2",
	DD3				= "打斷3",
	specWarnDDL 	= "特殊警告：下一次到你打斷",
	warnPossessed		= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.target:format(136442),
	specWarnPossessed	= DBM_CORE_AUTO_SPEC_WARN_OPTIONS.switch:format(136442),
	warnSandBolt		= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.target:format(136189),
	PHealthFrame		= "為$spell:136442消散顯示剩餘血量框架(需要首領血量框架開啟)",
	RangeFrame			= "顯示距離框架"
})

------------
-- Tortos --
------------
L= DBM:GetModLocalization(825)

L:SetWarningLocalization({
	warnKickShell			= "%s 被 >%s< 踢掉 (%d 剩餘)",
	specWarnCrystalShell	= "去拿 >%s<"
})

L:SetOptionLocalization({	
	warnKickShell			= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(134031),
	SoundWOP				= "語音警告：重要技能",	
	SoundAE					= "倒計時：$spell:133939",	
	dr1						= "減傷提示：$spell:134920 1/4",
	dr2						= "減傷提示：$spell:134920 2/4",
	dr3						= "減傷提示：$spell:134920 3/4",
	dr4						= "減傷提示：$spell:134920 4/4",
	specWarnCrystalShell	= "特別警告：缺少$spell:137633",
	InfoFrame				= "資訊框：缺少$spell:137633",
	SetIconOnTurtles		= "為$journal:7129標示團隊圖示(超過一名以上的團隊助理時不可靠)",
})

L:SetMiscLocalization({
	WrongDebuff		= "缺少%s"
})

-------------
-- Megaera --
-------------
L= DBM:GetModLocalization(821)

L:SetOptionLocalization({
	SoundWOP		= "語音警告：重要技能",
	HudMAP			= "高級定位監視(HUD)：$spell:139822",
	HudMAP2			= "高級定位監視(HUD)：$spell:139889",
	dr1				= "減傷提示：$spell:139458 1",
	dr2				= "減傷提示：$spell:139458 2",
	dr3				= "減傷提示：$spell:139458 3",
	dr4				= "減傷提示：$spell:139458 4",
	dr5				= "減傷提示：$spell:139458 5",
	dr6				= "減傷提示：$spell:139458 6",
	dr7				= "減傷提示：$spell:139458 7",
	dr8				= "減傷提示：$spell:139458 8",
	InfoFrame		= "資訊框：$journal:7006"
})

L:SetMiscLocalization({
	rampageEnds		= "梅賈拉的怒氣平息了。",
	Behind			= "迷霧中: "
})

------------
-- Ji-Kun --
------------
L= DBM:GetModLocalization(828)

L:SetWarningLocalization({
	warnFlock		= "%s %s (%d)",
	specWarnFlock	= "%s %s (%d)"
})

L:SetTimerLocalization({
	timerFlockCD	= "第%d波: %s"
})

L:SetOptionLocalization({
	SoundWOP		= "語音警告：重要技能",
	warnFlock		= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.count:format("ej7348"),
	specWarnFlock	= DBM_CORE_AUTO_SPEC_WARN_OPTIONS.switch:format("ej7348"),
	timerFlockCD	= DBM_CORE_AUTO_TIMER_OPTIONS.nextcount:format("ej7348"),
	add1			= "第一波$journal:7348(下)",
	add2			= "第二波$journal:7348(下)",
	add3			= "第三波$journal:7348(下)",
	add4			= "第四波$journal:7348(上)",
	add5			= "第四波$journal:7348(下)",
	add6			= "第五波$journal:7348(上)",
	add7			= "第五波$journal:7348(下)",
	add8			= "第六波$journal:7348(上)",
	add9			= "第七波$journal:7348(上)",
	add10			= "第七波$journal:7348(下)",
	add11			= "第八波$journal:7348(上)",
	add12			= "第八波$journal:7348(下)",
	add13			= "第九波$journal:7348(上)",
	add14			= "第九波$journal:7348(下)",
	add15			= "第十波$journal:7348(上)",
	add16			= "第十波$journal:7348(下)",
	add17			= "第十一波$journal:7348(上)",
	add18			= "第十一波$journal:7348(下)",
	add19			= "第十二波$journal:7348(上)",
	add20			= "第十二波$journal:7348(下)",
	add21			= "第十三波$journal:7348(上)",
	add22			= "第十三波$journal:7348(下)",
	add23			= "第十四波$journal:7348(上)",
	add24			= "第十四波$journal:7348(下)",
	add25			= "第十五波$journal:7348(上)",
	add26			= "第十五波$journal:7348(下)",
	RangeFrame		= "距離監視(8碼)：$spell:138923"
})

L:SetMiscLocalization({
	eggsHatchL			= "下層巢裡的蛋開始孵化了!",
	eggsHatchU			= "上層巢裡的蛋開始孵化了!",
	Upper				= "上方",
	Lower				= "下方",
	UpperAndLower		= "上下都有"
})

--------------------------
-- Durumu the Forgotten --
--------------------------
L= DBM:GetModLocalization(818)

L:SetWarningLocalization({
	warnAddsLeft			= "迷霧剩餘: %d",
	specWarnFogRevealed		= "%s 出現!",
	specWarnDisintegrationBeam	= "%s (%s)",
	specWarnDisintegrationBeamL	= "← ← ←左左左",
	specWarnDisintegrationBeamR	= "右右右→ → →"
})

L:SetOptionLocalization({
	SoundWOP					= "語音警告：重要技能",
	optDD						= "三元光分擔策略",
	nodd						= "不分擔",
	DD1							= "A:紅黃藍",
	DD2							= "B:黃藍紅",
	DD3							= "C:藍紅黃",
	HudMAP						= "高級定位監視(HUD)：三元光分擔",
	warnAddsLeft				= "警告：迷霧剩餘數量",
	specWarnFogRevealed			= "特別警告：迷霧被發現",
	specWarnDisintegrationBeam	= DBM_CORE_AUTO_SPEC_WARN_OPTIONS.spell:format("ej6882"),
	ArrowOnBeam					= "DBM箭頭：$journal:6882的轉動方向",
	specWarnDisintegrationBeamL			= "特殊警告：左轉$spell:133775",
	specWarnDisintegrationBeamR			= "特殊警告：右轉$spell:136316",
	SetIconRays					= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format("ej6891")
})

L:SetMiscLocalization({
	Eye		= "魔眼"
})

----------------
-- Primordius --
----------------
L= DBM:GetModLocalization(820)

L:SetOptionLocalization({
	SoundWOP		= "語音警告：重要技能",
	InfoFrame		= "資訊框：首領當前的$journal:6949技能",
	RangeFrame		= "顯示距離框架(2碼/5碼)",
	SetIconOnBadOoze	= "為$spell:140506自動標記"
})

L:SetMiscLocalization({
	BossSpellInfo 	= "進化技能分析表",
	AE1				= "持續性AE",
	AE2				= "靠近分擔AE (15s)",
	tar5			= "分散5碼 (3s)",
	tar1			= "病原體點名 (30s)",
	speed			= "速度提升50%",
	tar2			= "分散2碼 (10s)",
})

-----------------
-- Dark Animus --
-----------------
L= DBM:GetModLocalization(824)

L:SetWarningLocalization({
	warnMatterSwapped	= "%s: >%s< 和 >%s< 交換"
})

L:SetOptionLocalization({
	SoundWOP			= "語音警告：重要技能",
	RangeFrame			= "顯示距離框架(8碼)",
	warnMatterSwapped	= "警告：被$spell:138618交換的目標"
})

L:SetMiscLocalization({
	Pull	= "寶珠爆炸了!"
})

--------------
-- Iron Qon --
--------------
L= DBM:GetModLocalization(817)

L:SetWarningLocalization({
	warnDeadZone	= "%s: %s / %s "
})

L:SetOptionLocalization({
	warnDeadZone	= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.spell:format(137229),
	SoundWOP		= "語音警告：重要技能",
	SoundARAT		= "語音警告：報出$spell:137231的攻擊方位",
	ReapetAP		= "特殊功能：若你中了$spell:136192則不停呼救",
	HudMAP			= "高級定位監視(HUD)：$spell:136192",
	RangeFrame		= "顯示動態距離框架(當太多人太接近時會動態顯示)",
	InfoFrame		= "信息框：$spell:136193"
})

L:SetMiscLocalization({
	Helpme			= "拉我一把 ~~~"
})

-------------------
-- Twin Consorts --
-------------------
L= DBM:GetModLocalization(829)

L:SetOptionLocalization({
	SoundWOP			= "語音警告：重要技能",
	HudMAP				= "高級定位監視(HUD)：$journal:7651星座輔助線",
	HudMAP2				= "高級定位監視(HUD)：$spell:136752",
	RangeFrame			= "距離監視(8碼)"
})

L:SetMiscLocalization({
	DuskPhase			= "盧凜!借本宮力量!"
})

--------------
-- Lei Shen --
--------------
L= DBM:GetModLocalization(832)

L:SetOptionLocalization({
	SoundWOP		= "語音警告：重要技能",
	HudMAP			= "高級定位監視(HUD)：$spell:135695",
	HudMAP2			= "高級定位監視(HUD)：$spell:136295",
	RangeFrame		= "距離監視",--For two different spells
	StaticShockArrow	= "DBM箭頭：$spell:135695",
	OverchargeArrow		= "DBM箭頭：$spell:136295"
})

------------
-- Ra-den --
------------
L= DBM:GetModLocalization(831)

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("ToTTrash")

L:SetGeneralLocalization({
	name =	"雜兵"
})

L:SetOptionLocalization({
	SoundWOP		= "語音警告：重要技能",
	HudMAP			= "高級定位監視(HUD)：$spell:139322/$spell:139900",
	RangeFrame		= "距離監視(10碼)"--For 3 different spells
})
