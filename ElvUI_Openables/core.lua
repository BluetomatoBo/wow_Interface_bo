local addonName,NS = ...
NS.functions,NS.flags,NS.data,NS.frames = {},{},{},{}
local Fn,F,D,Fr = NS.functions,NS.flags,NS.data,NS.frames
local guidtip,guidbtn = "tip896081AB494A4B7BAF5FDD7C40140096","btn896081AB494A4B7BAF5FDD7C40140096"
local spell_opening = (GetSpellInfo(6247))
local combat_queue = {}

local E, L, V, P, G = unpack(ElvUI)
local AB = E:GetModule('ActionBars')

Fr.events = CreateFrame("Frame")
Fr.events.OnEvent = function(self,event,...)
	return self[event] and self[event](...)
end
Fr.events:SetScript("OnEvent",Fr.events.OnEvent)
Fr.events:RegisterEvent("ADDON_LOADED")

Fr.events.ADDON_LOADED = function(...)
	if (...) == addonName then
		if IsLoggedIn() then
			Fr.events.PLAYER_LOGIN()
		else
			Fr.events:RegisterEvent("PLAYER_LOGIN")
		end
	end
end

Fr.events.PLAYER_LOGIN = function()
	ElvUI_OpenablesDB = ElvUI_OpenablesDB or {}
	Fr.scantip = CreateFrame("GameTooltip",guidtip,nil,"GameTooltipTemplate")
	Fr.scantip:SetOwner(UIParent,"ANCHOR_NONE")
	Fn.GetOpenPatterns()
	Fn.CreateButton()
end

Fr.events.BAG_UPDATE_DELAYED = function()
	Fn.SetOpenable()
end

Fr.events.PLAYER_REGEN_ENABLED = function()
	F.inCombat = nil
	while next(combat_queue) do
		tremove(combat_queue, 1)()
	end
end

Fr.events.PLAYER_REGEN_DISABLED = function()
	F.inCombat = true
end

Fr.events.UNIT_SPELLCAST_SENT = function(...)
	local _, spell = ...
	if spell == spell_opening then
		F.opening = true
	end
end

Fr.events.UNIT_SPELLCAST_SUCCEEDED = function(...)
	if F.opening then
		F.opening = nil
		Fr.timer.anim:SetDuration(1.0)
		Fr.timer.anim:SetScript("OnFinished",Fn.SetOpenable)
		Fr.timer:Play()
	end
end
Fr.events.UNIT_SPELLCAST_FAILED = Fr.events.UNIT_SPELLCAST_SUCCEEDED
Fr.events.UNIT_SPELLCAST_STOP = Fr.events.UNIT_SPELLCAST_SUCCEEDED
Fr.events.UNIT_SPELLCAST_INTERRUPTED = Fr.events.UNIT_SPELLCAST_SUCCEEDED

Fn.PositionSave = function()
	local efscale = Fr.theButton:GetEffectiveScale()
	ElvUI_OpenablesDB.posx = Fr.theButton:GetLeft() * efscale
	ElvUI_OpenablesDB.posy = Fr.theButton:GetTop() * efscale
	Fn.SetOpenable()
end

Fn.PositionLoad = function()
	local posx,posy = ElvUI_OpenablesDB.posx, ElvUI_OpenablesDB.posy
	if not (posx and posy) then Fr.theButton:Show() return end
	local efscale = Fr.theButton:GetEffectiveScale()
	Fr.theButton:ClearAllPoints()
	Fr.theButton:SetPoint("TOPLEFT",UIParent,"BOTTOMLEFT",posx/efscale,posy/efscale)
end

Fn.SkinButton = function()
	AB:StyleButton(Fr.theButton)
end

