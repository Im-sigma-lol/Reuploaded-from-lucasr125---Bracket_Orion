wait(0.5);
for i, v in pairs(gethui().Orion:GetDescendants()) do
	if ((v.ClassName == "Frame") and (v.BackgroundTransparency < 0.3)) then
		v.BackgroundTransparency = 0.2;
	end
end
gethui().Orion.Name = "OrionEdited";
if (game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") == nil) then
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
			for hue = 0, 255, 4 do
				TOGGLE['DaIcon'].BorderColor3 = Color3.fromHSV(hue / 256, 1, 1);
				TOGGLE['DaIcon'].BackgroundColor3 = Color3.fromHSV(hue / 256, 0.5, 0.8);
				wait();
			end
		end
	end);
	TOGGLE['DaIcon'].MouseButton1Click:Connect(function()
		gethui().OrionEdited.Enabled = not gethui().OrionEdited.Enabled;
	end);
	TOGGLE['das']['CornerRadius'] = UDim.new(0.2, 0);
end
