-- GGH52Lan
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()
local Window = library:Window("By GGH52Lan")

local G = setmetatable({}, {__index = function(Self, Index)
local NewService = game.GetService(game, Index)
if NewService then
Self[Index] = NewService
end
return NewService
end})

local Players = G.Players
local plr = Players.LocalPlayer
local lastPosOftoolgiver = {}
local C
local H
local reExecuted = false
local lastPosOfCashGiver = nil

   local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
   
local function notify(n, c, i, t)
n = n or "GGH52Lan"
c = c or "text"
i = i or "rbxassetid://14260295451"
t = t or 5
OrionLib:MakeNotification({
    Name = n,
    Content = c,
    Image = i,
    Time = t
})
OrionLib:Init()
end

local function findTycoon()
    for i,v in pairs(workspace.Tycoons.Tycoons:GetDescendants()) do
       if v:IsA"ObjectValue" and v.Value == plr then
       return v.Parent
end
end
end

local function GetCreateCash()
    for i,v in pairs(workspace.CrateParent:GetChildren()) do
        if v then
        v.CanCollide = false
        v.Transparency = 1
        v.CFrame = plr.Character.PrimaryPart.CFrame
        end
    end
    H = workspace.CrateParent.ChildAdded:Connect(function(child)
        wait(.1)
        child.CanCollide = false
        child.Transparency = 1
        child.CFrame = plr.Character.PrimaryPart.CFrame
    end)
end

local function stopCreateCash()
   if H then H: Disconnect () end
end

local function DisableLaser(bool)
    if bool then
    for i,v in pairs(workspace.Tycoons.Tycoons:GetDescendants()) do
    if v:IsA"Part" and v.Name == "Pipe" then
    v.CanTouch = false
    end
    end
    C = workspace.Tycoons.Tycoons.DescendantAdded:Connect(function(obj)
    if obj:IsA"Part" and obj.Name == "Pipe" then
    obj.CanTouch = false
    end
    end)
    else
     for i,v in pairs(workspace.Tycoons.Tycoons:GetDescendants()) do
    if v:IsA"Part" and v.Name == "Pipe" then
    v.CanTouch = true
    end
    end
    C:Disconnect()
    end
end

local function GetAllTools()
for i,v in pairs(workspace.Tycoons.Tycoons:GetDescendants()) do
       if v:IsA"Part" and v.Name == "Giver" and v.Parent.Name:match("Giver%d") then
       lastPosOftoolgiver[v] = v.CFrame
       wait(.1)
        v.CanCollide = false
        v.Transparency = 1
       v.CFrame = plr.Character.PrimaryPart.CFrame
end
end
for i,v in pairs(lastPosOftoolgiver) do
    i.CFrame = v
    i.CanCollide = false
    i.Transparency = 0
end
table.clear(lastPosOftoolgiver)
print(lastPosOftoolgiver[1])
wait(1)
end

local loop = true
local function autoCollectCash()
    if not findTycoon() then return notify(nil, "Pls claim a tycoon") end
        lastPosOfCashGiver = findTycoon().Essentials.Giver.CFrame
        loop = true
    while loop do
    if not loop then break end
    findTycoon().Essentials.Giver.CanCollide = false
    findTycoon().Essentials.Giver.Transparency = 1
    findTycoon().Essentials.Giver.CFrame = plr.Character.PrimaryPart.CFrame
    wait(1)
    end
end

local function StopautoCollectCash()
if not findTycoon() then return nil end
loop = false
    findTycoon().Essentials.Giver.CanCollide = true
    findTycoon().Essentials.Giver.Transparency = 0
    findTycoon().Essentials.Giver.CFrame = lastPosOfCashGiver
    loop = false
end

local Coll
local function Wcollision(bool)
if bool then
 Coll = G.RunService.RenderStepped:Connect(function()
    for i,v in pairs(workspace.Tycoons.Tycoons:GetDescendants()) do
   if v:IsA"Part" and v.Parent.Name:match("Wall%d") then
    v.CanCollide = false
    end
end
end)
else
Coll:Disconnect()
notify(nil, "Loading..")
for i,v in pairs(workspace.Tycoons.Tycoons:GetDescendants()) do
    if v:IsA"Part" and v.Parent.Name:match("Wall%d") then
   repeat 
    v.CanCollide = true
    wait(.1)
    until v.CanCollide == true
    end
