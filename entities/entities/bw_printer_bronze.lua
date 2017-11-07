AddCSLuaFile()

ENT.Base 		= "bw_printer"

ENT.NiceName	= "Bronze Money Printer"
ENT.MaxHealth 	= 150
ENT.Model 		= "models/props_lab/reciever01b.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(142, 115, 35, 255)
ENT.Power 		= 1
ENT.LevelStats 	= {
	[0] = {50, 75, 2000},
	[1] = {100, 125, 4000},
	[2] = {200, 225, 8000},
	[3] = {400, 425, 16000},
	[4] = {800, 825, nil},
}

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 4,
		Price		= 2000,
	}
)