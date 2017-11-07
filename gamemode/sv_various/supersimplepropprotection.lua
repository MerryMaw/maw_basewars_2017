function GM:PhysgunPickup( pl, ent )
	return !ent:CreatedByMap() and !ent:IsPlayer() and (ent:GetCreator() == pl or pl:IsAdmin())
end
