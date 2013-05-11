local Gladius = _G.Gladius
if not Gladius then
  DEFAULT_CHAT_FRAME:AddMessage(format("Module %s requires Gladius", "Auras"))
end
local L = Gladius.L
local LSM

-- global functions
local strfind = string.find
local pairs = pairs
local UnitAura, GetSpellInfo = UnitAura, GetSpellInfo
local ceil = math.ceil

local Auras = Gladius:NewModule("Auras", false, true, {
   aurasBuffsAttachTo = "CastBar",
   aurasBuffsAnchor = "TOPLEFT",
   aurasBuffsRelativePoint = "BOTTOMLEFT",
   aurasBuffs = false,
   aurasBuffsGrow = "DOWNRIGHT",
   aurasBuffsSpacingX = 0,
   aurasBuffsSpacingY = 0,
   aurasBuffsPerColumn = 10,
   aurasBuffsMax = 20,
   aurasBuffsHeight = 16,
   aurasBuffsWidth = 16,
   aurasBuffsOffsetX = 0,
   aurasBuffsOffsetY = 0,
   aurasBuffsGloss = false,
   aurasBuffsGlossColor = { r = 1, g = 1, b = 1, a = 0.4 },
   
   aurasDebuffsAttachTo = "ClassIcon",
   aurasDebuffsAnchor = "BOTTOMLEFT",
   aurasDebuffsRelativePoint = "TOPLEFT",
   aurasDebuffs = false,
   aurasDebuffsGrow = "UPRIGHT",
   aurasDebuffsSpacingX = 0,
   aurasDebuffsSpacingY = 0,
   aurasDebuffsPerColumn = 10,
   aurasDebuffsMax = 20,
   aurasDebuffsHeight = 16,
   aurasDebuffsWidth = 16,
   aurasDebuffsOffsetX = 0,
   aurasDebuffsOffsetY = 0,
   aurasDebuffsGloss = false,
   aurasDebuffsGlossColor = { r = 1, g = 1, b = 1, a = 0.4 },
   
   aurasImportantAuras = true,
   aurasFrameAuras = nil,
}, {"Bottom Single Row"})

function Auras:OnEnable()   
   self:RegisterEvent("UNIT_AURA")
   
   LSM = Gladius.LSM   
   
   self.buffFrame = self.buffFrame or {}
   self.debuffFrame = self.debuffFrame or {}
   
   -- set auras
   Gladius.db.aurasFrameAuras = Gladius.db.aurasFrameAuras or self:GetAuraList()
end

function Auras:OnDisable()
   self:UnregisterAllEvents()
   
   for unit in pairs(self.debuffFrame) do
      self.debuffFrame[unit]:Hide()
   end
   
   for unit in pairs(self.buffFrame) do
      self.buffFrame[unit]:Hide()
   end
end

function Auras:SetTemplate(template)
   if (template == 1) then
      Gladius.db.aurasBuffsGrow = "DOWNRIGHT"
      Gladius.db.aurasBuffsAttachTo = "CastBar"
      Gladius.db.aurasBuffsRelativePoint = "BOTTOMLEFT"
      Gladius.db.aurasBuffsAnchor = "TOPLEFT"
      Gladius.db.aurasBuffsSpacingX = 1
      Gladius.db.aurasBuffsHeight = 17
      Gladius.db.aurasBuffsMax = Gladius.db.modules.Trinket and 8 or 6
      Gladius.db.aurasBuffsOffsetY = -1

      Gladius.db.aurasDebuffsGrow = "DOWNLEFT"
      Gladius.db.aurasDebuffsAttachTo = "Trinket"
      Gladius.db.aurasDebuffsRelativePoint = "BOTTOMRIGHT"
      Gladius.db.aurasDebuffsAnchor = "TOPRIGHT"
      Gladius.db.aurasDebuffsSpacingX = 1
      Gladius.db.aurasDebuffsHeight = 17
      Gladius.db.aurasDebuffsMax = Gladius.db.modules.Trinket and 8 or 6
      Gladius.db.aurasDebuffsOffsetY = -1
   end
end

function Auras:GetAttachTo()
   return Gladius.db.aurasAttachTo
end

function Auras:GetFrame(unit)
   return self.buffFrame[unit]
end

function Auras:GetIndicatorHeight()
   local height = 0
   
   if (Gladius.db.aurasBuffs) then
      height = height + Gladius.db.aurasBuffsHeight * ceil(Gladius.db.aurasBuffsMax / Gladius.db.aurasBuffsPerColumn)
   end
   
   if (Gladius.db.aurasDebuffs) then
      height = height + Gladius.db.aurasDebuffsHeight * ceil(Gladius.db.aurasDebuffsMax / Gladius.db.aurasDebuffsPerColumn)
   end
   
   return height
end

function Auras:UNIT_AURA(event, unit)
   if (not strfind(unit, "arena") or strfind(unit, "pet")) then return end
   
   -- buff frame
   for i=1, 40 do
      local name, rank, icon, count, dispelType, duration, expires, caster, isStealable = UnitAura(unit, i, "HELPFUL")     
	  if (self.buffFrame[unit] == nil) then break end
      if (not self.buffFrame[unit][i]) then break end
      
      if (name) then       
         self.buffFrame[unit][i].texture:SetTexture(icon)
         Gladius:Call(Gladius.modules.Timer, "SetTimer", self.buffFrame[unit][i], duration)  
         
         self.buffFrame[unit][i]:SetAlpha(1)
      else
         self.buffFrame[unit][i]:SetAlpha(0)
      end
   end
   
   -- debuff frame
   for i=1, 40 do
      local name, rank, icon, count, dispelType, duration, expires, caster, isStealable = UnitAura(unit, i, "HARMFUL")
      
      if (not self.debuffFrame[unit][i]) then break end
      
      if (name) then       
         self.debuffFrame[unit][i].texture:SetTexture(icon)
         Gladius:Call(Gladius.modules.Timer, "SetTimer", self.debuffFrame[unit][i], duration)  
         
         self.debuffFrame[unit][i]:SetAlpha(1)
      else
         self.debuffFrame[unit][i]:SetAlpha(0)
      end
   end
end

local function updateTooltip(f, unit, index, filter)
   if (GameTooltip:IsOwned(f)) then
		GameTooltip:SetUnitAura(unit, index, filter)
	end
end

