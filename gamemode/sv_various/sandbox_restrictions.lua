

-- SANDBOX RESTRICTIONS FROM SPAWNMENU
-- Tyler fill out if I missed anything :3

function GM:PlayerSpawnNPC()
	return false
end

function GM:PlayerSpawnEffect()
	return false
end

function GM:PlayerSpawnRagdoll()
	return false
end

function GM:PlayerSpawnSENT(pl)
	return pl:IsAdmin()
end

function GM:PlayerSpawnSWEP()
	return false
end

function GM:PlayerSpawnVehicle()
	return false
end

function GM:PlayerGiveSWEP()
	return false
end

function GM:CanDrive()
	return false
end