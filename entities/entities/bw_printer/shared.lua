
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= "Maw"
ENT.Purpose			= "Stuff"


//Editable for child printers
ENT.MaxHealth		= 100
ENT.Model			= "models/props_lab/reciever01b.mdl"
ENT.LevelStats		= {}

ENT.Material		= nil
ENT.Color			= Color(255,255,255,255)
ENT.Power			= 1

ENT.OffsetAng 		= Angle(0,-90,0)
ENT.OffsetPos 		= Vector(4,0,3.4)

//Shared Vars
ENT.ConsumedPower 	= 0

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "Level" )
end

function ENT:IsPowered()
	return self.ConsumedPower == self.Power
end
		
		


/*
	LevelStats structure:
	
	{
		[Level] = {Min,Max,PriceUpgrade},
	}
	
*/