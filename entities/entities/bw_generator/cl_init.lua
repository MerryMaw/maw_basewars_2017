include('shared.lua')

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Draw()
	self:DrawModel()
	
	local text = self.NiceName
	local text2 = {string.rep("*",self.ConsumedPower),string.rep("*",self.Power-self.ConsumedPower)}
	
	local Pos = self:LocalToWorld(self.OffsetPos)
	local Ang = self:LocalToWorldAngles(self.OffsetAng)
	
	surface.SetFont("3D2DFont32")
	local w,h = surface.GetTextSize(text)
	w = w + 8
	
	
	surface.SetFont("HL2Symbols")
	local w2,h2 = surface.GetTextSize(text2[1]..text2[2])
	
	cam.Start3D2D(Pos,Ang,0.1)
		surface.SetDrawColor(MAIN_BLACKCOLOR_FADE)
		surface.DrawRect(math.floor(-w/2),0,w+1,h)
		surface.DrawRect(math.floor(-w2/2)-5,50,w2+11,55)

		draw.DrawText(text,"3D2DFont32",0,0,MAIN_WHITECOLOR,1)
		draw.DrawText(text2[1],"HL2Symbols",-w2/2,30,MAIN_YELLOWCOLOR)
		draw.DrawText(text2[2],"HL2Symbols",-w2/2+w2/self.Power*self.ConsumedPower,30,MAIN_GREENCOLOR)
	cam.End3D2D()
end
