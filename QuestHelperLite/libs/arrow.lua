--[[ This entire file is pretty liberally ganked from TomTom and then again from
     QuestHelper (and then modified) under the following license:

-------------------------------------------------------------------------
  Copyright (c) 2006-2007, James N. Whitehead II
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

      * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
      * Redistributions in binary form must reproduce the above
        copyright notice, this list of conditions and the following
        disclaimer in the documentation and/or other materials provided
        with the distribution.
      * The name or alias of the copyright holder may not be used to endorse 
        or promote products derived from this software without specific prior
        written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
---------------------------------------------------------------------------

Thanks, James! <3   ]]

local function ColorGradient(perc, ...)
	local num = select("#", ...)
	local hexes = type(select(1, ...)) == "string"

	if perc == 1 then
		return select(num-2, ...), select(num-1, ...), select(num, ...)
	end

	num = num / 3

	local segment, relperc = math.modf(perc*(num-1))
	local r1, g1, b1, r2, g2, b2
	r1, g1, b1 = select((segment*3)+1, ...), select((segment*3)+2, ...), select((segment*3)+3, ...)
	r2, g2, b2 = select((segment*3)+4, ...), select((segment*3)+5, ...), select((segment*3)+6, ...)

	if not r2 or not g2 or not b2 then
		return r1, g1, b1
	else
		return r1 + (r2-r1)*relperc,
		g1 + (g2-g1)*relperc,
		b1 + (b2-b1)*relperc
	end
end

local wayframe = CreateFrame("Button", "QHLArrowFrame", UIParent)
--wayframe:SetPoint("CENTER", 0, 300)
wayframe:EnableMouse(true)
wayframe:SetMovable(true)
wayframe:SetUserPlaced(true)
wayframe.arrow = wayframe:CreateTexture("BACKGROUND")
wayframe.arrow:SetTexture(0,0,0,1);
wayframe:Hide()

wif = wayframe

-- Frame used to control the scaling of the title and friends
local titleframe = CreateFrame("Frame", nil, wayframe)

wayframe.title = titleframe:CreateFontString("OVERLAY", nil, "GameFontNormalSmall")
wayframe.status = titleframe:CreateFontString("OVERLAY", nil, "GameFontNormalSmall")
wayframe.tta = titleframe:CreateFontString("OVERLAY", nil, "GameFontNormalSmall")
wayframe.title:SetPoint("TOP", wayframe, "BOTTOM", 0, 0)
wayframe.status:SetPoint("TOP", wayframe.title, "BOTTOM", 0, 0)
wayframe.tta:SetPoint("TOP", wayframe.status, "BOTTOM", 0, 0)
local default_font_name, default_font_size, default_font_flags = wayframe.title:GetFont()

do
  local r, g, b, a = wayframe.status:GetTextColor()
  r, g, b = r - 0.2, g - 0.2, b - 0.2
  wayframe.status:SetTextColor(r, g, b, a)
end

local OnUpdate

local function OnDragStart(self, button)
	if not QHL:GetSetting("arrow_locked") then  -- TODO TWEAKERY
		wayframe.moving = true
		self:StartMoving()
	end
end

local function OnDragStop(self, button)
	self:StopMovingOrSizing()
	local point, relativeTo, relativePoint, xOfs, yOfs = wayframe:GetPoint()
	QHL:SetSetting("arrow_pos_x", xOfs)
	QHL:SetSetting("arrow_pos_y", yOfs)
	wayframe.moving = false
end

function wayframe:OnEvent(event, ...)

	local estart = GetTime();
	if (type(self.obj[event]) == 'function') then
	
		-- Call Event Specific Function
		self.obj[event](self.obj, event, ...);
	end
	QHL.updatetime = QHL.updatetime + (GetTime() - estart);
end

wayframe:RegisterEvent("ZONE_CHANGED_NEW_AREA")
function wayframe:ZONE_CHANGED_NEW_AREA(event, ...)

	if QHL:GetSetting("arrow") and not QHL:GetSetting("arrow_hide") then -- TODO TWEAKERY
		QHL_Arrow_Show();
		OnUpdate();
	end
end

wayframe:SetScript("OnDragStart", OnDragStart)
wayframe:SetScript("OnDragStop", OnDragStop)
wayframe:RegisterForDrag("LeftButton")

wayframe.arrow = wayframe:CreateTexture("OVERLAY")
--wayframe.arrow:SetTexture("Interface\\AddOns\\QuestHelperLite\\Art\\arrow_image_down") -- if we don't do this, the image doesn't seem to end up cached. :blizzard:
wayframe.arrow:SetTexture("Interface\\AddOns\\QuestHelperLite\\Art\\arrow_image")
wayframe.arrow:SetAllPoints()

local active_point, arrive_distance, showDownArrow, point_title
active_point = {}

function QHL_Arrow_Show()
  if not wayframe.moving then
  	wayframe:SetPoint("CENTER",  QHL:GetSetting("arrow_pos_x"), QHL:GetSetting("arrow_pos_y"))
  end
  wayframe:Show()
end

