local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, ProfileDB, GlobalDB
local H = E:GetModule('HUD');
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

-- Health for all units
function H:ConstructHealth(frame)
    self:AddElement(frame,'health')

	-- Health Bar
    local health = self:ConfigureStatusBar(frame,'health')
    health:SetOrientation("VERTICAL")
    health:SetFrameLevel(frame:GetFrameLevel() + 5)
    health:Point("LEFT",frame,"LEFT")
	health.value = self:ConfigureFontString(frame,'health',health)		
	health.PostUpdate = H.PostUpdateHealth
    health.frequentUpdates = true

    health.colorSmooth = false
    --health.colorDisconnected = false
    --health.colorTapping = true	

    return health
end

-- Power for units it is enabled on
function H:ConstructPower(frame)
    self:AddElement(frame,'power')
    
    local power = self:ConfigureStatusBar(frame,'power')
    power:SetOrientation("VERTICAL")
    power:SetFrameLevel(frame:GetFrameLevel()+1)

    power.value = self:ConfigureFontString(frame,'power',power)               
    
    power.PreUpdate = H.PreUpdatePowerHud
    power.PostUpdate = H.PostUpdatePowerHud

    -- Update the Power bar Frequently
    power.frequentUpdates = true

    power.colorTapping = true   
    power.colorPower = true
    power.colorReaction = true
    power.colorDisconnected = true      

    return power
end 

