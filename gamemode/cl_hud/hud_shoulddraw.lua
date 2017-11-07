
function GM:HUDShouldDraw( name )
	if (name == "CHudHealth" or 
		name == "CHudBattery") then return false end
		
	return true
end