local dataobj = LibStub:GetLibrary('LibDataBroker-1.1'):NewDataObject('Spec', {type = "data source", text = 'no spec', icon = "Interface\\Icons\\Spell_Shadow_SacrificialShield", iconCoords = {0.065, 0.935, 0.065, 0.935}})
local timer = 0

function dataobj.OnLeave()
	GameTooltip:SetClampedToScreen(true)
	GameTooltip:Hide()
end

function dataobj.OnEnter(self)
	GameTooltip:SetOwner(self, 'ANCHOR_BOTTOMLEFT', 0, self:GetHeight())
	GameTooltip:AddLine("Talents")
	GameTooltip:AddLine("Hint: left-click to show talents frame.")
	GameTooltip:AddLine("right-click to switch spec.")
	GameTooltip:Show()
end

function dataobj.OnClick(self, button)
	if button == "RightButton" then
		if GetActiveTalentGroup() == 1 then
			SetActiveTalentGroup(2)
		else
			SetActiveTalentGroup(1)
		end
	else
		ToggleTalentFrame()
	end
end

local OnUpdate = function(self, elapsed)
	timer = timer + elapsed
	if timer > 0.5 then
		local maxPoints, finalIcon, text = 0, "Interface\\Icons\\Spell_Shadow_SacrificialShield"
		for tab = 1, 3 do
			local _, _, _,icon, points = GetTalentTabInfo(tab,nil,nil,group)
			if points > maxPoints then
				maxPoints = points
				finalIcon = icon
			end
			text = format("%s%.2i", text and text.."/" or "", points)
		end
		dataobj.text = text
		dataobj.icon = finalIcon
		if text ~= "00/00/00" then
			self:SetScript('OnUpdate', nil)
		end
	end
end

local OnEvent = function(self, event, ...)
	self:SetScript('OnUpdate', OnUpdate)
end

local addon = CreateFrame('Frame')
addon:SetScript('OnEvent', OnEvent)
addon:RegisterEvent("CHARACTER_POINTS_CHANGED")
addon:RegisterEvent("PLAYER_TALENT_UPDATE")
addon:RegisterEvent("PLAYER_ENTERING_WORLD")