-- Castbar for units it is enabled on
-- For player/target castbar can be (and defaults) to horizontal mode.
-- For pet/targettarget/pettarget castbar is always vertical overlaid on the power bar.
-- Note in this version the castbar is no longer anchored to the power bar, so each
-- element can be disabled independently
function H:ConstructCastbar(frame)
    self:AddElement(frame,'hcastbar')
    self:AddElement(frame,'vcastbar')
    self:AddElement(frame,'castbar')
    local hcastbar = self:ConfigureStatusBar(frame,'hcastbar')
    local vcastbar = self:ConfigureStatusBar(frame,'vcastbar')

    vcastbar.PostCastStart = H.PostCastStart
    vcastbar.PostChannelStart = H.PostChannelStart
    vcastbar.OnUpdate = H.CastbarUpdate
    --vcastbar.PostCastInterruptible = H.PostCastInterruptible
    --vcastbar.PostCastNotInterruptible = H.PostCastNotInterruptible
    vcastbar:SetOrientation("VERTICAL")
    vcastbar:SetFrameStrata(frame.Power:GetFrameStrata())
    vcastbar:SetFrameLevel(frame.Power:GetFrameLevel()+2)

    vcastbar.Time = self:ConfigureFontString(frame,'vcastbar',vcastbar,'time')
    vcastbar.Time:Point("BOTTOM", vcastbar, "TOP", 0, 4)
    vcastbar.Time:SetTextColor(0.84, 0.75, 0.65)
    vcastbar.Time:SetJustifyH("RIGHT")
    
    vcastbar.Text = self:ConfigureFontString(frame,'vcastbar',vcastbar,'text')
    vcastbar.Text:SetPoint("TOP", vcastbar, "BOTTOM", 0, -4)
    vcastbar.Text:SetTextColor(0.84, 0.75, 0.65)
    
    vcastbar.Spark = vcastbar:CreateTexture(nil, 'OVERLAY')
    vcastbar.Spark:Height(12)
    vcastbar.Spark:SetBlendMode('ADD')
    vcastbar.Spark:SetVertexColor(1, 1, 1)

    --Set to vcastbar.SafeZone
    vcastbar.LatencyTexture = self:ConfigureTexture(frame,'vcastbar',vcastbar,'latency')
    vcastbar.LatencyTexture:SetVertexColor(0.69, 0.31, 0.31, 0.75)   
    vcastbar.SafeZone = vcastbar.LatencyTexture
    
    local button = CreateFrame("Frame", nil, vcastbar)
    button:SetTemplate("Default")
    
    button:Point("BOTTOM", vcastbar, "BOTTOM", 0, 0)
    
    local icon = button:CreateTexture(nil, "ARTWORK")
    icon:Point("TOPLEFT", button, 2, -2)
    icon:Point("BOTTOMRIGHT", button, -2, 2)
    icon:SetTexCoord(0.08, 0.92, 0.08, .92)
    icon.bg = button
    
    --Set to castbar.Icon
    vcastbar.ButtonIcon = icon
    frame.VertCastbar = vcastbar
    hcastbar:SetFrameLevel(6)

    hcastbar.CustomTimeText = H.CustomCastTimeText
    hcastbar.CustomDelayText = H.CustomCastDelayText
    if frame.unit ~= 'player' then
        hcastbar.PostCastStart = H.CheckCast
        hcastbar.PostChannelStart = H.CheckCast
        hcastbar.PostCastInterruptible = UF.PostCastInterruptible
        hcastbar.PostCastNotInterruptible = UF.PostCastNotInterruptible
    else
        hcastbar.PostCastStart = UF.PostCastStart
        hcastbar.PostChannelStart = UF.PostCastStart
        hcastbar.PostCastStop = UF.PostCastStop
        hcastbar.PostChannelStop = UF.PostCastStop
        hcastbar.PostChannelUpdate = UF.PostChannelUpdate
        hcastbar.PostCastInterruptible = UF.PostCastInterruptible
        hcastbar.PostCastNotInterruptible = UF.PostCastNotInterruptible
    end

    hcastbar.Time = self:ConfigureFontString(frame,'hcastbar',hcastbar,'time')
    hcastbar.Time:SetPoint("RIGHT", hcastbar, "RIGHT", -4, 0)
    hcastbar.Time:SetTextColor(0.84, 0.75, 0.65)
    hcastbar.Time:SetJustifyH("RIGHT")
    
    hcastbar.button = CreateFrame("Frame", nil, hcastbar)
    hcastbar.button:Size(26)
    hcastbar.button:SetTemplate("Default")
    hcastbar.button:CreateShadow("Default")

    hcastbar.Spark = hcastbar:CreateTexture(nil, 'OVERLAY')
    hcastbar.Spark:SetBlendMode('ADD')
    hcastbar.Spark:SetVertexColor(1, 1, 1)
    hcastbar.Spark:Width(12)

    hcastbar.Text = self:ConfigureFontString(frame,'hcastbar',hcastbar,'text')
    hcastbar.Text:SetTextColor(0.84, 0.75, 0.65)
    hcastbar.Text:SetPoint("LEFT", hcastbar.button, "RIGHT", 4, 0)

    hcastbar.Icon = hcastbar.button:CreateTexture(nil, "ARTWORK")
    hcastbar.Icon:Point("TOPLEFT", hcastbar.button, 2, -2)
    hcastbar.Icon:Point("BOTTOMRIGHT", hcastbar.button, -2, 2)
    hcastbar.Icon:SetTexCoord(0.08, 0.92, 0.08, .92)

    hcastbar.button:SetPoint("LEFT")

    --Set to castbar.SafeZone
    hcastbar.LatencyTexture = self:ConfigureTexture(frame,'hcastbar',hcastbar,'latency')
    hcastbar.LatencyTexture:SetVertexColor(0.69, 0.31, 0.31, 0.75)   
    hcastbar.SafeZone = hcastbar.LatencyTexture
    frame.HorizCastbar = hcastbar

    if frame.unit ~= 'target' then
        hcastbar:HookScript("OnShow", function(self) if E.db.unitframe.hud.hideOOC and not InCombatLockdown() then H:Hide(frame,"PLAYER_REGEN_DISABLED") end end)
        hcastbar:HookScript("OnHide", function(self) if E.db.unitframe.hud.hideOOC and not InCombatLockdown() then H:Hide(frame,"PLAYER_REGEN_ENABLED") end end)
        vcastbar:HookScript("OnShow", function(self) if E.db.unitframe.hud.hideOOC and not InCombatLockdown() then H:Hide(frame,"PLAYER_REGEN_DISABLED") end end)
        vcastbar:HookScript("OnHide", function(self) if E.db.unitframe.hud.hideOOC and not InCombatLockdown() then H:Hide(frame,"PLAYER_REGEN_ENABLED") end end)
    end
    
    if (frame.unit ~= 'player' and frame.unit ~= 'target') or not self.db.units[frame.unit].horizCastbar then
        return vcastbar
    else
        return hcastbar
    end