end
notify(nil, "Disabled wall Collision")
end
end

Window:Toggle("Create Cash", false, function(bool)
    if bool then
    GetCreateCash()
    notify(nil, "auto Get CreateCash enabled")
    else
    stopCreateCash()
    notify(nil, "auto Get CreateCash disabled")
    end
end)

Window:Toggle("Disable Door Lasers damage", false, function(bool)
    DisableLaser(bool)
end)

Window:Button("Get All Weapons", function()
    GetAllTools()
end)

Window:Toggle("Auto Collect Cash", false, function(bool)
    if bool then
    autoCollectCash()
    else
    StopautoCollectCash()
    end
end)

Window:Toggle("Walls Collision", false, function(bool)
    Wcollision(bool)
end)

Window:Button("Sword fight aura", function()
    if reExecuted then return notify(nil, "Already loaded") end
    reExecuted = true
--[[ by GGH52Lan
YT: https://www.youtube.com/@RandomVidzz-G
pls if u remake this script put a credit or a original creator Ex: (credit to GGH52Lan) or (original script is from GGH52Lan)
i Open source cuz for people who want to remake it and make better

]]

local Players = game.Players
local plr = Players.LocalPlayer
local loop = true
local retry = true
_G.name = "sword"
Mode = "enemy"
Modes = {"enemy", "others"}
local reach = 10
local auto=true
local N = Instance.new("BindableFunction")

local Window = library:Window("Sword Fight Aura")

function findTool(String)
    local strl = String:lower()
    for i,v in pairs(plr.Backpack: GetChildren ()) do
       if v.Name:lower():match(strl) ~= nil then
          return v
          end
       end
    for i,v in pairs(plr.Character:GetChildren()) do
       if v.Name:lower():match(strl) ~= nil then
         return v
         end
       end
    end

function getTool()
    return findTool(_G.name)
   
end

function KillAura()
    loop = true
    if Mode == "enemy" then
    repeat
    for i,v in pairs(game.Players:GetPlayers()) do
	pcall(function()
	if v ~= game.Players.LocalPlayer and v.TeamColor.Name ~= plr.TeamColor.Name and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChildOfClass"ForceField" == nil then
    
	local Distance = (v.Character:FindFirstChildOfClass("Part").Position - game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part").Position).magnitude
	if Distance <= reach then
	for i = 1,25 do
    plr.Character.Humanoid.RootPart.CFrame = v.Character.Humanoid.RootPart.CFrame * CFrame.new(-1.6,0,1.8)
    local h = getTool()
    h.Parent = plr.Character
    h:Activate()
    if plr.Character:FindFirstChildOfClass"Tool".Name ~= getTool().Name then
        plr.Character:FindFirstChildOfClass"Humanoid": UnequipTools()
        end
    if v.Character.Humanoid.Health <= 0 then
    loop = false
    if retry == true then
    wait(1)
    KillAura()
    end
    end
	end
	end 
    end
	end)
	end
    game:GetService("RunService").Heartbeat:Wait()
    until loop == false

    elseif Mode == "others" then

    repeat
    for i,v in pairs(game.Players:GetPlayers()) do
	pcall(function()
	if v ~= game.Players.LocalPlayer and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChildOfClass"ForceField" == nil then
    
	local Distance = (v.Character:FindFirstChildOfClass("Part").Position - game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part").Position).magnitude
	if Distance <= reach then
	for i = 1,25 do
    plr.Character.Humanoid.RootPart.CFrame = v.Character.Humanoid.RootPart.CFrame * CFrame.new(-1.6,0,1.8)
    local h = getTool()
    h.Parent = plr.Character
    h:Activate()
    if plr.Character:FindFirstChildOfClass"Tool".Name ~= getTool().Name then
        plr.Character:FindFirstChildOfClass"Humanoid": UnequipTools()
        end
    if v.Character.Humanoid.Health <= 0 then
    loop = false
    if retry == true then
    wait(1)
    KillAura()
    end
    end
	end
	end 
    end
	end)
	end
    game:GetService("RunService").Heartbeat:Wait()
    until loop == false
		
    end
    end
  
  local function notify1(Title, Text, con, Duration, Button, F)
  Title= Title or "GGH52Lan" Text = Text or "Text" Duration = Duration or 5 Button= Button or "Button"
  F = F or function() end
  con = con or "rbxassetid://14260295451"
 N.OnInvoke = F
  game:GetService("StarterGui"):SetCore("SendNotification",{
Title = Title;
Text = Text;
Icon = con;
Duration = Duration;
Button1 = Button;
Callback = N;})
  end

local function notify2(Title, Text, con, Duration, Button,B , F)
  Title= Title or "GGH52Lan" Text = Text or "Text" Duration = Duration or 5 Button= Button or "Button"
  F = F or function() end
  con = con or "rbxassetid://14260295451"
 N.OnInvoke = F
  game:GetService("StarterGui"):SetCore("SendNotification",{
Title = Title;
Text = Text;
Icon = con;
Duration = Duration;
Button1 = Button;
Button2 = B;
Callback = N;})
  end
  
  local function notify(Title, Text, con, Duration)
     Text = Text or "GGH52Lan" 
     Title= Title or "GGH52Lan"
     con = con or "rbxassetid://14260295451"
     Duration = Duration or 5
    game:GetService("StarterGui"):SetCore("SendNotification",{
 Title = Title;
 Text = Text;
 Duration = Duration;
 Icon = con;
})
    end

function GC(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		notify('Clipboard','Copied to clipboard')
	else
		notify('Clipboard',"Something went wrong 😕")
	end
end

local function modeDetector(b) 
if auto==true then
if not game:GetService"Teams": FindFirstChildOfClass "Team" then
Mode = "others"
	else
		Mode = "enemy"
	end
	else
		
	end
end

Window:Button("On", function()
    modeDetector()
    loop = true
    retry = true
    KillAura()

end)

Window:Button("Off", function()
    loop = false
    retry = false
    
    loop = false
    retry = false    
end)

Window:Button("notify Tool name", function()
for i,v in pairs (plr.Character: GetChildren ()) do
if v:IsA"Tool" then
notify2(v.Name, v.name, nil, 60, "TargetTool", "Ok", function (t)
if t == "TargetTool" then
_G.name = tostring(v.Name)
wait(1)
notify("Target Tool:", _G.name)
elseif t == "Ok" then
notify(nil, "👍")
end
end)
wait(1)
end
end
if not plr.Character: FindFirstChildOfClass"Tool" then
notify (nil, "Equip Tool")
end
end)

Window:Box("Reach - 10", function(text, focuslost)
   if focuslost then
   if not tonumber(text) then
    reach = tostring(10 or 10 and tonumber(string.format("%.2f", 10)))
    notify(nil, "only number is allowed, current reach: "..reach)
    elseif text == "" or tonumber(text) <= 10 then
    reach = 10
    notify(nil, "the minimum reach is 10, current reach: "..reach)
    elseif text == "" or tonumber(text) >= 40 then
    reach = 40
    notify(nil, "the maximum reach is 40, current reach: "..reach)
    end
   end
end)

Window:Box("Tool name", function(text, focuslost)
 if focuslost then
   if findTool(text) ~= nil then 
    _G.name = tostring(text)
notify("Tool found:", tostring(_G.name))
else
notify("Tool not found:", "no ".. text.. ". in ur backpack")
wait(1)
end
end
end)

local dropdown = Window:Dropdown("Mode", {"auto", "enemies only", "others"}, function(o)
    if o == "enemies only" then
    Mode = "enemy"
			auto=false
    elseif o == "others" then
     Mode = "others"
			auto=false
		elseif o == "auto" then
			auto = true
    end
end)

notify2 ("YT: Random Vidzz", "https://www.youtube.com/@RandomVidzz-G",nil, 60,"Copy", "👍", function (G)
if G=="Copy" then
GC("https://www.youtube.com/@RandomVidzz-G")
elseif G=="👍" then
notify(":(", ":(", "rbxassetid://14260616969")
end
end)

end)

Window:Button("infinite yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local function GetPlrs(txt)
	    local tl = txt:lower()
	    local found= {}
	    if tl == "me" or tl == "me " then
	    table.insert(found,game.Players.LocalPlayer)
	    return found
	    elseif tl == "random" or tl == "random " then
	    table.insert(found,game.Players:GetPlayers()[math.random(1, #Game.Players:GetPlayers())])
	    return found
	    elseif tl == "others" or tl == "others " then
	    for i,v in pairs(game.Players:GetPlayers()) do
	    if v ~= game.Players.LocalPlayer then
	    table.insert(found, v)
	    end
	    end
	    return found
	    elseif tl == "all" or tl == "all " then
	    for i,v in pairs(game.Players:GetPlayers()) do
	    table.insert(found, v)
	    end
	    return found
	    elseif tl == "enemies" or tl == "enemies " then
	    for i,v in pairs(game.Players:GetPlayers()) do
	    if v ~= game.Players.LocalPlayer and v.Team ~= plr.Team then
	    table.insert(found, v)
	    end
	    end
	    return found
	    elseif tl == "team" or tl == "team " then
	    for i,v in pairs(game.Players:GetPlayers()) do
	    if v ~= game.Players.LocalPlayer and v.Team == plr.Team then
	    table.insert(found, v)
	    end
	    end
	    return found
	    else
	    for i,v in pairs(game.Players:GetPlayers()) do
	    if v.Name:lower():match(tl) or v.DisplayName:lower():match(tl) then
	    table.insert(found, v)
	    end
	    end
	    return found
	end
	end

local KillW = library:Window("Kill Player")

local Target = "enemies"
KillW:Box("Kill - enemies", function(text, focuslost)
   if focuslost then
   Target = tostring(text)
   end
   end)
   
   local function bring(pl)
       if pl and pl.Character then
       pl.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(1.6,0,-1.8)
       end
   end
   
   local Lop = false
KillW:Button("Kill", function()
    if not plr.Character:FindFirstChildOfClass"Tool" then return notify(nil, "Pls equip tool") end
    if GetPlrs(Target)[1] then
    local Tool = plr.Character:FindFirstChildOfClass"Tool"
    Lop = true
    for i,target in pairs(GetPlrs(Target)) do
    while Lop do
    Tool.Parent = plr.Character
    bring(target)
    Tool:Activate()
    if target.Character.Humanoid.Health <= 0 then
    
    break 
    end
    wait(.1)
    end
    end
    else
    notify(nil, "invalid Player")
    end
end)

KillW:Button("Kill all", function()
    if not plr.Character:FindFirstChildOfClass"Tool" then return notify(nil, "Pls equip tool") end
    local Tool = plr.Character:FindFirstChildOfClass"Tool"
    Lop = true
    for i,target in pairs(GetPlrs("enemies")) do
    while Lop do
    Tool.Parent = plr.Character
    bring(target)
    Tool:Activate()
     if target.Character.Humanoid.Health <= 0 then
     
    break 
    end
    wait(.1)
    end
    end
end)

KillW:Button("Fix", function()
  if not Lop then
    Lop = true
    else
        Lop = false
            Lop = false
            end
end)

KillW:Button("Equip Tool", function()
    if  plr.Backpack:GetChildren()[1] then
    plr.Backpack:GetChildren()[1].Parent = plr.Character
    
    end
    wait(.1)
end)

KillW:Button("Drop Tool", function()
for i,v in pairs(plr.Character:GetChildren()) do
    if v:IsA"Tool" then
    v.Parent = workspace
    end
    end
    wait(.1)
end)

KillW:Button("Equip all Tool", function()
    for i,v in pairs(plr.Backpack:GetChildren()) do
    if v then
    v.Parent = plr.Character
    end
    end
end)

notify(nil, "By GGH52Lan")
 