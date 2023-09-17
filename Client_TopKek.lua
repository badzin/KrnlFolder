coroutine.resume(coroutine.create(function()
--- pre-init definitions ---
-- On this was LEAKED BY https://www.youtube.com/channel/UCbr8tL6wPOowOOfnRi02a6A (SUBSCRIBE)--

pool = {}
pool.new = function()
	local base = {}
	base.global = {}
	base.class = function(name) base[name] = {} end
	base.add = function(class, name, func) base[class][name] = func end
	base.define = function(class, name, val) base[class][name] = val end
	base.get = function(class, name) return base[class][name] end
	base.call = function(class, name) base[class][name]() end
	return base
end
local print = function(k) print("[T0PK3K dbg]: ".. k) end

--- init base ---

local kek = {}
kek.pool = pool.new(); pool = kek.pool; player = game.Players.LocalPlayer;

CreateObject = function(properties)
	local object = Instance.new(properties.Class)
	for i, v in pairs(properties) do
		pcall(function()
			if v ~= "Class" then
				object[i] = v
			end
		end)
	end	
	return object
end

-- t.menus will now define pre-created objects instead of just '0xf'
kek.menus = {
	["Main"] = {},
	["LocalPlayer"] = {Links = {}, Auto = {}, ReqBar = false},
	["Server"] = {Links = {"Destruction"}, Auto = {}, ReqBar = false},
	["Scripts"] = {Links = {}, Auto = {
		CreateObject {
			Class = "TextBox",
			Name = "search",
			BackgroundColor3 = Color3.new(14/255, 60/255, 66/255),
			BorderColor3 = Color3.new(3/255, 53/255, 49/255),
			Position = UDim2.new(0, 13, 0, 10),
			Size = UDim2.new(1, -26, 0, 27),
			Font = Enum.Font.SourceSans,
			FontSize = Enum.FontSize.Size14,
			Text = "Search for a script",
			TextColor3 = Color3.new(204/255, 204/255, 204/255)
		},
		CreateObject {
			Class = "ScrollingFrame",
			Name = "list",
			BackgroundColor3 = Color3.new(3/255, 39/255, 40/255),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 13, 0, 50),
			Size = UDim2.new(1, -26, 1, -60),
			CanvasSize = UDim2.new(0, 0, 0, 0)
		},
	}, ReqBar = false},
	["Players"] = {Links = {}, Auto = {}, ReqBar = true},
	["Miscellaneous"] = {Links = {}, Auto = {}, ReqBar = false},
	["Destruction"] = {Links = {}, Auto = {}, ReqBar = false, DoNotInclude = true}
}


--- global definitions ---
pool.define("global","gui", game:GetObjects("rbxassetid://388041033")[1]); local gui = pool.get("global", "gui");
pool.define("global","root", pool.get("global", "gui").root)
pool.define("global","main", pool.get("global", "root").main)
pool.define("global","title", pool.get("global", "root").topbar.title)
pool.define("global","NoTab_InnerSize",UDim2.new(1,-10,1,-60))
pool.define("global","NoTab_InnerPos",UDim2.new(0,5,0,56))
pool.define("global","StateRunning",false)
pool.define("global","TabTemplate",pool.get("global", "gui").root.template.tabframe.tabtemp)
pool.define("global","WindowTemplate",pool.get("global","gui").root.template)
pool.define("global","CurrentPlayers",{})

--- utility (general utility) --
pool.class("utility")
pool.utility.IterateObject = function(object, class, func)
	local function localiter(o)
		for i, v in pairs(o:GetChildren()) do
			if v:IsA(class) then
				func(v)
			end
			localiter(v)
		end
	end
	localiter(object)
end
pool.utility.GetObject = function(name)
	local function localiter(o)
		for i, v in pairs(o:GetChildren()) do
			if v.Name ==  name then return v end
			localiter(v)
		end
	end
	return localiter(gui)
end print("LOAD")
pool.utility.CreateObject = function(properties)
	local object = Instance.new(properties.Class)
	for i, v in pairs(properties) do
		pcall(function()
			if v ~= "Class" then
				object[i] = v
			end
		end)
	end	
	return object
end
pool.utility.SetProperties = function(obj, properties)
	for i, v in pairs(properties) do
		pcall(function()
			obj[i] = v
		end)
	end
end
pool.utility.CheckDependancies = function(obj, deps)
	for i, v in pairs(deps) do
		if not obj[v] then
			return false
		end
	end
	return true
end
pool.utility.LittleFriend = function(p)
		-- thanks rias<3
	plr=p.Character
	Shaft=Instance.new("Part", plr)
	Shaft.Name='Shaft'
	Shaft.Size=Vector3.new(1, 2.5, 1)
	Shaft.TopSurface=0
	Shaft.BottomSurface=0
	Shaft.CanCollide=true
	Cyln=Instance.new("CylinderMesh", Shaft)
	Cyln.Scale=Vector3.new(0.5,0.7,0.5)
	Instance.new("Weld", plr)
	plr.Weld.Part0=plr.Torso
	plr.Weld.Part1=plr.Shaft 
	plr.Weld.C0=CFrame.new(0,-0.35,-0.9)*CFrame.fromEulerAnglesXYZ(2.2,0,0) 
	Shaft.BrickColor=BrickColor.new("Pastel brown")
	Tip=Instance.new("Part", plr)
	Tip.Name='Tip'
	Tip.TopSurface=0
	Tip.BottomSurface=0
	Tip.Size=Vector3.new(1, 1, 1)
	Tip.CanCollide=true
	Tip.Touched:connect(function(prt) if prt.Parent~=player then spawn(function() for i=1, 5 do local pert=Instance.new("Part", player) pert.CFrame=CFrame.new(prt.Position) pert.CanCollide=true local mesh=Instance.new("BlockMesh", pert) mesh.Scale=Vector3.new(0.2,0.2,0.2) pert.BrickColor=BrickColor.new("White") end end) end end)
	Cyln2=Instance.new("SpecialMesh", Tip)
	Cyln2.MeshType='Sphere'
	Cyln2.Scale=Vector3.new(0.6,0.6,0.6)
	Instance.new("Weld", plr).Name='Weld2'
	plr.Weld2.Part0=plr.Shaft
	plr.Weld2.Part1=plr.Tip 
	plr.Weld2.C0=CFrame.new(0,-.9,0)
	Tip.BrickColor=BrickColor.new("Pink")
	-----
	Ball1=Instance.new("Part", plr)
	Ball1.Name='Ball1'
	Ball1.Size=Vector3.new(1, 1, 1)
	Ball1.TopSurface=0
	Ball1.BottomSurface=0
	Cyln3=Instance.new("SpecialMesh", Ball1)
	Cyln3.MeshType='Sphere'
	Cyln3.Scale=Vector3.new(0.4,0.4,0.4)
	Instance.new("Weld", plr).Name='Weld3'
	plr.Weld3.Part0=plr.Shaft
	plr.Weld3.Part1=plr.Ball1 
	plr.Weld3.C0=CFrame.new(0.225,.4,0.2)
	Ball1.BrickColor=BrickColor.new("Pastel brown")
	-----
	Ball2=Instance.new("Part", plr)
	Ball2.Name='Ball2'
	Ball2.Size=Vector3.new(1, 1, 1)
	Ball2.TopSurface=0
	Ball2.BottomSurface=0
	Cyln3=Instance.new("SpecialMesh", Ball2)
	Cyln3.MeshType='Sphere'
	Cyln3.Scale=Vector3.new(0.4,0.4,0.4)
	Instance.new("Weld", plr).Name='Weld4'
	plr.Weld4.Part0=plr.Shaft
	plr.Weld4.Part1=plr.Ball2 
	plr.Weld4.C0=CFrame.new(-0.225,.4,0.2)
	Ball2.BrickColor=BrickColor.new("Pastel brown")
end
pool.utility.ScalePlayer = function(p, size)
	-- omfg thanks var
	local pchar = p.Character
		local function scale(chr,scl)
		
			for _,v in pairs(pchar:GetChildren()) do
				if v:IsA("Hat") then
					v:Clone()
					v.Parent = game.Lighting
				end
			end
				
		    local Head = chr['Head']
		    local Torso = chr['Torso']
		    local LA = chr['Left Arm']
		    local RA = chr['Right Arm']
		    local LL = chr['Left Leg']
		    local RL = chr['Right Leg']
		    local HRP = chr['HumanoidRootPart']
		
		    wait(0.1)
		   
		    Head.formFactor = 3
		    Torso.formFactor = 3
		    LA.formFactor = 3
		    RA.formFactor = 3
		    LL.formFactor = 3
		    RL.formFactor = 3
		    HRP.formFactor = 3
		    
		    Head.Size = Vector3.new(scl * 2, scl, scl)
		    Torso.Size = Vector3.new(scl * 2, scl * 2, scl)
		    LA.Size = Vector3.new(scl, scl * 2, scl)
		    RA.Size = Vector3.new(scl, scl * 2, scl)
		    LL.Size = Vector3.new(scl, scl * 2, scl)
		    RL.Size = Vector3.new(scl, scl * 2, scl)
		    HRP.Size = Vector3.new(scl * 2, scl * 2, scl)
		    
		    local Motor1 = Instance.new('Motor6D', Torso)
		    Motor1.Part0 = Torso
		    Motor1.Part1 = Head
	    	Motor1.C0 = CFrame.new(0, 1 * scl, 0) * CFrame.Angles(-1.6, 0, 3.1)
	    	Motor1.C1 = CFrame.new(0, -0.5 * scl, 0) * CFrame.Angles(-1.6, 0, 3.1)
	    	Motor1.Name = "Neck"
				    
	    	local Motor2 = Instance.new('Motor6D', Torso)
	    	Motor2.Part0 = Torso
	    	Motor2.Part1 = LA
	    	Motor2.C0 = CFrame.new(-1 * scl, 0.5 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor2.C1 = CFrame.new(0.5 * scl, 0.5 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor2.Name = "Left Shoulder"
	    	
	    	local Motor3 = Instance.new('Motor6D', Torso)
	   		Motor3.Part0 = Torso
	    	Motor3.Part1 = RA
	    	Motor3.C0 = CFrame.new(1 * scl, 0.5 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor3.C1 = CFrame.new(-0.5 * scl, 0.5 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor3.Name = "Right Shoulder"
	    	
	    	local Motor4 = Instance.new('Motor6D', Torso)
	    	Motor4.Part0 = Torso
	    	Motor4.Part1 = LL
	    	Motor4.C0 = CFrame.new(-1 * scl, -1 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor4.C1 = CFrame.new(-0.5 * scl, 1 * scl, 0) * CFrame.Angles(0, -1.6, 0)
	    	Motor4.Name = "Left Hip"
	    	
	    	local Motor5 = Instance.new('Motor6D', Torso)
	    	Motor5.Part0 = Torso
	    	Motor5.Part1 = RL
	    	Motor5.C0 = CFrame.new(1 * scl, -1 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor5.C1 = CFrame.new(0.5 * scl, 1 * scl, 0) * CFrame.Angles(0, 1.6, 0)
	    	Motor5.Name = "Right Hip"
	    	
	    	local Motor6 = Instance.new('Motor6D', HRP)
	    	Motor6.Part0 = HRP
	    	Motor6.Part1 = Torso
	    	Motor6.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(-1.6, 0, -3.1)
	    	Motor6.C1 = CFrame.new(0, 0, 0) * CFrame.Angles(-1.6, 0, -3.1)
	    	    
		end
		
		scale(pchar, size)
	
		for _,v in pairs(game.Lighting:GetChildren()) do
			if v:IsA("Hat") then
				v.Parent = pchar
			end
		end
end
pool.utility.GetPlayers = function(str)
	if str == "all" then
		return game.Players:GetPlayers()
	end
	if str == "me" then
		return {game.Players.LocalPlayer}
	end
	if str == "others" then
		local cm = {}
		for i, v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer then
				table.insert(cm, v)
			end
		end
		return cm
	end
	local pn = str:gmatch("([^,]+)")
	local pl = {}
	for ln in pn do
		for i, v in pairs(game.Players:GetPlayers()) do
			local nm = (v.Name):lower()
			if string.sub(nm,1,#ln)==(ln):lower() then
				table.insert(pl, v)
			end
		end
	end
	return pl
end
pool.utility.StartFly = function()
local mouse=game.Players.LocalPlayer:GetMouse''
localplayer=game.Players.LocalPlayer
game.Players.LocalPlayer.Character:WaitForChild("Torso")
  local torso = game.Players.LocalPlayer.Character.Torso 
  local flying = true
  local speed=0
  local keys={a=false,d=false,w=false,s=false} 
  local e1
  local e2
  local function start()
   local pos = Instance.new("BodyPosition",torso)
   local gyro = Instance.new("BodyGyro",torso)
   pos.Name="EPIXPOS"
   pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
   pos.position = torso.Position
   gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
   gyro.cframe = torso.CFrame
   repeat
    wait()
    localplayer.Character.Humanoid.PlatformStand=true
    local new=gyro.cframe - gyro.cframe.p + pos.position
    if not keys.w and not keys.s and not keys.a and not keys.d then
     speed=1
    end
    if keys.w then 
     new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
     speed=speed+0.01
    end
    if keys.s then 
     new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
     speed=speed+0.01
    end
    if keys.d then 
     new = new * CFrame.new(speed,0,0)
     speed=speed+0.01
    end
    if keys.a then 
     new = new * CFrame.new(-speed,0,0)
     speed=speed+0.01
    end
    if speed>5 then
     speed=5
    end
    pos.position=new.p
    if keys.w then
     gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
    elseif keys.s then
     gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
    else
     gyro.cframe = workspace.CurrentCamera.CoordinateFrame
    end
   until flying==false
   if gyro then gyro:Destroy() end
   if pos then pos:Destroy() end
   flying=false
   localplayer.Character.Humanoid.PlatformStand=false
   speed=0
  end
  e1=mouse.KeyDown:connect(function(key)
   if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
   if key=="w" then
    keys.w=true
   elseif key=="s" then
    keys.s=true
   elseif key=="a" then
    keys.a=true
   elseif key=="d" then
    keys.d=true
   elseif key=="z" then
    if flying==true then
     flying=false
    else
     flying=true
     start()
    end
   end
  end)
  e2=mouse.KeyUp:connect(function(key)
   if key=="w" then
    keys.w=false
   elseif key=="s" then
    keys.s=false
   elseif key=="a" then
    keys.a=false
   elseif key=="d" then
    keys.d=false
   end
  end)
  start()
end
--- gui (gui lib) ---
pool.class("gui")
pool.gui.FindListRow = function(n, a)
	if n == 0 then n = 1 end
	if math.fmod(n, a) == 0 then
		n = n - 1
	end
	return math.floor(n / a)
end
pool.gui.GenerateTabs = function(base, tabs, execution)
	local tab_base = base.tabframe
	local inner_base = base.inner
	local pselect_base = base.playerbar
	if not pool.utility.CheckDependancies(base, {"tabframe", "inner", "playerbar"}) then
		return
	end
	for i, v in pairs(tabs) do
		local Virti = i
		local Virto = (function(n) if n < 0 then return 0 end return n end)(Virti - 1)
		local TempTab = pool.get("global", "TabTemplate"):Clone()
		pool.utility.SetProperties (TempTab, {
			Text = v,
			Position = UDim2.new(((0.25 * math.fmod(Virto, 4))), 2, 0, ((22 * (pool.gui.FindListRow(Virti, 4))) + 2)),
			Parent = tab_base,
			Name = "tab-" .. string.lower(v)
		})
		if math.ceil(Virti / 4) == math.ceil(#tabs / 4) then
		    nv = 1/(#tabs - (((pool.gui.FindListRow(Virti, 4)))*4))
			pool.utility.SetProperties (TempTab, {
			Text = v,
			Position = UDim2.new(((nv * math.fmod(Virto, 4))), 2, 0, ((22 * (pool.gui.FindListRow(Virti, 4))) + 2)),
			Size = UDim2.new(nv, -2, 0, 20),
			Parent = tab_base,
			Name = "tab-" .. string.lower(v)
		})
		end
		TempTab.MouseButton1Down:connect(function()
			execution (v)
		end)
	end
	if math.ceil(#tabs / 4)>1 then
		local rem = (math.ceil(#tabs / 4))
		tab_base.Size = UDim2.new(1, -10, 0, ((22 * rem) + 4))
		pselect_base.Position = pselect_base.Position + UDim2.new(0, 0, 0, (22 * (rem-2)))
		inner_base.Size = UDim2.new(1, -10, 1, (-105 + -((rem-1) * 20)))
		inner_base.Position = UDim2.new(0, 5, 0, (85 + ((rem-1) * 20)))
	end
end
pool.gui.GenerateButtonList = function(base, list, specifications, custom, leavex)
	if custom == nil then
		BaseButton = pool.utility.CreateObject {
			Class = "TextButton",
			BackgroundColor3 = specifications.BackgroundColor,
			BackgroundTransparency = specifications.BackgroundTransparency,
			BorderSizePixel = 0,
			FontSize = specifications.FontSize,
			Size = UDim2.new(
				(1/(specifications.NumberPerRow)),
				-(specifications.ButtonSeperation) - specifications.BorderDistance,
				0, specifications.ButtonHeight
			)
		}
	else
		BaseButton = custom
	end
	for i, v in pairs(list) do
		local Virti = i
		local Virto = (function(n) if n < 0 then return 0 end return n end)(Virti - 1)
		Virto = Virto + pool.gui.FindListRow(Virti, specifications.NumberPerRow)
		local BClone = BaseButton:Clone()
			if leavex == true then
			pool.utility.SetProperties(BClone, {
			Parent = base,
			Text = v.Text,
			Position = UDim2.new(
				BaseButton.Position.X.Scale, 
				BaseButton.Position.X.Offset, 
				0, ((specifications.ButtonSeperation + specifications.ButtonHeight) * pool.gui.FindListRow(Virti, specifications.NumberPerRow)) + (specifications.BorderDistance/2)
			)
			})
		else
		pool.utility.SetProperties(BClone, {
			Parent = base,
			Text = v.Text,
			Position = UDim2.new(
				(1/(specifications.NumberPerRow)) * math.fmod(Virto, specifications.NumberPerRow + 1),
				specifications.ButtonSeperation + (specifications.BorderDistance/2),
				0, ((specifications.ButtonSeperation + specifications.ButtonHeight) * pool.gui.FindListRow(Virti, specifications.NumberPerRow)) + (specifications.BorderDistance/2)
			) --[[ that was a doozy]]
		})
		end
		BClone.MouseButton1Down:connect(function()
			v.func()
		end)
	end
	if base:IsA("ScrollingFrame") then
		base.BorderSizePixel = 0
		base.ScrollBarThickness = 6
		base.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#list / specifications.NumberPerRow)*(specifications.ButtonHeight+specifications.ButtonSeperation) + 15)
	end
end
--- window lib ---
pool.class("windows")
pool.define("windows", "wpool", {})
pool.define("windows", "current", "Main")
pool.windows.open = function(w)
	if not kek.menus[w] then return end
	for i, v in pairs(pool.windows.wpool) do
		v.Visible = false
	end; pool.get("global", "main").Visible = false
	local handle
	for i, v in pairs(pool.windows.wpool) do
		if v.Name == "menu-" .. w then
			handle = v
		end
	end
	if w == "Main" then handle = pool.get("global", "main") end
	handle.Visible = true
	pool.get("global", "title").Text = "T0PK3K 2.0 ["..w.." Menu]"
	pool.windows.current = w
end
pool.windows.get = function(w)
	for i, v in pairs(pool.windows.wpool) do
		if v.Name == "menu-"..w then
			return v
		end
	end
end
pool.windows.initialize = function()
	tabs = {}
	for i, v in pairs(kek.menus) do
		if not v["DoNotInclude"] then
			table.insert(tabs, i)
		end
	end
	for i, v in pairs(kek.menus) do
		if i == "Main" then 
			local space = pool.get("global", "root").main
			local bf = space.mbut.inside
			for i, v in pairs(bf:GetChildren()) do
				v.MouseButton1Down:connect(function()
					pool.windows.open(v.Name)
				end)
			end
			if game.Workspace.FilteringEnabled == true then
				space.fe.Text = "FilteringEnabled: true"
				space.fe.TextColor3 = BrickColor.new("Bright red").Color
			else
				space.fe.Text = "FilteringEnabled: false"
				space.fe.TextColor3 = BrickColor.new("Bright green").Color
			end
			space.username.Text = "Welcome, " .. game.Players.LocalPlayer.Name
		else
			local space = pool.get("global", "WindowTemplate"):Clone(); space.Name = "menu-" .. i
			local ltabs = {}; for x, m in pairs(tabs) do table.insert(ltabs, m) end
			for x, m in pairs(v.Links) do
				table.insert(ltabs, m)
			end; space.tabframe.tabtemp.Parent = nil;
			pool.gui.GenerateTabs(space, ltabs, function(tab)
				pool.windows.open(tab)
			end)
			if #v.Auto > 0 then
				for x, m in pairs(v.Auto) do
					m.Parent = space.inner
				end
			end
			if v.ReqBar == false then
				space.inner.Size = pool.get("global", "NoTab_InnerSize") wait()
				space.inner.Position = pool.get("global", "NoTab_InnerPos")
				space.playerbar.Visible = false
			else
				space.inner.Size = UDim2.new(1, -10, 1, -87)
				space.inner.Position = UDim2.new(0, 5, 0, 83)
				space.playerbar.Visible = true
			end
			table.insert(pool.windows.wpool, space); space.Parent = pool.get("global", "root") 
		end
	end
end; pool.windows.initialize()
--- server ---
pool.class("server")
pool.define("server", "handle", pool.windows.get("Server"))
pool.define("server", "dhandle", pool.windows.get("Destruction"))
pool.server.initialize = function()
	local handle = pool.get("server", "handle")
	local dhandle = pool.get("server", "dhandle")
	pool.gui.GenerateButtonList (dhandle.inner, {
		{Text = "Gaben", func = (function()
			local steam = "rbxassetid://182119824"
			local gaben = "rbxassetid://177984640"
			local gaben2 = "rbxassetid://291288584"
			
			function particle(p, b)
			local a = Instance.new("ParticleEmitter", p)
			a.Rate = 750
			a.Lifetime = NumberRange.new(20, 30)
			a.VelocitySpread = 200
			a.Texture = b
			end
			
			function decal(p, b)
			local sides = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
			for i, v in pairs(sides) do
			local a = Instance.new("Decal", p)
			a.Texture = b
			a.Face = v
			end
			end
			
			function recurse(x)
			for i, v in pairs(x:GetChildren()) do
			if v:IsA("BasePart") then
			particle(v, steam)
			particle(v, gaben)
			decal(v, gaben2)
			end
			if #(v:GetChildren())>0 then
			recurse(v)
			end
			end
			end
			
			recurse(game)
			local mu = Instance.new("Sound", game.Workspace)
			mu.Volume = 1
			mu.Looped = true
			mu.Pitch = 1
			mu.SoundId = "rbxassetid://172143577"
			mu:Play()
		end)},
		{Text = "666", func = (function()
			for i,v in next,workspace:children''do
			  if(v:IsA'BasePart')then
			    me=v;
			    bbg=Instance.new('BillboardGui',me);
			    bbg.Name='stuf';
			    bbg.Adornee=me;
			    bbg.Size=UDim2.new(2.5,0,2.5,0)
			    --bbg.StudsOffset=Vector3.new(0,2,0)
			    tlb=Instance.new'TextLabel';
			    tlb.Text='666 666 666 666 666 666';
			    tlb.Font='SourceSansBold';
			    tlb.FontSize='Size48';
			    tlb.TextColor3=Color3.new(1,0,0);
			    tlb.Size=UDim2.new(1.25,0,1.25,0);
			    tlb.Position=UDim2.new(-0.125,-22,-1.1,0);
			    tlb.BackgroundTransparency=1;
			    tlb.Parent=bbg;
			    end;end;
			    --coroutine.wrap(function()while wait''do
			      s=Instance.new'Sound';
			      s.Parent=workspace;
			      s.SoundId='rbxassetid://152840862';
			      s.Pitch=1;
			      s.Volume=1;
			      s.Looped=true;
			      s:play();
			      --end;end)();
			      function xds(dd)
			        for i,v in next,dd:children''do
			          if(v:IsA'BasePart')then
			            v.BrickColor=BrickColor.new'Really black';
			            v.TopSurface='Smooth';
			            v.BottomSurface='Smooth';
			            s=Instance.new('SelectionBox',v);
			            s.Adornee=v;
			            s.Color=BrickColor.new'Really red';
			            a=Instance.new('PointLight',v);
			            a.Color=Color3.new(1,0,0);
			            a.Range=15;
			            a.Brightness=5;
			            f=Instance.new('Fire',v);
			            f.Size=19;
			            f.Heat=22;
			            end;
			            game.Lighting.TimeOfDay=0;
			            game.Lighting.Brightness=0;
			            game.Lighting.ShadowColor=Color3.new(0,0,0);
			            game.Lighting.Ambient=Color3.new(1,0,0);
			            game.Lighting.FogEnd=200;
			            game.Lighting.FogColor=Color3.new(0,0,0);
			        local dec = 'http://www.roblox.com/asset/?id=19399245';
			            local fac = {'Front', 'Back', 'Left', 'Right', 'Top', 'Bottom'}
			            --coroutine.wrap(function()
			            --for _,__ in pairs(fac) do
			            --local ddec = Instance.new("Decal", v)
			            --ddec.Face = __
			            --ddec.Texture = dec
			        --end end)()
			            if #(v:GetChildren())>0 then
			                   xds(v) 
			              end
			         end
			    end
			xds(game.Workspace)
		end)},
		{Text = "Clear Terrain", func = (function()
			game.Workspace.Terrain:Clear()
		end)},
		{Text = "Flood", func = (function()
			-- thanks krystal
			game.Workspace.Terrain:SetCells(Region3int16.new(Vector3int16.new(-100,-100,-100), Vector3int16.new(100,100,100)), 17, "Solid", "X")
		end)},
		{Text = "Troll", func = (function()
			function particle(p, b)
			local a = Instance.new("ParticleEmitter", p)
			a.Rate = 750
			a.Lifetime = NumberRange.new(20, 30)
			a.VelocitySpread = 200
			a.Texture = b
			end
			
			function decal(p, b)
			local sides = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
			for i, v in pairs(sides) do
			local a = Instance.new("Decal", p)
			a.Texture = b
			a.Face = v
			end
			end
			
			local function skybox(x)
				local sky = Instance.new("Sky",game.Lighting)
				local fcs={"Bk","Dn","Ft","Lf","Rt","Up"}
				for i,v in pairs(fcs) do
					sky["Skybox"..v]=x
				end
			end
			
			function recurse(x)
			for i, v in pairs(x:GetChildren()) do
			if v:IsA("BasePart") then
			particle(v, "rbxassetid://67202156")
			decal(v, "rbxassetid://67202156")
			end
			if #(v:GetChildren())>0 then
			recurse(v)
			end
			end
			end
			skybox("rbxassetid://67202156")
			recurse(game)
			local mu = Instance.new("Sound", game.Workspace)
			mu.Volume = 1
			mu.Looped = true
			mu.Pitch = 1
			mu.SoundId = "rbxassetid://154664102"
			mu:Play()
		end)},
		{Text = "Cenasploit", func = (function()
				cena = 
			function(instance)
			for i,v in pairs(instance:GetChildren()) do
			if v.ClassName == "Sound" then
			v:Destroy()
			end
			if v:IsA("BasePart") then
			v:ClearAllChildren()
			local function decal(face)
			local d = Instance.new("Decal", v)
			d.Texture = "rbxassetid://121913592"
			d.Face = face
			end
			decal("Back")
			decal("Bottom")
			decal("Left")
			decal("Right")
			decal("Front")
			decal("Top")
			end
			cena(v)
			end
			end
			cena(workspace)
			for i, v in pairs(game.Lighting:GetChildren()) do
			if v:IsA("Sky") then
			v:Destroy()
			end
			end
			local sk = Instance.new("Sky", game.Lighting)
			sk.SkyboxBk = "rbxassetid://121913592"
			sk.SkyboxDn = "rbxassetid://121913592"
			sk.SkyboxFt = "rbxassetid://121913592"
			sk.SkyboxLf = "rbxassetid://121913592"
			sk.SkyboxRt = "rbxassetid://121913592"
			sk.SkyboxUp = "rbxassetid://121913592"
			local s = Instance.new("Sound", game.Workspace)
			s.SoundId = "rbxassetid://289936337"
			s.Looped = true
			s.PlayOnRemove = true
			s:Play()
			for i,v in pairs(p) do
			pe = Instance.new("ParticleEmitter", v.Character.Torso)
			pe.Texture = t3
			pe.VelocitySpread = 360
			end
			for i= 1,#w do
			if w[i]:isA("BasePart") then
			pe = Instance.new("ParticleEmitter", w[i])
			pe.Texture = "rbxassetid://121913592"
			pe.VelocitySpread = 5
			end
			end
		end)},
		{Text = "Colorspam", func = (function()
			-- thanks var			
			local function r(where) 
 			for _,v in pairs (where:GetChildren()) do 
  			if v:IsA("BasePart") then 
   			spawn(function() while wait(0.1) do v.BrickColor = BrickColor.Random() wait()   end end) end r(v) end end r(workspace)
		end)},
		{Text = "Materialspam", func = (function()
			local materiallist = 
			{Enum.Material.Plastic,Enum.Material.Wood,Enum.Material.Slate,Enum.Material.Concrete,Enum.Material.CorrodedMetal,
				Enum.Material.DiamondPlate,Enum.Material.Foil,Enum.Material.Grass,
				Enum.Material.Ice,Enum.Material.Marble,Enum.Material.Granite,Enum.Material.Brick,
				Enum.Material.Pebble,Enum.Material.Sand,Enum.Material.Sand,
				Enum.Material.Fabric,Enum.Material.SmoothPlastic,Enum.Material.Metal,Enum.Material.WoodPlanks,Enum.Material.Neon,Enum.Material.Cobblestone}
			local function r(where) 
 			for _,v in pairs (where:GetChildren()) do 
  			if v:IsA("BasePart") then 
  			spawn(function() while wait(0.1) do v.Material = materiallist[math.random(#materiallist)] wait()   end end) end r(v) end end r(workspace)
		end)},
		{Text = "Transparencyfun", func = (function()
			local function r(where) 
 			for _,v in pairs (where:GetChildren()) do 
  			if v:IsA("BasePart") then 
   			spawn(function() while wait(0.1) do v.Transparency = math.random(0,1) wait()   end end) end r(v) end end r(workspace)
		end)},
		{Text = "Reflectancyfun", func = (function()
			local function r(where) 
 			for _,v in pairs (where:GetChildren()) do 
  			if v:IsA("BasePart") then 
   			spawn(function() while wait(0.1) do v.Reflectance = math.random(0,1) wait()   end end) end r(v) end end r(workspace)
		end)},
	},
	{
		ButtonHeight = 30,
		BorderDistance = 4,
		NumberPerRow = 2,
		ButtonSeperation = 2,
	},
	pool.utility.CreateObject {
		Class = "TextButton",
		BackgroundColor3 = Color3.new(39/255, 79/255, 78/255),
		BackgroundTransparency = 0.5,
		Size = UDim2.new(0.5, -4, 0, 30),
		Position = UDim2.new(0, 3, 0, 0),
		BorderSizePixel = 0,
		TextColor3 = Color3.new(1, 1, 1),
		FontSize = Enum.FontSize.Size14,
		Font = Enum.Font.SourceSans	
	})
	pool.gui.GenerateButtonList(handle.inner,
		{{Text = "Baseplate", func = (function()
				for X = -2500, 2500, 512 do
		       	for Z = -2500, 2500, 512 do
		        local P = Instance.new("Part")
		        P.Anchored = true
		        P.Locked = true
		        P.Size = Vector3.new(512,3,512)
		        P.CFrame = CFrame.new(X,0,Z)
		        P.BrickColor = BrickColor.Green()
		        P.Parent = game.Workspace
		        end
				end
			end)},
			{Text = "Clear", func = (function()
				for i,v in pairs(game.Workspace:GetChildren()) do
					if (not v:IsA("Terrain"))and(v.Name~="Camera") then
						v:Destroy()
					end
				end
			end)},
			{Text = "Kill All", func = (function()
				for i,v in pairs(game.Players:GetPlayers()) do
					if v.Character.Humanoid then
						v.Character.Humanoid.Health = 0
					end
				end
			end)},
			{Text = "Shutdown", func = (function()
				for i,v in pairs(game.Players:GetPlayers()) do
					if v.Name~=player.Name then
					v.PersonalServerRank = 255
					wait()
					v.PersonalServerRank = 0
					v:Destroy()
					end
				end
				game.Players.LocalPlayer:Destroy()
			end)},
			{Text = "Lock", func = (function()
				t.lock = true
				game.Players.PlayerAdded:connect(function(p)
					if t.lock == true then
						p.PersonalServerRank = 255
						wait()
						p.PersonalServerRank = 0
					end
				end)
			end)},
			{Text = "Unlock", func = (function()
				t.lock = false
			end)},
			{Text = "NoSound", func = (function()
				function re(o)
					for i,v in pairs(o:GetChildren()) do
						if v:IsA("Sound") then v:Stop() end re(v)
					end
				end
				re(game.Workspace)
			end)},
			{Text = "Indicate", func = (function()
				for i=1,10 do
					for i,v in pairs(game.Players:GetPlayers()) do
						if v.Character.Head then
							game:GetService("Chat"):Chat(v.Character,player.Name.." is using T0PK3K 0.8! nosyliam@v3rm",math.fmod(i,3))
						end
					end
				end
			end)},
			{Text = "Fog", func = (function()
				game.Lighting.FogEnd = 0
			end)},
			{Text = "NoFog", func = (function()
				game.Lighting.FogEnd = 1000000
			end)},
			{Text = "Fix Lighting", func = (function()
				local l = game.Lighting
				l.Ambient = Color3.new(0, 0, 0)
				l.Brightness = 1
				l.GlobalShadows = true
				l.Outlines = true
				l.FogEnd = 100000
				l.FogStart = 0
				l:SetMinutesAfterMidnight(12*60)
			end)},
			{Text = "Day", func = (function()
				game.Lighting:SetMinutesAfterMidnight(60*12)
			end)},
			{Text = "Night", func = (function()
				game.Lighting:SetMinutesAfterMidnight(0)
			end)}
		},
		{
			NumberPerRow = 4,
			ButtonSeperation = 0,
			ButtonHeight = 40,
			BorderDistance = 6,
			
		},
		pool.utility.CreateObject {
			Class = "TextButton",
			BackgroundColor3 = Color3.new(39/255, 79/255, 78/255),
			BackgroundTransparency = 0.5,
			Size = UDim2.new(0.25, -4, 0, 40),
			Position = UDim2.new(0, 3, 0, 0),
			BorderSizePixel = 0,
			TextColor3 = Color3.new(1, 1, 1),
			FontSize = Enum.FontSize.Size14,
			Font = Enum.Font.SourceSans	
		}
	)
	
end
--- localplayer ---
pool.class("localplayer")
pool.define("localplayer", "handle", pool.windows.get("LocalPlayer"))
pool.localplayer.initialize = function()
	local handle = pool.get("localplayer", "handle")
	pool.gui.GenerateButtonList(handle.inner,
		{{Text = "Respawn", func = (function()	
			local a1 = Instance.new("Model", game.Workspace)
			local a2 = Instance.new("Part", game.Workspace)
			a2.CanCollide = true
			a2.Anchored = true
			a2.CFrame = CFrame.new(10000, 10000, 10000)
			a2.Name = "Torso"
			local a3 = Instance.new("Humanoid", a1)
			a3.MaxHealth=100;a3.Health=100
			player.Character = a1
			a3.Health=0
		end)},
		{Text = "Freecam", func = (function()
			local cam = game.Workspace.CurrentCamera
			cam.CameraType = "Fixed"
			cam.CameraSubject = nil
			player.Character = nil
		end)},
		{Text = "Fixcam", func = (function()
			local cam = game.Workspace.CurrentCamera
			game.Workspace.CurrentCamera:remove()
			wait(0.5)
			cam = game.Workspace.CurrentCamera
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			game.Workspace.CurrentCamera.CameraType = "Custom"
		end)},
		{Text = "Disguise", func = (function()
			local p = player.Character
			if p:FindFirstChild("topkek") then
				p.topkek:Destroy()
			end
			p.Name = "topkek"
			p.Head.Transparency = 1
			local mo = Instance.new("Model", p)
			mo.Name = "topkek"
			local hu = Instance.new("Humanoid", mo)
			hu.Name = "distag"
			hu.Health = 100
			hu.MaxHealth = 100
			local fh = p.Head:Clone()
			fh.Parent = mo
			fh.Transparency = 0
			local we = Instance.new("Weld", fh)
			we.Part0 = mo
			we.Part1 = p.Head
			player:ClearCharacterAppearance()
			pcall(function() p["Body Colors"]:Destroy() end)
			Instance.new("BodyColors", p)
		end)},
		{Text = "NoClip On", func = (function()
			local p = player.Character
			if p == nil then return end pool.define("global","noclip",false)
			game:GetService("RunService").Stepped:connect(function()
				p.Torso.CanCollide = pool.get("global","noclip")
				p.Head.CanCollide = pool.get("global","noclip")
			end)
			p.Torso.Changed:connect(function()
				p.Torso.CanCollide = pool.get("global","noclip")
				p.Head.CanCollide = pool.get("global","noclip")
			end)
		end)},
		{Text = "NoClip Off", func = (function()
			local p = player.Character
			if p == nil then return end pool.define("global","noclip",true)
			pcall(function() wait()
			p.Torso.CanCollide = true
			p.Head.CanCollide = true end)
		end)},
		{Text = "Rainbow Name", func = (function()
			player.Neutral = false
			repeat
				wait()
				player.TeamColor = BrickColor.Random()
			until not player.Character.Humanoid
		end)},
		{Text = "Random Fedora", func = (function()
			local hats={
				98346834,
				215751161,
				119916949,
				72082328,
				147180077,
				100929604,
				63043890,
				1285307,
				1029025,
				334663683,
				259423244
			}
			game:GetService("InsertService"):LoadAsset(hats[math.random(1,#hats)]):GetChildren()[1].Parent = player.Character
		end)},
		{Text = "Clear Appearance", func = (function()
			player:ClearCharacterAppearance()
		end)},
		{Text = "Nil Orb", func = (function()
			game.Players.LocalPlayer.Character = nil
			player:Destroy()
			local cam = game.Workspace.CurrentCamera
			local m = Instance.new("Model", game.Workspace)
			m.Name = game.Players.LocalPlayer.Name
			local hum = Instance.new("Humanoid", m)
			hum.Health = 0
			hum.MaxHealth = 0
			local orb = Instance.new("Part", m)
			orb.Size = Vector3.new(1, 1, 1)
			orb.Shape = "Ball"
			orb.Name = "Head"
			orb.Anchored = true
			orb.CanCollide = true
			orb.BottomSurface = Enum.SurfaceType.Smooth
			orb.TopSurface = Enum.SurfaceType.Smooth
			orb.Transparency = 0
			cam.CameraSubject = orb
			cam.CameraType = Enum.CameraType.Fixed
			game:GetService("RunService").RenderStepped:connect(function()
				orb.CFrame = cam.CoordinateFrame * CFrame.new(0, -2, -6)
			end)
			game.Players.LocalPlayer.Chatted:connect(function(a)
				game:GetService("Chat"):Chat(orb, a)
			end)
		end)},
		{Text = "Fly", func = (function()
			pool.utility.StartFly()
		end)},
		{Text = "Rejoin", func = (function()
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		end)},
		{Text = "Levitate", func = (function()
			pool.define("global","lev",true)
			spawn(function()
				repeat
					ypcall(function()
						wait(0)
						player.Character.Humanoid:ChangeState(10)
					end)
				until pool.get("global","lev") == false
			end)
		end)},
		{Text = "NoLevitate", func = (function()
			pool.define("global","lev",false)
		end)},
		{Text = "God", func = (function()
			if player.Character.Humanoid then
				player.Character.Humanoid.MaxHealth = math.huge
				player.Character.Humanoid.Health = math.huge
			end
		end)},
		{Text = "Hackertag", func = (function()
			local len = 10
				local bb = Instance.new("BillboardGui")
				bb.Parent = player.Character.Head
				bb.Adornee = player.Character.Head
				bb.AlwaysOnTop = true
				bb.Enabled = true
				bb.Size = UDim2.new(len, 0, 1.5, 0)
				bb.Name = "tag"
				bb.StudsOffset = Vector3.new(0, 3, 0)
				--local fr = Instance.new("Frame")
				--fr.Parent = bb
				--fr.Size = UDim2.new(1, 0, 1, 0)
				--fr.Style = Enum.FrameStyle.RobloxRound
				local tl = Instance.new("TextLabel")
				tl.Parent = bb
				tl.BackgroundTransparency = 1
				tl.TextScaled = true
				tl.TextColor3 = Color3.new(255/255, 255/255, 255/255)
				tl.Size = UDim2.new(1, 0, 1, 0)
				tl.Text = "mlg pro haxor"
				tl.Name = "trutag"
				tl.Visible = true
				tl.ZIndex = 2
		end)},
		{Text = "Highjump", func = (function()
			local thrust = Instance.new("BodyVelocity")
			game:GetService('UserInputService').InputBegan:connect(function(i, b)
				if i.KeyCode == Enum.KeyCode.Space then
					print("Got jump")
					coroutine.resume(coroutine.create(function()
						thrust.Parent = game.Players.LocalPlayer.Character.PrimaryPart
						thrust.velocity = Vector3.new(0,50,0)
						thrust.maxForce = Vector3.new(0,4e+050,0)
						wait(0.2)
						thrust.Parent = nil 
					end))
				end
			end)
		end)},
		{Text = "Nograv", func = (function()
			if player.Character then
				for x,m in pairs(player.Character:GetChildren()) do
					if m:IsA("BasePart") then
						local bf = Instance.new("BodyForce", m)
						bf.force = Vector3.new(0, 192.25, 0) * m:GetMass()
					end
					if m:IsA("Hat") then
						if m:findFirstChild("Handle") then
							local bf = Instance.new("BodyForce", m.Handle)
							bf.force = Vector3.new(0, 192.25, 0) * m.Handle:GetMass()
						end
					end
				end
			end
		end)},
		},
		{
			NumberPerRow = 3,
			ButtonSeperation = 0,
			ButtonHeight = 40,
			BorderDistance = 6,
			
		},
		pool.utility.CreateObject {
			Class = "TextButton",
			BackgroundColor3 = Color3.new(39/255, 79/255, 78/255),
			BackgroundTransparency = 0.5,
			Size = UDim2.new(0.333, -4, 0, 40),
			Position = UDim2.new(0, 3, 0, 0),
			BorderSizePixel = 0,
			TextColor3 = Color3.new(1, 1, 1),
			FontSize = Enum.FontSize.Size14,
			Font = Enum.Font.SourceSans	
		}
	)
	
end
--- players ---
pool.class("players")
pool.define("players", "handle", pool.windows.get("Players"))
pool.players.doplayers = function(func)
	for i, v in pairs(pool.get("global","CurrentPlayers")) do
		func(v)
	end
end
pool.players.initialize = function()
	local handle = pool.get("players", "handle")
	game:GetService("ContextActionService"):BindAction("pbar", (function() handle.playerbar:CaptureFocus() end), false, Enum.KeyCode.Equals)
	handle.playerbar.FocusLost:connect(function(e)
		if e == true then
			pool.define("global","CurrentPlayers",pool.utility.GetPlayers(handle.playerbar.Text))
			handle.playerbar.Text = ""
		end
	end)
	pool.gui.GenerateButtonList(handle.inner,
		{{Text = "Kill", func = (function()pool.players.doplayers(function(p)
			if p.Character.Humanoid then
				p.Character.Humanoid.Health = 0
			end end)
		end)},
		{Text = "Kick", func = (function()pool.players.doplayers(function(p)
			p.PersonalServerRank=255 
			wait()
			p.PersonalServerRank=0 p:Destroy()end)
		end)},
		{Text = "Ban", func = (function()pool.players.doplayers(function(p)
			p.PersonalServerRank=255 
			wait()
			p.PersonalServerRank=0;p:Destroy() table.insert(t.bans,p.userId) end)
		end)},
		{Text = "Sparkles", func = (function()pool.players.doplayers(function(p)
			if p.Character.Torso then
				Instance.new("Sparkles").Parent = p.Character.Torso
			end end)
		end)},
		{Text = "Fire", func = (function()pool.players.doplayers(function(p)
			if p.Character.Torso then
				Instance.new("Fire").Parent = p.Character.Torso
			end end)
		end)},
		{Text = "God", func = (function()pool.players.doplayers(function(p)
			if p.Character.Humanoid then
				p.Character.Humanoid.MaxHealth = math.huge
				p.Character.Humanoid.Health = math.huge
			end end)
		end)},
		{Text = "SemiGod", func = (function()pool.players.doplayers(function(p)
			if p.Character.Humanoid then
				p.Character.Humanoid.MaxHealth = 9999999999
				p.Character.Humanoid.Health = 9999999999
			end end)
		end)},
		{Text = "Nuke", func = (function()pool.players.doplayers(function(p)
			local nuke = Instance.new("Part", game.Workspace)
					local opos = v.Character.Torso.CFrame
					nuke.BrickColor = BrickColor.new("Bright yellow")
					nuke.TopSurface = Enum.SurfaceType.Smooth
					nuke.BottomSurface = Enum.SurfaceType.Smooth
					nuke.Anchored = true
					nuke.CanCollide = false
					nuke.Shape = "Ball"				
					nuke.Transparency = 0.5
					nuke.CFrame = v.Character.Torso.CFrame		
					nuke.Size = Vector3.new(1, 1, 1)
					nuke.Touched:connect(function(p)
						local expl = Instance.new("Explosion", p)
						expl.BlastPressure = 50000
						expl.BlastRadius = 50
						expl.Position = p.Position
						p.Material = Enum.Material.CorrodedMetal
						p:BreakJoints()
					end)
					for i = 1, 150 do
						nuke.Size = Vector3.new(i, i, i)
						nuke.CFrame = opos
						wait(0.08)
					end
					nuke:Destroy()
					end)
		end)},
		{Text = "Ungod", func = (function()pool.players.doplayers(function(p)
			if p.Character.Humanoid then
				p.Character.Humanoid.MaxHealth = 100
				p.Character.Humanoid.Health = 100
			end end)
		end)},
		{Text = "Sit", func = (function()pool.players.doplayers(function(p)
			if p.Character.Humanoid then
				p.Character.Humanoid.Sit = true
			end end)
		end)},
		{Text = "Jump", func = (function()pool.players.doplayers(function(p)
			if p.Character.Humanoid then
				p.Character.Humanoid.Jump = true
			end end)
		end)},
		{Text = "Freeze", func = (function()pool.players.doplayers(function(p)
			if p.Character.Torso then
				p.Character.Torso.Anchored = true
			end end)
		end)},
		{Text = "Thaw", func = (function()pool.players.doplayers(function(p)
			if p.Character.Torso then
				p.Character.Torso.Anchored = false
			end end)
		end)},
		{Text = "PSTools", func = (function()pool.players.doplayers(function(p)
			p.PersonalServerRank = 255 end)
		end)},
		{Text = "No PSTools", func = (function()pool.players.doplayers(function(p)
			p.PersonalServerRank = 0 end)
		end)},
		{Text = "BTools", func = (function()pool.players.doplayers(function(p)
			local a = Instance.new("HopperBin")
			a.BinType = "GameTool"
			a.Parent = p.Backpack
			local a = Instance.new("HopperBin")
			a.BinType = "Clone"
			a.Parent = p.Backpack
			local a = Instance.new("HopperBin")
			a.BinType = "Hammer"
			a.Parent = p.Backpack end)
		end)},
		{Text = "Giraffe", func = (function()pool.players.doplayers(function(v)
			if v.Character then
						local char=v.Character
						local h=char.Head
						local tor=char.Torso
						tor.Neck.C0=tor.Neck.C0*CFrame.new(0,0,5)
						local fn=Instance.new("Part",char)
						fn.Size=Vector3.new(1,5.5,1)
						fn.Name="FakeNeck"
						fn.Anchored=false
						fn.CanCollide=false
						if char:FindFirstChild("Body Colors") then
							fn.BrickColor=char["Body Colors"].HeadColor
						end
						local cm=Instance.new("CylinderMesh",fn)
						local we=Instance.new("Weld",h)
						we.Part0=h
						we.Part1=fn
						we.C1=we.C1*CFrame.new(0,2.6,0)
			end	end)
		end)},
		{Text = "Neon", func = (function()pool.players.doplayers(function(v)
			if v.Character then
					for x,m in pairs(v.Character:GetChildren()) do
						if m:IsA("BasePart") then
							m.BrickColor = BrickColor.new("Bright green")
							m.Material = Enum.Material.Neon
							if m.Name == "Head" then
								for s,z in pairs(m:GetChildren()) do
									if z:IsA("SpecialMesh") then
										z:Destroy()
									end
								end
								m.Size = Vector3.new(1,1,1)
							end
						end
						if m:IsA("Hat") or m:IsA("Shirt") or m:IsA("Pants") then
							m:Destroy()
						end
					end
				end
			end)
		end)},
		{Text = "Goldify", func = (function()pool.players.doplayers(function(v)
			if v.Character then
						for x,m in pairs(v.Character:GetChildren()) do
							if m:IsA("Hat") or m:IsA("Shirt") or m:IsA("Pants") then
								m:Destroy()
							end
							if m.Name == "Head" then
								m.Size = Vector3.new(1,1,1)
								m.Material = Enum.Material.Marble
								m.BrickColor = BrickColor.new("Bright yellow")
								if m:FindFirstChild("Mesh") then m.Mesh:Destroy() end
							else
								if m:IsA("BasePart") then
									local bm = Instance.new("BlockMesh", m)
									m.Material = Enum.Material.Marble
									m.BrickColor = BrickColor.new("Bright yellow")
								end	
							end
						end
					end
			end)
		end)},
		{Text = "Notools", func = (function()pool.players.doplayers(function(p)
			for i,v in pairs(p.Backpack:GetChildren()) do
				v.Parent = nil
			end end)
		end)},
		{Text = "Taketools", func = (function()pool.players.doplayers(function(p)
			for i,v in pairs(p.Backpack:GetChildren()) do
				v.Parent = player.Backpack
			end end)
		end)},
		{Text = "+5 WalkSpeed", func = (function()pool.players.doplayers(function(p)
			if p.Character.Humanoid then
				p.Character.Humanoid.WalkSpeed = p.Character.Humanoid.WalkSpeed + 5
			end end)
		end)},
		{Text = "-5 WalkSpeed", func = (function()pool.players.doplayers(function(p)
			if p.Character.Humanoid then
				p.Character.Humanoid.WalkSpeed = p.Character.Humanoid.WalkSpeed + 10
			end end)
		end)},
		{Text = "Confuse", func = (function()pool.players.doplayers(function(p)
			if p.Character.Humanoid then
				p.Character.Humanoid.WalkSpeed = -16
			end end)
		end)},
		{Text = "+1 HeadSize", func = (function()pool.players.doplayers(function(p)
			if p.Character.Head then
				p.Character.Head.Mesh.Scale=p.Character.Head.Mesh.Scale+Vector3.new(1,1,1)
			end end)
		end)},
		{Text = "-1 HeadSize", func = (function()pool.players.doplayers(function(p)
			if p.Character.Head then
				p.Character.Head.Mesh.Scale=p.Character.Head.Mesh.Scale-Vector3.new(1,1,1)
			end end)
		end)},
		{Text = "Dwarf", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				pool.utility.ScalePlayer(p, 0.4)
			end end)
		end)},
		{Text = "Giant", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				pool.utility.ScalePlayer(p, 3)
			end end)
		end)},
		{Text = "Invisible", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				function re(o)
					for i,v in pairs(o:GetChildren()) do
						if v:IsA("BasePart") then
							v.Transparency=1
						end
						re(v)
					end
				end
				re(p.Character)
			end end)
		end)},
		{Text = "Visible", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				function re(o)
					for i,v in pairs(o:GetChildren()) do
						if v:IsA("BasePart")and(v.Name~="HumanoidRootPart") then
							v.Transparency=0
						end
						re(v)
					end
				end
				re(p.Character)
			end end)
		end)},
		{Text = "Sword", func = (function()pool.players.doplayers(function(p)
			if p.Backpack then
				game:GetService("InsertService"):LoadAsset(125013769):GetChildren()[1].Parent = p.Backpack
			end end)
		end)},
		-- ripping commands straight out of liamin pro smh
		{Text = "Spongebob", func = (function()pool.players.doplayers(function(v)
			if v.Character then
				local char = v.Character
						char.Head.Transparency = 1
						for x,m in pairs(v.Character:GetChildren()) do
							if m:IsA("Shirt") or m:IsA("Pants") or m:IsA("CharacterMesh") or m:IsA("Hat") then
								m:Destroy()
							end
						end
						
						op = {86500054,86500078,86500036,86500008,86500064,86487700,86498048,62234425}
						local is=game:GetService('InsertService')
							local a,b=ypcall(function()
							
							for x,m in pairs(v.Character:GetChildren()) do
								if m:IsA("CharacterMesh") then
									m:Destroy()
								end
							end
							
							for x,m in pairs(op) do
								coroutine.resume(coroutine.create(function()
								local as = is:LoadAsset(m):GetChildren()[1]
								if as:IsA("CharacterMesh") then
								if as.BodyPart == Enum.BodyPart.Head or as.BodyPart == Enum.BodyPart.Torso then else
									as.Parent=v.Character
								end
								end
								end))
							end
							end)
							if not a then
								print("error: "..tostring(b))
							end
						local fa = char.Head:FindFirstChild("face")
						if fa then fa:Destroy() end
						if char.Torso:FindFirstChild("roblox") then
						char.Torso.roblox:Destroy()
						end
						local bc = char:FindFirstChild("Body Colors")
						if bc then
						local clr={
							"HeadColor",
							"TorsoColor",
							"LeftArmColor",
							"RightArmColor",
							"LeftLegColor",
							"RightLegColor"
						}
						for x,m in pairs(clr) do
							bc[m] = BrickColor.new("New Yeller")
						end
						local face = Instance.new("Decal", char.Torso)
						face.Texture = "rbxassetid://286937955"
						face.Face = "Front"
						face.Name = "SpongeFace"
						local bars = {
							"Back",
							"Bottom",
							"Left",
							"Right",
							"Top",
						}
						for x,m in pairs(bars) do
							local spo = Instance.new("Decal", char.Torso)
							spo.Texture = "http://www.roblox.com/asset?id=286718556"
							spo.Name = m
							spo.Face = m
						end
						local sp = Instance.new("Pants", char)
						sp.PantsTemplate = "http://www.roblox.com/asset?id=206379118"
			end end end)
		end)},
		{Text = "Stun", func = (function()pool.players.doplayers(function(v)
			if v.Character.Humanoid then
				v.Character.Torso.CFrame = v.Character.Torso.CFrame * CFrame.Angles(math.rad(90),0,0) 
				v.Character.Humanoid.PlatformStand = true
			end end)
		end)},
		{Text = "Quicksand", func = (function()pool.players.doplayers(function(v)
			if v.Character then
				if v.Character.Humanoid then
					local hole = Instance.new("Part", v.Character)
					hole.Anchored = true
					hole.Name = "Hole"
					hole.FormFactor = Enum.FormFactor.Custom
					hole.Size = Vector3.new(7, 1, 7)
					hole.CanCollide = false
					hole.CFrame = v.Character.Torso.CFrame * CFrame.new(0,-3.3,0)
					hole.BrickColor = BrickColor.new("Cool yellow")
					hole.Material = Enum.Material.Sand
					local hm = Instance.new("CylinderMesh", hole)
					local tor = v.Character.Torso
					tor.Anchored = true
					if v.Character:FindFirstChild("Humanoid") then
					v.Character.Humanoid.Jump = true
					end
					for x,m in pairs(v.Character:GetChildren()) do
						if m:IsA("BasePart") then
							m.CanCollide = false
						end
					end
					for i=1,75 do
						tor.CFrame=tor.CFrame*CFrame.new(0,-0.1,0)
						wait(0.06)
					end
					tor.CFrame=tor.CFrame*CFrame.new(0,
						-500,0
					)
					v.Character.Humanoid.Health = 0
					v.Character.Torso.Anchored = false
				end
			end
		end)
		end)},
		{Text = "PStand", func = (function()pool.players.doplayers(function(p)
			if p.Character.Humanoid then
				p.Character.Humanoid.PlatformStand = true
			end end)
		end)},
		{Text = "Shrek", func = (function()pool.players.doplayers(function(p)
			if p.Character then
			local pchar = p.Character
			for i,v in pairs(pchar:GetChildren()) do
				if v:IsA("Hat") or v:IsA("CharacterMesh") or v:IsA("Shirt") or v:IsA("Pants") then
					v:Destroy()
				end
			end
			for i,v in pairs(pchar.Head:GetChildren()) do
				if v:IsA("Decal") or v:IsA("SpecialMesh") then
					v:Destroy()
				end
			end
			
			local mesh = Instance.new("SpecialMesh", pchar.Head)
			mesh.MeshType = "FileMesh"
			pchar.Head.Mesh.MeshId = "http://www.roblox.com/asset/?id=19999257"
			pchar.Head.Mesh.Offset = Vector3.new(-0.1, 0.1, 0)
			pchar.Head.Mesh.TextureId = "http://www.roblox.com/asset/?id=156397869"
			
			local Shirt = Instance.new("Shirt", p.Character)
			local Pants = Instance.new("Pants", p.Character)
			
			Shirt.ShirtTemplate = "rbxassetid://133078194"
			Pants.PantsTemplate = "rbxassetid://133078204"
			end end)
		end)},
		{Text = "Insane", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				for i,v in pairs(p.Character.Torso:GetChildren()) do
				if v:IsA("Motor6D") then
				coroutine.wrap(function()
				while v do
				v.C0=v.C0*CFrame.Angles(math.random(-180,180),math.random(-180,180),math.random(-180,180))
				wait()
				end
				end)()
				end
				end
			end end)
		end)},
		{Text = "Duck", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				local pchar = p.Character
			    for i,v in pairs(pchar.Torso:GetChildren()) do
				    if v:IsA("Decal") then
					    v:Destroy()
				    end
			    end
			    for i,v in pairs(pchar:GetChildren()) do
				    if v:IsA("Hat") then
					    v:Destroy()
				    end
			    end
			    local duck = Instance.new("SpecialMesh", pchar.Torso)
			    duck.MeshType = "FileMesh"
			    duck.MeshId = "http://www.roblox.com/asset/?id=9419831"
			    duck.TextureId = "http://www.roblox.com/asset/?id=9419827"
			    duck.Scale = Vector3.new(5, 5, 5)
			    pchar.Head.Transparency = 1
			    pchar["Left Arm"].Transparency = 1
			    pchar["Right Arm"].Transparency = 1
			    pchar["Left Leg"].Transparency = 1
			    pchar["Right Leg"].Transparency = 1
			    pchar.Head.face.Transparency = 1
				end end)
		end)},
		{Text = "D��ick", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				t.utility.LittleFriend(p)
			end end)
		end)},
		{Text = "No D�ick", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				   p.Character.Ball1:Remove()
				   p.Character.Ball2:Remove()
				   p.Character.Tip:Remove()
				   p.Character.Shaft:Remove()
			end end)
		end)},
		{Text = "Select", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				Instance.new("SelectionBox", p.Character).Adornee = p.Character
			end end)
		end)},
		{Text = "Sphere", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				Instance.new("SelectionSphere", p.Character).Adornee = p.Character
			end end)
		end)},
		{Text = "Knife", func = (function()pool.players.doplayers(function(p)
			if p.Backpack then
				game:GetService("InsertService"):LoadAsset(170897263):GetChildren()[1].Parent = p.Backpack
			end end)
		end)},
		{Text = "Guns", func = (function()pool.players.doplayers(function(p)
			if p.Backpack then
				game:GetService("InsertService"):LoadAsset(130113146):GetChildren()[1].Parent = p.Backpack
				game:GetService("InsertService"):LoadAsset(67747912):GetChildren()[1].Parent = p.Backpack
				game:GetService("InsertService"):LoadAsset(95354288):GetChildren()[1].Parent = p.Backpack
			end end)
		end)},
		{Text = "Bring", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				p.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame*CFrame.new(0,2,0)
			end end)
		end)},
		{Text = "Goto", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame*CFrame.new(0,2,0)
			end end)
		end)},
		{Text = "Ghost", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame*CFrame.new(0,2,0)
			end end)
		end)},
		{Text = "Headspin", func = (function()pool.players.doplayers(function(p)
			if p.Character then
				player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame*CFrame.new(0,2,0)
			end end)
		end)}},
		{
			NumberPerRow = 4,
			ButtonSeperation = 0,
			ButtonHeight = 40,
			BorderDistance = 6,
			
		},
		pool.utility.CreateObject {
			Class = "TextButton",
			BackgroundColor3 = Color3.new(39/255, 79/255, 78/255),
			BackgroundTransparency = 0.5,
			Size = UDim2.new(0.25, -4, 0, 40),
			Position = UDim2.new(0, 3, 0, 0),
			BorderSizePixel = 0,
			TextColor3 = Color3.new(1, 1, 1),
			FontSize = Enum.FontSize.Size14,
			Font = Enum.Font.SourceSans	
		}
	)