end

-- Name element
function H:ConstructName(frame)
    self:AddElement(frame,'name')
    local name = self:ConfigureFontString(frame,'name')
    return name
end

-- Eclipse Bar for druids
function H:ConstructEclipseBar(frame)
    self:AddElement(frame,'classbars')

    local eclipseBar = self:ConfigureFrame(frame,'classbars', true)
    eclipseBar:SetFrameStrata("MEDIUM")
    eclipseBar:SetTemplate("Default")
    eclipseBar:SetFrameLevel(8)
    eclipseBar:SetBackdropBorderColor(0,0,0,0)

    local function ConfigureEclipseBar(name)
        local element = 'classbars'
        if name == nil then name = "statusbar" end
        local sbname = frame.unit..'_hud_classbars_'..name

        -- Create the status bar
        local sb = CreateFrame('StatusBar', sbname, eclipseBar)

        -- Dummy texture so we can set colors
        sb:SetStatusBarTexture(E['media'].blankTex)
        sb:GetStatusBarTexture():SetHorizTile(false)
     
        -- Frame strata/level
        sb:SetFrameStrata(eclipseBar:GetFrameStrata())
        sb:SetFrameLevel(eclipseBar:GetFrameLevel() + 5)

        if not self.units[frame.unit][element].statusbars then
            self.units[frame.unit][element].statusbars =  { }
        end

        self.units[frame.unit][element].statusbars[name] = sb
        return sb
    end
                    
    local lunarBar = ConfigureEclipseBar('lunarbar')
    lunarBar:SetPoint('BOTTOM', eclipseBar)
    lunarBar:SetOrientation('VERTICAL')
    eclipseBar.LunarBar = lunarBar

    local solarBar = ConfigureEclipseBar('solarbar')
    solarBar:SetPoint('BOTTOM', lunarBar:GetStatusBarTexture(), 'TOP')
    solarBar:SetStatusBarColor(.30, .52, .90)
    solarBar:SetOrientation('VERTICAL')
    eclipseBar.SolarBar = solarBar
    
    local eclipseBarText = self:ConfigureFontString(frame,'classbars',eclipseBar,'text')
    eclipseBarText:SetPoint("LEFT", eclipseBar, "RIGHT", E:Scale(10), 0)
    
    eclipseBar.PostUpdatePower = UF.EclipseDirection
    eclipseBar.Text = eclipseBarText

    return eclipseBar
end

function H:ConstructSubBars(frame,element,name,num)
    self:AddElement(frame,element)

    local bars = self:ConfigureFrame(frame,element,true)
    bars:SetFrameLevel(frame:GetFrameLevel() + 30)
    bars:SetTemplate("Default")
    bars:SetBackdropBorderColor(0,0,0,0)

    for i = 1, num do
        bars[i] = self:ConfigureStatusBar(frame,element,frame,name..i)
        bars[i]:SetFrameStrata("MEDIUM")
        bars[i]:SetFrameLevel(frame:GetFrameLevel() + 35)

        if i == 1 then
            bars[i]:SetPoint("BOTTOM", bars)
        else
            bars[i]:SetPoint("BOTTOM", bars[i-1], "TOP", 0, E:Scale(1))
        end
     
        bars[i]:SetOrientation('VERTICAL')
    end

    if element == 'classbars' then
        bars.value = self:ConfigureFontString(frame,element,frame)                
        bars.value:Hide()
    end

    return bars
end

-- Wild Mushroom Bar for Druids
function H:ConstructWildMushroomBar(frame)
    return self:ConstructSubBars(frame,'mushroom','wildmushroom',3)
end

-- Warlock spec bars
function H:ConstructShardBar(frame)
    return self:ConstructSubBars(frame,'classbars','shardbar',4)
end

-- Construct holy power for paladins
function H:ConstructHolyPower(frame)
    return self:ConstructSubBars(frame,'classbars','holypower',5)
end

-- Runes for death knights
function H:ConstructRunes(frame)
    return self:ConstructSubBars(frame,'classbars','rune',6)
end

-- Totems for shamans
function H:ConstructTotems(frame)
    return self:ConstructSubBars(frame,'classbars','totem',4)
end