function QHL_Arrow_Reset()
  QHL:SetSetting("arrow", true)
  wayframe:ClearAllPoints()
  wayframe:SetPoint("CENTER", QHLDEFAULT["arrow_pos_x"], QHLDEFAULT["arrow_pos_y"])
  QHL:SetSetting("arrow_pos_x", QHLDEFAULT["arrow_pos_x"])
  QHL:SetSetting("arrow_pos_y", QHLDEFAULT["arrow_pos_y"])
  QHL:SetSetting("arrow_locked", false) -- they're probably going to want to move it
  QHL:SetSetting("arrow_size", QHLDEFAULT["arrow_size"])
  QHL:SetSetting("arrow_textsize", QHLDEFAULT["arrow_textsize"])
  QHL_Arrow_Show()
end

function QHL_Arrow_SetScale(scale)
  if scale then
    QHL:SetSetting("arrow_size", scale)
  else
    scale = QHL:GetSetting("arrow_size")
  end
  
  if not showDownArrow then
    wayframe:SetHeight(42 * scale)
    wayframe:SetWidth(56 * scale)
  else
    scale = scale * 0.8
    wayframe:SetHeight(70 * scale)
    wayframe:SetWidth(53 * scale)
  end
end

function QHL_Arrow_SetTextScale(scale)
  if scale then
    QHL:SetSetting("arrow_textsize", scale)
  else
    scale = QHL:GetSetting("arrow_textsize")
  end
  
  wayframe.title:SetFont(default_font_name, default_font_size * scale, default_font_flags)
  wayframe.status:SetFont(default_font_name, default_font_size * scale, default_font_flags)
  wayframe.tta:SetFont(default_font_name, default_font_size * scale, default_font_flags)
end

function QHL_Arrow_SetActivePoint(m, f, x, y, desc)
  active_point.m, active_point.f, active_point.x, active_point.y = m, f, x, y
  wayframe.title:SetText(desc)
  QHL_Arrow_Show()
  OnUpdate()
end

local callbacks = {}
local callbackstemp = {}
local last_c, last_z, last_x, last_y, last_desc

local status = wayframe.status
local tta = wayframe.tta
local arrow = wayframe.arrow
local last_distance = 0
local tta_throttle = 0
local speed = 0
local speed_count = 0

OnUpdate = function()

  local self = wayframe
  
	if not active_point.m or QHL.InBrokenInstance or QHL.world ~= QHL:GetWorld(active_point.m, active_point.f) or not QHL:GetSetting("arrow") then
		self:Hide()
		return
	end

  self:Show()

  local dist, dx, dy = QHL.Astrolabe:ComputeDistance(QHL.map, QHL.floor, QHL.pos_x, QHL.pos_y, active_point.m, active_point.f, active_point.x, active_point.y)
  --dist = QHL.quests.path_distance
  
  local text = ""
  
  if dist then
    -- I had support for miles and kilometers, but decided that distances were rarely large
    -- enough to warrent it.
    if QHL:GetSetting("arrow_meters") then
      text = QHL:Concat(math.floor(0.5+dist*0.9144), " ", QHL_LOCALE_METERS);
      --text = QHFormat("DISTANCE_METRES", math.floor(0.5+dist*0.9144))
    else
      text = QHL:Concat(math.floor(0.5 + dist), " ", QHL_LOCALE_YARDS);
      --text = QHFormat("DISTANCE_YARDS", math.floor(0.5 + dist))
    end
  end
  
  status:SetText(text)

	-- Showing the arrival arrow?
	if dist and dist <= 10 then
		if not showDownArrow then
			showDownArrow = true
      			QHL_Arrow_SetScale()
			arrow:SetTexture("Interface\\AddOns\\QuestHelperLite\\Art\\arrow_image_down")
			arrow:SetVertexColor(0, 1, 0)
		end

		local cell = math.floor(mod(GetTime() * 20, 55)) -- 20 fps seems to be around the right number

		local column = cell % 9
		local row = floor(cell / 9)

		local xstart = (column * 53) / 512
		local ystart = (row * 70) / 512
		local xend = ((column + 1) * 53) / 512
		local yend = ((row + 1) * 70) / 512
		arrow:SetTexCoord(xstart,xend,ystart,yend)
	else
		if showDownArrow then
			showDownArrow = false
      			QHL_Arrow_SetScale()
			arrow:SetTexture("Interface\\AddOns\\QuestHelperLite\\Art\\arrow_image")
			showDownArrow = false
		end

		local angle = atan2(-dx, -dy) / 360 * (math.pi * 2) -- degrees. seriously what
    		--if angle < 0 then angle = angle + math.pi * 2 end
		local player = GetPlayerFacing()
		angle = angle - player

		local perc = math.abs((math.pi - math.abs(angle)) / math.pi)
    		if perc > 1 then perc = 2 - perc end -- siiigh

		local gr,gg,gb = 0, 1, 0
		local mr,mg,mb = 1, 1, 0
		local br,bg,bb = 1, 0, 0
		local r,g,b = ColorGradient(perc, br, bg, bb, mr, mg, mb, gr, gg, gb)		
		arrow:SetVertexColor(r,g,b)

		local cell = floor(angle / (math.pi * 2) * 108 + 0.5) % 108
		local column = cell % 9
		local row = floor(cell / 9)

		local xstart = (column * 56) / 512
		local ystart = (row * 42) / 512
		local xend = ((column + 1) * 56) / 512
		local yend = ((row + 1) * 42) / 512
		arrow:SetTexCoord(xstart,xend,ystart,yend)
	end

	-- Calculate the TTA every second  (%01d:%02d)

  --[[
  if elapsed then
    tta_throttle = tta_throttle + elapsed

    if tta_throttle >= 1.0 then
      -- Calculate the speed in yards per sec at which we're moving
      local current_speed = (last_distance - dist) / tta_throttle

      if last_distance == 0 then
        current_speed = 0
      end

      if speed_count < 2 then
        speed = (speed + current_speed) / 2
        speed_count = speed_count + 1
      else
        speed_count = 0
        speed = current_speed
      end

      if speed > 0 then
        local eta = math.abs(dist / speed)
        tta:SetFormattedText("%01d:%02d", eta / 60, eta % 60) 
      else
        tta:SetText("")
      end
      
      last_distance = dist
      tta_throttle = 0
    end
  end
  ]]
