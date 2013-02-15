local addon, ns = ...
ns.oUF = ElvUF
local oUF = ns.oUF
local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:NewModule('HUD','AceTimer-3.0','AceEvent-3.0');
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");
H.frames = {}


E.Hud = H

function H:updateAllElements(frame)
    for _, v in ipairs(frame.__elements) do
        v(frame, "UpdateElement", frame.unit)
    end
end

function H:SetUpAnimGroup()
-- The following functions are thanks to Hydra from the ElvUI forums
    self.anim = self:CreateAnimationGroup("Flash")
    self.anim.fadein = self.anim:CreateAnimation("ALPHA", "FadeIn")
    self.anim.fadein:SetChange(1)
    self.anim.fadein:SetOrder(2)

    self.anim.fadeout = self.anim:CreateAnimation("ALPHA", "FadeOut")
    self.anim.fadeout:SetChange(-1)
    self.anim.fadeout:SetOrder(1)
end

function H:Flash(duration)
    if not E.db.hud.flash then return end
    if not self.anim then
        H.SetUpAnimGroup(self)
    end

    self.anim.fadein:SetDuration(duration)
    self.anim.fadeout:SetDuration(duration)
    self.anim:Play()
end

function H:CreateWarningFrame()
	local f=CreateFrame("ScrollingMessageFrame","ElvUIHudWarning",UIParent)
	f:SetFont(LSM:Fetch("font", (self.db or P.hud).font),(self.db or P.hud).fontsize*2,"THINOUTLINE")
	f:SetShadowColor(0,0,0,0)
	f:SetFading(true)
	f:SetFadeDuration(0.5)
	f:SetTimeVisible(0.6)
	f:SetMaxLines(10)
	f:SetSpacing(2)
	f:SetWidth(128)
	f:SetHeight(128)
	f:SetPoint("CENTER",0,E:Scale(-100))
	f:SetMovable(false)
	f:SetResizable(false)
	--f:SetInsertMode("TOP") -- Bugged currently
end

function H:Hide(frame,event)
    local alpha = self.db.alpha
    local oocalpha = self.db.alphaOOC

    if not UnitExists(frame.unit) then return end
	if (event == "PLAYER_REGEN_DISABLED") then
			E:UIFrameFadeIn(frame, 0.3 * (alpha - frame:GetAlpha()), frame:GetAlpha(), alpha)
	elseif (event == "PLAYER_REGEN_ENABLED") then
			E:UIFrameFadeOut(frame, 0.3 * (oocalpha + frame:GetAlpha()), frame:GetAlpha(), oocalpha)
	elseif (event == "PLAYER_ENTERING_WORLD") then
			if (not UnitAffectingCombat("player")) then
				E:UIFrameFadeOut(frame, 0.3 * (oocalpha + frame:GetAlpha()), frame:GetAlpha(), oocalpha)
			end
	end
end

local frames = { }

function H:HideOOC(frame)
	if self.db.hideOOC == true and frame.unit ~= 'target' then
		self:EnableHide(frame)
	end
    tinsert(frames,frame)
end

function H:UpdateHideSetting()
    if not self.db.hideOOC then
        for _,f in pairs(frames) do
            self:DisableHide(f)
            f:SetAlpha(self.db['alpha'])
        end
    else
        for _,f in pairs(frames) do
            self:EnableHide(f)
            local alpha = self.db[InCombatLockdown() and 'alpha' or 'alphaOOC']
            f:SetAlpha(alpha)
        end
    end
end

function H:DisableFrame(f)
    f:Hide()
    f:EnableMouse(false)
    f:SetAlpha(0)
end

function H:EnableFrame(f,a,m)
    if a == nil then a = 1 end
    if m == nil then m = true end
    f:Show()
    f:EnableMouse(m)
    f:SetAlpha(a)
end

local elv_units = { 'player', 'target', 'pet', 'pettarget', 'targettarget' }
local old_settings = {}

function H:UpdateElvUFSetting(enableChanged,init)
    local value
    if E.db.hud.enabled then value = not E.db.hud.hideElv else value = true end
    for _,unit in pairs(elv_units) do
        if not value and not old_settings[unit] then old_settings[unit] = E.db.unitframe.units[unit]['enable'] end
        E.db.unitframe.units[unit]['enable'] = (value and old_settings[unit] or (E.db.hud.units[unit]['enabled'] and value)) or value; UF:CreateAndUpdateUF(unit)
    end
