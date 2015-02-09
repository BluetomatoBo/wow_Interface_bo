local mod	= DBM:NewMod(1147, "DBM-BlackrockFoundry", nil, 457)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 12751 $"):sub(12, -3))
mod:SetCreatureID(76906)--81315 Crack-Shot, 81197 Raider, 77487 Grom'kar Firemender, 80791 Grom'kar Man-at-Arms, 81318 Iron Gunnery Sergeant, 77560 Obliterator Cannon, 81612 Deforester
mod:SetEncounterID(1692)
mod:SetZone()
mod:SetUsedIcons(8, 7, 2, 1)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 160140 163753",
	"SPELL_CAST_SUCCESS 155864",
	"SPELL_AURA_APPLIED 155921 159481 165195",
	"SPELL_AURA_APPLIED_DOSE 155921",
	"UNIT_DIED",
	"CHAT_MSG_MONSTER_YELL"
)

--TODO, maybe range finder for when Man-at_arms is out (reckless Charge)
--TODO, train timers, as well as what mobs get off with each train.
--TODO, mythic "move out of fire" warnings and maybe cast warnings too
--TODO, add audio countdown for trains when the train timers are proven good and support whole fight.
--Operator Thogar
local warnProtoGrenade				= mod:NewSpellAnnounce(155864, 3)
local warnEnkindle					= mod:NewStackAnnounce(155921, 2, nil, "Tank")
local warnTrain						= mod:NewTargetCountAnnounce(176312, 4)
--Adds
local warnDelayedSiegeBomb			= mod:NewTargetAnnounce(159481, 3)

--Operator Thogar
local specWarnProtoGrenade			= mod:NewSpecialWarningMove(165195, nil, nil, nil, nil, nil, 2)
local specWarnEnkindle				= mod:NewSpecialWarningStack(155921, nil, 2)--Maybe need 3 for new cd?
local specWarnEnkindleOther			= mod:NewSpecialWarningTaunt(155921)
local specWarnTrain					= mod:NewSpecialWarningDodge(176312, nil, nil, nil, 3)
--Adds
local specWarnCauterizingBolt		= mod:NewSpecialWarningInterrupt(160140, not "Healer")
local specWarnIronbellow			= mod:NewSpecialWarningSpell(163753, nil, nil, nil, 2)
local specWarnDelayedSiegeBomb		= mod:NewSpecialWarningYou(159481)
local yellDelayedSiegeBomb			= mod:NewYell(159481)
local specWarnManOArms				= mod:NewSpecialWarningSwitch("ej9549", "-Healer")
--local specWarnObliteration		= mod:NewSpecialWarningMove(156494)--Debuff doesn't show in combat log, and dot persists after moving out of it so warning is pretty useless right now. TODO, see if UNIT_AURA player type check can work.

--Operator Thogar
local timerProtoGrenadeCD			= mod:NewCDTimer(12, 155864)
local timerEnkindleCD				= mod:NewCDTimer(12, 155921, nil, "Tank")
local timerTrainCD					= mod:NewNextCountTimer("d15", 176312)
--Adds
--local timerCauterizingBoltCD		= mod:NewNextTimer(30, 160140)
local timerIronbellowCD				= mod:NewCDTimer(10, 163753)

local countdownTrain				= mod:NewCountdown(5, 176312)

local voiceTrain					= mod:NewVoice(176312) --see mythicVoice{} otherVoice{} tables for more details
local voiceProtoGrenade				= mod:NewVoice(165195) --runaway

mod:AddInfoFrameOption(176312)
mod:AddSetIconOption("SetIconOnAdds", "ej9549", false, true)

mod.vb.trainCount = 0
local MovingTrain = GetSpellInfo(176312)
local Train = GetSpellInfo(174806)
local Cannon = GetSpellInfo(62357)
local Reinforcements = EJ_GetSectionInfo(9537)
local ManOArms = EJ_GetSectionInfo(9549)
local Deforester = EJ_GetSectionInfo(10329)

--Note, all trains spawn 5 second after yell for that train
--this means that for 5 second cd trains you may see a yell for NEXT train as previous train is showing up. Do not confuse this!
--Also be aware that older beta videos are wrong, blizz has changed train orders few times, so don't try to fill in missing data by putting "thogar" into youtube unless it's a RECENT LIVE video.
local mythicTrains = {
	[1] = { [4] = ManOArms },--+7 after pull
	[2] = { [1] = Deforester },--+5 after 1
	[3] = { [2] = Train },--+5 after 2.
	[4] = { [3] = Train },--+15 after 3.
	[5] = { ["specialw"] = L.threeTrains, ["speciali"] = L.threeRandom, [1] = Train, [2] = Train, [3] = Train, [4] = Train },--+15 after 4
	[6] = { [1] = Cannon, [4] = Cannon },--+15 after 5
	[7] = { [2] = Train },--+5 after 6.
	[8] = { [3] = Train },--+5 after 7.
	[9] = { [2] = Train },--+15 after 8.
	[10] = { [2] = Reinforcements, [3] = Reinforcements },--+20 after 9
	[11] = { [1] = Train, [4] = Train },--+15 after 10.
	[12] = { [2] = Train, [4] = Train },--+15 after 11
	--Unknown After 12
}

