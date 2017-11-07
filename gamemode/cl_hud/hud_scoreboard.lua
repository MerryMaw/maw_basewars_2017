
local sw,sh = ScrW(),ScrH()

local bh,offh = 256,100
local w,h = 800,300
local x,y = sw/2-w/2,sh/2-h/2

local Grad_Up 		= Material("gui/gradient_up")
local Grad 			= Material("gui/gradient_down")

local PlayerList = nil

local function PopulateList()
	if (!PlayerList) then return end
	
	PlayerList.List:Clear()
	
	local lp = LocalPlayer()
	
	local dat,factions = player.GetAllFactions()
	
	for faction,pllist in pairs(dat) do
		local col = factions[faction] or MAIN_DEFAULT_FACTIONCOLOR
		
		local a = PlayerList.List:Add("DLabel")
		a:SetText(faction)
		a:SetTextColor(col)
		a:SetFont("HUDFontSubtitle")
		a:SizeToContents()
		a:DockMargin(0, 10, 0, 0)
		a.Paint = function(s,w,h)
			surface.SetDrawColor(ColorAlpha(MAIN_BLACKCOLOR,240))
			surface.DrawRect(0,0,w,h)
			
			surface.SetDrawColor(ColorAlpha(col,50))
			surface.SetMaterial(Grad)
			surface.DrawOutlinedRect(0,0,w,h)
			surface.DrawTexturedRect(0,0,w,h*2)
		end
		
		for i,v in pairs(pllist) do
			local a = PlayerList.List:Add("DPanel")
			a:SetText("")
			a:SetTall(22)
			a.Paint = function(s,W,H)
				if (!IsValid(v)) then return end
				
				surface.SetDrawColor(ColorAlpha(col,20+20*(i%2)))
				surface.DrawRect(0,0,W,H)
				
				local Col = ColorAlpha(col,230)
				
				draw.SimpleText(v:Nick(),"Trebuchet18",10,H/2,Col,nil,1)
				draw.SimpleText(v:Ping(),"Trebuchet18",W-13,H/2,Col,2,1)
			end
		end
	end
end
	

function GM:ScoreboardShow()
	if (!PlayerList) then
		PlayerList = vgui.Create("DPanel")
		PlayerList:SetPos(x,y-offh/2)
		PlayerList:SetSize(w,h+offh)
		--PlayerList:SetTitle("")
		PlayerList:MakePopup()
		PlayerList:SetAlpha(0)
		--PlayerList:SetDraggable( false )
		--PlayerList:ShowCloseButton( false )
		PlayerList.OldPaint = PlayerList.Paint
		PlayerList.Paint = function(s,w,h)
			s.OldPaint(s,w,h)
			surface.SetDrawColor(MAIN_BLACKCOLOR_FADE)
			surface.SetMaterial(Grad_Up)
			
			surface.DrawTexturedRect(0,offh,w,h-offh)
			--surface.DrawRect(0,0,w,offh)
			surface.DrawTexturedRect(0,0,w,offh)
			
			--The banner
			draw.SimpleText(self.Name,"HUDFontTitle",w/2,offh/2,MAIN_WHITECOLOR,1,1)
		end
		
		PlayerList.Pane = vgui.Create("DScrollPanel",PlayerList)
		PlayerList.Pane:SetPos(5,offh+5)
		PlayerList.Pane:SetSize(w-10,h-10)
		PlayerList.Pane.Paint = function(s,w,h) end
		
		PlayerList.Pane.VBar.Paint = function(s,w,h) end
		PlayerList.Pane.VBar.btnGrip.Paint = function(s,w,h)  
			surface.SetDrawColor(MAIN_WHITECOLOR_FADE)
			surface.DrawRect(2,2,w-4,h-4,MAIN_WHITECOLOR_FADE) 
		end
		PlayerList.Pane.VBar.btnDown.Paint 	= PlayerList.Pane.VBar.btnGrip.Paint
		PlayerList.Pane.VBar.btnUp.Paint 	= PlayerList.Pane.VBar.btnGrip.Paint
		
		PlayerList.List = vgui.Create("DListLayout",PlayerList.Pane)
		PlayerList.List:SetSize(PlayerList.Pane:GetWide()-10,PlayerList.Pane:GetTall()-10)
		PlayerList.List:SetPos(5,5)
	end
	
	PopulateList()
	
	PlayerList:Stop()
	PlayerList:SetVisible(true)
	PlayerList:AlphaTo( 255, 0.2, 0, function() end )
end

function GM:ScoreboardHide()
	PlayerList:Stop()
	PlayerList:AlphaTo( 0, 0.2, 0, function(anim,pan) pan:SetVisible(false) end )
end

function GM:HUDDrawScoreBoard()
end