function Auras:CreateFrame(unit)
   local button = Gladius.buttons[unit]
   if (not button) then return end       
   
   -- create buff frame
   if (not self.buffFrame[unit] and Gladius.db.aurasBuffs) then
      self.buffFrame[unit] = CreateFrame("Frame", "Gladius" .. self.name .. "BuffFrame" .. unit, button)
            
      for i=1, 40 do
         self.buffFrame[unit][i] = CreateFrame("CheckButton", "Gladius" .. self.name .. "BuffFrameIcon" .. i .. unit, button, "ActionButtonTemplate")
         self.buffFrame[unit][i]:SetScript("OnEnter", function(f) 
            GameTooltip:SetUnitAura(unit, i, "HELPFUL")
            f:SetScript("OnUpdate", function(f)
               updateTooltip(f, unit, i, "HELPFUL")
            end)
         end)
         self.buffFrame[unit][i]:SetScript("OnLeave", function(f)
            f:SetScript("OnUpdate", nil)
            GameTooltip:Hide()
         end)
         self.buffFrame[unit][i]:EnableMouse(false)
         self.buffFrame[unit][i]:SetNormalTexture("Interface\\AddOns\\Gladius\\images\\gloss")
         self.buffFrame[unit][i].texture = _G[self.buffFrame[unit][i]:GetName().."Icon"]
         self.buffFrame[unit][i].normalTexture = _G[self.buffFrame[unit][i]:GetName().."NormalTexture"]
         self.buffFrame[unit][i].cooldown = _G[self.buffFrame[unit][i]:GetName().."Cooldown"]
         self.buffFrame[unit][i].cooldown:SetReverse(false)
         
         Gladius:Call(Gladius.modules.Timer, "RegisterTimer", self.buffFrame[unit][i])
      end
   end
   
   -- create debuff frame
   if (not self.debuffFrame[unit] and Gladius.db.aurasDebuffs) then
      self.debuffFrame[unit] = CreateFrame("Frame", "Gladius" .. self.name .. "DebuffFrame" .. unit, button)
      self.debuffFrame[unit]:EnableMouse(false)
      
      for i=1, 40 do
         self.debuffFrame[unit][i] = CreateFrame("CheckButton", "Gladius" .. self.name .. "DebuffFrameIcon" .. i .. unit, button, "ActionButtonTemplate")
         self.debuffFrame[unit][i]:SetScript("OnEnter", function(f) 
            GameTooltip:SetUnitAura(unit, i, "HARMFUL")
            f:SetScript("OnUpdate", function(f)
               updateTooltip(f, unit, i, "HARMFUL")
            end)
         end)
         self.debuffFrame[unit][i]:SetScript("OnLeave", function(f)
            f:SetScript("OnUpdate", nil)
            GameTooltip:Hide()
         end)
         self.debuffFrame[unit][i]:EnableMouse(false)
         self.debuffFrame[unit][i]:SetNormalTexture("Interface\\AddOns\\Gladius\\images\\gloss")
         self.debuffFrame[unit][i].texture = _G[self.debuffFrame[unit][i]:GetName().."Icon"]
         self.debuffFrame[unit][i].normalTexture = _G[self.debuffFrame[unit][i]:GetName().."NormalTexture"]
         self.debuffFrame[unit][i].cooldown = _G[self.debuffFrame[unit][i]:GetName().."Cooldown"]
         self.debuffFrame[unit][i].cooldown:SetReverse(false)
         
         Gladius:Call(Gladius.modules.Timer, "RegisterTimer", self.debuffFrame[unit][i])
      end
   end
   
   if (not Gladius.test) then
      self:UNIT_AURA(nil, unit)
   end
end

