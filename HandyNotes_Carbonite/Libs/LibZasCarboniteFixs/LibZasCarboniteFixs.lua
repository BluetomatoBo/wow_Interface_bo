--=========================================================================================================================
-- Library: Zasurus' Carbonite fixes - Information & Instructions
--[[=======================================================================================================================
    Origins:	I created this to fix Carbonite's code as it doesn't allow you to control the
                    colour of icon's added. I have posted on Carbonite's forums asking if the TINY
                    code change could be added (as it doesn't affect anything that doesn't pass the
                    colour to the icon) but nobody has replied so until they fix it I have created
                    this small fix/library.
                    
    Description: This replaces some of Carbonite's functions with an almost identical copy with
                    a slight changes:
                    
                    1-3 - Small changes to the public API to get it usable again
                          (guess it worked at some point!) 
                    
                    4-6 - These are three new public API's I believe are needed. They are just
                          pass-thought's really but reduce the likely hood of problems if Carbonite
                          changes it's code
                    
                    7 - "Nx.Map:UpI(dNG)" changed from hard coded icon colours to use the icon
                        colours you can already pass and are stored with the icon. If no colour
                        is passed/stored then this function will work exactly the same as before.
                    
                    8 - "Nx.Map:IOMD(but)" changed so that it doesn't ignore right clicks on objects
                        on the map that aren't valid types. Instead it clicks though them to the map
                        below. I can't see this being a problem as before it did nothing on a right
                        click on these objects and now it just lets the user access the map hidden
                        behind the object!
                    
                    As this replaces some functions it could cause problems if another addon does
                    the same or when Carbonite change that function and this fix isn't updated (or
                    hopefully removed if they integrate the suggested code change!). Therefore
                    if you intend to use this in your code ether make sure you keep it up to date
                    or contact me and I will send you updates for your addon every time I update it!
    
    
    Use: 	Add this file to your TOC file BEFORE the .lua files that will use it are loaded and make
            sure your addon has Carbonite as an optional dependency.
            
            -:NOTE:- Due to the fact this isn't a real library if you have an out of date version it it
            could and likely will cause problems! Best option is to ask Carbonite to add this to there
            official code (if they haven't done it by now!) :D
=========================================================================================================================]]

-----------------------------------------------------------------
-- Lib Setup
-----------------------------------------------------------------
	do
		local MAJOR_VERSION = "Fix_ZasCarboniteFixes-0.1";
		local MINOR_VERSION = 1;
		
		if not(LibStub) then
			error(MAJOR_VERSION .. " requires LibStub.");
		end;
		
		if not LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION) then
		  return;	-- already loaded and no upgrade necessary
		end;
	end;
-----------------------------------------------------------------

