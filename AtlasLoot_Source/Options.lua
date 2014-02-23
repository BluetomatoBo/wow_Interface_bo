local L = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot_Source");

local getOptions, options
do
	
	local function getColorOpt(info)
		return AtlasLoot_Source.db.profile[info[#info]].r, AtlasLoot_Source.db.profile[info[#info]].g, AtlasLoot_Source.db.profile[info[#info]].b
	end
	
	local function setColorOpt(info, r, g, b)
		AtlasLoot_Source.db.profile[info[#info]] = { r = r, g = g, b = b }
		return AtlasLoot_Source.db.profile[info[#info]].r, AtlasLoot_Source.db.profile[info[#info]].g, AtlasLoot_Source.db.profile[info[#info]].b
	end
	
	 local function getOpt(info)
		return AtlasLoot_Source.db.profile[info[#info]]
	end
	
	local function setOpt(info, value)
		AtlasLoot_Source.db.profile[info[#info]] = value
		return AtlasLoot_Source.db.profile[info[#info]]
	end

	function getOptions()
		if not options then
			options = {
				type = "group",
				args = {
					general = {
						type = "group",
						inline = true,
						name = "",
						args = {
							itemID = {						
								type = "group",
								inline = true,
								name = L["ItemID"],
								order = 10,
								args = {
									enableItemID = {
										type = "toggle",
										name = L["Enable"],
										order = 10,
										get = getOpt,
										set = setOpt,
									},
									itemIDColor = {
										type = "color",
										name = L["Color"],
										get = getColorOpt,
										set = setColorOpt,
										order = 20,
									},
								},
							},
							dropLocation = {						
								type = "group",
								inline = true,
								name = L["Drop Location"],
								order = 20,
								args = {
									enableDropLocation = {
										type = "toggle",
										name = L["Enable"],
										order = 10,
										get = getOpt,
										set = setOpt,
									},
									dropLocationColor = {
										type = "color",
										name = L["Color"],
										get = getColorOpt,
										set = setColorOpt,
										order = 20,
									},
								},
							},
							factionInfo = {						
								type = "group",
								inline = true,
								name = L["Faction Info"],
								order = 30,
								args = {
									enableFactionInfo = {
										type = "toggle",
										name = L["Enable"],
										order = 10,
										get = getOpt,
										set = setOpt,
									},
									factionInfoColor = {
										type = "color",
										name = L["Color"],
										get = getColorOpt,
										set = setColorOpt,
										order = 20,
									},
								},
							},
							priceInfo = {						
								type = "group",
								inline = true,
								name = L["Price Info"],
								order = 40,
								args = {
									enablePriceInfo = {
										type = "toggle",
										name = L["Enable"],
										order = 10,
										get = getOpt,
										set = setOpt,
									},
									priceInfoColor = {
										type = "color",
										name = L["Color"],
										get = getColorOpt,
										set = setColorOpt,
										order = 20,
									},
								},
							},
							craftingInfo = {						
								type = "group",
								inline = true,
								name = "Crafting Info",
								order = 50,
								args = {
									enableCraftingInfo = {
										type = "toggle",
										name = L["Enable"],
										width = "full",
										order = 10,
										get = getOpt,
										set = setOpt,
									},
									replaceItemWithSpellTT = {
										type = "toggle",
										name = "Replace itemtooltip with craftingtooltip",
										width = "full",
										order = 20,
										get = getOpt,
										set = setOpt,
									},
									addSpellIntoTT = {
										type = "toggle",
										name = "Add crafting infos into item tooltip",
										order = 30,
										get = getOpt,
										set = setOpt,
									},
									placeCraftingTTUnderItem = {
										type = "toggle",
										name = "Craft TT under Item TT",
										order = 40,
										get = getOpt,
										set = setOpt,
									},
								},
							},
						},
					},
				},
			}
		end
		return options
	end

end

function AtlasLoot_Source:OptionsInitialize()
	if self.options then return end
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("AtlasLoot_Source", getOptions)

	self.options = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("AtlasLoot_Source", "AtlasLoot_Source", nil, "general")
end