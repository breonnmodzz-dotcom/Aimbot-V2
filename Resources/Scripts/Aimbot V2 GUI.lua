--// Cache
local loadstring, game, getgenv, setclipboard = loadstring, game, getgenv, setclipboard

--// Loaded check
if getgenv().Aimbot then return end

--// Load Aimbot V2 (NOVO RAW)
loadstring(game:HttpGet("https://raw.githubusercontent.com/breonnmodzz-dotcom/Aimbot-V2/refs/heads/main/Resources/Scripts/Main.lua"))()

--// Variables
local Aimbot = getgenv().Aimbot
local Settings, FOVSettings, Functions = Aimbot.Settings, Aimbot.FOVSettings, Aimbot.Functions

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()

local Parts = {"Head", "HumanoidRootPart", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "LeftUpperLeg", "RightFoot", "RightLowerLeg", "LowerTorso", "RightUpperLeg"}

--// Frame
Library.UnloadCallback = Functions.Exit

local MainFrame = Library:CreateWindow({
\tName = "Aimbot V2 + ESP (BREONN)",
\tThemeable = {
\t\tImage = "7059346386",
\t\tInfo = "Breonn Aimbot V2 + ESP
Made by breonnmodzz",
\t\tCredit = false
\t},
\tBackground = "",
\tTheme = [[{"__Designer.Colors.section":"ADC7FF","__Designer.Colors.topGradient":"1B242F","__Designer.Settings.ShowHideKey":"Enum.KeyCode.RightShift","__Designer.Colors.otherElementText":"54637D","__Designer.Colors.hoveredOptionBottom":"38667D","__Designer.Background.ImageAssetID":"","__Designer.Colors.unhoveredOptionTop":"407495","__Designer.Colors.innerBorder":"2C4168","__Designer.Colors.unselectedOption":"4E6EA0","__Designer.Background.UseBackgroundImage":true,"__Designer.Files.WorkspaceFile":"Aimbot V2","__Designer.Colors.main":"23A0FF","__Designer.Colors.outerBorder":"162943","__Designer.Background.ImageColor":"FFFFFF","__Designer.Colors.tabText":"C9DFF1","__Designer.Colors.elementBorder":"111D26","__Designer.Colors.sectionBackground":"0E141C","__Designer.Colors.selectedOption":"558AC2","__Designer.Colors.background":"11182A","__Designer.Colors.bottomGradient":"202B42","__Designer.Background.ImageTransparency":95,"__Designer.Colors.hoveredOptionTop":"4885A0","__Designer.Colors.elementText":"7692B8","__Designer.Colors.unhoveredOptionBottom":"5471C4"}]]
})

--// Tabs
local SettingsTab = MainFrame:CreateTab({Name = "Settings"})
local FOVSettingsTab = MainFrame:CreateTab({Name = "FOV Settings"})
local ESPTab = MainFrame:CreateTab({Name = "ESP"}) -- NOVA ABA ESP
local FunctionsTab = MainFrame:CreateTab({Name = "Functions"})

--// Settings - Sections
local Values = SettingsTab:CreateSection({Name = "Values"})
local Checks = SettingsTab:CreateSection({Name = "Checks"})
local ThirdPerson = SettingsTab:CreateSection({Name = "Third Person"})

--// FOV Settings - Sections
local FOV_Values = FOVSettingsTab:CreateSection({Name = "Values"})
local FOV_Appearance = FOVSettingsTab:CreateSection({Name = "Appearance"})

--// ESP - Sections
local ESPSection = ESPTab:CreateSection({Name = "ESP Options"})

--// Functions - Sections
local FunctionsSection = FunctionsTab:CreateSection({Name = "Functions"})

