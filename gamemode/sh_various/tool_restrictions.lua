local RestrictedTools = {
	"duplicator"
}

function GM:CanTool( ply, tr, tool )
	if (SERVER) then
		if (IsValid(tr.Entity) and tr.Entity:GetCreator() != ply) then return false end
	end
	
	return ply:IsAdmin() or !table.HasValue(RestrictedTools,tool:lower())
end