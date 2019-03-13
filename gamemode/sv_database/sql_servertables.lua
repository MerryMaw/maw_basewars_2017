
function SQL_InitializeServerTables()
	local DB = GAMEMODE.MainDatabase
	if (!DB) then Error("Your database is fucked! :C") return end
	
	--Accounts
	local s = {
		"PlayerID BIGINT NOT NULL PRIMARY KEY",
		"Money BIGINT UNSIGNED",
	}
	
	s = "CREATE TABLE IF NOT EXISTS Accounts("..table.concat(s,",")..");"
	
	local a = mysql:Query(s,DB)
	
	function a.onCompleted(s,Results)
		print("Success")
	end
end