-- ESP VARIABLES
local ESPEnabled = false
local ESPObjects = {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

--// Settings / Values
Values:AddToggle({
    Name = "Aim Fire Mode", 
    Value = true,
    Callback = function(New) Settings.HoldMode = New end
}).Default = true

Values:AddTextbox({
    Name = "Fire Button", 
    Value = "ButtonR2",
    Callback = function(New) Settings.FireKey = New end
}).Default = "ButtonR2"

Settings.LockPart = Parts[1]
Values:AddDropdown({
\tName = "Lock Part",
\tValue = Parts[1],
\tCallback = function(New) Settings.LockPart = New end,
\tList = Parts,
\tNothing = "Head"
}).Default = Parts[1]

Values:AddTextbox({
\tName = "Hotkey",
\tValue = Settings.TriggerKey,
\tCallback = function(New) Settings.TriggerKey = New end
}).Default = Settings.TriggerKey

Values:AddTextbox({
    Name = "Menu Toggle", 
    Value = Settings.MenuKey or "ButtonR1",
    Callback = function(New)
        Settings.MenuKey = New
        print("Menu Key:", New)
    end
}).Default = Settings.MenuKey or "ButtonR1"

Values:AddSlider({
\tName = "Sensitivity",
\tValue = Settings.Sensitivity,
\tCallback = function(New) Settings.Sensitivity = New end,
\tMin = 0,
\tMax = 1,
\tDecimals = 2
}).Default = Settings.Sensitivity

--// Settings / Checks
Checks:AddToggle({
\tName = "Team Check",
\tValue = Settings.TeamCheck,
\tCallback = function(New) Settings.TeamCheck = New end
}).Default = Settings.TeamCheck

Checks:AddToggle({
\tName = "Wall Check",
\tValue = Settings.WallCheck,
\tCallback = function(New) Settings.WallCheck = New end
}).Default = Settings.WallCheck

Checks:AddToggle({
\tName = "Alive Check",
\tValue = Settings.AliveCheck,
\tCallback = function(New) Settings.AliveCheck = New end
}).Default = Settings.AliveCheck

--// Settings / ThirdPerson
ThirdPerson:AddToggle({
\tName = "Enable Third Person",
\tValue = Settings.ThirdPerson,
\tCallback = function(New) Settings.ThirdPerson = New end
}).Default = Settings.ThirdPerson

ThirdPerson:AddSlider({
\tName = "Sensitivity",
\tValue = Settings.ThirdPersonSensitivity,
\tCallback = function(New) Settings.ThirdPersonSensitivity = New end,
\tMin = 0.1,
\tMax = 5,
\tDecimals = 1
}).Default = Settings.ThirdPersonSensitivity

--// FOV Settings / Values
FOV_Values:AddToggle({
\tName = "Enabled",
\tValue = FOVSettings.Enabled,
\tCallback = function(New) FOVSettings.Enabled = New end
}).Default = FOVSettings.Enabled

FOV_Values:AddToggle({
\tName = "Visible",
\tValue = FOVSettings.Visible,
\tCallback = function(New) FOVSettings.Visible = New end
}).Default = FOVSettings.Visible

FOV_Values:AddSlider({
\tName = "Amount",
\tValue = FOVSettings.Amount,
\tCallback = function(New) FOVSettings.Amount = New end,
\tMin = 10,
\tMax = 300
}).Default = FOVSettings.Amount

--// FOV Settings / Appearance
FOV_Appearance:AddToggle({
\tName = "Filled",
\tValue = FOVSettings.Filled,
\tCallback = function(New) FOVSettings.Filled = New end
}).Default = FOVSettings.Filled

FOV_Appearance:AddSlider({
\tName = "Transparency",
\tValue = FOVSettings.Transparency,
\tCallback = function(New) FOVSettings.Transparency = New end,
\tMin = 0,
\tMax = 1,
\tDecimal = 1
}).Default = FOVSettings.Transparency

FOV_Appearance:AddSlider({
\tName = "Sides",
\tValue = FOVSettings.Sides,
\tCallback = function(New) FOVSettings.Sides = New end,
\tMin = 3,
\tMax = 60
}).Default = FOVSettings.Sides

FOV_Appearance:AddSlider({
\tName = "Thickness",
\tValue = FOVSettings.Thickness,
\tCallback = function(New) FOVSettings.Thickness = New end,
\tMin = 1,
\tMax = 50
}).Default = FOVSettings.Thickness

FOV_Appearance:AddColorpicker({
\tName = "Color",
\tValue = FOVSettings.Color,
\tCallback = function(New) FOVSettings.Color = New end
}).Default = FOVSettings.Color

FOV_Appearance:AddColorpicker({
\tName = "Locked Color",
\tValue = FOVSettings.LockedColor,
\tCallback = function(New) FOVSettings.LockedColor = New end
}).Default = FOVSettings.LockedColor

--// ESP TOGGLES
ESPSection:AddToggle({
    Name = "ESP Box",
    Value = false,
    Callback = function(Value)
        ESPEnabled = Value
        if not Value then
            for _, obj in pairs(ESPObjects) do
                if obj then obj:Destroy() end
            end
            ESPObjects = {}
        end
    end
})

--// Functions / Fire Mode
local UserInputService = game:GetService("UserInputService")
local holding = false
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode.Name == Settings.FireKey then
        holding = true
        Settings.Enabled = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode.Name == Settings.FireKey then
        holding = false
        Settings.Enabled = false
    end
end)

