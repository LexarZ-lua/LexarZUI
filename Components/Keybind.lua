-- Keybind component for binding keys to actions
local Keybind = {}
Keybind.__index = Keybind

function Keybind.new(parent, position, defaultKey, callback)
    local keybind = Instance.new("Frame")
    keybind.Size = UDim2.new(0.3, 0, 0.2, 0)
    keybind.Position = position
    keybind.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    keybind.BackgroundTransparency = 0.3
    keybind.Parent = parent

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0.2, 0)
    button.Text = "Press a Key"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Parent = keybind

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0.8, 0)
    label.Position = UDim2.new(0, 0, 0.2, 0)
    label.Text = defaultKey
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.Parent = keybind
    
    button.MouseButton1Click:Connect(function()
        -- Wait for the user to press a key
        local userInputService = game:GetService("UserInputService")
        userInputService.InputBegan:Wait()
        local keyPressed = userInputService:GetLastInputType().KeyCode
        label.Text = keyPressed.Name
        callback(keyPressed)
    end)

    return keybind
end

return Keybind