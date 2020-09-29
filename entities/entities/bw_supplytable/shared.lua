
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Supply Table",
		Category 	= "Utility",
		Model 		= "models/props/cs_militia/table_shed.mdl",
		Limit 		= 1,
		Price		= 2500,
	}
)
