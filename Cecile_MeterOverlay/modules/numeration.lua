----------------------------------------------------------------------------------------------------
-- Numeration module
--  original code by ckaotik : https://github.com/ckaotik


--if Numeration its not present, dont use this module
if not IsAddOnLoaded("Numeration")  then return; end

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("details");

--debug
local debug = Engine.AddOn:GetModule("debug");

--toggle window
function mod.Toggle()
	Numeration:ToggleVisibility()
end

--store numeration data
local emptyTable = {}

--get the values for an unit within a type
function mod.GetUnitValues(set, unitName, statType)

	--get the raw data
	local mergePets = NumerationCharOptions.petsmerged
	local data = set.unit[unitName]

	--if we dont have data return 0
	if not data then return 0, 0 end

	--get totals and duration for the unit
	local total    = data[statType] and data[statType].total or 0
	local duration = data[statType] and data[statType].time or 0

	--sum pets and calculate max duration
	for petName in pairs(mergePets and data.pets or emptyTable) do
		local petData = set.unit[petName][statType]
		if petData then
			total = total + petData.total
			duration = math.max(duration, petData.time or 0)
		end
	end

	--calculate value per second
	local perSecond = duration > 0 and math.floor(total/duration + 0.5) or total

	--return results
	return total, perSecond
end

--get the sum table
function mod.GetSumtable(scope, mode)

	--get numeration
	local Numeration = _G.Numeration;

	--temporary result table
	local sumTable = {}
	local totalsum, totalpersec = 0, 0

	--init numeration vars
	local statType = (mode == Engine.TYPE_HEAL and 'hd') or (mode == Engine.TYPE_DPS and 'dd') or 'dd'

	--get the data set
	local set = Numeration:GetSet(Engine.CURRENT_DATA and "current" or "total")

	--go trought the units
	for name, data in pairs(set and set.unit or emptyTable) do

		--if its not a pet
		if data.class ~= 'PET' then

			--get unit name and class
			local unitData = {
				name = data.name,
				enclass = data.class,
			}

			--get the values for this unit
			local value, perSecond = mod.GetUnitValues(set, data.name, statType)

			--output the desired value
			if mode == Engine.TYPE_DPS then
				unitData.damage = value
				unitData.dps = perSecond

			elseif mode == Engine.TYPE_HEAL then
				unitData.healing = value
				unitData.hps = perSecond
			end

			--dont add empty results
			if (value>0) then

				--calculate totals
				totalsum    = totalsum + value
				totalpersec = totalpersec + perSecond

				--inser the result table
				table.insert(sumTable, unitData)
			end


		end
	end

	--return values
	return sumTable, totalsum, totalpersec
end

--return the segment name
function mod.GetSegmentName()

	--get numeration
	local Numeration = _G.Numeration;

	--get the data set
	local set = Numeration:GetSet("current")

	return set and set.name or ''
end

--initialize module
function mod:OnInitialize()

	--get the generic meter
	mod.meter = Engine.AddOn:GetModule("meter");

	---register the damage meter
	mod.meter:RegisterMeter("Numeration",mod.GetSumtable,mod.GetSegmentName,mod.Toggle)

end