local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local M = E:GetModule('MiscEnh');

local function SelectQuestReward(index)
	local btn = _G[("QuestInfoItem%d"):format(index)]
	if (btn.type == "choice") then
		QuestInfoItemHighlight:ClearAllPoints()
		QuestInfoItemHighlight:SetAllPoints(btn)
		QuestInfoItemHighlight:Show()

		-- set choice
		QuestInfoFrame.itemChoice = btn:GetID()
	end
end

function M:QUEST_COMPLETE()
	if not E.private.general.selectquestreward then return end

	-- default first button when no item has a sell value.
	local choice, price = 1, 0
	local num = GetNumQuestChoices()

	if num <= 0 then
		return	-- no choices, quick exit
	end

	for index = 1, num do
		local link = GetQuestItemLink("choice", index);
		if (link) then
			local vsp = select(11, GetItemInfo(link))
			if vsp and vsp > price then
				price = vsp
				choice = index
			end
		end
	end

	SelectQuestReward(choice)
end

function M:LoadQuestReward()
	-- no config setting yet
	-- if not E.private.general.questreward then return end
	self:RegisterEvent("QUEST_COMPLETE");
end