-- Main script to initialize LexarUI with all components

-- Import required modules
local Signals = require(game.ServerScriptService.LexarUI.Utils.Signals)
local Elements = require(game.ServerScriptService.LexarUI.Core.Elements)
local Animations = require(game.ServerScriptService.LexarUI.Core.Animations)
local Drag = require(game.ServerScriptService.LexarUI.Utils.Drag)
local Tabs = require(game.ServerScriptService.LexarUI.Core.Tabs)
local Window = require(game.ServerScriptService.LexarUI.Core.Window)
local Button = require(game.ServerScriptService.LexarUI.Components.Button)
local ColorPicker = require(game.ServerScriptService.LexarUI.Components.ColorPicker)
local Dropdown = require(game.ServerScriptService.LexarUI.Components.Dropdown)
local Keybind = require(game.ServerScriptService.LexarUI.Components.Keybind)
local Slider = require(game.ServerScriptService.LexarUI.Components.Slider)
local TextBox = require(game.ServerScriptService.LexarUI.Components.TextBox)
local Toggle = require(game.ServerScriptService.LexarUI.Components.Toggle)

-- Create the main screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the main window
local window = Window.new(screenGui, UDim2.new(0.25, 0, 0.25, 0), UDim2.new(0.5, 0, 0.5, 0), "Main Window")

-- Create Tabs
local tabs = Tabs.new(screenGui, UDim2.new(0.25, 0, 0.1, 0), {"Tab 1", "Tab 2", "Tab 3"}, function(selectedTab)
    print("Tab changed to: " .. selectedTab)
end)

-- Set Content for Tab 1
local tab1Content = Instance.new("TextLabel")
tab1Content.Size = UDim2.new(1, 0, 1, 0)
tab1Content.Text = "This is the content for Tab 1"
tab1Content.TextColor3 = Color3.fromRGB(255, 255, 255)
tab1Content.BackgroundTransparency = 1
tabs:SetActiveTab("Tab 1")
window:SetContent(tab1Content)

-- Set Content for Tab 2
local tab2Content = Instance.new("TextLabel")
tab2Content.Size = UDim2.new(1, 0, 1, 0)
tab2Content.Text = "This is the content for Tab 2"
tab2Content.TextColor3 = Color3.fromRGB(255, 255, 255)
tab2Content.BackgroundTransparency = 1
window:SetContent(tab2Content)

-- Create Dropdown
Dropdown.new(screenGui, UDim2.new(0.5, -150, 0.5, -100), {"Option 1", "Option 2", "Option 3"}, function(selected)
    print("Selected: " .. selected)
end)

-- Create Keybind
Keybind.new(screenGui, UDim2.new(0.5, -150, 0.5, 50), "F", function(key)
    print("Key pressed: " .. key.Name)
end)

-- Create Slider
Slider.new(screenGui, UDim2.new(0.5, -150, 0.5, 150), 0, 100, 50, function(value)
    print("Slider value: " .. value)
end)

-- Create TextBox
TextBox.new(screenGui, UDim2.new(0.5, -150, 0.5, 250), "Enter text", function(text)
    print("Text entered: " .. text)
end)

-- Create Toggle
Toggle.new(screenGui, UDim2.new(0.5, -150, 0.5, 350), true, function(state)
    print("Toggle state: " .. (state and "ON" or "OFF"))
end)

-- Create Signal for Button Click
local buttonClickedSignal = Signals.new()

-- Connect a listener to the signal
buttonClickedSignal:Connect(function()
    print("Button was clicked!")
end)

-- Create a Button that triggers the signal when clicked
Elements:CreateButton(screenGui, "Click Me", UDim2.new(0.5, -50, 0.8, 0), UDim2.new(0, 100, 0, 50), function()
    -- Fire the signal when the button is clicked
    buttonClickedSignal:Fire()
end)

-- Make window draggable
Drag:MakeDraggable(window.Window)

-- Add some animations
local button = Elements:CreateButton(screenGui, "Animated Button", UDim2.new(0.5, -50, 0.6, 0), UDim2.new(0, 100, 0, 50), function()
    print("Animated Button clicked!")
end)
Animations:TweenSize(button, UDim2.new(0.5, 0, 0.5, 0), "Out", "Quad", 0.5)