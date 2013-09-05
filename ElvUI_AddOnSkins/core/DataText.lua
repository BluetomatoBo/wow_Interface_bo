local AS, DT = ElvUI[1]:GetModule('AddOnSkins'), ElvUI[1]:GetModule('DataTexts')

local function OnClick(self, button)
	if EmbedSystem_MainWindow:IsShown() then
		EmbedSystem_MainWindow:Hide()
	else
		EmbedSystem_MainWindow:Show()
	end
end

local function OnEnter(self)
	DT:SetupTooltip(self)
	DT.tooltip:AddLine('Left Click to Show')
	DT.tooltip:AddLine('Right Click to Hide')
	DT.tooltip:Show()
end

local function OnEvent(self, event)
	local Text = ''
	if AS:CheckOption('EmbedRecount', 'Recount') then Text = 'Recount' end
	if AS:CheckOption('EmbedalDamageMeter', 'alDamageMeter') then Text = 'alDamageMeter' end
	if AS:CheckOption('EmbedSkada', 'Skada') then Text = 'Skada' end
	if AS:CheckOption('EmbedOmen', 'Omen') then Text = 'Omen' end
	if AS:CheckOption('EmbedTDPS', 'TinyDPS') then Text = 'TinyDPS' end
	if Text == '' then
		self.text:SetText(format('%s %s', 'AddOnSkins', AS.Version))
	else
		self.text:SetText(format('%s %s', 'Toggle', Text))
	end
end

DT:RegisterDatatext('AddOnSkins', { 'PLAYER_ENTERING_WORLD' }, OnEvent, nil, OnClick, OnEnter)