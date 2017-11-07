
local mat 	= Material("basewars2017/bg.png","noclamp")
local Grad 	= Material("gui/gradient_down")

function DrawBWBackground(x,y,w,h,col)
	surface.SetDrawColor(col)
	surface.SetMaterial(mat)
	surface.DrawTexturedRectUV(x,y,w,h,0,0,w/127,h/127)
	
	surface.SetDrawColor(col.r,col.g,col.b,40)
	surface.SetMaterial(Grad)
	surface.DrawTexturedRect(x,y,w,h)
end