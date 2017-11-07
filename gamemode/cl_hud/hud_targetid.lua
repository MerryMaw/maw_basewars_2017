local x,y = ScrW()/2,ScrH()/2+30


hook.Add("HUDPaint","TargetID",function()
	local tr 	= util.GetPlayerTrace( LocalPlayer() )
	tr 			= util.TraceLine( tr )
	
	local e 	= tr.Entity
	
	if (!IsValid(e)) then return end
	
	local hp = e:Health()
	
	if (hp > 0) then 
		draw.SimpleText(hp, "TargetIDSmall", x, y+20, MAIN_WHITECOLOR, 1, 1)
	end
	
	
	if (!e:IsPlayer()) then return end
	
	draw.SimpleText(e:Nick(), "TargetID", x, y, e:GetFactionColor(), 1, 1)
end)