---------------------------------------------------------------------------------------------
-- QHLOptions Class
---------------------------------------------------------------------------------------------
QHLOptions = {};
QHLOptions.__index = QHLOptions;

function QHLOptions:new()

	-- Metatable
	local self = {};
     	setmetatable(self, QHLOptions);
     	
	-- Splash Info Frame
	QHLOptions.panel = CreateFrame("Frame", "QHLOptions_Frame", UIParent, "QHLOPTIONSMAINTEMPLATE");
	QHLOptions.panel.okay = self.SaveOptions;
	QHLOptions.panel.cancel = self.ReloadOptions;
	QHLOptions.panel.default = self.LoadDefaultOptions;
	QHLOptions.panel.label = QHL_LOCALE_OPTIONSTAB;
	QHLOptions_FrameLabel1:SetText(QuestHelperLite:GetLabel());
	QHLOptions_FrameLabel2:SetText(QuestHelperLite:GetPrettyVersion());
	QHLOptions_FrameLabel3:SetText(QuestHelperLite:Concat(QHL_LOCALE_THANKS, QuestHelperLite:GetLabel(), "!"));
	QHLOptions_FrameLabel4:SetText(QuestHelperLite:Concat(QHL_LOCALE_SUPPORT, "   ", QHL_LOCALE_SUPPORTLINK));
	QHLOptions_FrameLabel6:SetText(QHL_LOCALE_OPTIONS);
	QHLOptions_FrameLabel7:SetText(QHL_LOCALE_TRACK_OPTIONS);

	-- Register in the Interface Addon Options GUI
	QHLOptions.panel.name = "QuestHelperLite";
	InterfaceOptions_AddCategory(QHLOptions.panel);

	return self;
end

function QHLOptions:Update()

end

function QHLOptions:ReloadOptions()

	QHLOptions:SetupOptions(true);
end

function QHLOptions:LoadDefaultOptions()

	if QHL then QHL:LoadDefaultSettings(); end
	QHLOptions:SetupOptions(true);
end

function QHLOptions:SetupOptions(reload)

	if QHL and (reload or not QHLOptions.loaded) then

		QHLOptions:SetCheckButton(QHLOptions_Frame_ShowArrow, QHL_LOCALE_MENU_ARROW_SHOW, QHL:GetSetting("arrow"));
		QHLOptions:SetCheckButton(QHLOptions_Frame_ShowTrail, QHL_LOCALE_TRAIL_SHOW, QHL:GetSetting("trail_show"));
		QHLOptions:SetCheckButton(QHLOptions_Frame_ZoneOnly, QHL_LOCALE_ZONE_ONLY, QHL:GetSetting("track_by_zone"));
		QHLOptions:SetCheckButton(QHLOptions_Frame_TrackByGroup, QHL_LOCALE_TRACK_BY_GROUP, QHL:GetSetting("track_by_group"));
		QHLOptions:SetCheckButton(QHLOptions_Frame_TrackByLevel, QHL_LOCALE_TRACK_BY_LEVEL, QHL:GetSetting("track_by_level"));
		QHLOptions:SetCheckButton(QHLOptions_Frame_AutoSortQuests, QHL_LOCALE_AUTOSORT_QUESTS, QHL:GetSetting("track_quests"));
		QHLOptions:SetSlider(QHLOptions_Frame_UpdateInterval, nil, QHL_LOCALE_UPDATEINTERVAL, 0.05, 1, 0.05, QHL:GetSetting("update_interval"), " sec");
		QHLOptions:SetSlider(QHLOptions_Frame_LevelOffset, nil, QHL_LOCALE_LEVELOFFSET, 0, 10, 1, QHL:GetSetting("track_level_offset"), "+/-");

		QHLOptions.loaded = true;
		--QHL:Print("QuestHelperLite Settings Loaded");
	end
end

function QHLOptions:SaveOptions()

	-- Fail Safe To Guarantee Options Aren't Overwritten With Unitiliazed Variables
	if not QHLOptions.loaded then QHLOptions:SetupOptions(); end

	QHL:SetSetting("arrow", QHLOptions_Frame_ShowArrow:GetChecked());
	QHL:SetSetting("trail_show", QHLOptions_Frame_ShowTrail:GetChecked());
	QHL:SetSetting("track_by_zone", QHLOptions_Frame_ZoneOnly:GetChecked());
	QHL:SetSetting("track_by_group", QHLOptions_Frame_TrackByGroup:GetChecked());
	QHL:SetSetting("track_by_level", QHLOptions_Frame_TrackByLevel:GetChecked());
	QHL:SetSetting("track_quests", QHLOptions_Frame_AutoSortQuests:GetChecked());
	QHL:SetSetting("update_interval", QHLOptions_Frame_UpdateInterval:GetValue());
	QHL:SetSetting("track_level_offset", QHLOptions_Frame_LevelOffset:GetValue());

	--QHL:Print("QuestHelperLite Settings Saved");
	
	QHLOptions:Update();
end

function QHLOptions:SetCheckButton(checkbutton, label, value)

	if checkbutton and QHL then
	
		local fonstring = getglobal(QHL:Concat(checkbutton:GetName(), "Text"));
		if label then
			checkbutton.label = label;
			fonstring:SetText(label);
		end
		if value then checkbutton:SetChecked(value); 
		else checkbutton:SetChecked(false); end
	end
end

function QHLOptions:SetEditBox(editbox, label, value)

	if editbox and QHL then
	
		local fontstring = getglobal(QHL:Concat(editbox:GetName(), "Text"));
		if label then
			editbox.label = label;
			fontstring:SetText(label);
		end
		if value then editbox:SetText(value); 
		else editbox:SetText(""); end
		editbox:SetCursorPosition(0);
	end
end

function QHLOptions:SetSlider(slider, width, label, min, max, step, value, unit)

	if slider and QHL then
	
		slider.unit = unit;
		local fontstring = getglobal(QHL:Concat(slider:GetName(), "Text"));
		if label then slider.label = label; end
		if value then
			fontstring:SetText(QHL:Concat(label," [", floor(value*100 + 0.5 ) / 100, unit, "]"));
		else
			fontstring:SetText(label);
		end
		fontstring:SetTextColor(0.99, 0.82, 0);
		if width then slider:SetWidth(width); end
		if min and max then slider:SetMinMaxValues(min, max); end
		if step then slider:SetValueStep(step); end
		if value then slider:SetValue(value); end
	end
end

function QHLOptions:SetDropdown(dropdown, label, value, ...)

	if dropdown and QHL then
		
		local fontstring = getglobal(QHL:Concat(dropdown:GetName(), "Label"));
		if label then 
			dropdown.label = label;
			fontstring:SetText(label); 
		end
		dropdown.arguments = {...};
		UIDropDownMenu_Initialize(dropdown, QHLOptions.SetDropdownList);
		if value then UIDropDownMenu_SetSelectedValue(dropdown, value); 
		else UIDropDownMenu_ClearAll(dropdown); end
	end
end

QHLOptions.DropDownInfo = {};
function QHLOptions:SetDropdownList()
	
	local info = UIDropDownMenu_CreateInfo();
	for index,value in ipairs(self.arguments) do
		if(value) then
			wipe(QHLOptions.DropDownInfo);
			QHLOptions.DropDownInfo.text = value;
			QHLOptions.DropDownInfo.value = value;
			QHLOptions.DropDownInfo.owner = UIDROPDOWNMENU_INIT_MENU;
			QHLOptions.DropDownInfo.func = QHLOptions.DropdownOnClick;
			UIDropDownMenu_AddButton(QHLOptions.DropDownInfo);
		end
	end
end