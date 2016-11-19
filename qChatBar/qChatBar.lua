local addon = CreateFrame('Frame', 'qChatBar', qChatBar)
addon:SetScript('OnEvent', function(self, event, ...) self[event](self, event, ...) end)
addon:RegisterEvent('ADDON_LOADED')

local texture = "Interface\\Addons\\qChatBar\\media\\normTex"
local glowtex = "Interface\\Addons\\qChatBar\\media\\glowTex"

function framechat(f)
	f:SetBackdrop({
		bgFile = texture,
        edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1, 
		insets = {left = 1, right = 1, top = 1, bottom = 1} 
	})
	f:SetBackdropBorderColor(.15,.15,.15,0)	
end

local shadows = {
	bgFile =  texture,
	edgeFile = glowtex, 
	edgeSize = 4,
	insets = { left = 3, right = 3, top = 3, bottom = 3 }
}

function CreateShadow(f)
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -2, 2)
	shadow:SetPoint("BOTTOMRIGHT", 2, -2)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor( .05,.05,.05, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 1)
	f.shadow = shadow
	return shadow
end

local height, width = 13, 12

function addon:S(button)
ChatFrame_OpenChat("/s ", SELECTED_DOCK_FRAME);	
end
function addon:W(button)
ChatFrame_OpenChat("/w ", SELECTED_DOCK_FRAME);		
end
function addon:G(button)
ChatFrame_OpenChat("/g ", SELECTED_DOCK_FRAME);	
end
function addon:O(button)
ChatFrame_OpenChat("/o ", SELECTED_DOCK_FRAME);		
end
function addon:P(button)
ChatFrame_OpenChat("/p ", SELECTED_DOCK_FRAME);	
end
function addon:R(button)
ChatFrame_OpenChat("/raid ", SELECTED_DOCK_FRAME);
end
function addon:GE(button)
ChatFrame_OpenChat("/1 ", SELECTED_DOCK_FRAME);		
end
function addon:T(button)
ChatFrame_OpenChat("/2 ", SELECTED_DOCK_FRAME);		
end
function addon:D(button)
ChatFrame_OpenChat("/3 ", SELECTED_DOCK_FRAME);	
end
function addon:Y(button)
ChatFrame_OpenChat("/y ", SELECTED_DOCK_FRAME);		
end

function addon:Style()
	qChatBar:ClearAllPoints()
	qChatBar:SetParent(chatbar)
	
	s = CreateFrame('Button', 's', qChatBar)
    s:ClearAllPoints()
	s:SetParent(qChatBar)
	s:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 121)
	s:SetWidth(width)
	s:SetHeight(height)
	framechat(s)
	CreateShadow(s)
	s:SetBackdropColor(1,1,1,1)
	s:RegisterForClicks('AnyUp')
	s:SetScript('OnClick', addon.S)	
		
	w = CreateFrame('Button', 'w', qChatBar)
    w:ClearAllPoints()
	w:SetParent(qChatBar)
	w:SetPoint("RIGHT", s, "RIGHT", 0, -13.2)
	w:SetWidth(width)
	w:SetHeight(height)
	framechat(w)
	CreateShadow(w)
	w:SetBackdropColor(.7,.33,.82, 1) 
	w:RegisterForClicks('AnyUp')
	w:SetScript('OnClick', addon.W)
	
    g = CreateFrame('Button', 'g', qChatBar)
    g:ClearAllPoints()
	g:SetParent(qChatBar)
	g:SetPoint("RIGHT", w, "RIGHT", 0, -13.2)
	g:SetWidth(width)
	g:SetHeight(height)
	framechat(g)
	CreateShadow(g)
	g:SetBackdropColor(0,.8,0,1) 
	g:RegisterForClicks('AnyUp')
	g:SetScript('OnClick', addon.G)	
	
	
    o = CreateFrame('Button', 'o', qChatBar)
    o:ClearAllPoints()
	o:SetParent(qChatBar)
	o:SetPoint("RIGHT", g, "RIGHT", 0, -13.2)
	o:SetWidth(width)
	o:SetHeight(height)
	framechat(o)
	CreateShadow(o)
	o:SetBackdropColor(0,.54,0, 1) 
	o:RegisterForClicks('AnyUp')
	o:SetScript('OnClick', addon.O)	
	
	
    r = CreateFrame('Button', 'r', qChatBar)
	r:ClearAllPoints()
	r:SetParent(qChatBar)
	r:SetPoint("RIGHT", o, "RIGHT", 0, -13.2)
	r:SetWidth(width)
	r:SetHeight(height)
	framechat(r)
	CreateShadow(r)
	r:SetBackdropColor(.8,.4,.1, 1)
	r:RegisterForClicks('AnyUp')
    r:SetScript('OnClick', addon.R)	
    
	
	p = CreateFrame('Button', 'p', qChatBar)
	p:ClearAllPoints()
	p:SetParent(qChatBar)
	p:SetPoint("RIGHT", r, "RIGHT", 0, -13.2)
	p:SetWidth(width)
	p:SetHeight(height)
	framechat(p)
	CreateShadow(p)
	p:SetBackdropColor(.11,.5,.7, 1)
	p:RegisterForClicks('AnyUp')
    p:SetScript('OnClick', addon.P)	
	
	ge = CreateFrame('Button', 'ge', qChatBar)
	ge:ClearAllPoints()
	ge:SetParent(qChatBar)
	ge:SetPoint("RIGHT", p, "RIGHT", 0, -13.2)
	ge:SetWidth(width)
	ge:SetHeight(height)
	framechat(ge)
	CreateShadow(ge)
	ge:SetBackdropColor(.7,.7,0, 1)
	ge:RegisterForClicks('AnyUp')
    ge:SetScript('OnClick', addon.GE)
	
    t = CreateFrame('Button', 't', qChatBar)
	t:ClearAllPoints()
	t:SetParent(qChatBar)
	t:SetPoint("RIGHT", ge, "RIGHT", 0, -13.2)
	t:SetWidth(width)
	t:SetHeight(height)
	framechat(t)
	CreateShadow(t)
	t:SetBackdropColor(.7,.7,0, 1)
	t:RegisterForClicks('AnyUp')
    t:SetScript('OnClick', addon.T)
	
    d = CreateFrame('Button', 'd', qChatBar)
	d:ClearAllPoints()
	d:SetParent(qChatBar)
	d:SetPoint("RIGHT", t, "RIGHT", 0, -13.2)
	d:SetWidth(width)
	d:SetHeight(height)
	framechat(d)
	CreateShadow(d)
	d:SetBackdropColor(.7,.7,0, 1)
	d:RegisterForClicks('AnyUp')
    d:SetScript('OnClick', addon.D)
	
	y = CreateFrame('Button', 'y', qChatBar)
	y:ClearAllPoints()
	y:SetParent(qChatBar)
	y:SetPoint("RIGHT", d, "RIGHT", 0, -13.2)
	y:SetWidth(width)
	y:SetHeight(height)
	framechat(y)
	CreateShadow(y)
	y:SetBackdropColor(1,0,0, 1)
	y:RegisterForClicks('AnyUp')
    y:SetScript('OnClick', addon.Y)	
    
end

function addon:ADDON_LOADED(event, name)	
self:Style()	
end