--https://www.youtube.com/watch?v=_W8vy5Gc5q4
local otherTrains = {
	[1] = { [4] = Train },--+12 after pull
	[2] = { [2] = Train },--+10 after 1
	[3] = { [1] = Reinforcements },--+5 after 2
	[4] = { [3] = Train },--+15 after 3
	[5] = { [4] = Cannon },--+5 after 4
	[6] = { [2] = Train },--+25 after 5
	[7] = { [3] = ManOArms },--+5 after 6
	[8] = { [1] = Train },--+25 after 7
	[9] = { [2] = Reinforcements, [3] = Reinforcements },--+15 after 8
	[10] = { [1] = Train, [4] = Train },--+40 after 9
	[11] = { [1] = Cannon },--+10 after 10
	[12] = { [2] = Train },--+15 after 11
	[13] = { [4] = Reinforcements },--+10 after 12
	[14] = { [3] = Train },--+20 after 13
	[15] = { [2] = Train },--+10 after 14
	[16] = { [1] = Train },--+10 after 15
	[17] = { [2] = ManOArms, [4] = Cannon },--+15 after 16
	[18] = { [1] = Train },--+20 after 17
	[19] = { [3] = Train },--+5 after 18
	[20] = { [1] = Cannon, [4] = Cannon },--+30 after 19
	[21] = { [2] = Train },--+10 after 20
	[22] = { [2] = Train },--+25 after 21
	[23] = { [2] = Reinforcements, [3] = ManOArms },--+30 after 22
	[24] = { ["specialw"] = L.oneTrain, ["speciali"] = L.oneRandom, [1] = Train, [2] = Train, [3] = Train, [4] = Train },--Lane 4, but if reinforcements aren't dead from wave 23, lane 2 (because reinforcements cart still blocking lane 4) Not Actually random. But detecting if reinforcement cart still in way impossible :\
	[25] = { [1] = Train },--+20 after 24
	[26] = { [1] = Cannon, [4] = Reinforcements },--+20 after 25
	[27] = { [3] = Train },--+25 after 26
	[28] = { [2] = ManOArms, [3] = ManOArms },--+15 after 27
	[29] = { [4] = Train },--+10 after 28
}

local function fakeTrainYell(self)
	self:CHAT_MSG_MONSTER_YELL("Fake", nil, nil, nil, L.Train)
	DBM:Debug("Fake yell fired, Boss skipped a yell?")
end

--  Voicelist
--	A: just rushing through the lane(express)
--	B: small Adds(Reinforcements)
--	C: cannon
--	D: big Adds (ManOArms)
--	E: fire(Deforester) 
--	F: random express (3x trainType A)
--	X: random rail

local mythicVoice = {
	[1] = "D4",
	[2] = "E1",
	[3] = "A2",
	[4] = "A3",
	[5] = "F",
	[6] = "CX",
	[7] = "A2",
	[8] = "A3",
	[9] = "A2",
	[10] = "BX",
	[11] = "A14",
	[12] = "F"
}

local otherVoice = {
	[1] = "A4",
	[2] = "A2",
	[3] = "B1",
	[4] = "A3",
	[5] = "C4",
	[6] = "A2",
	[7] = "D3",
	[8] = "A1",
	[9] = "B23",
	[10] = "A14",
	[11] = "C1",
	[12] = "A2",
	[13] = "B4",
	[14] = "A3",
	[15] = "A2",
	[16] = "A1",
	[17] = "D2C4",
	[18] = "A1",
	[19] = "A3",
	[20] = "C14",
	[21] = "A2",
	[22] = "A2",
	[23] = "B2D3",
	[24] = "AX",
	[25] = "A1",--Possibly also random?
	[26] = "C1D4",--Don't worry, B14 will be used on mythic i'm sure. sorry about this messup
	[27] = "A3",
	[28] = "D23",
	[29] = "A4",
}

