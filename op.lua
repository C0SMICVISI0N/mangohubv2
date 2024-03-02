
	-- Anti Kick
	game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function()

		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
		
	end)

	-- Anti Afk
	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)

	-- Config
	getgenv().config = {}
	local Config = getgenv().config
	Config.AutoDrinkEnabled = false
	Config.AutoPresteigeEnabled = false
	Config.AutoEquipDrinkEnabled = false
	Config.AutoGrabGems = false
	Config.AutoUltraPresteigeEnabled = false

	local ConFigFolderPath = "MangoHubV2/Config/BSR"
		
	if not isfolder(ConFigFolderPath) then makefolder(ConFigFolderPath) end

	--if not isfile(ConFigFolderPath .. "/") then writefile(ConFigFolderPath .. "/", "return false") end
	if not isfile(ConFigFolderPath .. "/AutoDrinkEnabled") then writefile(ConFigFolderPath .. "/AutoDrinkEnabled", "return false") end
	if not isfile(ConFigFolderPath .. "/AutoPresteigeEnabled") then writefile(ConFigFolderPath .. "/AutoPresteigeEnabled", "return false") end
	if not isfile(ConFigFolderPath .. "/AutoEquipDrinkEnabled") then writefile(ConFigFolderPath .. "/AutoEquipDrinkEnabled", "return false") end
	if not isfile(ConFigFolderPath .. "/AutoGrabGems") then writefile(ConFigFolderPath .. "/AutoGrabGems", "return false") end
	if not isfile(ConFigFolderPath .. "/AutoUltraPresteigeEnabled") then writefile(ConFigFolderPath .. "/AutoUltraPresteigeEnabled", "return false") end


	Config.AutoDrinkEnabled = loadstring(readfile(ConFigFolderPath .. "/AutoDrinkEnabled"))()
	Config.AutoPresteigeEnabled = loadstring(readfile(ConFigFolderPath .. "/AutoPresteigeEnabled"))()
	Config.AutoEquipDrinkEnabled = loadstring(readfile(ConFigFolderPath .. "/AutoEquipDrinkEnabled"))()
	Config.AutoGrabGems = loadstring(readfile(ConFigFolderPath .. "/AutoGrabGems"))()
	Config.AutoUltraPresteigeEnabled = loadstring(readfile(ConFigFolderPath .. "/AutoUltraPresteigeEnabled"))()


	function SaveConfig()
		
		writefile(ConFigFolderPath .. "/AutoDrinkEnabled", "return " .. tostring(Config.AutoDrinkEnabled))
		writefile(ConFigFolderPath .. "/AutoPresteigeEnabled", "return " .. tostring(Config.AutoPresteigeEnabled))
		writefile(ConFigFolderPath .. "/AutoEquipDrinkEnabled", "return " .. tostring(Config.AutoEquipDrinkEnabled))
		writefile(ConFigFolderPath .. "/AutoGrabGems", "return " .. tostring(Config.AutoGrabGems))
		writefile(ConFigFolderPath .. "/AutoUltraPresteigeEnabled", "return " .. tostring(Config.AutoUltraPresteigeEnabled))

	end

	-- Services
	local Players = game:GetService("Players")

	-- Mango Api
	local MangoApi = loadstring(game:HttpGet("https://raw.githubusercontent.com/C0SMICVISI0N/MangoAPI/main/API/MangoAPI.lua"))()

	-- CFA Library
	local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/C0SMICVISI0N/MangoAPI/main/API/UiLibrarys/CFA%20Hub.lua"))()

	-- Create Window
	local Window = Lib:CreateWindow("MangoHub V2", "Burping Reborn", false, 1193450739)

	-- Auto Farmw
	--local Player = Window:CreatePage("Client")
	local AF = Window:CreatePage("Auto Farm")
	local Creds = Window:CreatePage("Credits")

	-- Sections

	local CredsS = Creds:CreateSection("Credits")

	local AFS = AF:CreateSection("Auto Farm")
	local AFS2 = AF:CreateSection("Auto Pets")

	CredsS:CreateButton("Hub By: Cosmic", function ()
		
	end)

	CredsS:CreateButton("Script By: Cosmic", function ()
		
	end)

	CredsS:CreateButton("Copy Discord Invite", function ()
		setclipboard("https://discord.gg/UPzpppYUp5")
	end)

	-- Inputs
	AFS:CreateToggle("Auto Drink", {Toggled=Config.AutoDrinkEnabled , Description = false}, function(Value)
	Config.AutoDrinkEnabled = Value
	SaveConfig()
	end)

	AFS:CreateToggle("Auto Equip Drink", {Toggled=Config.AutoEquipDrinkEnabled , Description = false}, function(Value)
	Config.AutoEquipDrinkEnabled = Value
	SaveConfig()
	end)

	AFS:CreateToggle("Auto Presteige", {Toggled=Config.AutoPresteigeEnabled , Description = false}, function(Value)
	Config.AutoPresteigeEnabled = Value
	SaveConfig()
	end)

	AFS:CreateToggle("Auto Ultra Presteige", {Toggled=Config.AutoPresteigeEnabled , Description = false}, function(Value)
	Config.AutoUltraPresteigeEnabled = Value
	SaveConfig()
	end)

	AFS2:CreateToggle("Auto Grab Gems", {Toggled=Config.AutoGrabGems , Description = false}, function(Value)
	Config.AutoGrabGems = Value
	SaveConfig()
	end)

	warn("MangoHub V2 Loaded!")
	-- Main Loop

	while wait() do
		
		if Config.AutoGrabGems then
			for i, v in pairs(workspace.Gems:GetChildren()) do
			
				firetouchinterest(game.Players.LocalPlayer.Character.Head, v, 1)

			end
		end

		if Config.AutoPresteigeEnabled then
			local ohString1 = "12F91374-1737-4DC2-AEB2-F355F0E30B69"

			game:GetService("ReplicatedStorage").Events.PrestigeEvent:FireServer(ohString1)
		end

		if Config.AutoUltraPresteigeEnabled then
			game:GetService("ReplicatedStorage").Events.UltraPrestigeEvent:FireServer()
		end

		if Config.AutoDrinkEnabled then
			local ohString1 = "E2523EB3-2EE6-4F1F-AE3A-EADE7058B6B8"

			game:GetService("ReplicatedStorage").Events.DrinkEvent:FireServer(ohString1)
		end
		
		if Config.AutoEquipDrinkEnabled then
			local ohBoolean1 = true
			local ohString2 = "E6997686-7FB1-4F93-B05A-AF22F8928A3A"

			game:GetService("ReplicatedStorage").Events.equipdrink:FireServer(ohBoolean1, ohString2)
		end
	end
