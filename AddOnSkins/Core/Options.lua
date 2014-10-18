local AS, ASL = unpack(AddOnSkins)
local tinsert, sort, pairs, format, gsub, strfind = tinsert, sort, pairs, format, gsub, strfind

local DEVELOPER_STRING = ""
local LINE_BREAK = "\n"

local DEVELOPERS = {
	"Affli",
	"Arstraea",
	"Azilroka",
	"Blazeflack",
	"Cadayron",
	"Camealion",
	"Catok",
	"CJO",
	"Darth Predator",
	"Dec",
	"Drii",
	"Edoc",
	"efaref",
	"Elv",
	"Jasje",
	"Kemat1an",
	"Kkthnx",
	"Konungr",
	"Lockslap",
	"lolarennt",
	"MaXiMUS",
	"Merith",
	"MrRuben5",
	"Outofammo",
	"Pat",
	"Pezzer13",
	"Rakkhin",
	"Repooc",
	"Shestak",
	"Shadowcall",
	"Sinaris",
	"Sortokk",
	"Tukz",
	"Warmexx",
}

sort(DEVELOPERS, function(a, b) return strlower(a) < strlower(b) end)
for _, devName in pairs(DEVELOPERS) do
	DEVELOPER_STRING = DEVELOPER_STRING..LINE_BREAK..devName
end