local function showTrainWarning(self)
	local text = ""
	local textTable = {}
	local usedv = {}
	local train = self.vb.trainCount
	local trainTable = self:IsMythic() and mythicTrains or otherTrains
	if trainTable[train] then
		if trainTable[train]["specialw"] then
			text = text .. trainTable[train]["specialw"]..", "
		else
			for i = 1, 4 do
				if trainTable[train][i] then
					if not usedv[trainTable[train][i]] then
						usedv[trainTable[train][i]] = #textTable + 1
						local t = { vehicle = trainTable[train][i], lane = L.lane.." "..i }
						table.insert(textTable, t)
					else
						local t = textTable[usedv[trainTable[train][i]]]
						t.lane = t.lane..", "..i
					end
				end
			end
		end
	end
	for i = 1, #textTable do
		local t = textTable[i]
		text = text..t.lane..": "..t.vehicle..", "
	end
	text = string.sub(text, 1, text:len() - 2)
	text = "noStrip |cffffff9a"..text.."|r"
	warnTrain:Show(train, text)
end

local function laneCheck(self)
	local posX = UnitPosition("player")--room is perfrect square, y coord not needed.
	local train = self.vb.trainCount
	local trainTable = self:IsMythic() and mythicTrains or otherTrains
	if not trainTable[train] then return end
	local playerLane
	-- map coord from http://mysticalos.com/images/DBM/ThogarData/1.jpeg http://mysticalos.com/images/DBM/ThogarData/2.jpeg http://mysticalos.com/images/DBM/ThogarData/3.jpeg http://mysticalos.com/images/DBM/ThogarData/4.jpeg
	if posX > 577.8 then
		playerLane = 1
	elseif posX > 553.8 then
		playerLane = 2
	elseif posX > 529.6 then
		playerLane = 3
	else
		playerLane = 4
	end
	if trainTable[train][playerLane] then
		specWarnTrain:Show()
	end
end

local lines = {}

local function sortInfoFrame(a, b)
	local rexp = "^"..L.lane.." ".."%d"
	local c = string.match(a, rexp)
	local d = string.match(b, rexp)
	if c and not d then
		return true
	elseif not c and d then
		return false
	elseif c and d and c < d then 
		return true
	else
		return false
	end
end

local function updateInfoFrame()
	table.wipe(lines)
	local train = mod.vb.trainCount + 1
	local trainTable = mod:IsMythic() and mythicTrains or otherTrains
	if trainTable[train] then
		for i = 1, 4 do
			if trainTable[train][i] then
				lines[L.lane.." "..i] = trainTable[train][i]
			else
				lines[L.lane.." "..i] = ""
			end
		end
		if trainTable[train]["speciali"] then
			lines[trainTable[train]["speciali"]] = ""
		end
	else
		lines[DBM_CORE_UNKNOWN] = ""
	end
	return lines
end

local function showInfoFrame()
	if mod.Options.InfoFrame then
		DBM.InfoFrame:SetHeader(MovingTrain.." ("..(mod.vb.trainCount + 1)..")")
		DBM.InfoFrame:Show(5, "function", updateInfoFrame, sortInfoFrame)
	end
end

function mod:test(num)
	self.vb.trainCount = num
	showTrainWarning(self)
	DBM.InfoFrame:SetHeader(MovingTrain.." ("..(self.vb.trainCount + 1)..")")
	DBM.InfoFrame:Show(5, "function", updateInfoFrame, sortInfoFrame)
end

function mod:OnCombatStart(delay)
	self.vb.trainCount = 0
	timerProtoGrenadeCD:Start(6-delay)
	timerEnkindleCD:Start(15-delay)
	if not self.Options.ShowedThogarMessage then
		DBM:AddMsg(L.helperMessage)
		self.Options.ShowedThogarMessage = true
	end
	if self:IsMythic() then
		self:Schedule(9.5, fakeTrainYell, self)
		timerTrainCD:Start(12-delay, 1)
	else
		self:Schedule(14.5, fakeTrainYell, self)
		timerTrainCD:Start(17-delay, 1)
	end
	showInfoFrame()
end

function mod:OnCombatEnd()
	if self.Options.InfoFrame then
		DBM.InfoFrame:Hide()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	local spellId = args.spellId
	if spellId == 155864 then
		warnProtoGrenade:Show()
		timerProtoGrenadeCD:Start()
	end
end

function mod:SPELL_CAST_START(args)
	local spellId = args.spellId
	if spellId == 160140 then
		specWarnCauterizingBolt:Show(args.sourceName)
	elseif spellId == 163753 then
		if self:AntiSpam() then
			specWarnIronbellow:Show()
		end
		timerIronbellowCD:Start(12, args.sourceGUID)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	local spellId = args.spellId
	if spellId == 155921 then
		local amount = args.amount or 1
		warnEnkindle:Show(args.destName, amount)
		timerEnkindleCD:Start()
		if amount >= 2 then
			if args:IsPlayer() then
				specWarnEnkindle:Show(amount)
			else--Taunt as soon as stacks are clear, regardless of stack count.
				if not UnitDebuff("player", GetSpellInfo(155921)) and not UnitIsDeadOrGhost("player") then
					specWarnEnkindleOther:Show(args.destName)
				end
			end
		end
	elseif spellId == 159481 then
		warnDelayedSiegeBomb:CombinedShow(1, args.destName)
		if args:IsPlayer() then
			specWarnDelayedSiegeBomb:Show()
			yellDelayedSiegeBomb:Yell()
		end
	elseif spellId == 165195 and args:IsPlayer() then
		specWarnProtoGrenade:Show()
		voiceProtoGrenade:Play("runaway")
