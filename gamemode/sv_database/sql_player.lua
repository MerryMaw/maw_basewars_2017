hook.Add("PlayerAuthed","SQL_LoadPlayer",function(pl) 
	SQL_LoadPlayer(pl) 
end)

function SQL_LoadPlayer(pl)
	local ID = SQLStr(pl:SteamID64())
	
	local c = mysql:Query("SELECT * FROM Accounts WHERE PlayerID="..ID,GAMEMODE.MainDatabase)
	
	function c.onSuccess(databas,Data)
		if (!IsValid(pl)) then return end
		
		if (Data and Data[1]) then
			print("Loaded user: "..pl:Nick().." from DB!")
			
			pl:SetMoney(Data[1].Money)
		else
			local q = [[INSERT IGNORE INTO Accounts(PlayerID,Money) VALUES
				(]]..ID..[[,0)]]
			
			mysql:Query(q,GAMEMODE.MainDatabase)
			
			print("New user: "..pl:Nick().." added to DB!")
		end
	end
end