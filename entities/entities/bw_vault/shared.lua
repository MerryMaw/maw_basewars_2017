
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"

function ENT:SetupDataTables()
	self:NetworkVar( "String", 0, "StringMoney" )
end

function ENT:GetMoney()
	return tonumber(self:GetStringMoney()) or 0
end

function ENT:SetMoney(money)
	self:SetStringMoney(tostring(money))
end

AddSpawnableEntity(
	{
		Class 		= "bw_vault",
		Name 		= "Money Vault",
		Category 	= "Other",
		Model 		= "models/props_lab/powerbox01a.mdl",
		Limit 		= 1,
		Price		= 500,
	}
)