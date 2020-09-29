

--The chat commands function
local ChatCommands = {}

function AddChatCommand(Str,FunctionCallback)
	ChatCommands["/"..Str:gsub(" ","_"):lower()] = FunctionCallback
end

hook.Add( "PlayerSay", "ChatCommandsBW", function( ply, text, team )
	local Dat = string.Explode(" ",text)
	
	if (ChatCommands[Dat[1]:lower()]) then
		ChatCommands[Dat[1]:lower()](ply,table.concat(Dat," ",2))
		
		return false
	end
end)



AddChatCommand("upgrade",function(pl,str)
	local e = pl:GetEyeTrace()
	e = e.Entity
	
	if (IsValid(e) and e.Upgrade) then
		if (e:GetCreator() == pl) then
			e.Entity:Upgrade(pl)
		end
	end
end)



AddChatCommand("dropmoney",function(pl,str)
	local Dat = tonumber(string.Explode(" ",str)[1])
	
	if (Dat and Dat > 0 and Dat <= pl:GetMoney()) then
		pl:SetMoney(pl:GetMoney() - Dat)
		DropMoney(Dat, pl:GetShootPos()+pl:GetAimVector()*20)
	end
end)

