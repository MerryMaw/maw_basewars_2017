
AddCSLuaFile("autolua.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function GM:Initialize()
	self.MainDatabase = mysql:Start("localhost","root","Admin123","gmod_basewars",3306)
	SQL_InitializeServerTables()
	
	resource.AddDir("materials/basewars2017")
	resource.AddFile("resource/fonts/halflife2.ttf")
end


-- We don't need to touch the default sandbox spawn so :3

function GM:PlayerLoadout( ply )
	ply:Give("weapon_physcannon")
	ply:Give("weapon_physgun")
	ply:Give("gmod_tool")
	ply:Give("bw_keys")
	
	ply:SelectWeapon("weapon_physgun")
	
	ply:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	
	for k,v in pairs(ply:GetWeapons()) do
		v:DrawShadow(false)
	end
	
	ply:SetWalkSpeed(250)
	ply:SetRunSpeed(350)
	
	ply:ConCommand("gf_config 1")
 
	return true
end

function GM:PlayerDeathSound()
	return true
end

function GM:EntityTakeDamage( e, dmginfo )
	
	if (IsValid(e:GetCreator())) then
		e:SetHealth(e:Health()-dmginfo:GetDamage()/10)
		
		if (e:Health() <= 0) then 
			e:Remove()
		end
	end
	//dmginfo:SetDamageType(DMG_GENERIC)
end