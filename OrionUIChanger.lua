if (game.Players.LocalPlayer.PlayerGui:FindFirstChild("ToggleUi") == nil) then
	local TOGGLE = {};
	TOGGLE['Ui'] = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui);
	TOGGLE['DaIcon'] = Instance.new("ImageButton", TOGGLE['Ui']);
	TOGGLE['das'] = Instance.new("UICorner", TOGGLE['DaIcon']);
	TOGGLE['Ui'].Name = "ToggleUi";
	TOGGLE['Ui'].ResetOnSpawn = false;
	TOGGLE['DaIcon'].Size = UDim2.new(0, 45, 0, 45);
	TOGGLE['DaIcon'].Position = UDim2.new(0, 0, 0, 0);
	TOGGLE['DaIcon'].Draggable = true;
	TOGGLE['DaIcon'].Image = "rbxassetid://15315284749";
	TOGGLE['DaIcon'].BackgroundColor3 = Color3.fromRGB(255, 186, 117);
	TOGGLE['DaIcon'].BorderColor3 = Color3.fromRGB(255, 186, 117);
	task.spawn(function()
		while true do
			for i = 0, 255, 4 do
				TOGGLE['DaIcon'].BorderColor3 = Color3.fromHSV(i / 256, 1, 1);
				TOGGLE['DaIcon'].BackgroundColor3 = Color3.fromHSV(i / 256, 0.5, 0.8);
				wait();
			end
		end
	end);
	TOGGLE['DaIcon'].MouseButton1Click:Connect(function()
		gethui().Orion.Enabled = not gethui().Orion.Enabled;
	end);
	TOGGLE['das']['CornerRadius'] = UDim.new(0.20000000298023224, 0);
end
for i, v in pairs(gethui().Orion:GetDescendants()) do
	if ((v.ClassName == "Frame") and (v.BackgroundTransparency < 0.3)) then
		v.BackgroundTransparency = 0.2;
	end
end
