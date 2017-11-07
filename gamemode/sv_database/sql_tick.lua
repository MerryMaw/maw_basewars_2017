

--This is for the more frequent SQL queries, instead of doing alot of queries for each player, lets send all the necessary ones in one go. MUCH faster this way!
local CD = CurTime()

hook.Add("Tick","UpdateMySQL",function()
	if (CD > CurTime()) then return end
	
	local Ab = ""
	for k,v in pairs(player.GetAll()) do
		if (v.SQL_MoneyQuery) then
			Ab = Ab..v.SQL_MoneyQuery
			v.SQL_MoneyQuery = nil
		end
	end
	
	if (Ab != "") then
		mysql:Query(Ab,GAMEMODE.MainDatabase)
	end
	
	CD = CurTime()+1
end)