end

wayframe:SetScript("OnUpdate", OnUpdate)

local function spacer()
  local htex = QHL:CreateIconTexture(item, 10)
  htex:SetVertexColor(1, 1, 1, 0)
  return htex
end

function QHL_Arrow_PopulateMenu(menu)
  local hide = QHL:CreateMenuItem(menu, QHL:GetSetting("arrow") and QHL_LOCALE_MENU_ARROW_HIDE or QHL_LOCALE_MENU_ARROW_SHOW)
  hide:SetFunction(function () QHL:ToggleArrow() end)
  --hide:AddTexture(spacer(), true)
  --hide:AddTexture(spacer(), false)

  local lock = QHL:CreateMenuItem(menu, not QHL:GetSetting("arrow_locked") and QHL_LOCALE_MENU_ARROW_LOCK or QHL_LOCALE_MENU_ARROW_UNLOCK)
  local ltex = QHL:CreateIconTexture(item, 10)
  lock:SetFunction(function () local arrow_locked = not QHL:GetSetting("arrow_locked"); QHL:SetSetting("arrow_locked", arrow_locked); end)
  lock:AddTexture(ltex, true)
  lock:AddTexture(spacer(), false)
  ltex:SetVertexColor(1, 1, 1, QHL:GetSetting("arrow_locked") and 1 or 0)
  
  local scale = QHL:CreateMenuItem(menu, QHL_LOCALE_MENU_ARROW_ARROWSCALE)
  local scale_menu = QHL:CreateMenu()
  scale:SetSubmenu(scale_menu)
  scale:AddTexture(spacer(), true)
  for i = 5, 15 do
    local it = QHL:CreateMenuItem(scale_menu, string.format("%d%%", i * 10))
    local ix = i
    it:SetFunction(function () QHL_Arrow_SetScale(ix / 10) end)
    local icon = QHL:CreateIconTexture(item, 10)
    if QHL:GetSetting("arrow_size") == ix / 10 then
      icon:SetVertexColor(1, 1, 1, 1)
    else
      icon:SetVertexColor(1, 1, 1, 0)
    end
    it:AddTexture(icon)
  end
  
  local tscale = QHL:CreateMenuItem(menu, QHL_LOCALE_MENU_ARROW_TEXTSCALE)
  local tscale_menu = QHL:CreateMenu()
  tscale:SetSubmenu(tscale_menu)
  tscale:AddTexture(spacer(), true)
  for i = 5, 15 do
    local it = QHL:CreateMenuItem(tscale_menu, string.format("%d%%", i * 10))
    local ix = i
    it:SetFunction(function () QHL_Arrow_SetTextScale(ix / 10) end)
    local icon = QHL:CreateIconTexture(item, 10)
    if QHL:GetSetting("arrow_textsize") == ix / 10 then
      icon:SetVertexColor(1, 1, 1, 1)
    else
      icon:SetVertexColor(1, 1, 1, 0)
    end
    it:AddTexture(icon)
  end
  
  local reset = QHL:CreateMenuItem(menu, QHL_LOCALE_MENU_ARROW_RESET)
  reset:SetFunction(function () QHL_Arrow_Reset() end)
  
  local objective = QHL.quests:GetNextObjective();
  if objective then 
    local ignore = QHL:CreateMenuItem(menu, QHL_LOCALE_MENU_OBJECTIVE_IGNORE):SetFunction(function () QHL.quests:IgnoreObjective(objective); end)
  end
end

local function WayFrame_OnClick(self, button)
  local menu = QHL:CreateMenu()
  QHL:CreateMenuTitle(menu, QHL_LOCALE_ARROWLINK_ARROW)
  
  QHL_Arrow_PopulateMenu(menu)
  
  menu:ShowAtCursor()
end

wayframe:RegisterForClicks("RightButtonUp")
wayframe:SetScript("OnClick", WayFrame_OnClick)

--QHL_OnUpdate(OnUpdate)


