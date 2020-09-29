
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Gun Vault",
		Category 	= "Other",
		Model 		= "models/props/cs_militia/footlocker01_closed.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
