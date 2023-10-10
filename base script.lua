getgenv().settings = {
	WalkSpeed = 16,
	AutoWalkspeed = false,
	JumpPower = 50,
	AutoJumpPower = false,
	HipHeight = 0,
	AutoHipHeight = false,
	Gravity = 196.2,
	AutoGravity = false,
}

local LocalPlayer = game.Players.LocalPlayer
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Bracket = loadstring(game:HttpGet("https://raw.githubusercontent.com/lucasr125/bracket-lib-v3.3/main/bracketv3.3.lua"))()
local Window = Bracket:Window({Name = GameName,Enabled = true,Color = Color3.new(1,0.5,0.25),Size = UDim2.new(0,296,0,296),Position = UDim2.new(0.5,-248,0.5,-248)}) do
	local HomeTab = Window:Tab({Name = "Home"}) do
		local HomeSection = HomeTab:Section({Name = "User Commands",Side = "Right"}) do
			local ServerHop = HomeSection:Button({Name = "Server Hop",Side = "Left",Callback = function()
				httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
				if httprequest then
					local servers = {}
					local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100", game.PlaceId)})
					local body = game.HttpService:JSONDecode(req.Body)
					if body and body.data then
						for i, v in next, body.data do
							if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
								table.insert(servers, 1, v.id)
							end
						end
					end
					if #servers > 0 then
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
					else
						return Bracket:Notification({Title = "Error",Description = "Couldn't find a server!",Duration = 10})
					end
				end
			end})
			local RemoteSpy = HomeSection:Button({Name = "Hydroxide",Side = "Left",Callback = function()
				local owner = "Upbolt"
				local branch = "revision"

				local function webImport(file)
					return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
				end

				webImport("init")
				webImport("ui/main")
			end})
			local InfYield = HomeSection:Button({Name = "Infinite Yield",Side = "Left",Callback = function()
				loadstring(game:HttpGet(("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")))()
			end})
			local Rejoin = HomeSection:Button({Name = "Rejoin",Side = "Left",Callback = function()
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
			end})
		end
		local LocalFuncs = HomeTab:Section({Name = "Local Functions",Side = "Left"}) do
			local WalkspeedValue = LocalFuncs:Slider({Name = "Walkspeed Value",Flag = "WalkspeedValue",Side = "Left",Min = 20,Max = 1000,Value = getgenv().settings.WalkSpeed,Precise = 0,Unit = "",Callback = function(Value_Number) 
				getgenv().settings.Walkspeed = Value_Number
				LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().settings.Walkspeed
			end})
			local AutomaticWalkspeed = LocalFuncs:Toggle({Name = "Automatic Set Walkspeed",Flag = "AutomaticWalkspeed",Side = "Left",Value = false,Callback = function(Toggle_Bool)
				getgenv().settings.AutoWalkspeed = Toggle_Bool
				if getgenv().settings.AutoWalkspeed == true then
					while getgenv().settings.AutoWalkspeed do
						task.wait()
						local Character = workspace:WaitForChild(LocalPlayer.Name)
						if Character:FindFirstChild("Humanoid") ~= nil and Character.Humanoid.WalkSpeed ~= getgenv().settings.Walkspeed then
							Character:FindFirstChild("Humanoid").WalkSpeed = getgenv().settings.Walkspeed
						end
					end
				end
			end})
			local JumpPowerValue = LocalFuncs:Slider({Name = "JumpPower Value",Flag = "JumpPowerValue",Side = "Left",Min = 50,Max = 1000,Value = getgenv().settings.JumpPower,Precise = 0,Unit = "",Callback = function(Value_Number) 
				getgenv().settings.JumpPower = Value_Number
				LocalPlayer.Character.Humanoid.JumpPower = getgenv().settings.JumpPower
			end})
			local AutomaticJumpPower = LocalFuncs:Toggle({Name = "Automatic Set JumpPower",Flag = "AutomaticJumpPower",Side = "Left",Value = false,Callback = function(Toggle_Bool)
				getgenv().settings.AutoJumpPower = Toggle_Bool
				if getgenv().settings.AutoJumpPower == true then
					while getgenv().settings.AutoJumpPower do
						task.wait()
						local Character = workspace:WaitForChild(LocalPlayer.Name)
						if Character:FindFirstChild("Humanoid") ~= nil and Character.Humanoid.JumpPower ~= getgenv().settings.JumpPower then
							Character:FindFirstChild("Humanoid").JumpPower = getgenv().settings.JumpPower
						end
					end
				end
			end})

			local HipHeightValue = LocalFuncs:Slider({Name = "HipHeight Value",Flag = "HipHeightValue",Side = "Left",Min = 0,Max = 100,Value = getgenv().settings.HipHeight,Precise = 0,Unit = "",Callback = function(Value_Number) 
				getgenv().settings.HipHeight = Value_Number
				LocalPlayer.Character.Humanoid.HipHeight = getgenv().settings.HipHeight
			end})
			local AutomaticHipHeight = LocalFuncs:Toggle({Name = "Automatic Set HipHeight",Flag = "AutomaticHipHeight",Side = "Left",Value = false,Callback = function(Toggle_Bool)
				getgenv().settings.AutoHipHeight = Toggle_Bool
				if getgenv().settings.AutoHipHeight == true then
					while getgenv().settings.AutoHipHeight do
						task.wait()
						local Character = workspace:WaitForChild(LocalPlayer.Name)
						if Character:FindFirstChild("Humanoid") ~= nil and Character.Humanoid.HipHeight ~= getgenv().settings.HipHeight then
							Character:FindFirstChild("Humanoid").HipHeight = getgenv().settings.HipHeight
						end
					end
				end
			end})

			local GravityValue = LocalFuncs:Slider({Name = "Gravity Value",Flag = "GravityValue",Side = "Left",Min = 0,Max = 1000,Value = getgenv().settings.Gravity,Precise = 2,Unit = "",Callback = function(Value_Number) 
				getgenv().settings.Gravity = Value_Number
				game.Workspace.Gravity = getgenv().settings.Gravity
			end})
			local AutomaticGravity = LocalFuncs:Toggle({Name = "Automatic Set Gravity",Flag = "AutomaticGravity",Side = "Left",Value = false,Callback = function(Toggle_Bool)
				getgenv().settings.AutoGravity = Toggle_Bool
				if getgenv().settings.AutoGravity == true then
					while getgenv().settings.AutoGravity do
						task.wait()
						game.Workspace.Gravity = getgenv().settings.Gravity
					end
				end
			end})
		end
	end
end