-- Construct harmony bar for monks
function H:ConstructHarmony(frame)
   return self:ConstructSubBars(frame,'classbars','harmony',5)
end
 
-- Construct shadow orb bar for priests
function H:ConstructShadowOrbBar(frame)
    return self:ConstructSubBars(frame,'classbars','shadoworb',3)
end

-- Construct arcane bar for mages
function H:ConstructArcaneBar(frame)
    return self:ConstructSubBars(frame,'classbars','arcanecharge',4) 
end

-- Combo points for rogues and druids
function H:ConstructComboPoints(frame)
    local bars = self:ConstructSubBars(frame,'cpoints','combopoint',5)
    
    bars[1]:SetStatusBarColor(0.69, 0.31, 0.31)     
    bars[2]:SetStatusBarColor(0.69, 0.31, 0.31)
    bars[3]:SetStatusBarColor(0.65, 0.63, 0.35)
    bars[4]:SetStatusBarColor(0.65, 0.63, 0.35)
    bars[5]:SetStatusBarColor(0.33, 0.59, 0.33)
    
    bars.Override = H.ComboDisplay
    
    frame:RegisterEvent("UNIT_DISPLAYPOWER", H.ComboDisplay)
    return bars
end

function H.ConstructAuraBars(self,unit)
    local config = E.db.unitframe.hud.units[unit]['aurabars']
    local media = config.media
    local size = config.size
    local bar = self.statusBar
    
    self:SetTemplate('Default')

    bar:Size(size.width,size.height)
    local textureSetting = 'units.'..unit..'.aurabars.media.texture'
    local fontSetting = 'units.'..unit..'.aurabars.media.font'
    bar:SetStatusBarTexture(LSM:Fetch("statusbar", UF.db.statusbar))
    
    bar.spelltime:FontTemplate(LSM:Fetch("font", UF.db.font), UF.db.fontSize, "THINOUTLINE")
    bar.spellname:FontTemplate(LSM:Fetch("font", UF.db.font), UF.db.fontSize, "THINOUTLINE")

    bar.spellname:ClearAllPoints()
    bar.spellname:SetPoint('LEFT', bar, 'LEFT', 2, 0)
    
    bar.iconHolder:SetTemplate('Default')
    bar.icon:SetInside(bar.iconHolder)
    bar.icon:SetDrawLayer('OVERLAY')
    
    
    bar.iconHolder:HookScript('OnEnter', function(self)
        GameTooltip.auraBarLine = true;
    end)    
    
    bar.iconHolder:HookScript('OnLeave', function(self)
        GameTooltip.auraBarLine = nil;
        GameTooltip.numLines = nil
    end)

    bar.bg = bar:CreateTexture(nil, 'BORDER')
    bar.bg:Hide()
end

function H:ConstructPlayerAuraBars()
    H.ConstructAuraBars(self,"player")
end

function H:ConstructTargetAuraBars()
    H.ConstructAuraBars(self,"target")
end

function H:ConstructAuraBarHeader(frame)
    self:AddElement(frame,'aurabars')
    local auraBar = self:ConfigureFrame(frame,'aurabars')

    if frame.unit == "player" then
        auraBar.PostCreateBar = H.ConstructPlayerAuraBars
    else
        auraBar.PostCreateBar = H.ConstructTargetAuraBars
    end
    auraBar.PostUpdate = UF.ColorizeAuraBars
    auraBar.gap = 1
    auraBar.spacing = 1
    auraBar.spark = true
    auraBar.sort = true
    auraBar.debuffColor = {0.8, 0.1, 0.1}
    auraBar.filter = self.AuraBarFilter
    
    local healthColor = UF.db.colors.health

    auraBar.friendlyAuraType = 'HELPFUL'
    auraBar.enemyAuraType = 'HARMFUL'
    auraBar.buffColor = {healthColor.r, healthColor.b, healthColor.g}
    auraBar.down = true
    
    return auraBar
end

function H:ConstructRaidIcon(frame)
    self:AddElement(frame,'raidicon')
    local f = CreateFrame('Frame', nil, frame)
    f:SetFrameLevel(20)
    
    local tex = f:CreateTexture(nil, "OVERLAY")
    tex:SetTexture([[Interface\TargetingFrame\UI-RaidTargetingIcons]])
    tex:Size(12)

    return tex