-- Ensure that Carbonite exists
if (Nx) then
	-- Updated by adding texture, width and height and passing these straight though to IIT()
    function Nx.MapInitIconType(icT,drM,tex1,w,h)
		local map=Nx.Map:GeM(1)
		-- Passed though tex1, w and h
        map:IIT(icT,drM,tex1,w,h)
	end
	
	-- Added col (Colour) and passed it though to AIP(). Will act as it was before if col not specified
    function Nx.MapAddIconPoint(icT,maN,x,y,tex1,col)
		local map=Nx.Map:GeM(1)
		local maI=Nx.MNTI1[maN]
		print("col = "..tostring(col).."");
		if maI then
			local wx,wy=map:GWP(maI,x,y)
			-- Passed col though instead of just nil and also returned icon so I can point to it later
            return map:AIP(icT,wx,wy,col,tex1)
		end
	end
	
	function Nx.MapAddIconRect(icT,maN,x,y,x2,y2,col)
		local map=Nx.Map:GeM(1)
		local maI=Nx.MNTI1[maN]
		if maI then
			-- Added a return as this was missing so I couldn't point to the object to change it's tooltip.
            return map:AIR(icT,maI,x,y,x2,y2,col)
		end
	end
	
	-----------------------------------------------------------------------------
	-- Surgested new function.
	-----------------------------------------------------------------------------
		-- Basic pass-through for changing the scale icon types disapear at
        function Nx.MapSetIconVisableScale(icT,sca)
			local map=Nx.Map:GeM(1)
			map:SITAS(icT,sca)
		end
		
		-- Basic pass-through for changing the alpha of icon types
        function Nx.MapSetIconAlpha(icT,alp,alN)
			local map=Nx.Map:GeM(1)
			map:SITA(icT,alp,alN)
		end
		
        -- Basic pass-through for changing the frame level of icon types
		function Nx.MapSetIconFrameLevel(icT,lev)
			local map=Nx.Map:GeM(1)
			map:SITL(icT,lev)
		end
	-----------------------------------------------------------------------------
	
	------------------------------------
	-- This is the changes I would like
	-- to enable coloured icons and enable
	-- right click though rectangles
	------------------------------------
		function Nx.Map:UpI(dNG)
		   local c2r1=Nx.U_21
		   local c2r=Nx.U_22
		   local d=self.Dat
		   local wpS=1
		   local wpM=self.GOp["MapIconScaleMin"]
		   if wpM>=0 then
			  wpS=self.ScD*.08
		   end
		   for type,v in pairs(d) do
			  v.Ena=dNG or strbyte(type)==33
			  if v.AtS then
				 if self.ScD<v.AtS then
					v.Ena=false
				 end
			  end
		   end
		   for k,v in pairs(d) do
			  if v.Ena then
				 if v.DrM=="ZP" then
					local sca=self.IcS
					local w=v.W*sca
					local h=v.H*sca
					for n=1,v.Num do
					   local ico=v[n]
					   local f=self:GIS(v.Lvl)
					   if self:CFZ(f,ico.X,ico.Y,w,h,0) then
						  f.NxT=ico.Tip
						  if ico.Tex1 then
							 f.tex1:SetTexture(ico.Tex1)
						  elseif v.Tex1 then
							 f.tex1:SetTexture(v.Tex1)
						  else
							 f.tex1:SetTexture(c2r1(ico.Col1))
						  end
					   end
					end
				 elseif v.DrM=="WP" then
					local sca=self.IcS*v.Sca*wpS
					local w=max(v.W*sca,wpM)
					local h=max(v.H*sca,wpM)
					if v.AlN then
					   local aNe=v.AlN*(abs(GetTime() % .7-.35)/.7+.5)
					   for n=1,v.Num do
						  local ico=v[n]
						  local f=self:GIS(v.Lvl)
						  if v.ClF1(self,f,ico.X,ico.Y,w,h,0) then
							 f.NxT=ico.Tip
							 f.NXType=3000
							 f.NXData=ico
							 if ico.Tex1 then
								f.tex1:SetTexture(ico.Tex1)
							 elseif v.Tex1 then
								f.tex1:SetTexture(v.Tex1)
							 else
								f.tex1:SetTexture(c2r1(ico.Col1))
							 end
							 local a=v.Alp
							 local dis=(ico.X-self.PlX) ^ 2+(ico.Y-self.PlY) ^ 2
							 if dis<306 then
								a=aNe
							 end
							 f.tex1:SetVertexColor(1,1,1,a)
						  end
					   end
					else
					   for n=1,v.Num do
						  local ico=v[n]
						  local f=self:GIS(v.Lvl)
						  if v.ClF1(self,f,ico.X,ico.Y,w,h,0) then
							 f.NxT=ico.Tip
							 f.NXType=3000
							 f.NXData=ico
							 if ico.Tex1 then
								f.tex1:SetTexture(ico.Tex1)
							 elseif v.Tex1 then
								f.tex1:SetTexture(v.Tex1)
							 else
								f.tex1:SetTexture(c2r1(ico.Col1))
							 end
							 if v.Alp then
								-------------------------------------------------------------------------------------------
								-- Replaced code to allow colour for icons
								-------------------------------------------------------------------------------------------
									local r,g,b = 1,1,1
									if (ico.Col1) then
										r,g,b = c2r1(ico.Col1)
									end;
									f.tex1:SetVertexColor(r,g,b,v.Alp)
									
									---------------------------------------
									-- Old line
									---------------------------------------
									-- f.tex1:SetVertexColor(1,1,1,v.Alp)
									---------------------------------------
								-------------------------------------------------------------------------------------------
							 end
						  end
					   end
					end
				 elseif v.DrM=="ZR" then
					local x,y,x2,y2
					for n=1,v.Num do
					   local ico=v[n]
					   local f=self:GIS(v.Lvl)
					   f.NxT=ico.Tip
					   
					   x,y=self:GWP(ico.MaI,ico.X,ico.Y)
					   x2,y2=self:GWP(ico.MaI,ico.X2,ico.Y2)
					   if self:CFTL(f,x,y,x2-x,y2-y) then
						  if v.Tex2 then
							 f.tex1:SetTexture(v.Tex1)
						  else
							 f.tex1:SetTexture(c2r(ico.Col1))
						  end
					   end
					end
				 end
			  end
		   end
		end

		-- Mouse button pressed DOWN on a rectange over the map
        function Nx.Map:IOMD(but)
			local this=self
			local map=this.NxM1
			
			map:CaC3()
			map.ClF=this
			map.ClT2=this.NXType
			map.ClI=this.NXData
			
			local shi=IsShiftKeyDown()
			
			if but=="LeftButton" then
				local cat1=floor((this.NXType or 0)/1000)
				
				if cat1==2 and shi then
					if map.BGIN>0 then
						local _,_,_,str=strsplit("~",map.BGM)
						local _,_,_,st2=strsplit("~",this.NXData)
						if str~=st2 then
							Nx.Tim:Fir("BGInc")
						end
					end
					
					map.BGM=this.NXData
					map.BGIN=map.BGIN+1
					UIErrorsFrame:AddMessage("Inc " .. map.BGIN,1,1,1,1)
					Nx.Tim:Sta("BGInc",1.5,map,map.BGIST)
				else
					if map:IDC() then
						if cat1==3 then
							map:GM_OG()
						end
					else
						map.OMD(map.Frm,but)
					end
				end
			else
				if but=="RightButton" then
					local typ=this.NXType
					
					if typ then
						local i=floor(typ/1000)
						
						if i==1 then
							map:BPL()
							map.PIM:Ope()
						elseif i==2 then
							Nx.Tim:Fir("BGInc")
							map.BGM=this.NXData
							map.BGIM:Ope()
						elseif i==3 then
							map:GMO(this.NXData,typ)
						elseif i==9 then
							Nx.Que:IOMD(this)
						end
						---------------------------------------------------------------------------------------------------
						-- Added code to fix right click ignore issue for rectangles
						---------------------------------------------------------------------------------------------------
							else -- Else this isn't anthing significant so ignore it and just click the map below!
								map.OMD(map.Frm,but)
						---------------------------------------------------------------------------------------------------
					end
				else
					map.OMD(map.Frm,but)
				end
			end
		end
	------------------------------------
end;