end
--- scripts ---
pool.class("scripts")
pool.define("scripts", "handle", pool.windows.get("Scripts"))
pool.define("scripts", "data", game:GetObjects("rbxassetid://376553985")[1])
pool.get("scripts", "data").Parent = game.RobloxReplicatedStorage

for i, v in pairs(game:GetObjects("rbxassetid://382476899")[1]:GetChildren()) do
	v.Parent = pool.scripts.data
end

pool.scripts.compile = function(param)
	local data = pool.get("scripts", "data")
	local compile = {}
	if type(param) == "string" then param = (function() return true end) end
	for i, v in pairs(data:GetChildren()) do
		if param(v.Name) then
			table.insert(compile, {
				Text = v.Name,
				func = (function()
					local tm = Instance.new("LocalScript", player.PlayerGui)
					tm.Disabled = true
					tm.Source = v.Source
					tm.Disabled = false
					game:GetService("Debris"):AddItem(tm, 1000)
				end)
			})
		end
	end
	return compile
end
pool.scripts.generate = function(param)
	local handle = pool.get("scripts", "handle")
	for i, v in pairs(handle.inner.list:GetChildren()) do
		v:Destroy()
	end
	pool.gui.GenerateButtonList(handle.inner.list,
		pool.scripts.compile(param),
		{
			NumberPerRow = 1,
			ButtonSeperation = 0,
			ButtonHeight = 40,
			BorderDistance = 8,
			
		},
		pool.utility.CreateObject {
			Class = "TextButton",
			BackgroundColor3 = Color3.new(39/255, 79/255, 78/255),
			BackgroundTransparency = 0.5,
			Size = UDim2.new(1, -4, 0, 40),
			Position = UDim2.new(0, 3, 0, 0),
			BorderSizePixel = 0,
			TextColor3 = Color3.new(1, 1, 1),
			FontSize = Enum.FontSize.Size14,
			Font = Enum.Font.SourceSans	
		}
	)
end
pool.scripts.initialize = function(param)
	local handle = pool.get("scripts", "handle")
	pool.scripts.generate("")
	return game:GetService("UserInputService").InputBegan:connect(function(o)
		if handle.inner.search:IsFocused() then
			local se = handle.inner.search.Text
			if se == "" or se == " " then pool.scripts.generate("") return end
			pool.scripts.generate(function(n)
				if string.find(string.lower(n), string.lower(se)) ~= nil then
					return true
				else return false end
			end)
		end
	end)
end
--- init ---
wait(1)
spawn(function() 
	
pool.server.initialize(); wait()
pool.localplayer.initialize(); wait()
pool.players.initialize(); wait()
pool.scripts.initialize(); wait()

pool.get("global", "main").Visible = true
pool.get("global", "root").template.Visible = false

pool.get("global", "gui").Parent = game.CoreGui
pool.get("global", "root").topbar.exit.MouseButton1Down:connect(function()
	pool.get("global", "gui").Parent = nil
end) end) end))