function AS:Ace3Options()
	local Ace3OptionsPanel = IsAddOnLoaded("ElvUI") and ElvUI[1] or Enhanced_Config and Enhanced_Config[1] or nil

	if not Ace3OptionsPanel then return end

	local function GenerateOptionTable(skinName, order)
		local text = gsub(skinName, "Skin", "")
		local options = {
			type = "toggle",
			name = text,
			order = order,
			desc = ASL.OptionsPanel.SkinDesc,
		}
		return options
	end

	Ace3OptionsPanel.Options.args.addonskins = {
		order = 100,
		type = "group",
		name = AS.Title,
		args = {},
	}
	Ace3OptionsPanel.Options.args.addonskins.args.addons = {
		order = 0,
		type = "group",
		name = ASL["AddOn Skins"],
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) end,
		guiInline = true,
		args = {},
	}
	Ace3OptionsPanel.Options.args.addonskins.args.blizzard = {
		order = 1,
		type = "group",
		name = ASL["Blizzard Skins"],
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) end,
		guiInline = true,
		args = {},
	}
	Ace3OptionsPanel.Options.args.addonskins.args.bossmods = {
		type = "group",
		name = ASL["BossMod Options"],
		order = 1,
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) end,
		guiInline = false,
		args = {
			DBMFont = {
				type = "select", dialogControl = "LSM30_Font",
				order = 1,
				name = ASL["DBM|VEM Font"],
				values = AceGUIWidgetLSMlists.font, 
			},
			DBMFontSize = {
				type = "range",
				order = 2,
				name = ASL["DBM|VEM Font Size"],
				min = 8, max = 18, step = 1, 
			},
			DBMFontFlag = {
				name = ASL["DBM|VEM Font Flag"],
				order = 3,
				type = "select",
				values = {
					["NONE"] = "None",
					["OUTLINE"] = "OUTLINE",
					["THICKOUTLINE"] = "THICKOUTLINE",
					["MONOCHROME"] = "MONOCHROME",
					["MONOCHROMEOUTLINE"] = "MONOCHROMEOUTLINE",
				},
			},
			DBMSkinHalf = {
				type = "toggle",
				name = ASL["DBM|VEM Half-bar Skin"],
				order = 4,
			},
			BigWigsHalfBar = {
				type = "toggle",
				name = ASL["BigWigs Half-Bar"],
				order = 4,
				disabled = function() return not AS:CheckOption("BigWigsSkin", "BigWigs") end
			},
		}
	}
	Ace3OptionsPanel.Options.args.addonskins.args.embed = {
		order = 2,
		type = "group",
		name = ASL["Embed Settings"],
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) AS:Embed_Check() end,
		args = {
			desc = {
				type = "description",
				name = ASL["Settings to control Embedded AddOns:\n\nAvailable Embeds: alDamageMeter | Omen | Skada | Recount | TinyDPS"],
				order = 1
			},
			EmbedSystem = {
				type = "toggle",
				name = ASL["Single Embed System"],
				order = 2,
				disabled = function() return AS:CheckOption("EmbedSystemDual") end,
			},
			EmbedMain = {
				type = "input",
				width = "full",
				name = ASL["Embed for Main Panel"],
				disabled = function() return not AS:CheckOption("EmbedSystem") end,
				order = 3,
			},
			EmbedSystemDual = {
				type = "toggle",
				name = ASL["Dual Embed System"],
				order = 4,
				disabled = function() return AS:CheckOption("EmbedSystem") end,
			},
			EmbedLeft = {
				type = "input",
				width = "full",
				name = ASL["Embed for Left Window"],
				disabled = function() return not AS:CheckOption("EmbedSystemDual") end,
				order = 5,
			},
			EmbedRight = {
				type = "input",
				width = "full",
				name = ASL["Embed for Right Window"],
				disabled = function() return not AS:CheckOption("EmbedSystemDual") end,
				order = 6,
			},
			EmbedLeftWidth = {
				type = "range",
				order = 7,
				name = ASL["Embed Left Window Width"],
				min = 100,
				max = 300,
				step = 1,
				disabled = function() return not AS:CheckOption("EmbedSystemDual") end,
				width = "full",
			},
			EmbedOoC = {
				type = "toggle",
				name = ASL["Out of Combat (Hide)"],
				order = 8,
			},
			EmbedOoCDelay = {
				name = ASL["Embed OoC Delay"],
				order = 9,
				type = "range",
				min = 1,
				max = 30,
				step = 1,
				disabled = function() return not ((AS:CheckOption("EmbedSystemDual") or AS:CheckOption("EmbedSystem")) and AS:CheckOption("EmbedOoC")) end,
			},
			HideChatFrame = {
				name = ASL["Hide Chat Frame"],
				order = 10,
				type = "select",
				values = AS:GetChatWindowInfo(),
				disabled = function() return not (AS:CheckOption("EmbedSystemDual") or AS:CheckOption("EmbedSystem")) end,
			},
			EmbedSexyCooldown = {
				type = "toggle",
				name = ASL["Attach SexyCD to action bar"],
				order = 11,
				disabled = function() return not AS:CheckOption("SexyCooldownSkin", "SexyCooldown2") end,
			},
			EmbedCoolLine = {
				type = "toggle",
				name = ASL["Attach CoolLine to action bar"],
				order = 12,
				disabled = function() return not AS:CheckOption("CoolLineSkin", "CoolLine") end,
			},
			TransparentEmbed = {
				type = "toggle",
				name = ASL["Embed Transparancy"],
				order = 13,
			},
			EmbedBelowTop = {
				type = "toggle",
				name = ASL["Embed Below Top Tab"],
				order = 14,
			},
			RecountBackdrop = {
				type = "toggle",
				name = ASL["Recount Backdrop"],
				order = 15,
				disabled = function() return not (AS:CheckOption("RecountSkin", "Recount") and AS:CheckEmbed("Recount")) end
			},
			SkadaBackdrop = {
				type = "toggle",
				name = ASL["Skada Backdrop"],
				order = 16,
				disabled = function() return not (AS:CheckOption("SkadaSkin", "Skada") and AS:CheckEmbed("Skada")) end
			},
			OmenBackdrop = {
				type = "toggle",
				name = ASL["Omen Backdrop"],
				order = 17,
				disabled = function() return not (AS:CheckOption("OmenSkin", "Omen") and AS:CheckEmbed("Omen")) end
			},
		}
	}
	Ace3OptionsPanel.Options.args.addonskins.args.misc = {
		type = "group",
		name = MISCELLANEOUS,
		order = 3,
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:SetOption(info[#info], value) end,
		args = {
			SkinTemplate = {
				name = ASL["Skin Template"],
				order = 1,
				type = "select",
				values = {
					["Transparent"] = "Transparent",
					["Default"] = "Default",
				}
			},
			WeakAuraAuraBar = {
				type = "toggle",
				name = ASL["WeakAura AuraBar"],
				order = 2,
				disabled = function() return not AS:CheckOption("WeakAurasSkin", "WeakAuras") end,
			},
			AuctionHouse = {
				type = "toggle",
				name = ASL["Auction House"],
				order = 3,
			},
		}
	}
	Ace3OptionsPanel.Options.args.addonskins.args.faq = {
		type = "group",
		name = ASL["FAQ's"],
		order = 4,
		args = {
			question1 = {
				type = "description",
				name = "|cffc41f3b[Q] "..ASL["DBM/VEM Half-Bar Skin Spacing looks wrong. How can I fix it?"],
				order = 1,
				fontSize = "medium",
			},
			answer1 = {
				type = "description",
				name = "|cffabd473[A] "..ASL["To use the DBM/VEM Half-Bar skin. You must change the DBM/VEM Options. Offset Y needs to be at least 15."],
				order = 2,
				fontSize = "medium",
			},
		},
	}
	Ace3OptionsPanel.Options.args.addonskins.args.credits = {
		type = "group",
		name = ASL["Credits"],
		order = -1,
		args = {
			desc = {
				order = 1,
				type = "description",
				name = format(ASL["Credits:"].."%s", DEVELOPER_STRING),
				fontSize = "medium",
			},
		},
	}
	Ace3OptionsPanel.Options.args.addonskins.args.about = {
		type = "group",
		name = ASL["About/Help"],
		order = -2,
		args = {
			desc = {
				order = 1,
				type = "description",
				fontSize = "medium",
				name = ASL["This is where you can find out more of AddOnSkins."],
			},
			tukuilink = {
				type = "input",
				width = "full",
				name = ASL["Download Link"],
				get = function(info) return "http://www.tukui.org/addons/index.php?act=view&id=128" end,
				order = 2,
			},
			changeloglink = {
				type = "input",
				width = "full",
				name = ASL["Changelog Link"],
				get = function(info) return "http://www.tukui.org/forums/topic.php?id=30607" end,
				order = 3,
			},
			gitlablink = {
				type = "input",
				width = "full",
				name = ASL["GitLab Link / Report Errors"],
				get = function(info) return "http://git.tukui.org/Azilroka/addonskins" end,
				order = 4,
			},
			skinlink = {
				type = "input",
				width = "full",
				name = ASL["Available Skins / Skin Requests"],
				get = function(info) return "http://www.tukui.org/forums/topic.php?id=28550" end,
				order = 5,
			},
		},
	}
	local order, blizzorder = 0, 0
	for skinName, _ in AS:OrderedPairs(AS.register) do
		if skinName ~= "MiscFixes" then
			if strfind(skinName, "Blizzard_") then
				Ace3OptionsPanel.Options.args.addonskins.args.blizzard.args[skinName] = GenerateOptionTable(skinName, blizzorder)
				blizzorder = blizzorder + 1
			else
				Ace3OptionsPanel.Options.args.addonskins.args.addons.args[skinName] = GenerateOptionTable(skinName, order)
				order = order + 1
			end
		end
	end
	if blizzorder == 0 then Ace3OptionsPanel.Options.args.addonskins.args.blizzard = nil end
end