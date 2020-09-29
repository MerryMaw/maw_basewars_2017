
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Armor Dispenser",
		Category 	= "Utility",
		Model 		= "models/props_combine/suit_charger001.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
