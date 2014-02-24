local addon, ns = ...
ns.oUF = ElvUF
local oUF = ns.oUF
local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local VUF = E:NewModule('VerticalUnitFrames','AceTimer-3.0','AceEvent-3.0');
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");
local EP = LibStub("LibElvUIPlugin-1.0")

-- wonder if this is related
E.db.unitframe.vuf = {}
E.VerticalUnitFrames = VUF

function VUF:updateAllElements(frame)
    for _, v in ipairs(frame.__elements) do
        v(frame, "UpdateElement", frame.unit)
    end
end

function VUF:CreateWarningFrame()
	local f=CreateFrame("ScrollingMessageFrame","ElvUIVerticalUnitFramesWarning",UIParent)
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

function VUF:CreateScreenFlash()
    local f = CreateFrame('Frame', "ElvUIVerticalUnitFramesScreenFlash", E.UIParent);
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

function VUF:Hide(frame,event)
    if frame.unit == 'target' then return end
    if not UnitExists(frame.unit) then return end
    local alpha = self.db.alpha
    local oocalpha = self.db.alphaOOC

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
end

function VUF:UpdateHideSetting()
    if not self.db.hideOOC then
        for _,f in pairs(self.units) do
            self:DisableHide(f)
            if UnitExists(f.unit) then
                f:SetAlpha(self.db['alpha'])
            end
        end
    else
        for _,f in pairs(self.units) do
            self:EnableHide(f)
            local alpha = self.db[InCombatLockdown() and 'alpha' or 'alphaOOC'] or P.unitframe.vuf[InCombatLockdown() and 'alpha' or 'alphaOOC']
            if UnitExists(f.unit) then
                f:SetAlpha(alpha)
            end
        end
    end
end

function VUF:DisableFrame(f)
    f:Hide()
    f:EnableMouse(false)
    f:SetAlpha(0)
end

function VUF:EnableFrame(f,a,m)
    if a == nil then a = 1 end
    if m == nil then m = true end
    f:Show()
    f:EnableMouse(m)
    f:SetAlpha(a)
end

local elv_units = { 'player', 'target', 'pet', 'pettarget', 'targettarget', 'focus', 'focustarget' }
local old_settings = {}

function VUF:UpdateElvUFSetting()
    local value
    if E.db.unitframe.vuf.enabled then value = not E.db.unitframe.vuf.hideElv else value = true end
    for _,unit in pairs(elv_units) do
        if not value and old_settings[unit] == nil then old_settings[unit] = E.db.unitframe.units[unit]['enable'] end
        E.db.unitframe.units[unit]['enable'] = (value and old_settings[unit] or (E.db.unitframe.vuf.units[unit]['enabled'] and value)) or value; UF:CreateAndUpdateUF(unit)
    end
end

function VUF:PLAYER_REGEN_ENABLED()
    if (not self.enabledFunc) then return end
    self[self.enabledFunc](unpack(self.enabledArgs));
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end

function VUF:PLAYER_TARGET_CHANGED()
    local frame = self.units['target']

    frame:DisableElement('AuraBars');

    VUF:ScheduleTimer('AuraBarsSuck',0.25);

    self:UnregisterEvent("PLAYER_TARGET_CHANGED");
end

function VUF:EnableHide(frame)
    if frame.unit == 'target' then return end
    local hider = frame.vuf_hider
    if not hider then
        hider = CreateFrame("Frame",nil,UIParent)
        frame.vuf_hider = hider
    end
    hider:RegisterEvent("PLAYER_REGEN_DISABLED")
    hider:RegisterEvent("PLAYER_REGEN_ENABLED")
    hider:RegisterEvent("PLAYER_ENTERING_WORLD")
    hider:SetScript("OnEvent", function(self,event) VUF:Hide(frame,event) end)
end

function VUF:DisableHide(frame)
    if frame.unit == 'target' then return end
    local hider = frame.vuf_hider
    if not hider then return end
    hider:UnregisterEvent("PLAYER_REGEN_DISABLED")
    hider:UnregisterEvent("PLAYER_REGEN_ENABLED")
    hider:UnregisterEvent("PLAYER_ENTERING_WORLD")
    hider:SetScript("OnEvent", nil)
end

function VUF:AuraBarsSuck()
    if (UnitAffectingCombat("player")) then self:RegenWait("AuraBarsSuck"); return end
    VUF.enableAuraBars = true
    VUF:UpdateAllFrames()
    VUF.enableAuraBars = false
end

function VUF:Enable()
    self:UpdateElvUFSetting(true)
    for _,f in pairs(self.units) do
        if not self.db.enabled then
            if self.db.hideOOC then
                self:DisableHide(f)
            end
            VUF:DisableFrame(f)
        else
            VUF:EnableFrame(f,self.db.alpha,self.db.enableMouse)
            if self.db.hideOOC then            
                self:EnableHide(f)
                VUF:Hide(f,"PLAYER_REGEN_ENABLED")
            end
        end
    end

    self:RegisterEvent("PLAYER_TARGET_CHANGED");
    VUF:ScheduleTimer('AuraBarsSuck',5)
end

function VUF:UpdateMouseSetting()
    for _,f in pairs(self.units) do
        if self.db.enableMouse or self.db.hideElv then
            f:EnableMouse(true)
        else
            f:EnableMouse(false)
        end
    end
end

function VUF:RegenWait(func, ...)
    self.enabledFunc = func;
    self.enabledArgs = {...};
    self:RegisterEvent("PLAYER_REGEN_ENABLED");
end

function VUF:UpdateAll()
    self.db = E.db.unitframe.vuf

    if UnitAffectingCombat("player") then self:RegenWait("UpdateAll"); return end

    self:UpdateAllFrames()
    self:UpdateMouseSetting()
    self:UpdateHideSetting()
    self:Enable()
end

function VUF:PLAYER_ENTERING_WORLD()
    E:StaticPopup_Show('CONFIG_RL');
end

function VUF:Initialize()
    self.db = E.db.unitframe.vuf

    self:CreateWarningFrame()
    self:CreateScreenFlash()

    oUF:RegisterStyle('ElvUI_VerticalUnitFrames',function(frame,unit)
        frame:SetFrameLevel(5)
        VUF:ConstructVerticalUnitFrame(frame,unit)
    end)

    oUF:SetActiveStyle('ElvUI_VerticalUnitFrames')
    local units = { 'player', 'target', 'pet', 'targettarget', 'pettarget', 'focus', 'focustarget' }
    for _,unit in pairs(units) do
        local stringTitle = E:StringTitle(unit)
        if stringTitle:find('target') then
            stringTitle = gsub(stringTitle, 'target', 'Target')
        end
        oUF:Spawn(unit, "ElvUF_"..stringTitle.."VerticalUnitFrame")
    end

    EP:RegisterPlugin(addon, VUF.GenerateOptions)

    hooksecurefunc(E,"UpdateAll",function(self,ignoreInstall) VUF:UpdateAll() end)
    hooksecurefunc(UF,"Update_AllFrames",function(self) VUF:UpdateAllFrames() end)
    
    if UnitAffectingCombat("player") then self:RegenWait("UpdateAll") else self:UpdateAll() end

    self.version = GetAddOnMetadata(addon,'Version')
    print(L["ElvUI VerticalUnitFrames "]..format("v|cff33ffff%s|r",self.version)..L[" is loaded. Thank you for using it and note that I will always support you."])
end

E:RegisterModule(VUF:GetName())
