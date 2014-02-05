local addon, ns = ...
ns.oUF = ElvUF
local oUF = ns.oUF
local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:NewModule('HUD','AceTimer-3.0','AceEvent-3.0');
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");
local EP = LibStub("LibElvUIPlugin-1.0")
H.frames = {}

-- wonder if this is related
E.db.unitframe.hud = {}
E.Hud = H

function H:updateAllElements(frame)
    for _, v in ipairs(frame.__elements) do
        v(frame, "UpdateElement", frame.unit)
    end
end

function H:CreateWarningFrame()
	local f=CreateFrame("ScrollingMessageFrame","ElvUIHudWarning",UIParent)
	f:SetFont(LSM:Fetch("font", (UF.db or P.unitframe).font),(UF.db or P.unitframe).fontSize*2,"THINOUTLINE")
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

function H:CreateScreenFlash()
    local f = CreateFrame('Frame', "ElvUIHudScreenFlash", E.UIParent);
    f:SetToplevel(true)
    f:SetFrameStrata("FULLSCREEN_DIALOG")
    f:SetAllPoints(E.UIParent)
    f:EnableMouse(false)
    f.texture = f:CreateTexture(nil, "BACKGROUND")
    f.texture:SetTexture("Interface\\FullScreenTextures\\LowHealth")
    f.texture:SetAllPoints(E.UIParent)
    f.texture:SetBlendMode("ADD")
    f:SetAlpha(0)
end

H.fading = false
function H:Hide(frame,event)
    if not UnitExists(frame.unit) then return end
    local alpha = self.db.alpha
    local oocalpha = self.db.alphaOOC

    H.fading = true
    if (event == "PLAYER_REGEN_DISABLED") then
            RegisterUnitWatch(frame)
            E:UIFrameFadeIn(frame, 0.3 * (alpha - frame:GetAlpha()), frame:GetAlpha(), alpha)
	elseif (event == "PLAYER_REGEN_ENABLED") then
            UnregisterUnitWatch(frame)
            E:UIFrameFadeOut(frame, 0.3 * (oocalpha + frame:GetAlpha()), frame:GetAlpha(), oocalpha)
	elseif (event == "PLAYER_ENTERING_WORLD") then
			if (not UnitAffectingCombat("player")) then
                UnregisterUnitWatch(frame)
                E:UIFrameFadeOut(frame, 0.3 * (oocalpha + frame:GetAlpha()), frame:GetAlpha(), oocalpha)
			end
	end
    H.fading = false
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
            if UnitExists(f.unit) then
                f:SetAlpha(self.db['alpha'])
            end
        end
    else
        for _,f in pairs(frames) do
            self:EnableHide(f)
            local alpha = self.db[InCombatLockdown() and 'alpha' or 'alphaOOC'] or P.unitframe.hud[InCombatLockdown() and 'alpha' or 'alphaOOC']
            if UnitExists(f.unit) then
                f:SetAlpha(alpha)
            end
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

local elv_units = { 'player', 'target', 'pet', 'pettarget', 'targettarget', 'focus', 'focustarget' }
local old_settings = {}

function H:UpdateElvUFSetting()
    local value
    if E.db.unitframe.hud.enabled then value = not E.db.unitframe.hud.hideElv else value = true end
    for _,unit in pairs(elv_units) do
        if not value and old_settings[unit] == nil then old_settings[unit] = E.db.unitframe.units[unit]['enable'] end
        E.db.unitframe.units[unit]['enable'] = (value and old_settings[unit] or (E.db.unitframe.hud.units[unit]['enabled'] and value)) or value; UF:CreateAndUpdateUF(unit)
    end
end

function H:PLAYER_REGEN_ENABLED()
    self:Enable()
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end

function H:PLAYER_TARGET_CHANGED()
    local frame = self.units['target']

    frame:DisableElement('AuraBars');

    H:ScheduleTimer('AuraBarsSuck',0.25);

    self:UnregisterEvent("PLAYER_TARGET_CHANGED");
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

function H:AuraBarsSuck()
    H.enableAuraBars = true
    H:UpdateAllFrames()
    H.enableAuraBars = false
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

    self:RegisterEvent("PLAYER_TARGET_CHANGED");
    H:ScheduleTimer('AuraBarsSuck',5)
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

function H:UpdateAll()
    self.db = E.db.unitframe.hud

    self:UpdateAllFrames()
    self:UpdateMouseSetting()
    self:UpdateHideSetting()
    if UnitAffectingCombat("player") then self:RegisterEvent("PLAYER_REGEN_ENABLED") else self:Enable() end
end

function H:Initialize()
    if E.db.hud and not E.db.unitframe.hud.copied then
        E.db.unitframe.hud = {}
        E:CopyTable(E.db.unitframe.hud,E.db.hud)
        E.db.unitframe.hud.copied = true
    else
        E.db.unitframe.hud.copied = true
    end
    self.db = E.db.unitframe.hud

    self:CreateWarningFrame()
    self:CreateScreenFlash()

    oUF:RegisterStyle('ElvUI_Hud',function(frame,unit)
        frame:SetFrameLevel(5)
        H:ConstructHudFrame(frame,unit)
    end)

    oUF:SetActiveStyle('ElvUI_Hud')
    local units = { 'player', 'target', 'pet', 'targettarget', 'pettarget', 'focus', 'focustarget' }
    for _,unit in pairs(units) do
        local stringTitle = E:StringTitle(unit)
        if stringTitle:find('target') then
            stringTitle = gsub(stringTitle, 'target', 'Target')
        end
        oUF:Spawn(unit, "ElvUF_"..stringTitle.."Hud")
    end

    EP:RegisterPlugin(addon, H.GenerateOptions)
    self:UpdateAllFrames()
    self:UpdateMouseSetting()
    self:UpdateHideSetting()

    hooksecurefunc(E,"UpdateAll",function(self,ignoreInstall) H:UpdateAll() end)
    hooksecurefunc(UF,"Update_AllFrames",function(self) H:UpdateAllFrames() end)
    
    if UnitAffectingCombat("player") then self:RegisterEvent("PLAYER_REGEN_ENABLED") else self:Enable() end

    self.version = GetAddOnMetadata(addon,'Version')
    print(L["ElvUI Hud "]..format("v|cff33ffff%s|r",self.version)..L[" is loaded. Thank you for using it and note that I will always support you."])
end

E:RegisterModule(H:GetName())
