local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EgoDrivenKeyUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Create main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 260)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
frame.BorderSizePixel = 0
frame.Parent = screenGui
frame.ClipsDescendants = true

-- Rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 14)
uiCorner.Parent = frame

-- Title label
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 50)
title.Position = UDim2.new(0, 20, 0, 20)
title.BackgroundTransparency = 1
title.Text = "Ego Driven | Key System"
title.TextColor3 = Color3.fromRGB(240, 240, 240)
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

-- Thank-you description (now between title and textbox)
local note = Instance.new("TextLabel")
note.Size = UDim2.new(1, -40, 0, 30)
note.Position = UDim2.new(0, 20, 0, 65)
note.BackgroundTransparency = 1
note.Text = "If you got your key from the link, it's kinda perm, so uh yeah, better thank me — NEL__BLR"
note.TextColor3 = Color3.fromRGB(180, 180, 180)
note.Font = Enum.Font.Gotham
note.TextSize = 13
note.TextWrapped = true
note.TextXAlignment = Enum.TextXAlignment.Left
note.TextYAlignment = Enum.TextYAlignment.Top
note.Parent = frame

-- TextBox for key input
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -40, 0, 50)
keyBox.Position = UDim2.new(0, 20, 0, 100)
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyBox.TextColor3 = Color3.fromRGB(220, 220, 220)
keyBox.PlaceholderText = "Enter your key here..."
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 24
keyBox.ClearTextOnFocus = false
keyBox.BorderSizePixel = 0
keyBox.Text = ""
keyBox.Parent = frame

local keyBoxCorner = Instance.new("UICorner")
keyBoxCorner.CornerRadius = UDim.new(0, 10)
keyBoxCorner.Parent = keyBox

-- Autofill saved key
if getgenv and getgenv().EgoDrivenSavedKey then
    keyBox.Text = getgenv().EgoDrivenSavedKey
end

-- Button container
local buttonFrame = Instance.new("Frame")
buttonFrame.Size = UDim2.new(1, -40, 0, 60)
buttonFrame.Position = UDim2.new(0, 20, 0, 160)
buttonFrame.BackgroundTransparency = 1
buttonFrame.Parent = frame

-- Get Key button
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.48, 0, 1, 0)
getKeyButton.Position = UDim2.new(0, 0, 0, 0)
getKeyButton.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.Font = Enum.Font.GothamSemibold
getKeyButton.TextSize = 22
getKeyButton.Text = "Get Key"
getKeyButton.BorderSizePixel = 0
getKeyButton.Parent = buttonFrame

local getKeyButtonCorner = Instance.new("UICorner")
getKeyButtonCorner.CornerRadius = UDim.new(0, 10)
getKeyButtonCorner.Parent = getKeyButton

-- Submit Key button
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.48, 0, 1, 0)
submitButton.Position = UDim2.new(0.52, 0, 0, 0)
submitButton.BackgroundColor3 = Color3.fromRGB(67, 138, 255)
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.Font = Enum.Font.GothamSemibold
submitButton.TextSize = 22
submitButton.Text = "Submit Key"
submitButton.BorderSizePixel = 0
submitButton.Parent = buttonFrame

local submitButtonCorner = Instance.new("UICorner")
submitButtonCorner.CornerRadius = UDim.new(0, 10)
submitButtonCorner.Parent = submitButton

-- Status bar frame
local statusBar = Instance.new("Frame")
statusBar.Size = UDim2.new(1, 0, 0, 30)
statusBar.Position = UDim2.new(0, 0, 1, -50)
statusBar.BackgroundColor3 = Color3.fromRGB(55, 120, 255)
statusBar.BorderSizePixel = 0
statusBar.Parent = frame

local statusBarCorner = Instance.new("UICorner")
statusBarCorner.CornerRadius = UDim.new(0, 10)
statusBarCorner.Parent = statusBar

-- Status label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 1, 0)
statusLabel.Position = UDim2.new(0, 10, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.Font = Enum.Font.GothamSemibold
statusLabel.TextSize = 18
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.TextYAlignment = Enum.TextYAlignment.Center
statusLabel.Parent = statusBar

-- Hover effects
local function onHover(button, enterColor, leaveColor)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = enterColor
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = leaveColor
    end)
