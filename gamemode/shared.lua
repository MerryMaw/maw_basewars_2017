DeriveGamemode("sandbox")

include("autolua.lua")

AddLuaSVFolder("sv_various")
AddLuaSVFolder("sv_database")

AddLuaSHFolder("sh_player")
AddLuaSHFolder("sh_various")

AddLuaCSFolder("cl_various")
AddLuaCSFolder("cl_hud/vgui")
AddLuaCSFolder("cl_hud")

GM.Name 			= "Basewars"
GM.Author 			= "The Maw"
GM.Email 			= "cjbremer@gmail.com"
GM.Website 			= "www.devinity2.eu"


function GM:PlayerNoClip( pl )
	return pl:IsAdmin()
end