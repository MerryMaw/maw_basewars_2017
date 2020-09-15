local RestrictedTools = {
	"duplicator"
}

function GM:CanTool( ply, tr, tool )
	if (SERVER) then
		if (IsValid(tr.Entity)) then
			if (tr.Entity:CreatedByMap()) then
				return false
			elseif (IsValid(tr.Entity:GetCreator())) then 
				if (tr.Entity:GetCreator() != ply) then
					return false 
				end
			else
				tr.Entity:SetCreator(ply)
			end
		end
	end
	
	return ply:IsAdmin() or !table.HasValue(RestrictedTools,tool:lower())
end