hook.Add("PlayerSelectSpawn", "FindSpawnpoint", function(pl)
	for k,v in pairs(ents.FindByClass("bw_spawnpoint")) do
		if (v:GetCreator() == pl) then
			return v
		end
	end
end)