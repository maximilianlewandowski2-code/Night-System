-- Roblox Loading-Ring GUI Haupt-Skript

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingRing"
loadingGui.ResetOnSpawn = false
loadingGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5,0,0.5,0)
frame.Size = UDim2.new(0, 100, 0, 100)
frame.BackgroundTransparency = 1
frame.Parent = loadingGui

local ring = Instance.new("ImageLabel")
ring.Size = UDim2.new(1,0,1,0)
ring.BackgroundTransparency = 1
ring.Image = "rbxassetid://3926307971"  -- Standard Roblox SpriteSheet Kreis
ring.ImageRectOffset = Vector2.new(916, 396)
ring.ImageRectSize = Vector2.new(36, 36)
ring.Parent = frame

local angle = 0
local runService = game:GetService("RunService")
runService.RenderStepped:Connect(function(dt)
	angle = (angle + dt * 180) % 360
	frame.Rotation = angle
end)

-- Blende nach 5 Sekunden aus:
task.wait(5)
loadingGui:Destroy()