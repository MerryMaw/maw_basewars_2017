
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

/* Resource consumption etc */
ENT.Power			= 2
ENT.ConsumedPower 	= 0

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "Level" )
	self:NetworkVar( "Bool", 0, "Online" )
	self:NetworkVar( "Entity", 0, "Target" )
end

function ENT:IsPowered()
	return self.ConsumedPower == self.Power
end


AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= "Floor Turret",
		Category 	= "Defence",
		Model 		= "models/Combine_turrets/Floor_turret.mdl",
		Limit 		= 1,
		Price		= 500,
	}
)
