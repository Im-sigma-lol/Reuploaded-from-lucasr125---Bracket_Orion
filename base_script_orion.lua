local localPlayer = game.Players.LocalPlayer
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local settings = {
	["walkspeed"] = 16,
	["jumppower"] = 50,
	["gravity"] = 196.6,
	["hipheight"] = 0,
	["autowalkspeed"] = false,
	["autojumppower"] = false,
	["autohipheight"] = false,
}

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/lucasr125/Bracket_Orion/main/orionlib.lua')))();
local Window = OrionLib:MakeWindow({Name = gameName.." ; "..identifyexecutor(), HidePremium = false, SaveConfig = false, IntroEnabled = true, IntroText = gameName});

local localTab = Window:MakeTab({Name = "Local",Icon = "rbxassetid://4483345998",PremiumOnly = false});
local SetValueSection = localTab:AddSection({
	Name = "Set Values Section"
})
local walkspeedSlider = SetValueSection:AddSlider({Name = "Set walkspeed",Min = 0,Max = 1000,Default = settings.walkspeed,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "walkspeed",Callback = function(Value)
	settings.walkspeed = Value
	localPlayer.Character.Humanoid.WalkSpeed = settings.walkspeed
end});
local jumppowerSlider = SetValueSection:AddSlider({Name = "Set jumppower",Min = 0,Max = 1000,Default = settings.jumppower,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "jumppower",Callback = function(Value)
	settings.jumppower = Value
	localPlayer.Character.Humanoid.JumpPower = settings.jumppower
	localPlayer.Character.Humanoid.UseJumpPower = true
end});
local hipheightSlider = SetValueSection:AddSlider({Name = "Set hipheight",Min = 0,Max = 50,Default = settings.hipheight,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "hipheight",Callback = function(Value)
	settings.hipheight = Value
	localPlayer.Character.Humanoid.HipHeight = settings.hipheight
end});
local gravitySlider = SetValueSection:AddSlider({Name = "Set gravity",Min = 0,Max = 1000,Default = settings.gravity,Color = Color3.fromRGB(255,255,255),Increment = 1,ValueName = "gravity",Callback = function(Value)
	settings.gravity = Value
	game.Workspace.Gravity = settings.gravity
end});
local AutoValueSection = localTab:AddSection({
	Name = "Auto Values Section"
})
local walkspeedToggle = AutoValueSection:AddToggle({Name = "Auto walkspeed",Default = false,Callback = function(Value)
	settings.autowalkspeed = Value
	if settings.autowalkspeed == true then
		while task.wait(0.1) and settings.autowalkspeed == true do
			localPlayer.Character.Humanoid.WalkSpeed = settings.walkspeed
		end
	end
end});
local jumppowerToggle = AutoValueSection:AddToggle({Name = "Auto jumppower",Default = false,Callback = function(Value)
	settings.autojumppower = Value
	if settings.autojumppower == true then
		while task.wait(0.1) and settings.autojumppower == true do
			localPlayer.Character.Humanoid.JumpPower = settings.jumppower
			localPlayer.Character.Humanoid.UseJumpPower = true
		end
	end
end});
local hipheightToggle = AutoValueSection:AddToggle({Name = "Auto hipheight",Default = false,Callback = function(Value)
	settings.autohipheight = Value
	if settings.autohipheight == true then
		while task.wait(0.1) and settings.autohipheight == true do
			localPlayer.Character.Humanoid.HipHeight = settings.hipheight
		end
	end
end});