end

function H:PLAYER_REGEN_ENABLED()
    self:Enable()
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end

function H:EnableHide(frame)
    if frame.unit == 'target' then return end
    local hider = frame.hud_hider
    if not hider then
        hider = CreateFrame("Frame",nil,UIParent)
        frame.hud_hider = hider
    end
    hider:RegisterEvent("PLAYER_REGEN_DISABLED")
    hider:RegisterEvent("PLAYER_REGEN_ENABLED")
    hider:RegisterEvent("PLAYER_ENTERING_WORLD")
    hider:SetScript("OnEvent", function(self,event) H:Hide(frame,event) end)
end

function H:DisableHide(frame)
    if frame.unit == 'target' then return end
    local hider = frame.hud_hider
    if not hider then return end
    hider:UnregisterEvent("PLAYER_REGEN_DISABLED")
    hider:UnregisterEvent("PLAYER_REGEN_ENABLED")
    hider:UnregisterEvent("PLAYER_ENTERING_WORLD")
    hider:SetScript("OnEvent", nil)
end

function H:Enable()
    self:UpdateElvUFSetting(true)
    for _,f in pairs(frames) do
        if not self.db.enabled then
            if self.db.hideOOC then
                self:DisableHide(f)
            end
            H:DisableFrame(f)
        else
            H:EnableFrame(f,self.db.alpha,self.db.enableMouse)
            if self.db.hideOOC then            
                self:EnableHide(f)
                H:Hide(f,"PLAYER_REGEN_ENABLED")
            end
        end
    end
    self.lowHealthFlash:Show()
    self.lowHealthFlash:SetAlpha(0)
end

function H:UpdateMouseSetting()
    for _,f in pairs(frames) do
        if self.db.enableMouse or self.db.hideElv then
            f:EnableMouse(true)
        else
            f:EnableMouse(false)
        end
    end
end

function H:ResetSettings()
    local oldSettings = {}
    local sl = self.db.simpleLayout
    E:CopyTable(oldSettings,self.db)
    E:CopyTable(self.db,P.hud)
    for k,_ in pairs(oldSettings) do
        if self.db[k] then
            self.db[k] = oldSettings[k]
        end
    end
    self.db['install_complete'] = 3
    return sl
end

function H:Initialize()
    if self.db then return end;
    self.db = E.db.hud

    self:CreateWarningFrame()
    local sl = false 
    if not self.db['install_complete'] or self.db['install_complete'] and self.db['install_complete'] < 3 then sl = self:ResetSettings() end

    oUF:RegisterStyle('ElvUI_Hud',function(frame,unit)
        H:ConstructHudFrame(frame,unit)
    end)

    oUF:SetActiveStyle('ElvUI_Hud')
    local units = { 'player', 'target', 'pet', 'targettarget', 'pettarget' }
    for _,unit in pairs(units) do
        local stringTitle = E:StringTitle(unit)
        if stringTitle:find('target') then
            stringTitle = gsub(stringTitle, 'target', 'Target')
        end
        oUF:Spawn(unit, "ElvUF_"..stringTitle.."Hud")
    end

    if sl then self:simpleLayout() end
    self:GenerateOptionTables()
    self:UpdateAllFrames()
    self:UpdateMouseSetting()
    self:UpdateHideSetting()

    hooksecurefunc(UF,"Update_AllFrames",function(self) H:UpdateAllFrames() end)

    local f = CreateFrame('Frame', nil, UIParent); 
    f:SetAllPoints();
    f.t = f:CreateTexture(nil, 'ARTWORK'); 
    f.t:SetTexture("Interface\\FullScreenTextures\\LowHealth"); 
    f.t:SetBlendMode("ADD")
    self.lowHealthFlash = f

    if UnitAffectingCombat("player") then self:RegisterEvent("PLAYER_REGEN_ENABLED") else self:Enable() end

    self.version = GetAddOnMetadata(addon,'Version')
    print(L["ElvUI Hud "]..format("v|cff33ffff%s|r",self.version)..L[" is loaded. Thank you for using it and note that I will always support you."])
end

E:RegisterModule(H:GetName())
