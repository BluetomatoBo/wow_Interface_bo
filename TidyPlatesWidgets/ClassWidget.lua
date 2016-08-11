---------------
-- Class Widget
---------------
local classWidgetPath = "Interface\\Addons\\TidyPlatesWidgets\\ClassWidget\\"

--[[
f.icon:SetTexture("Interface\\GLUES\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES"); -- this is the image containing all class icons
local coords = CLASS_ICON_TCOORDS[class]; -- get the coordinates of the class icon we want
f.icon:SetTexCoord(unpack(coords)); -- cut out the region with our class icon according to coords
--]]

local CachedUnitClass = TidyPlatesUtility.CachedUnitClass

local function UpdateClassWidget(self, unit, showFriendly)
	local class

	if unit then
		if showFriendly and unit.reaction == "FRIENDLY" and unit.type == "PLAYER" then
			class = unit.class
		elseif unit.type == "PLAYER" then class = unit.class end

		if class then
			--self.Icon:SetTexture(ClassIconTable[class])
			self.Icon:SetTexture(classWidgetPath..class)
			self:Show()
		else self:Hide() end
	end

end

local function CreateClassWidget(parent)

	local frame = CreateFrame("Frame", nil, parent.widgetFrame)
	frame:SetWidth(24); frame:SetHeight(24)
	
	frame.Icon = frame:CreateTexture(nil, "ARTWORK")
	frame.Icon:SetAllPoints(frame)
	frame:Hide()
	frame.Update = UpdateClassWidget
	return frame
end

TidyPlatesWidgets.CreateClassWidget = CreateClassWidget