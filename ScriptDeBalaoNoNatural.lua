local player = tostring(game.Players.LocalPlayer.Name)
while true do
if game.Workspace:FindFirstChild("GreenBalloon") then
if not game.Workspace[player]:FindFirstChild("GreenBalloon") and not game.Players.LocalPlayer.Backpack:FindFirstChild("GreenBalloon") then
local workspaceClone = game.Workspace.GreenBalloon:Clone()
workspaceClone.Parent = game.Workspace[player]
end
else
local balloonCheck = game.Workspace:GetDescendants()
local balloonClone
for i, balloon in ipairs(balloonCheck) do
if (tostring(balloon.Name) == "GreenBalloon") then
balloonClone = balloon:Clone()
wait()
end
end
balloonClone.Parent = game.Workspace
local workspaceClone = game.Workspace.GreenBalloon:Clone()
workspaceClone.Parent = game.Workspace[player]
end
wait()
end