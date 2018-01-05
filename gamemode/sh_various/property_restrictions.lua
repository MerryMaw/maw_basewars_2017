
function GM:CanProperty( ply, property, ent )
	return ply:IsAdmin()
	--if ( !ply:IsAdmin() && property == "remover" ) then return false end
end