function Auras:Update(unit)   
   Gladius.db.aurasFrameAuras = Gladius.db.aurasFrameAuras or self:GetAuraList()

   -- create frame
   if (not self.buffFrame[unit] or not self.debuffFrame[unit]) then 
      self:CreateFrame(unit)
   end
   
   -- update buff frame 
   if (Gladius.db.aurasBuffs) then  
      self.buffFrame[unit]:ClearAllPoints()
      
      -- anchor point 
      local parent = Gladius:GetParent(unit, Gladius.db.aurasBuffsAttachTo)     
      self.buffFrame[unit]:SetPoint(Gladius.db.aurasBuffsAnchor, parent, Gladius.db.aurasBuffsRelativePoint, Gladius.db.aurasBuffsOffsetX, Gladius.db.aurasBuffsOffsetY)

      -- size
      self.buffFrame[unit]:SetWidth(Gladius.db.aurasBuffsWidth*Gladius.db.aurasBuffsPerColumn+Gladius.db.aurasBuffsSpacingX*Gladius.db.aurasBuffsPerColumn)
      self.buffFrame[unit]:SetHeight(Gladius.db.aurasBuffsHeight*math.ceil(Gladius.db.aurasBuffsMax/Gladius.db.aurasBuffsPerColumn)+(Gladius.db.aurasBuffsSpacingY*(math.ceil(Gladius.db.aurasBuffsMax/Gladius.db.aurasBuffsPerColumn)+1)))
      
      -- icon points
      local anchor, parent, relativePoint, offsetX, offsetY
      local start, startAnchor = 1, self.buffFrame[unit]
      
      -- grow anchor
      local grow1, grow2, grow3, startRelPoint
      if (Gladius.db.aurasBuffsGrow == "DOWNRIGHT") then
         grow1, grow2, grow3, startRelPoint = "TOPLEFT", "BOTTOMLEFT", "TOPRIGHT", "TOPLEFT"
      elseif (Gladius.db.aurasBuffsGrow == "DOWNLEFT") then
         grow1, grow2, grow3, startRelPoint = "TOPRIGHT", "BOTTOMRIGHT", "TOPLEFT", "TOPRIGHT"
      elseif (Gladius.db.aurasBuffsGrow == "UPRIGHT") then
         grow1, grow2, grow3, startRelPoint = "BOTTOMLEFT", "TOPLEFT", "BOTTOMRIGHT", "BOTTOMLEFT"
      elseif (Gladius.db.aurasBuffsGrow == "UPLEFT") then
         grow1, grow2, grow3, startRelPoint = "BOTTOMRIGHT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT"
      end
            
      for i=1, 40 do
         self.buffFrame[unit][i]:ClearAllPoints()
         
         if (Gladius.db.aurasBuffsMax >= i) then        
            if (start == 1) then
               anchor, parent, relativePoint, offsetX, offsetY = grow1, startAnchor, startRelPoint, 0, strfind(Gladius.db.aurasBuffsGrow, "DOWN") and -Gladius.db.aurasBuffsSpacingY or Gladius.db.aurasBuffsSpacingY                  
            else
               anchor, parent, relativePoint, offsetX, offsetY = grow1, self.buffFrame[unit][i-1], grow3, strfind(Gladius.db.aurasBuffsGrow, "LEFT") and -Gladius.db.aurasBuffsSpacingX or Gladius.db.aurasBuffsSpacingX, 0                                
               
               if (start == Gladius.db.aurasBuffsPerColumn) then
                  start = 0
                  startAnchor = self.buffFrame[unit][i - Gladius.db.aurasBuffsPerColumn + 1]
                  startRelPoint = grow2
               end
            end
            
            start = start + 1
         end
      
         self.buffFrame[unit][i]:SetPoint(anchor, parent, relativePoint, offsetX, offsetY)
         
         self.buffFrame[unit][i]:SetWidth(Gladius.db.aurasBuffsWidth)
         self.buffFrame[unit][i]:SetHeight(Gladius.db.aurasBuffsHeight)
         
         -- style action button   
         self.buffFrame[unit][i].normalTexture:SetHeight(self.buffFrame[unit][i]:GetHeight() + self.buffFrame[unit][i]:GetHeight() * 0.4)
         self.buffFrame[unit][i].normalTexture:SetWidth(self.buffFrame[unit][i]:GetWidth() + self.buffFrame[unit][i]:GetWidth() * 0.4)
         
         self.buffFrame[unit][i].normalTexture:ClearAllPoints()
         self.buffFrame[unit][i].normalTexture:SetPoint("CENTER", 0, 0)
         self.buffFrame[unit][i]:SetNormalTexture("Interface\\AddOns\\Gladius\\images\\gloss")
         
         self.buffFrame[unit][i].texture:ClearAllPoints()
         self.buffFrame[unit][i].texture:SetPoint("TOPLEFT", self.buffFrame[unit][i], "TOPLEFT")
         self.buffFrame[unit][i].texture:SetPoint("BOTTOMRIGHT", self.buffFrame[unit][i], "BOTTOMRIGHT")
         
         self.buffFrame[unit][i].normalTexture:SetVertexColor(Gladius.db.aurasBuffsGlossColor.r, Gladius.db.aurasBuffsGlossColor.g, 
            Gladius.db.aurasBuffsGlossColor.b, Gladius.db.aurasBuffsGloss and Gladius.db.aurasBuffsGlossColor.a or 0)
      end
      
      -- hide
      self.buffFrame[unit]:SetAlpha(0)
   end  
   
   -- update debuff frame 
   if (Gladius.db.aurasDebuffs) then  
      self.debuffFrame[unit]:ClearAllPoints()
      
      -- anchor point 
      local parent = Gladius:GetParent(unit, Gladius.db.aurasDebuffsAttachTo)     
      self.debuffFrame[unit]:SetPoint(Gladius.db.aurasDebuffsAnchor, parent, Gladius.db.aurasDebuffsRelativePoint, Gladius.db.aurasDebuffsOffsetX, Gladius.db.aurasDebuffsOffsetY)

      -- size
      self.debuffFrame[unit]:SetWidth(Gladius.db.aurasDebuffsWidth*Gladius.db.aurasDebuffsPerColumn+Gladius.db.aurasDebuffsSpacingX*Gladius.db.aurasDebuffsPerColumn)
      self.debuffFrame[unit]:SetHeight(Gladius.db.aurasDebuffsHeight*math.ceil(Gladius.db.aurasDebuffsMax/Gladius.db.aurasDebuffsPerColumn)+(Gladius.db.aurasDebuffsSpacingY*(math.ceil(Gladius.db.aurasDebuffsMax/Gladius.db.aurasDebuffsPerColumn)+1)))

      -- icon points
      local anchor, parent, relativePoint, offsetX, offsetY
      local start, startAnchor = 1, self.debuffFrame[unit]
      
      -- grow anchor
      local grow1, grow2, grow3, startRelPoint
      if (Gladius.db.aurasDebuffsGrow == "DOWNRIGHT") then
         grow1, grow2, grow3, startRelPoint = "TOPLEFT", "BOTTOMLEFT", "TOPRIGHT", "TOPLEFT"
      elseif (Gladius.db.aurasDebuffsGrow == "DOWNLEFT") then
         grow1, grow2, grow3, startRelPoint = "TOPRIGHT", "BOTTOMRIGHT", "TOPLEFT", "TOPRIGHT"
      elseif (Gladius.db.aurasDebuffsGrow == "UPRIGHT") then
         grow1, grow2, grow3, startRelPoint = "BOTTOMLEFT", "TOPLEFT", "BOTTOMRIGHT", "BOTTOMLEFT"
      elseif (Gladius.db.aurasDebuffsGrow == "UPLEFT") then
         grow1, grow2, grow3, startRelPoint = "BOTTOMRIGHT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT"
      end
            
      for i=1, 40 do
         self.debuffFrame[unit][i]:ClearAllPoints()
         
         if (Gladius.db.aurasDebuffsMax >= i) then        
            if (start == 1) then
               anchor, parent, relativePoint, offsetX, offsetY = grow1, startAnchor, startRelPoint, 0, strfind(Gladius.db.aurasDebuffsGrow, "DOWN") and -Gladius.db.aurasDebuffsSpacingY or Gladius.db.aurasDebuffsSpacingY                  
            else
               anchor, parent, relativePoint, offsetX, offsetY = grow1, self.debuffFrame[unit][i-1], grow3, strfind(Gladius.db.aurasDebuffsGrow, "LEFT") and -Gladius.db.aurasDebuffsSpacingX or Gladius.db.aurasDebuffsSpacingX, 0                                
               
               if (start == Gladius.db.aurasDebuffsPerColumn) then
                  start = 0
                  startAnchor = self.debuffFrame[unit][i - Gladius.db.aurasDebuffsPerColumn + 1]
                  startRelPoint = grow2
               end
            end
            
            start = start + 1
         end
      
         self.debuffFrame[unit][i]:SetPoint(anchor, parent, relativePoint, offsetX, offsetY)
         
         self.debuffFrame[unit][i]:SetWidth(Gladius.db.aurasDebuffsWidth)
         self.debuffFrame[unit][i]:SetHeight(Gladius.db.aurasDebuffsHeight)
         
         -- style action button   
         self.debuffFrame[unit][i].normalTexture:SetHeight(self.debuffFrame[unit][i]:GetHeight() + self.debuffFrame[unit][i]:GetHeight() * 0.4)
         self.debuffFrame[unit][i].normalTexture:SetWidth(self.debuffFrame[unit][i]:GetWidth() + self.debuffFrame[unit][i]:GetWidth() * 0.4)
         
         self.debuffFrame[unit][i].normalTexture:ClearAllPoints()
         self.debuffFrame[unit][i].normalTexture:SetPoint("CENTER", 0, 0)
         self.debuffFrame[unit][i]:SetNormalTexture("Interface\\AddOns\\Gladius\\images\\gloss")
         
         self.debuffFrame[unit][i].texture:ClearAllPoints()
         self.debuffFrame[unit][i].texture:SetPoint("TOPLEFT", self.debuffFrame[unit][i], "TOPLEFT")
         self.debuffFrame[unit][i].texture:SetPoint("BOTTOMRIGHT", self.debuffFrame[unit][i], "BOTTOMRIGHT")
         
         self.debuffFrame[unit][i].normalTexture:SetVertexColor(Gladius.db.aurasDebuffsGlossColor.r, Gladius.db.aurasDebuffsGlossColor.g, 
            Gladius.db.aurasDebuffsGlossColor.b, Gladius.db.aurasDebuffsGloss and Gladius.db.aurasDebuffsGlossColor.a or 0)
      end
      
      -- hide
      self.debuffFrame[unit]:SetAlpha(0)
   end
   
   -- event
   if (not Gladius.db.aurasDebuffs and not Gladius.db.aurasBuffs) then
      self:UnregisterAllEvents()
   else
      self:RegisterEvent("UNIT_AURA")
   end
