
local menu = menu

local sw,sh = ScrW(),ScrH()

local w,h = 600, 420
local x,y = sw / 2 - w / 2, sh / 2 - h / 2

function OpenFactionsMenu()
	if (!IsValid(menu)) then
		menu = vgui.Create("DFrame")
		menu:SetSize(w,h)
		menu:SetTitle("Faction Menu")
		menu:SetDraggable(true)
		menu:SetDeleteOnClose(false)
		menu:MakePopup( true )
		menu:Center()
		--menu:SetSkin("Basewars Remastered")

		local Tabs = vgui.Create( "DPropertySheet", menu)
		Tabs:Dock(FILL)
		--Tabs:SetSkin("Basewars Remastered")

		--Create tab
		local a = vgui.Create("DPanel")
		a.Paint = function() end

		local t = a:Add("DLabel")
		t:SetText("Faction Name")
		t:Dock(TOP)

		local F_Name = a:Add("DTextEntry")
		F_Name:Dock(TOP)

		local t = a:Add("DLabel")
		t:SetText("Faction Password")
		t:Dock(TOP)

		local F_Pass = a:Add("DTextEntry")
		F_Pass:Dock(TOP)

		local F_Color = a:Add("DColorMixer")
		F_Color:Dock(TOP)
		F_Color:DockMargin(5, 5, 5, 5)
		F_Color:SetAlphaBar(false)

		local F_Confirm = a:Add("DButton")
		F_Confirm:Dock(BOTTOM)
		F_Confirm:SetText("Create faction")
		F_Confirm.DoClick = function(s)
			CreateFaction(F_Name:GetValue(),F_Pass:GetValue(),ColorAlpha(F_Color:GetColor(),255))
			menu:SetVisible(false)
		end



		--Join tab
		local b = vgui.Create("DPanel")
		b.Paint = function(s,W,H) end

		local tList = b:Add("DListView")
		tList:Dock(TOP)
		tList:SetTall(200)
		tList:SetMultiSelect(false)
		tList:AddColumn("Name")
		tList:AddColumn("Players")

		local ref = b:Add("DButton")
		ref:Dock(TOP)
		ref:SetText("Refresh")
		ref.DoClick = function()
			tList:Clear()

			local P,F = player.GetAllFactions()

			for k,v in pairs(P) do
				tList:AddLine(k,#v)
			end
		end

		ref:DoClick()

		local t = b:Add("DLabel")
		t:SetText("Faction Password")
		t:Dock(TOP)
		t:DockMargin(0,5,0,5)

		local F_Pass = b:Add("DTextEntry")
		F_Pass:Dock(TOP)

		local Join = b:Add("DButton")
		Join:Dock(TOP)
		Join:SetText("Join")
		Join.DoClick = function(s)
			local S = tList:GetLine(tList:GetSelectedLine())
			
			if (IsValid(S)) then
				JoinFaction(S:GetColumnText(1),F_Pass:GetValue())
				menu:SetVisible(false)
			end
		end

		local t = b:Add("DLabel")
		t:SetText("Leave Faction")
		t:Dock(TOP)
		t:DockMargin(0,5,0,5)

		local Leave = b:Add("DButton")
		Leave:Dock(TOP)
		Leave:SetText("Leave")
		Leave.DoClick = function(s)
			if (LocalPlayer():HasFaction()) then
				LeaveFaction()
				menu:SetVisible(false)
			end
		end

		--Management tab
		local c = vgui.Create("DPanel")
		c.Paint = function(s,W,H) end

		--Why do I need to do dis garry :C FIX DIS FOR DTEXTENTRY!
		for k,v in pairs(a:GetChildren()) do
			v:SetZPos( k )
		end

		for k,v in pairs(b:GetChildren()) do
			v:SetZPos( k )
		end

		for k,v in pairs(c:GetChildren()) do
			v:SetZPos( k )
		end

		Tabs:AddSheet( "Create", a, "basewars2017/icons/brick_add.png" )
		Tabs:AddSheet( "Join", b, "basewars2017/icons/group.png" )
		Tabs:AddSheet( "Management", c, "basewars2017/icons/wrench.png" )
	end
	
	menu:SetVisible(true)
end