function GM:OnPlayerChat( pl, str, bTeamOnly, bPlayerIsDead )
	if (!IsValid(pl)) then return end
	
	local tab = {}

	if ( bPlayerIsDead ) then
		table.insert( tab, Color( 255, 30, 40 ) )
		table.insert( tab, "*DEAD* " )
	end

	if ( bTeamOnly ) then
		table.insert( tab, Color( 30, 160, 40 ) )
		table.insert( tab, "( TEAM ) " )
	end

	chat.AddText( unpack(tab), pl:GetFactionColor(), pl:Nick(), MAIN_WHITECOLOR, ": ", str )

	return true
end