local AS, ASL = unpack(AddOnSkins)

function AS:UpdateLocale_zhTW()
	ASL.DataText.ToggleEmbed = '顯示/隱藏'
	ASL.DataText.LeftClick = '點選左鍵:顯示'
	ASL.DataText.RightClick = '點選右鍵:隱藏'

	ASL.EmbedSystem.ToggleLeftChat = '顯示/隱藏左側對話框'
	ASL.EmbedSystem.ToggleRightChat = '顯示/隱藏右側對話框'
	ASL.EmbedSystem.ToggleEmbed = '顯示/隱藏內嵌插件'
	ASL.EmbedSystem.ToggleOptions = '顯示/隱藏更多美化面板/選項'

	ASL.OptionsPanel.SkinDesc = '啟用/停用此美化面板.\n需重新啟動,變動方才生效。'
	ASL.OptionsPanel.EmbedDesc = '啟用/停用此插件內嵌，'
	ASL.OptionsPanel.OptionDesc = '啟用/停用此選項，'

	ASL["AddOn Skins"] = "插件美化"
	ASL["Blizzard Skins"] = "Blizzard 面板美化"
	ASL["BossMod Options"] = "首領對戰插件選項"
	ASL["DBM|VEM Font"] = "DBM|VEM 字型"
	ASL["DBM|VEM Font Size"] = "DBM|VEM 字體大小"
	ASL["DBM|VEM Font Flag"] = "DBM|VEM 字型描邊"
	ASL["DBM Transparent Radar"] = "DBM Transparent Radar"
	ASL["None"] = "無"
	ASL["OUTLINE"] = "描邊"
	ASL["THICKOUTLINE"] = "粗邊"
	ASL["MONOCHROME"] = "單線"
	ASL["MONOCHROMEOUTLINE"] = "單線邊"
	ASL["DBM|VEM Half-bar Skin"] = "DBM|VEM 計時條美化"
	ASL["BigWigs Half-Bar"] = "BigWigs 計時條美化"
	ASL["Embed Settings"] = "插件內嵌設定"
	ASL["Settings to control Embedded AddOns:\n\nAvailable Embeds: alDamageMeter | Details | Omen | Skada | Recount | TinyDPS"] = "「嵌入插件」的控制選項:\n\n可用於嵌入：alDamageMeter | 詳細內容 | Omen | Skada | Recount | TinyDPS"
	ASL["One Window Embed System"] = "One Window Embed System"
	ASL["Embed for One Window"] = "Embed for Main Window"
	ASL["Two Window Embed System"] = "Two Window Embed System"
	ASL["Window One Embed"] = "Window One Embed"
	ASL["Window Two Embed"] = "Window Two Embed"
	ASL["Window One Width"] = "Window One Width"
	ASL["Out of Combat (Hide)"] = "脫戰隱藏"
	ASL["Attach SexyCD to action bar"] = "SexyCD 依附至快捷列"
	ASL["Attach CoolLine to action bar"] = "CoolLine 依附至快捷列"
	ASL["Embed Transparancy"] = "內嵌插件透明度"
	ASL["Embed Below Top Tab"] = "嵌入至上側分頁列下"
	ASL["Recount Backdrop"] = "Recount 背景"
	ASL["Skada Backdrop"] = "Skada 背景"
	ASL["Omen Backdrop"] = "Omen 背景"
	ASL["WeakAura AuraBar"] = "WeakAura 光環列"
	ASL["Auction House"] = "拍賣場"
	ASL["FAQ's"] = "問與答"
	ASL["DBM/VEM Half-Bar Skin Spacing looks wrong. How can I fix it?"] = "DBM/VEM 美化計時條的間距看起來怪怪的.我要如何修正?"
	ASL["To use the DBM/VEM Half-Bar skin. You must change the DBM/VEM Options. Offset Y needs to be at least 15."] = "若使用 DBM/VEM 美化計時條.請務必將 DBM/VEM 選項中的 Y軸位移值 變更為 15 以上."
	ASL["Credits"] = "特別感謝"
	ASL["Credits:"] = "特別感謝:"
	ASL["About/Help"] = "相關資訊/協助"
	ASL["Links"] = "Links"
	ASL["Download Link"] = "下載連結"
	ASL["Changelog Link"] = "更新記錄連結"
	ASL["GitLab Link / Report Errors"] = "GitLab 連結/回報錯誤"
	ASL["Available Skins / Skin Requests"] = "可美化面板清單/提出美化需求"
	ASL["Version"] = "版本"
	ASL["Left Click to Show"] = "點選左鍵：顯示"
	ASL["Right Click to Hide"] = "點選右鍵：隱藏"
	ASL["Left Click:"] = "點選左鍵："
	ASL["Right Click:"] = "點選右鍵："
	ASL["Skin Template"] = "面板美化樣板"
	ASL["Hide Chat Frame"] = "隱藏對話框"
	ASL["Embed OoC Delay"] = "嵌入脫戰延遲時間"
	ASL['Reset Settings'] = "重置設定"
	ASL["WeakAura Cooldowns"] = "WeakAura 冷卻時間"
	ASL["Embed into Right Chat Panel"] = "嵌入右側對話框"
	ASL["Parchment"] = "羊皮紙"
	ASL["Enable Skin Debugging"] = "啟用美化功能除錯系統"
end