end

function Auras:Show(unit)
   local testing = Gladius.test
      
   -- show buff frame
   if (self.buffFrame[unit]) then 
      self.buffFrame[unit]:SetAlpha(1)
      
      for i=1, Gladius.db.aurasBuffsMax do
         self.buffFrame[unit][i]:SetAlpha(1)
      end
   end
   
   -- show debuff frame
   if (self.debuffFrame[unit]) then
      self.debuffFrame[unit]:SetAlpha(1)
      
      for i=1, Gladius.db.aurasDebuffsMax do
         self.debuffFrame[unit][i]:SetAlpha(1)
      end
   end
end

function Auras:Reset(unit)  
   if (self.buffFrame[unit]) then 
      -- hide buff frame
      self.buffFrame[unit]:SetAlpha(0)
      
      for i=1, 40 do
         self.buffFrame[unit][i].texture:SetTexture("")
         self.buffFrame[unit][i]:SetAlpha(0)
      end
   end
   
   if (self.debuffFrame[unit]) then 
      -- hide debuff frame
      self.debuffFrame[unit]:SetAlpha(0)
      
      for i=1, 40 do
         self.debuffFrame[unit][i].texture:SetTexture("")
         self.debuffFrame[unit][i]:SetAlpha(0)
      end
   end
end

function Auras:Test(unit)   
   -- test buff frame
   if (self.buffFrame[unit]) then
      for i=1, Gladius.db.aurasBuffsMax do
         self.buffFrame[unit][i].texture:SetTexture(GetSpellTexture(21562))
      end
   end
   
   -- test debuff frame
   if (self.debuffFrame[unit]) then
      for i=1, Gladius.db.aurasDebuffsMax do
         self.debuffFrame[unit][i].texture:SetTexture(GetSpellTexture(589))
      end
   end
end

