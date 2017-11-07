AddCSLuaFile()

ENT.Base = "bw_printer"

ENT.NiceName	= "Paladium Money Printer"
ENT.MaxHealth 	= 750
ENT.Model 		= "models/props_c17/consolebox05a.mdl"
ENT.Material 	= "models/debug/debugwhite"
ENT.Color 		= Color(0, 161, 255, 255)
ENT.Power 		= 2
ENT.LevelStats 	= {
	[0] = {7200, 8200, 565000},
	[1] = {14400, 15400, 1130000},
	[2] = {28800, 29800, 2260000},
	[3] = {57600, 58600, 4520000},
	[4] = {115200, 116200, nil},
}

AddSpawnableEntity(
	{
		Class 		= string.Explode("/",ENT.Folder)[2],
		Name 		= ENT.NiceName,
		Category 	= "Printers",
		Model 		= ENT.Model,
		Limit 		= 2,
		Price		= 565000,
	}
)