--[[	elseif spellId == 156494 and args:IsPlayer() and self:AntiSpam() then
		specWarnObliteration:Show()--]]
	end
end
mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 80791 then
		timerIronbellowCD:Cancel(args.destGUID)
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg, npc, _, _, target)
	if target == L.Train then
		self:Unschedule(fakeTrainYell)--Always unschedule
		self.vb.trainCount = self.vb.trainCount + 1
		local count = self.vb.trainCount
		showTrainWarning(self)
		if msg == "Fake" then
			countdownTrain:Start(2.5)
			self:Schedule(1.5, laneCheck, self)
			self:Schedule(2.5, showInfoFrame)
		else
			countdownTrain:Start()
			self:Schedule(4, laneCheck, self)
			self:Schedule(5, showInfoFrame)
		end
		if self:IsMythic() then
			if mythicVoice[count] then
				voiceTrain:Play("Thogar\\"..mythicVoice[count])
			end
			--+5 added to all timers so timers are for train coming down the lane.
			--yes this means sometimes two timers up at a time instead of one. this is fine, fight doesn't have many timers.
			local expectedTime
			if count == 1 or count == 2 or count == 6 or count == 7 then
				expectedTime = 5
			elseif count == 9 then
				expectedTime = 20
			else
				expectedTime = 15
			end
			if expectedTime then
				if msg == "Fake" then expectedTime = expectedTime - 2.5 end
				timerTrainCD:Schedule(5, expectedTime, count+1)
				self:Schedule(expectedTime+2.5, fakeTrainYell, self)--Schedule fake yell 2.5 seconds after we should have seen one.
			else
				print("Train Set: "..count..". DBM has no train data beyond this point. Send us videos if you can.")
				timerTrainCD:Start(count)
			end
			if count == 1 then--I'm sure they spawn again sometime later, find that data
				specWarnManOArms:Show()
			end
		else
			if otherVoice[count] then
				voiceTrain:Play("Thogar\\"..otherVoice[count])
			end
			--Next Train 5 seconds after: 2, 4, 6, 18
			--Next Train 10 seconds after: 1, 10, 14, 15, 20, 28
			--Next Train 15 seconds after: 3, 8, 11, 16, 27
			--Next Train 20 seconds after: 13, 17, 24, 25
			--Next Train 25 seconds after: 5, 7, 21, 26
			--Next Train 30 seconds after: 19
			--Next Train 40 seconds after: 9
			local expectedTime
			if count == 2 or count == 4 or count == 6 or count == 18 then
				expectedTime = 5
			elseif count == 1 or count == 10 or count == 14 or count == 15 or count == 20 or count == 28 then
				expectedTime = 10
			elseif count == 3 or count == 8 or count == 11 or count == 16 or count == 23 or count == 27 then
				expectedTime = 15
			elseif count == 13 or count == 17 or count == 24 or count == 25 then
				expectedTime = 20
			elseif count == 5 or count == 7 or count == 21 or count == 26 then
				expectedTime = 25
			elseif count == 19 or count == 22 then
				expectedTime = 30
			elseif count == 9 then
				expectedTime = 40
			end
			if expectedTime then
				if msg == "Fake" then expectedTime = expectedTime - 2.5 end
				timerTrainCD:Schedule(5, expectedTime, count+1)--Show timer for next train from current yell (previous yell already has timer for yell this train is for so no 5 second timer needed)
				self:Schedule(expectedTime+2.5, fakeTrainYell, self)--Schedule fake yell 2.5 seconds after we should have seen one.
			else
				print("Train Set: "..count..". DBM has no train data beyond this point. Send us videos if you can.")
				timerTrainCD:Start(5, count)--Show timer for incoming train for current yell if we have no data for next
			end
			if count == 7 or count == 17 or count == 23 or count == 28 then--I'm sure they spawn again sometime later, find that data
				specWarnManOArms:Show()
				if self.Options.SetIconOnAdds then
					self:ScanForMobs(80791, 0, 8, 2, 0.2, 15)--Man At Arms scanner marking 8 down
					self:ScanForMobs(87841, 1, 1, 2, 0.2, 15)--Fire Mender scanner marking 1 up
				end
			end
		end
	end
end