function Auras:GetOptions()
   Gladius.db.aurasFrameAuras = Gladius.db.aurasFrameAuras or self:GetAuraList()
   
   local options = {
      buffs = {  
         type="group",
         name=L["Buffs"],
         childGroups="tab",
         order=1,
         args = {
            general = {  
               type="group",
               name=L["General"],
               order=1,
               args = {
                  widget = {
                     type="group",
                     name=L["Widget"],
                     desc=L["Widget settings"],  
                     inline=true,                
                     order=1,
                     args = { 
                        aurasBuffs = {
                           type="toggle",
                           name=L["Auras Buffs"],
                           desc=L["Toggle aura buffs"],
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=5,
                        },
                        aurasBuffsGrow = {
                           type="select",
                           name=L["Auras Column Grow"],
                           desc=L["Grow direction of the auras"],
                           values=function() return {
                              ["UPLEFT"] = L["Up Left"],
                              ["UPRIGHT"] = L["Up Right"],
                              ["DOWNLEFT"] = L["Down Left"],
                              ["DOWNRIGHT"] = L["Down Right"],
                           }
                           end,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=10,
                        }, 
                        sep = {                     
                           type = "description",
                           name="",
                           width="full",
                           order=13,
                        },                        
                        aurasBuffsPerColumn = {
                           type="range",
                           name=L["Aura Icons Per Column"],
                           desc=L["Number of aura icons per column"],
                           min=1, max=50, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=15,
                        },
                        aurasBuffsMax = {
                           type="range",
                           name=L["Aura Icons Max"],
                           desc=L["Number of max buffs"],
                           min=1, max=40, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=20,
                        },  
                        sep2 = {                     
                           type = "description",
                           name="",
                           width="full",
                           order=23,
                        },   
                        aurasBuffsGloss = {
                           type="toggle",
                           name=L["Auras Gloss"],
                           desc=L["Toggle gloss on the auras icon"],
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           hidden=function() return not Gladius.db.advancedOptions end,
                           order=25,
                        },
                        aurasBuffsGlossColor = {
                           type="color",
                           name=L["Auras Gloss Color"],
                           desc=L["Color of the auras icon gloss"],
                           get=function(info) return Gladius:GetColorOption(info) end,
                           set=function(info, r, g, b, a) return Gladius:SetColorOption(info, r, g, b, a) end,
                           hasAlpha=true,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           hidden=function() return not Gladius.db.advancedOptions end,
                           order=30,
                        },
                     },
                  },
                  size = {
                     type="group",
                     name=L["Size"],
                     desc=L["Size settings"],  
                     inline=true,                
                     order=2,
                     args = {
                        aurasBuffsWidth = {
                           type="range",
                           name=L["Aura Icon Width"],
                           desc=L["Width of the aura icons"],
                           min=10, max=100, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=5,
                        },
                        aurasBuffsHeight = {
                           type="range",
                           name=L["Aura Icon Height"],
                           desc=L["Height of the aura icon"],
                           min=10, max=100, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=10,
                        },   
                        sep = {                     
                           type = "description",
                           name="",
                           width="full",
                           order=13,
                        },
                        aurasBuffsSpacingY = {
                           type="range",
                           name=L["Auras Spacing Vertical"],
                           desc=L["Vertical spacing of the auras"],
                           min=0, max=30, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=15,
                        },
                        aurasBuffsSpacingX = {
                           type="range",
                           name=L["Auras Spacing Horizontal"],
                           desc=L["Horizontal spacing of the auras"],
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           min=0, max=30, step=1,
                           order=20,
                        },             
                     },
                  },
                  position = {
                     type="group",
                     name=L["Position"],
                     desc=L["Position settings"],  
                     inline=true,                
                     hidden=function() return not Gladius.db.advancedOptions end,
                     order=3,
                     args = {
                        aurasBuffsAttachTo = {
                           type="select",
                           name=L["Auras Attach To"],
                           desc=L["Attach auras to the given frame"],
                           values=function() return Gladius:GetModules(self.name) end,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           width="double",
                           order=5,
                        },
                        sep = {                     
                           type = "description",
                           name="",
                           width="full",
                           order=7,
                        },
                        aurasBuffsAnchor = {
                           type="select",
                           name=L["Auras Anchor"],
                           desc=L["Anchor of the auras"],
                           values=function() return Gladius:GetPositions() end,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=10,
                        },
                        aurasBuffsRelativePoint = {
                           type="select",
                           name=L["Auras Relative Point"],
                           desc=L["Relative point of the auras"],
                           values=function() return Gladius:GetPositions() end,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=15,               
                        },
                        sep2 = {                     
                           type = "description",
                           name="",
                           width="full",
                           order=17,
                        },
                        aurasBuffsOffsetX = {
                           type="range",
                           name=L["Auras Offset X"],
                           desc=L["X offset of the auras"],
                           min=-100, max=100, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=20,
                        },
                        aurasBuffsOffsetY = {
                           type="range",
                           name=L["Auras Offset Y"],
                           desc=L["Y  offset of the auras"],
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           min=-50, max=50, step=1,
                           order=25,
                        },
                     },
                  },
               },
            },
            --[[filter = {  
               type="group",
               name=L["Filter"],
               childGroups="tree",
               hidden=function() return not Gladius.db.advancedOptions end,
               order=2,
               args = {
                  whitelist = {  
                     type="group",
                     name=L["Whitelist"],
                     order=1,
                     args = {
                     },
                  },
                  blacklist = {  
                     type="group",
                     name=L["Blacklist"],
                     order=2,
                     args = {
                     },
                  },
                  filterFunction = {  
                     type="group",
                     name=L["Filter Function"],
                     order=3,
                     args = {
                     },
                  },
               },
            },]]
         },
      },
      debuffs = {  
         type="group",
         name=L["Debuffs"],
         childGroups="tab",
         order=2,
         args = {
            general = {  
               type="group",
               name=L["General"],
               order=1,
               args = {
                  widget = {
                     type="group",
                     name=L["Widget"],
                     desc=L["Widget settings"],  
                     inline=true,                
                     order=1,
                     args = { 
                        aurasDebuffs = {
                           type="toggle",
                           name=L["Auras Debuffs"],
                           desc=L["Toggle aura debuffs"],
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=5,
                        },
                        aurasDebuffsGrow = {
                           type="select",
                           name=L["Auras Column Grow"],
                           desc=L["Grow direction of the auras"],
                           values=function() return {
                              ["UPLEFT"] = L["Up Left"],
                              ["UPRIGHT"] = L["Up Right"],
                              ["DOWNLEFT"] = L["Down Left"],
                              ["DOWNRIGHT"] = L["Down Right"],
                           }
                           end,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=10,
                        }, 
                        sep = {                     
                           type = "description",
                           name="",
                           width="full",
                           order=13,
                        },                        
                        aurasDebuffsPerColumn = {
                           type="range",
                           name=L["Aura Icons Per Column"],
                           desc=L["Number of aura icons per column"],
                           min=1, max=50, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=15,
                        },
                        aurasDebuffsMax = {
                           type="range",
                           name=L["Aura Icons Max"],
                           desc=L["Number of max Debuffs"],
                           min=1, max=40, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=20,
                        },  
                        sep2 = {                     
                           type = "description",
                           name="",
                           width="full",
                           order=23,
                        },   
                        aurasDebuffsGloss = {
                           type="toggle",
                           name=L["Auras Gloss"],
                           desc=L["Toggle gloss on the auras icon"],
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           hidden=function() return not Gladius.db.advancedOptions end,
                           order=25,
                        },
                        aurasDebuffsGlossColor = {
                           type="color",
                           name=L["Auras Gloss Color"],
                           desc=L["Color of the auras icon gloss"],
                           get=function(info) return Gladius:GetColorOption(info) end,
                           set=function(info, r, g, b, a) return Gladius:SetColorOption(info, r, g, b, a) end,
                           hasAlpha=true,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           hidden=function() return not Gladius.db.advancedOptions end,
                           order=30,
                        },
                     },
                  },
                  size = {
                     type="group",
                     name=L["Size"],
                     desc=L["Size settings"],  
                     inline=true,                
                     order=2,
                     args = {
                        aurasDebuffsWidth = {
                           type="range",
                           name=L["Aura Icon Width"],
                           desc=L["Width of the aura icons"],
                           min=10, max=100, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=5,
                        },
                        aurasDebuffsHeight = {
                           type="range",
                           name=L["Aura Icon Height"],
                           desc=L["Height of the aura icon"],
                           min=10, max=100, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=10,
                        },   
                        sep = {                     
                           type = "description",
                           name="",
                           width="full",
                           order=13,
                        },
                        aurasDebuffsSpacingY = {
                           type="range",
                           name=L["Auras Spacing Vertical"],
                           desc=L["Vertical spacing of the auras"],
                           min=0, max=30, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=15,
                        },
                        aurasDebuffsSpacingX = {
                           type="range",
                           name=L["Auras Spacing Horizontal"],
                           desc=L["Horizontal spacing of the auras"],
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           min=0, max=30, step=1,
                           order=20,
                        },             
                     },
                  },
                  position = {
                     type="group",
                     name=L["Position"],
                     desc=L["Position settings"],  
                     inline=true,                
                     hidden=function() return not Gladius.db.advancedOptions end,
                     order=3,
                     args = {
                        aurasDebuffsAttachTo = {
                           type="select",
                           name=L["Auras Attach To"],
                           desc=L["Attach auras to the given frame"],
                           values=function() return Gladius:GetModules(self.name) end,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           width="double",
                           order=5,
                        },
                        sep = {                     
                           type = "description",
                           name="",
                           width="full",
                           order=7,
                        },
                        aurasDebuffsAnchor = {
                           type="select",
                           name=L["Auras Anchor"],
                           desc=L["Anchor of the auras"],
                           values=function() return Gladius:GetPositions() end,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=10,
                        },
                        aurasDebuffsRelativePoint = {
                           type="select",
                           name=L["Auras Relative Point"],
                           desc=L["Relative point of the auras"],
                           values=function() return Gladius:GetPositions() end,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=15,               
                        },
                        sep2 = {                     
                           type = "description",
                           name="",
                           width="full",
                           order=17,
                        },
                        aurasDebuffsOffsetX = {
                           type="range",
                           name=L["Auras Offset X"],
                           desc=L["X offset of the auras"],
                           min=-100, max=100, step=1,
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           order=20,
                        },
                        aurasDebuffsOffsetY = {
                           type="range",
                           name=L["Auras Offset Y"],
                           desc=L["Y  offset of the auras"],
                           disabled=function() return not Gladius.dbi.profile.modules[self.name] end,
                           min=-50, max=50, step=1,
                           order=25,
                        },
                     },
                  },
               },
            },
            --[[filter = {  
               type="group",
               name=L["Filter"],
               childGroups="tree",
               hidden=function() return not Gladius.db.advancedOptions end,
               order=2,
               args = {
                  whitelist = {  
                     type="group",
                     name=L["Whitelist"],
                     order=1,
                     args = {
                     },
                  },
                  blacklist = {  
                     type="group",
                     name=L["Blacklist"],
                     order=2,
                     args = {
                     },
                  },
                  filterFunction = {  
                     type="group",
                     name=L["Filter Function"],
                     order=3,
                     args = {
                     },
                  },
               },
            },]]
         },
      },      
      auraList = {  
         type="group",
         name=L["Auras"],
         childGroups="tree",
         order=3,
         args = {      
            newAura = {
               type = "group",
               name = L["New Aura"],
               desc = L["New Aura"],
               inline=true,
               order = 1,
               args = {
                  name = {
                     type = "input",
                     name = L["Name"],
                     desc = L["Name of the aura"],
                     get=function() return Auras.newAuraName or "" end,
                     set=function(info, value) Auras.newAuraName = value end,
                     order=1,
                  },
                  priority = {
                     type= "range",
                     name = L["Priority"],
                     desc = L["Select what priority the aura should have - higher equals more priority"],
                     get=function() return Auras.newAuraPriority or "" end,
                     set=function(info, value) Auras.newAuraPriority = value end,
                     min=0,
                     max=5,
                     step=1,
                     order=2,
                  },
                  add = {
                     type = "execute",
                     name = L["Add new Aura"],
                     func = function(info)
                        Gladius.dbi.profile.aurasFrameAuras[Auras.newAuraName] = Auras.newAuraPriority 
                        Gladius.options.args[self.name].args.auraList.args[Auras.newAuraName] = Auras:SetupAura(Auras.newAuraName, Auras.newAuraPriority)
                     end,
                     order=3,
                  },
               },
            },
         },
      },
   }
   
   -- set auras
   if (not Gladius.db.aurasFrameAuras) then
      Gladius.db.aurasFrameAuras = self:GetAuraList()
   end
  
   for aura, priority in pairs(Gladius.db.aurasFrameAuras) do
      options.auraList.args[aura] = self:SetupAura(aura, priority)
   end
   
   return options
