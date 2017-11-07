
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "Money" )
end