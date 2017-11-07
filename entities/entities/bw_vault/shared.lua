
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "Money" )
end

AddSpawnableEntity(
	{
		Class 		= "bw_vault",
		Name 		= "Money Vault",
		Category 	= "Others",
		Model 		= "models/props_lab/powerbox01a.mdl",
		Limit 		= 1,
		Price		= 500,
	}
)