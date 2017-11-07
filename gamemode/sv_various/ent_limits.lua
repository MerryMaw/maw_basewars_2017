
local meta = FindMetaTable("Player")

function meta:ClassExceedLimit(class)
	local e = IsClassSpawnable(class)
	
	if (!e) then return true end
	
	local c = 0
	
	for k,v in pairs(ents.FindByClass(class)) do
		if (!v:IsWeapon() and v:GetCreator() == self) then
			c = c + 1
		end
	end
	
	return c >= e.Limit
end