local settings = {
  ["walkspeed"] = 16,
  ["autoWalkspeed"] = false,
  ["jumppower"] = 50,
  ["autoJumppower"] = false,
  ["gravity"] = 196.6,
  ["autoGravity"] = false,
  ["hipheight"] = 2,
  ["autoHipheight"] = false
}

local localPlayer = game.Players.LocalPlayer
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/lucasr125/Bracket_Orion/main/orionlib.lua')))();
local Window = OrionLib:MakeWindow({Name = gameName.." ; ", HidePremium = false, SaveConfig = false, IntroEnabled = true, IntroText = identifyexecutor().." ; "..gameName});

local localTab = Window:MakeTab({Name = "Local",Icon = "rbxassetid://4483345998",PremiumOnly = false});
local walkspeedSlider = localTab:AddSlider({Name = "Set walkspeed",Min = 0,Max = 1000,Default = settings.walkspeed,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "walkspeed",Callback = function(Value)
  settings.walkspeed = Value
  localPlayer.Character.Humanoid.WalkSpeed = settings.walkspeed
end});
local walkspeedToggle = localTab:AddToggle({Name = "Auto set walkspeed value",Default = false,Callback = function(Value)
	settings.autoWalkspeed = Value
  while settings.autoWalkspeed do
    if settings.autoWalkspeed == true then
      task.wait()
			local Character = workspace:WaitForChild(LocalPlayer.Name)
			if Character:FindFirstChild("Humanoid") ~= nil and Character.Humanoid.WalkSpeed ~= settings.Walkspeed then
				Character:FindFirstChild("Humanoid").WalkSpeed = settings.Walkspeed
			end
    end
  end
end});
local jumppowerSlider = localTab:AddSlider({Name = "Set jumppower",Min = 0,Max = 1000,Default = settings.jumppower,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "jumppower",Callback = function(Value)
  settings.jumppower = Value
  localPlayer.Character.Humanoid.JumpPower = settings.jumppower
  localPlayer.Character.Humanoid.UseJumpPower = true
end});
local jumppowerToggle = localTab:AddToggle({Name = "Auto set jumppower value",Default = false,Callback = function(Value)
	settings.autoJumppower = Value
  while settings.autoJumppower do
    if settings.autoJumppower == true then
      task.wait()
			local Character = workspace:WaitForChild(LocalPlayer.Name)
			if Character:FindFirstChild("Humanoid") ~= nil and Character.Humanoid.JumpPower ~= settings.jumppower then
				Character:FindFirstChild("Humanoid").JumpPower = settings.jumppower
				localPlayer.Character.Humanoid.UseJumpPower = true
			end
    end
  end
end});
local hipheightSlider = localTab:AddSlider({Name = "Set hipheight",Min = 0,Max = 50,Default = settings.hipheight,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "hipheight",Callback = function(Value)
  settings.hipheight = Value
  localPlayer.Character.Humanoid.HipHeight = settings.hipheight
end});
local hipheightToggle = localTab:AddToggle({Name = "Auto set hipheight value",Default = false,Callback = function(Value)
	settings.autoHipheight = Value
  while settings.autoHipheight do
    if settings.autoHipheight == true then
      task.wait()
			local Character = workspace:WaitForChild(LocalPlayer.Name)
			if Character:FindFirstChild("Humanoid") ~= nil and Character.Humanoid.HipHeight ~= settings.hipheight then
				Character:FindFirstChild("Humanoid").HipHeight = settings.hipheight
			end
    end
  end
end});
local gravitySlider = localTab:AddSlider({Name = "Set gravity",Min = 0,Max = 1000,Default = settings.gravity,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "gravity",Callback = function(Value)
  settings.gravity = Value
  game.Workspace.Gravity = settings.gravity
end});
local gravityToggle = localTab:AddToggle({Name = "Auto set gravity value",Default = false,Callback = function(Value)
	settings.autoGravity = Value
  while settings.autoGravity do
    if settings.autoGravity == true then
      task.wait()
			game.Workspace.Gravity = settings.gravity
    end
  end
end});
