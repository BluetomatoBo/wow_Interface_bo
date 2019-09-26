local mod	= DBM:NewMod("StickyIcons", "RaidLeadTools")

mod:SetRevision("20190917190757")
mod:SetZone(DBM_DISABLE_ZONE_DETECTION)

mod:AddBoolOption("Enabled", false)
mod:AddSliderOption("IconsUpdateTime", 1, 10, 1, 1)

local isActive, raidIcons = false, {}

do
	local wipe, pairs = table.wipe, pairs
	local GetNumGroupMembers, IsInRaid, GetRaidTargetIndex, SetRaidTarget = GetNumGroupMembers, IsInRaid, GetRaidTargetIndex, SetRaidTarget

	mod:RegisterOnUpdateHandler(function()
		if mod.Options.Enabled and isActive then
			local iconsUsed = {}
			if GetNumGroupMembers() >= 1 and IsInRaid() then
				for i = 1, GetNumGroupMembers() do
					local icon = GetRaidTargetIndex("raid" .. i)
					if icon then
						iconsUsed[icon] = "raid" .. i
					end
				end
			end
			for i, v in pairs(raidIcons) do
				if not iconsUsed[i] and not GetRaidTargetIndex(v) then
					SetRaidTarget(v, i)
				end
			end
		end
	end, mod.Options.IconsUpdateTime)

	function mod:OnInitialize()
		DBM:RegisterCallback("pull", function()
			if not self.Options.Enabled then
				return
			end
			wipe(raidIcons)
			if GetNumGroupMembers() >= 1 and IsInRaid() then
				for i = 1, GetNumGroupMembers() do
					local icon = GetRaidTargetIndex("raid" .. i)
					if icon then
						raidIcons[icon] = "raid" .. i
					end
				end
				isActive = true
			end
		end)
		DBM:RegisterCallback("wipe", function()
			isActive = false
		end)
		DBM:RegisterCallback("kill", function()
			isActive = false
		end)
	end
end