Fn.CreateButton = function()
	if Fr.theButton then return end
	if Fn.InCombat() then
		if not tContains(combat_queue,Fn.CreateButton) then
			tinsert(combat_queue,Fn.CreateButton)
		end
		return
	end
	
	Fr.theButton = CreateFrame("Button",guidbtn,UIParent,"SecureActionButtonTemplate,ActionButtonTemplate")
	Fr.theButton:Hide()
	Fr.theButton:SetWidth(35)
	Fr.theButton:SetHeight(35)
	Fr.theButton:ClearAllPoints()
	Fr.theButton:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	Fr.theButton:EnableMouse(true)
	Fr.theButton:RegisterForDrag("LeftButton")
	Fr.theButton:RegisterForClicks("AnyUp")
	Fr.theButton:SetMovable(true)
	Fr.theButton:SetClampedToScreen(true)
	Fr.theButton:SetScript("OnDragStart", function(self) if not Fn.InCombat() and IsAltKeyDown() then self:StartMoving() end end)
	Fr.theButton:SetScript("OnDragStop", function(self) if not Fn.InCombat() then self:StopMovingOrSizing() Fn.PositionSave() end end)
	Fr.theButton:SetScript("OnEnter", function(self)
		if self.tooltip then 
			GameTooltip:SetOwner(self,"ANCHOR_TOP")
			if type(self.tooltip)=="string" then 
				GameTooltip:SetText(self.tooltip)
				GameTooltip:AddLine("ALT-Click and drag to move")
			elseif type(self.tooltip)=="number" then
				GameTooltip:SetItemByID(self.tooltip)
				GameTooltip:AddDoubleLine("Click to loot container","ALT-Click and drag to move",0,1,0)
			end
			GameTooltip:Show()
		end 
	end)
	Fr.theButton:SetScript("OnLeave",GameTooltip_Hide)

 	Fr.theButton.icon = _G[string.format("%sIcon",guidbtn)]
	Fr.theButton.icon:SetTexture("Interface\\Icons\\inv_crate_01")
	Fr.theButton.tooltip = BROWSE_NO_RESULTS
	
	if not Fr.timer then
    Fr.timer = Fr.events:CreateAnimationGroup()
    Fr.timer.anim = Fr.timer:CreateAnimation("Animation")
    Fr.timer:SetLooping("NONE")
  end

  Fn.SetOpenable()
	
	Fr.events:RegisterEvent("BAG_UPDATE_DELAYED")
	Fr.events:RegisterEvent("PLAYER_REGEN_ENABLED")
	Fr.events:RegisterEvent("PLAYER_REGEN_DISABLED")
	Fr.events:RegisterUnitEvent("UNIT_SPELLCAST_SENT","player")
	Fr.events:RegisterUnitEvent("UNIT_SPELLCAST_FAILED","player")
	Fr.events:RegisterUnitEvent("UNIT_SPELLCAST_STOP","player")
	Fr.events:RegisterUnitEvent("UNIT_SPELLCAST_INTERRUPTED","player")
	Fr.events:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED","player")
	
	Fr.timer.anim:SetDuration(1.0)
	Fr.timer.anim:SetScript("OnFinished",Fn.PositionLoad)
	Fr.timer:Play()
	
	Fn.SkinButton()
	
end

D.open_spells,D.open_strings = {58172,98681,102923,109946,109947,109948,131934,131935,131936},{}
Fn.GetOpenPatterns = function()
	D.open_strings[ITEM_OPENABLE] = true
	local spell_effect
	for _,spellid in ipairs(D.open_spells) do
		Fr.scantip:ClearLines()
		Fr.scantip:SetSpellByID(spellid)
		spell_effect = (_G[string.format("%s%s%d",guidtip,"TextLeft",Fr.scantip:NumLines())]:GetText())
		if spell_effect and spell_effect ~= "" then 
			D.open_strings[string.format("%s %s",ITEM_SPELL_TRIGGER_ONUSE,spell_effect)] = true
			spell_effect = nil
		end
	end
end

Fn.IsOpenable = function()
	if Fn.InCombat() then
		if not tContains(combat_queue,Fn.IsOpenable) then
			tinsert(combat_queue,Fn.IsOpenable)
		end
		return
	end
	
	for i=1,Fr.scantip:NumLines() do
		if D.open_strings[_G[string.format("%s%s%d",guidtip,"TextLeft",i)]:GetText()] then
			return true
		end
	end
	
	for key,_ in pairs(D.open_strings) do
		for i=1,Fr.scantip:NumLines() do
			if string.find(_G[string.format("%s%s%d",guidtip,"TextLeft",i)]:GetText(),key,1,true) then
				return true
			end
		end
	end

	return false	
end

Fn.SetOpenable = function()
	if Fn.InCombat() then
		if not tContains(combat_queue,Fn.SetOpenable) then
			tinsert(combat_queue,Fn.SetOpenable)
		end
		return
	end
	D.bag_id, D.bag_slot_id, D.item_id = nil, nil, nil
	for bag = BACKPACK_CONTAINER, NUM_BAG_SLOTS, 1 do
		for slot = 1, GetContainerNumSlots(bag), 1 do
			if not D.bag_id then
				Fr.scantip:ClearLines()
				Fr.scantip:SetBagItem(bag,slot)
				if Fn.IsOpenable() then
					D.bag_id = bag
					D.bag_slot_id = slot
					D.item_id = GetContainerItemID(bag,slot)
					D.item_icon = GetContainerItemInfo(bag,slot)
					break
				end
			end
		end

		if D.bag_id then
			break
		end
	end

	if D.bag_id then
		Fr.theButton:SetAttribute("type1", "macro")
		Fr.theButton:SetAttribute("macrotext1", "/run ClearCursor() if MerchantFrame:IsShown() then HideUIPanel(MerchantFrame) end\n/use "..D.bag_id.." "..D.bag_slot_id)
		Fr.theButton.icon:SetTexture(D.item_icon)
		Fr.theButton.tooltip = D.item_id
 		Fr.theButton:Show()
	else
		Fr.theButton.icon:SetTexture("Interface\\Icons\\inv_crate_01")
		Fr.theButton.tooltip = BROWSE_NO_RESULTS
 		Fr.theButton:Hide()
	end
	
end

Fn.InCombat = function()
	return F.inCombat or InCombatLockdown() or UnitAffectingCombat("player") or UnitAffectingCombat("pet")
end

-- debug
-- _G[addonName] = NS