end

onHover(getKeyButton, Color3.fromRGB(105, 190, 255), Color3.fromRGB(85, 170, 255))
onHover(submitButton, Color3.fromRGB(85, 160, 255), Color3.fromRGB(67, 138, 255))

-- Get Key action
getKeyButton.MouseButton1Click:Connect(function()
    local keyLink = "https://NEL-BLR.github.io/"
    if setclipboard then
        setclipboard(keyLink)
        statusLabel.Text = "Status: Key generator link copied to clipboard"
    else
        statusLabel.Text = "Status: Clipboard not supported"
    end
    statusLabel.TextColor3 = Color3.new(1, 1, 1)
end)

-- Submit Key action
submitButton.MouseButton1Click:Connect(function()
    local inputKey = keyBox.Text:gsub("%s", "") -- remove spaces
    local prefix = "Ego-Driv3n_"
    local validLength = #prefix + 12

    if inputKey:sub(1, #prefix) == prefix and #inputKey == validLength then
        if getgenv then
            getgenv().EgoDrivenSavedKey = inputKey
        end
        statusLabel.Text = "Status: Access Enlocked to Ego Driven"
        statusLabel.TextColor3 = Color3.new(1, 1, 1)
        keyBox.Text = ""
        wait(1)
        screenGui:Destroy()
        -- Trigger your main Ego Driven logic here
            local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()

local Window = Library:CreateWindow{
    Title = "Ego Drive | Version [TEST]",
    SubTitle = "by NEL__BLR",
    TabWidth = 160,
    Size = UDim2.fromOffset(830, 525),
    Resize = true,
    MinSize = Vector2.new(470, 380),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
}

local Tabs = {
    Dashboard = Window:CreateTab{
        Title = "Dashboard",
        Icon = "phosphor-gauge-bold"
    },
    Tools = Window:CreateTab{
        Title = "Tools",
        Icon = "wrench"
    },
    Settings = Window:CreateTab{
        Title = "Settings",
        Icon = "settings"
    }
}

local Options = Library.Options

Library:Notify{
    Title = "Ego Drive",
    Content = "Interface Initialized Successfully.",
    Duration = 5
}

Tabs.Dashboard:CreateParagraph("Intro", {
    Title = "Welcome to Ego Drive",
    Content = "Enhance your ego. Dominate the field.\nEverything starts here."
})

Tabs.Tools:CreateButton{
    Title = "Activate Ego Mode",
    Description = "Unleash your inner striker.",
    Callback = function()
        Window:Dialog{
            Title = "Ego Mode",
            Content = "Are you sure you want to enter Ego Mode?",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        print("Ego Mode Activated.")
                    end
                },
                {
                    Title = "No",
                    Callback = function()
                        print("Ego Mode Cancelled.")
                    end
                }
            }
        }
    end
}

Tabs.Tools:CreateToggle("EnableFocus", {
    Title = "Focus Mode",
    Default = false
}):OnChanged(function()
    print("Focus Mode:", Options.EnableFocus.Value)
end)

Tabs.Tools:CreateSlider("EgoLevel", {
    Title = "Ego Intensity",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(val)
        print("Ego Intensity set to:", val)
    end
})

Tabs.Settings:CreateInput("PlayerName", {
    Title = "Player Name",
    Default = "",
    Placeholder = "Enter your name",
    Callback = function(name)
        print("Player name set to:", name)
    end
})

InterfaceManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes{}
InterfaceManager:SetFolder("EgoDrive")
SaveManager:SetFolder("EgoDrive/Configs")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Library:Notify{
    Title = "Ego Drive",
    Content = "Loaded successfully.",
    Duration = 6
}

SaveManager:LoadAutoloadConfig()
            
    else
        statusLabel.Text = "Status: Key Invalid"
        statusLabel.TextColor3 = Color3.new(1, 0, 0)
    end
end)

-- Press Enter to submit
keyBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        submitButton:Activate()
    end
end)