end

function H:ConstructRestingIndicator(frame)
    self:AddElement(frame,'resting')
    local resting = frame:CreateTexture(nil, "OVERLAY")
    resting:Size(16)
    
    return resting
end

function H:ConstructCombatIndicator(frame)
    self:AddElement(frame,'combat')
    local combat = frame:CreateTexture(nil, "OVERLAY")
    combat:Size(13)
    combat:SetVertexColor(0.69, 0.31, 0.31)
    
    return combat
end

function H:ConstructPvPIndicator(frame)
    self:AddElement(frame,'pvp')
    local pvp = self:ConfigureFontString(frame,'pvp')
    pvp:SetTextColor(0.69, 0.31, 0.31)
    
    return pvp
end

function H:ConstructHealComm(frame)
    self:AddElement(frame,'healcomm')
    local mhpb = self:ConfigureStatusBar(frame,'healcomm',frame,'mybar')
    mhpb:SetStatusBarColor(0, 1, 0.5, 0.25)
    mhpb:SetFrameLevel(frame.Health:GetFrameLevel() - 2)
    mhpb:Hide()
    
    local ohpb = self:ConfigureStatusBar(frame,'healcomm',frame,'otherbar')
    ohpb:SetStatusBarColor(0, 1, 0, 0.25)
    mhpb:SetFrameLevel(mhpb:GetFrameLevel())    
    ohpb:Hide()
    
    if frame.Health then
        ohpb:SetParent(frame.Health)
        mhpb:SetParent(frame.Health)
    end
    
    return {
        myBar = mhpb,
        otherBar = ohpb,
        maxOverflow = 1,
        PostUpdate = function(self)
            if self.myBar:GetValue() == 0 then self.myBar:SetAlpha(0) else self.myBar:SetAlpha(1) end
            if self.otherBar:GetValue() == 0 then self.otherBar:SetAlpha(0) else self.otherBar:SetAlpha(1) end
        end
    }
end

function H:ConstructGCD(frame)
    self:AddElement(frame,'gcd')
    local GCD = self:ConfigureStatusBar(frame,'gcd')
    GCD:SetStatusBarColor(.8,.8,.8,0)
    GCD:SetAlpha(1)
    GCD:SetOrientation('VERTICAL')
    GCD:SetFrameStrata(frame.Power:GetFrameStrata())
    GCD:SetFrameLevel(frame.Power:GetFrameLevel()+2)
    
    GCD.Spark = GCD:CreateTexture(frame:GetName().."_GCDSpark", "OVERLAY")
    GCD.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
    GCD.Spark:SetVertexColor(1,1,1)
    GCD.Spark:Height(12)
    GCD.Spark:Point('CENTER',GCD:GetStatusBarTexture(),'TOP')
    GCD.Spark:SetBlendMode("ADD")

    return GCD
end

function H:ConstructDebuffs(frame)
    self:AddElement(frame,'debuffs')
    local debuffs = self:ConfigureFrame(frame,'debuffs')

    debuffs.size = 26
    debuffs.num = 36

    debuffs.spacing = 2
    debuffs.initialAnchor = "TOPRIGHT"
    debuffs["growth-y"] = "UP"
    debuffs["growth-x"] = "LEFT"
    debuffs.PostCreateIcon = self.PostCreateAura
    debuffs.PostUpdateIcon = self.PostUpdateAura       
    debuffs.CustomFilter = self.AuraFilter
    debuffs.type = 'debuffs'

    -- an option to show only our debuffs on target
    --[[if unit == "target" then
        debuffs.onlyShowPlayer = C.unitframes.onlyselfdebuffs
    end]]
    return debuffs
end

function H:ConstructBuffs(frame)
    self:AddElement(frame,'buffs')
    local buffs = self:ConfigureFrame(frame,'buffs')
                        
    buffs.size = 26
    buffs.num = 36
    buffs.numRow = 9
                            
    buffs.spacing = 2
    buffs.initialAnchor = "TOPLEFT"
    buffs.PostCreateIcon = H.PostCreateAura
    buffs.PostUpdateIcon = H.PostUpdateAura
    buffs.CustomFilter = self.AuraFilter
    buffs.type = 'buffs'

    return buffs
end 