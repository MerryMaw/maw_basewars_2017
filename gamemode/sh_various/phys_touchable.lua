
-- Don't return true otherwise, as it can affect the simple prop protection thingy on the otherside.
hook.Add("PhysgunPickup","CanTouchGamemodeSpecific",function(pl,ent)
	if (ent.Untouchable) then return false end
end)