--// Menu Toggle System
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode.Name == Settings.MenuKey or input.UserInputType.Name == Settings.MenuKey then
        Library:Close()
        wait(0.1)
        Library:Open()
    end
end)

--// ESP LOOP
RunService.Heartbeat:Connect(function()
    if ESPEnabled then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local root = plr.Character.HumanoidRootPart
                local existing = ESPObjects[plr]
                
                if not existing or not existing.Parent then
                    if existing then existing:Destroy() end
                    
                    local box = Instance.new("BoxHandleAdornment")
                    box.Name = "ESPBox"
                    box.Size = Vector3.new(4.5, 6, 1.5)
                    box.Color3 = Color3.new(0, 1, 0)
                    box.Transparency = 0.5
                    box.Adornee = plr.Character
                    box.AlwaysOnTop = true
                    box.ZIndex = 10
                    box.Parent = root
                    ESPObjects[plr] = box
                end
            elseif ESPObjects[plr] then
                ESPObjects[plr]:Destroy()
                ESPObjects[plr] = nil
            end
        end
    else
        for plr, obj in pairs(ESPObjects) do
            if obj then obj:Destroy() end
        end
        ESPObjects = {}
    end
end)

--// Auto Open + Toggle Indicator
wait(1)
Library:Open()

-- BOTÃO MINIMIZAR FLUTUANTE
local ScreenGui = game.CoreGui:FindFirstChild("AimbotToggle") or Instance.new("ScreenGui")
ScreenGui.Name = "AimbotToggle"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleMenu"
ToggleBtn.Parent = ScreenGui
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 20, 0, 20)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleBtn.Text = "X"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextScaled = true
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.BorderSizePixel = 2
ToggleBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Active = true
ToggleBtn.Draggable = true

ToggleBtn.MouseButton1Click:Connect(function()
    if Library.Opened then
        Library:Close()
        ToggleBtn.Text = "+"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        Library:Open()
        ToggleBtn.Text = "X"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

--// Functions
FunctionsSection:AddButton({
\tName = "Reset Settings",
\tCallback = function()
\t\tFunctions.ResetSettings()
\t\tLibrary.ResetAll()
\tend
})

FunctionsSection:AddButton({
\tName = "Restart",
\tCallback = Functions.Restart
})

FunctionsSection:AddButton({
\tName = "Exit",
\tCallback = function()
\t\tFunctions:Exit()
\t\tLibrary.Unload()
\tend
})

FunctionsSection:AddButton({
\tName = "Copy Script Page",
\tCallback = function()
\t\tsetclipboard("https://github.com/breonnmodzz-dotcom/Aimbot-V2")
\tend
})

print("✅ BREONN Aimbot V2 + ESP + Botão Minimizar CARREGADO!")
print("🔗 Novo RAW: https://raw.githubusercontent.com/breonnmodzz-dotcom/Aimbot-V2/refs/heads/main/Resources/Scripts/Main.lua")
