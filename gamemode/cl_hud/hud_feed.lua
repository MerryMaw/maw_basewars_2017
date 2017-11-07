local Main 

local grad_Down = surface.GetTextureID( "gui/gradient_down" )

function AddFeedMsg(msg,col)
	local l = Main.Msg:Add("DLabel")
	l:SetText(msg)
	l:SetTextColor(col)
	l:SetFont("ChatFont")
	l:SizeToContents()
	
	local i = 0
	while (Main.Msg:ChildCount()-i > 20) do
		Main.Msg:GetChild(i):Remove() 
		i = i+1
	end
	
	Main.VBar:AnimateTo(Main.Msg:GetTall(),0.5,0,0.5)
end
	
hook.Add("Initialize","InitFeedHUD",function()
	Main = vgui.Create("DScrollPanel")
	Main:SetPos(0,17)
	Main:SetSize(570, 170)
	Main.Paint = function(s,w,h)
		surface.SetDrawColor(MAIN_BLACKCOLOR_FADE_LESS)
		surface.SetTexture(grad_Down)
		surface.DrawTexturedRect(0,0,w,h)
		
		--surface.DrawOutlinedRect(0,0,w,h)
	end
	
	
	Main.VBar.Paint 		= function(s,w,h) end
	Main.VBar.btnGrip.Paint = function(s,w,h) 
		surface.SetDrawColor(MAIN_WHITECOLOR_FADE)
		surface.DrawRect(2 , 0 , w-4 , h)
	end
	Main.VBar.btnDown.Paint = function(s,w,h) 
		surface.SetDrawColor(MAIN_WHITECOLOR_FADE)
		surface.DrawRect(2 , 2 , w-4 , h-4)
	end
	Main.VBar.btnUp.Paint 	= function(s,w,h) 
		surface.SetDrawColor(MAIN_WHITECOLOR_FADE)
		surface.DrawRect(2 , 2 , w-4 , h-4)
	end
	
	local p = vgui.Create("DListLayout",Main)
	p:SetPos(0,0)
	p:SetSize(Main:GetSize())
	
	Main.Msg = p
end)
