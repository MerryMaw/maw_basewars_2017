

local sw, sh = ScrW(), ScrH()

function GM:HUDPaint()	
	DrawBWHealthBar()
	
	surface.SetDrawColor(MAIN_BLACKCOLOR_FADE_LESS)
	surface.DrawRect(0,0,sw,17)
	
	draw.SimpleText("F1 - Help | F2 - Factions", "HUDFont", 5)
	
	--surface.SetDrawColor(MAIN_WHITECOLOR)
	--surface.DrawLine(0,17,sw,17)
end