end

local function setAura(info, value)
	if (info[#(info)] == "name") then   
      -- create new aura
      Gladius.options.args["ClassIcon"].args.auraList.args[value] = ClassIcon:SetupAura(value, Gladius.dbi.profile.aurasFrameAuras[info[#(info) - 1]])
		Gladius.dbi.profile.aurasFrameAuras[value] = Gladius.dbi.profile.aurasFrameAuras[info[#(info) - 1]]
		
		-- delete old aura
		Gladius.dbi.profile.aurasFrameAuras[info[#(info) - 1]] = nil 
		Gladius.options.args["ClassIcon"].args.auraList.args = {}
		
		for aura, priority in pairs(Gladius.dbi.profile.aurasFrameAuras) do
         Gladius.options.args["ClassIcon"].args.auraList.args[aura] = ClassIcon:SetupAura(aura, priority)
      end
   else
      Gladius.dbi.profile.aurasFrameAuras[info[#(info) - 1]] = value
	end
end

local function getAura(info)
   if (info[#(info)] == "name") then
      return info[#(info) - 1]
   else      
      return Gladius.dbi.profile.aurasFrameAuras[info[#(info) - 1]]
   end
end

function Auras:SetupAura(aura, priority)
   return {
      type = "group",
      name = aura,
      desc = aura,
      get = getAura,
      set = setAura,
      args = {
         name = {
            type = "input",
            name = L["Name"],
            desc = L["Name of the aura"],
            order=1,
         },
         priority = {
            type= "range",
            name = L["Priority"],
            desc = L["Select what priority the aura should have - higher equals more priority"],
            min=0,
            max=5,
            step=1,
            order=2,
         },
         delete = {
            type = "execute",
            name = L["Delete"],
            func = function(info)
               Gladius.dbi.profile.aurasFrameAuras[info[#(info) - 1]] = nil 
               
               local newAura = Gladius.options.args["Auras"].args.auraList.args.newAura
               Gladius.options.args["Auras"].args.auraList.args = {
                  newAura = newAura,
               }
               
               for aura, priority in pairs(Gladius.dbi.profile.aurasFrameAuras) do
                  Gladius.options.args["Auras"].args.auraList.args[aura] = self:SetupAura(aura, priority)
               end
            end,
            order=3,
         },
      },
   }
end

function Auras:GetAuraList()
	local auraTable = setmetatable({
		-- Spell Name			Priority (higher = more priority)
		-- Crowd control
		[GetSpellInfo(108194)] 	= 4,	-- Asphyxiate
		[GetSpellInfo(115001)] 	= 4,	-- Remorseless Winter
		[GetSpellInfo(91800)] 	= 4,	-- Gnaw
		[GetSpellInfo(91797)] 	= 4,	-- Monstrous Blow (Dark Transformation)
		[GetSpellInfo(113801)] 	= 4,	-- Bash (Force of Nature - Feral Treants)
		[GetSpellInfo(102795)] 	= 4,	-- Bear Hug
		[GetSpellInfo(33786)] 	= 4,	-- Cyclone
		[GetSpellInfo(99)] 	= 4,	-- Disorienting Roar
		[GetSpellInfo(2637)] 	= 4,	-- Hibernate
		[GetSpellInfo(22570)] 	= 4,	-- Maim
		[GetSpellInfo(5211)] 	= 4,	-- Mighty Bash
		[GetSpellInfo(9005)] 	= 4,	-- Pounce
		[GetSpellInfo(102546)] 	= 4,	-- Pounce (Incarnation)
		[GetSpellInfo(110698)] 	= 4,	-- Hammer of Justice (Paladin)
		[GetSpellInfo(113004)] 	= 4,	-- Intimidating Roar [Fleeing in fear] (Warrior)
		[GetSpellInfo(113056)] 	= 4,	-- Intimidating Roar [Cowering in fear] (Warrior)
		[GetSpellInfo(117526)] 	= 4,	-- Binding Shot
		[GetSpellInfo(3355)] 	= 4,	-- Freezing Trap
		[GetSpellInfo(1513)] 	= 4,	-- Scare Beast
		[GetSpellInfo(19503)] 	= 4,	-- Scatter Shot
		[GetSpellInfo(19386)] 	= 4,	-- Wyvern Sting
		[GetSpellInfo(90337)] 	= 4,	-- Bad Manner (Monkey)
		[GetSpellInfo(24394)] 	= 4,	-- Intimidation
		[GetSpellInfo(126246)] 	= 4,	-- Lullaby (Crane)
		[GetSpellInfo(126355)] 	= 4,	-- Paralyzing Quill (Porcupine)
		[GetSpellInfo(126423)] 	= 4,	-- Petrifying Gaze (Basilisk)
		[GetSpellInfo(50519)] 	= 4,	-- Sonic Blast (Bat)
		[GetSpellInfo(56626)] 	= 4,	-- Sting (Wasp)
		[GetSpellInfo(96201)] 	= 4,	-- Web Wrap (Shale Spider)
		[GetSpellInfo(118271)] 	= 4,	-- Combustion Impact
		[GetSpellInfo(44572)] 	= 4,	-- Deep Freeze
		[GetSpellInfo(31661)] 	= 4,	-- Dragon's Breath
		[GetSpellInfo(118)] 	= 4,	-- Polymorph
		[GetSpellInfo(61305)] 	= 4,	-- Polymorph: Black Cat
		[GetSpellInfo(28272)] 	= 4,	-- Polymorph: Pig
		[GetSpellInfo(61721)] 	= 4,	-- Polymorph: Rabbit
		[GetSpellInfo(61780)] 	= 4,	-- Polymorph: Turkey
		[GetSpellInfo(28271)] 	= 4,	-- Polymorph: Turtle
		[GetSpellInfo(82691)] 	= 4,	-- Ring of Frost
		[GetSpellInfo(123393)] 	= 4,	-- Breath of Fire (Glyph of Breath of Fire)
		[GetSpellInfo(126451)] 	= 4,	-- Clash
		[GetSpellInfo(122242)] 	= 4,	-- Clash (not sure which one is right)
		[GetSpellInfo(119392)] 	= 4,	-- Charging Ox Wave
		[GetSpellInfo(120086)] 	= 4,	-- Fists of Fury
		[GetSpellInfo(119381)] 	= 4,	-- Leg Sweep
		[GetSpellInfo(115078)] 	= 4,	-- Paralysis
		[GetSpellInfo(105421)] 	= 4,	-- Blinding Light
		[GetSpellInfo(115752)] 	= 4,	-- Blinding Light (Glyph of Blinding Light)
		[GetSpellInfo(105593)] 	= 4,	-- Fist of Justice
		[GetSpellInfo(853)] 	= 4,	-- Hammer of Justice
		[GetSpellInfo(119072)] 	= 4,	-- Holy Wrath
		[GetSpellInfo(20066)] 	= 4,	-- Repentance
		[GetSpellInfo(10326)] 	= 4,	-- Turn Evil
		[GetSpellInfo(113506)] 	= 4,	-- Cyclone (Symbiosis)
		[GetSpellInfo(605)] 	= 4,	-- Dominate Mind
		[GetSpellInfo(88625)] 	= 4,	-- Holy Word: Chastise
		[GetSpellInfo(64044)] 	= 4,	-- Psychic Horror
		[GetSpellInfo(8122)] 	= 4,	-- Psychic Scream
		[GetSpellInfo(113792)] 	= 4,	-- Psychic Terror (Psyfiend)
		[GetSpellInfo(9484)] 	= 4,	-- Shackle Undead
		[GetSpellInfo(87204)] 	= 4,	-- Sin and Punishment
		[GetSpellInfo(2094)] 	= 4,	-- Blind
		[GetSpellInfo(1833)] 	= 4,	-- Cheap Shot
		[GetSpellInfo(1776)] 	= 4,	-- Gouge
		[GetSpellInfo(408)] 	= 4,	-- Kidney Shot
		[GetSpellInfo(113953)] 	= 4,	-- Paralysis (Paralytic Poison)
		[GetSpellInfo(6770)] 	= 4,	-- Sap
		[GetSpellInfo(76780)] 	= 4,	-- Bind Elemental
		[GetSpellInfo(77505)] 	= 4,	-- Earthquake
		[GetSpellInfo(51514)] 	= 4,	-- Hex
		[GetSpellInfo(118905)] 	= 4,	-- Static Charge (Capacitor Totem)
		[GetSpellInfo(710)] 	= 4,	-- Banish
		[GetSpellInfo(137143)] 	= 4,	-- Blood Horror
		[GetSpellInfo(54786)] 	= 4,	-- Demonic Leap (Metamorphosis)
		[GetSpellInfo(5782)] 	= 4,	-- Fear
		[GetSpellInfo(118699)] 	= 4,	-- Fear
		[GetSpellInfo(130616)] 	= 4,	-- Fear (Glyph of Fear)
		[GetSpellInfo(5484)] 	= 4,	-- Howl of Terror
		[GetSpellInfo(22703)] 	= 4,	-- Infernal Awakening
		[GetSpellInfo(6789)] 	= 4,	-- Mortal Coil
		[GetSpellInfo(132412)] 	= 4,	-- Seduction (Grimoire of Sacrifice)
		[GetSpellInfo(30283)] 	= 4,	-- Shadowfury
		[GetSpellInfo(104045)] 	= 4,	-- Sleep (Metamorphosis)
		[GetSpellInfo(7922)] 	= 4,	-- Charge Stun
		[GetSpellInfo(118895)] 	= 4,	-- Dragon Roar
		[GetSpellInfo(5246)] 	= 4,	-- Intimidating Shout (aoe)
		[GetSpellInfo(20511)] 	= 4,	-- Intimidating Shout (targeted)
		[GetSpellInfo(132168)] 	= 4,	-- Shockwave
		[GetSpellInfo(107570)] 	= 4,	-- Storm Bolt
		[GetSpellInfo(105771)] 	= 4,	-- Warbringer
		[GetSpellInfo(107079)] 	= 4,	-- Quaking Palm
		[GetSpellInfo(20549)] 	= 4,	-- War Stomp
		[GetSpellInfo(118345)] 	= 4,	-- Pulverize
		[GetSpellInfo(89766)] 	= 4,	-- Axe Toss (Felguard/Wrathguard)
		[GetSpellInfo(115268)] 	= 4,	-- Mesmerize (Shivarra)
		[GetSpellInfo(6358)] 	= 4,	-- Seduction (Succubus)

		-- Roots
		[GetSpellInfo(96294)] 	= 2,	-- Chains of Ice (Chilblains)
		[GetSpellInfo(91807)] 	= 2,	-- Shambling Rush (Dark Transformation)
		[GetSpellInfo(339)] 	= 2,	-- Entangling Roots
		[GetSpellInfo(113770)] 	= 2,	-- Entangling Roots (Force of Nature - Balance Treants)
		[GetSpellInfo(19975)] 	= 2,	-- Entangling Roots (Nature's Grasp)
		[GetSpellInfo(45334)] 	= 2,	-- Immobilized (Wild Charge - Bear)
		[GetSpellInfo(102359)] 	= 2,	-- Mass Entanglement
		[GetSpellInfo(110693)] 	= 2,	-- Frost Nova (Mage)
		[GetSpellInfo(19185)] 	= 2,	-- Entrapment
		[GetSpellInfo(128405)] 	= 2,	-- Narrow Escape
		[GetSpellInfo(90327)] 	= 2,	-- Lock Jaw (Dog)
		[GetSpellInfo(50245)] 	= 2,	-- Pin (Crab)
		[GetSpellInfo(54706)] 	= 2,	-- Venom Web Spray (Silithid)
		[GetSpellInfo(4167)] 	= 2,	-- Web (Spider)
		[GetSpellInfo(122)] 	= 2,	-- Frost Nova
		[GetSpellInfo(111340)] 	= 2,	-- Ice Ward
		[GetSpellInfo(33395)] 	= 2,	-- Freeze
		[GetSpellInfo(116706)] 	= 2,	-- Disable
		[GetSpellInfo(113275)] 	= 2,	-- Entangling Roots (Symbiosis)
		[GetSpellInfo(123407)] 	= 2,	-- Spinning Fire Blossom
		[GetSpellInfo(113275)] 	= 2,	-- Entangling Roots (Symbiosis)
		[GetSpellInfo(87194)] 	= 2,	-- Glyph of Mind Blast
		[GetSpellInfo(114404)] 	= 2,	-- Void Tendril's Grasp
		[GetSpellInfo(115197)] 	= 2,	-- Partial Paralysis
		[GetSpellInfo(64695)] 	= 2,	-- Earthgrab (Earthgrab Totem)
		[GetSpellInfo(63685)] 	= 2,	-- Freeze (Frozen Power)
		[GetSpellInfo(107566)] 	= 2,	-- Staggering Shout
		
		-- Silences
		[GetSpellInfo(47476)] 	= 3,	-- Strangulate
		[GetSpellInfo(114238)] 	= 3,	-- Fae Silence (Glyph of Fae Silence)
		[GetSpellInfo(81261)] 	= 3,	-- Solar Beam
		[GetSpellInfo(34490)] 	= 3,	-- Silencing Shot
		[GetSpellInfo(102051)] 	= 3,	-- Frostjaw (also a root)
		[GetSpellInfo(55021)] 	= 3,	-- Silenced - Improved Counterspell
		[GetSpellInfo(116709)] 	= 3,	-- Spear Hand Strike
		[GetSpellInfo(31935)] 	= 3,	-- Avenger's Shield
		[GetSpellInfo(15487)] 	= 3,	-- Silence
		[GetSpellInfo(1330)] 	= 3,	-- Garrote - Silence
		[GetSpellInfo(113287)] 	= 3,	-- Solar Beam (Symbiosis)
		[GetSpellInfo(132409)] 	= 3,	-- Spell Lock (Grimoire of Sacrifice)
		[GetSpellInfo(31117)] 	= 3,	-- Unstable Affliction
		[GetSpellInfo(115782)] 	= 3,	-- Optical Blast (Observer)
		[GetSpellInfo(24259)] 	= 3,	-- Spell Lock (Felhunter
		[GetSpellInfo(25046)] 	= 3,	-- Arcane Torrent (Energy)
		[GetSpellInfo(28730)] 	= 3,	-- Arcane Torrent (Mana)
		[GetSpellInfo(50613)] 	= 3,	-- Arcane Torrent (Runic Power)
		[GetSpellInfo(69179)] 	= 3,	-- Arcane Torrent (Rage)
		[GetSpellInfo(80483)] 	= 3,	-- Arcane Torrent (Focus)
		[GetSpellInfo(129597)] 	= 3,	-- Arcane Torrent (Chi)
				
		-- Disarms
		[GetSpellInfo(126458)] 	= 1,	-- Grapple Weapon (Monk)
		[GetSpellInfo(50541)] 	= 1,	-- Clench (Scorpid)
		[GetSpellInfo(91644)] 	= 1,	-- Snatch (Bird of Prey)
		[GetSpellInfo(117368)] 	= 1,	-- Grapple Weapon
		[GetSpellInfo(64058)] 	= 1,	-- Psychic Horror
		[GetSpellInfo(51722)] 	= 1,	-- Dismantle
		[GetSpellInfo(118093)] 	= 1,	-- Disarm (Voidwalker/Voidlord)
		[GetSpellInfo(676)] 	= 1,	-- Disarm
						
		-- Buffs
		[GetSpellInfo(48792)] 	= 1,	-- Icebound Fortitude
		[GetSpellInfo(49039)] 	= 1,	-- Lichborne
		[GetSpellInfo(110575)] 	= 1,	-- Icebound Fortitude (Death Knight)
		[GetSpellInfo(122291)] 	= 1,	-- Unending Resolve (Warlock)
		[GetSpellInfo(31821)] 	= 1,	-- Aura Mastery
		[GetSpellInfo(113002)] 	= 1,	-- Spell Reflection (Warrior)
		[GetSpellInfo(8178)] 	= 1,	-- Grounding Totem Effect (Grounding Totem)
		[GetSpellInfo(104773)] 	= 1,	-- Unending Resolve
		[GetSpellInfo(23920)] 	= 1,	-- Spell Reflection
		[GetSpellInfo(114028)] 	= 1,	-- Mass Spell Reflection
		[GetSpellInfo(131557)] 	= 1,	-- Spiritwalker's Aegis
		[GetSpellInfo(89485)] 	= 1,	-- Inner Focus
		[GetSpellInfo(6940)] 	= 1,	-- Hand of Sacrifice
		[GetSpellInfo(110913)] 	= 1,	-- Dark Bargain

		-- Immunities
		[GetSpellInfo(115018)] 	= 1,	-- Desecrated Ground
		[GetSpellInfo(48707)] 	= 1,	-- Anti-Magic Shell
		[GetSpellInfo(110617)] 	= 1,	-- Deterrence (Hunter)
		[GetSpellInfo(110715)] 	= 1,	-- Dispersion (Priest)
		[GetSpellInfo(110700)] 	= 1,	-- Divine Shield (Paladin)
		[GetSpellInfo(110696)] 	= 1,	-- Ice Block (Mage)
		[GetSpellInfo(110570)] 	= 1,	-- Anti-Magic Shell (Death Knight)
		[GetSpellInfo(110788)] 	= 1,	-- Cloak of Shadows (Rogue)
		[GetSpellInfo(19263)] 	= 1,	-- Deterrence
		[GetSpellInfo(45438)] 	= 1,	-- Ice Block
		[GetSpellInfo(115760)] 	= 1,	-- Glyph of Ice Block
		[GetSpellInfo(131523)] 	= 1,	-- Zen Meditation
		[GetSpellInfo(642)] 	= 1,	-- Divine Shield
		[GetSpellInfo(47585)] 	= 1,	-- Dispersion
		[GetSpellInfo(31224)] 	= 1,	-- Cloak of Shadows
		[GetSpellInfo(46924)] 	= 1,	-- Bladestorm
	}, {
      __index = function(t, index) 
         if (index ~= nil) then
            return rawget(t, index)
         else
            return nil
         end            
      end
   })
   
   return auraTable
end