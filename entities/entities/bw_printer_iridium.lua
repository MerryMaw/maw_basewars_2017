AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Rhenium Money Printer"
ENT.MaxHealth 	= 800
ENT.Model 		= "models/props_c17/consolebox05a.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(33, 255, 0, 255)
ENT.Power 		= 2
ENT.LevelStats 	= {
	[0] = {2300, 2800, 180000},
	[1] = {4600, 5100, 360000},
	[2] = {9200, 9700, 720000},
	[3] = {18400, 18900, 1440000},
	[4] = {36800, 37200, nil},
}

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 3,
		Price		= 180000,
	}
)