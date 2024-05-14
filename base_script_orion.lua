local settings = {
  ["walkspeed"] = 16,
  ["jumppower"] = 50,
  ["gravity"] = 196.6,
  ["hipheight"] = 2,
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
local jumppowerSlider = localTab:AddSlider({Name = "Set jumppower",Min = 0,Max = 1000,Default = settings.jumppower,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "jumppower",Callback = function(Value)
  settings.jumppower = Value
  localPlayer.Character.Humanoid.JumpPower = settings.jumppower
  localPlayer.Character.Humanoid.UseJumpPower = true
end});
local hipheightSlider = localTab:AddSlider({Name = "Set hipheight",Min = 0,Max = 50,Default = settings.hipheight,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "hipheight",Callback = function(Value)
  settings.hipheight = Value
  localPlayer.Character.Humanoid.HipHeight = settings.hipheight
end});
local gravitySlider = localTab:AddSlider({Name = "Set gravity",Min = 0,Max = 1000,Default = settings.gravity,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "gravity",Callback = function(Value)
  settings.gravity = Value
  game.Workspace.Gravity = settings.gravity
end});
