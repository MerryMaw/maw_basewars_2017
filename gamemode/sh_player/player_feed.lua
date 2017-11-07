
local meta = FindMetaTable("Player")
	
	
function meta:AddFeedMessage(msg,col)
	if (SERVER) then
		net.Start("FeedMessage")
			net.WriteString(msg)
			net.WriteColor(col)
		net.Send(self)
	else
		AddFeedMsg(msg,col)
	end
end

if (SERVER) then	
	util.AddNetworkString("FeedMessage")
else
	net.Receive("FeedMessage",function()
		AddFeedMsg(net.ReadString(),net.ReadColor())
	end)
end