
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

function ENT:SetupDataTables()
end


AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Generic Ammo Dispenser",
		Category 	= "Ammo",
		Model 		= "models/props_lab/reciever_cart.mdl",
		Limit 		= 1,
		Price		= 500,
	}
)