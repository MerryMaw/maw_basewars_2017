include('shared.lua')

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT


local ang = Angle(0,90,90)
local pos = Vector(13,0,10.5)

function ENT:Draw()
	self:DrawModel()
	
	local Ang = self:LocalToWorldAngles(ang)
	local Pos = self:LocalToWorld(pos)
	
	cam.Start3D2D(Pos,Ang,0.1)
		draw.DrawText("$"..math.NiceInt(self:GetMoney()),"3D2DFont64",0,-34,MAIN_WHITECOLOR,1)
	cam.End3D2D()
end