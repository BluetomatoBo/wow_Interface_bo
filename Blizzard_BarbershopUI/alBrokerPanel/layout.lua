--[[
	I think, the layout is fairly self-explanatory,
	Here's a list of all available options:
		noIcon, useLabel, formatting,
		parent, width, height, scale, alpha
		fontFamily, fontSize, fontStyle, fontObject, noShadow
]]
local cargoShip = LibStub("LibCargoShip-2.1")

local durability = cargoShip("Durability", {fontSize = 10, font = UI_FONT, fontStyle = 'OUTLINEMONOCHROME', noShadow = true})
durability:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 185, -1)

local equip = cargoShip("Broker_Equipment", {fontSize = 10, font = UI_FONT, fontStyle = 'OUTLINEMONOCHROME', noShadow = true})
equip:SetPoint("LEFT", durability, "RIGHT", 10, 0)

local spec = cargoShip("Spec", {fontSize = 10, font = UI_FONT, fontStyle = 'OUTLINEMONOCHROME', noShadow = true})
spec:SetPoint("LEFT", equip, "RIGHT", 10, 0)

local dps = cargoShip("Dps", {fontSize = 10, font = UI_FONT, fontStyle = 'OUTLINEMONOCHROME', noShadow = true})
dps:SetPoint("LEFT", spec, "RIGHT", 3, 0)