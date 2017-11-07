
-- Just a simple piece of script that rather inexpensively freezes whatever prop the player spawns and drops.

local function EntFreeze(pl,ent)
	local phys = ent:GetPhysicsObject()
	
	if (!IsValid(phys)) then return end

	phys:EnableMotion(false)
	phys:Sleep()
end

hook.Add("PlayerSpawnedProp","FreezeSpawnedProp",function( pl, model, ent )
	ent:SetCreator(pl)
	ent:SetHealth(ent:BoundingRadius()*10)
	EntFreeze(pl,ent)
end)

hook.Add("PhysgunDrop","FreezeDroppedProp",EntFreeze)