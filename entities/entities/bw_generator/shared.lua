
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"


//Editable for child generators
ENT.MaxHealth		= 100
ENT.Model			= "models/props_vehicles/generatortrailer01.mdl"
ENT.UpgradeCost		= {}

ENT.Material		= nil
ENT.Color			= Color(255,255,255,255)
ENT.Power			= 1

ENT.OffsetAng 		= Angle(180,0,-90)
ENT.OffsetPos 		= Vector(-7,22,60)

//SharedVars
ENT.ConsumedPower 	= 0

function ENT:SetupDataTables()
	//self:NetworkVar( "Int", 0, "Level" )
end

/*
	LevelStats structure:
	
	{
		[Level] = {Min,Max,PriceUpgrade},
	}
	
*/