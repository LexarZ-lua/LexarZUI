-- Toggle component for enabling or disabling features
local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(parent, position, defaultState, callback)
    local toggle = Instance.new("Frame")
    toggle.Size = UDim2.new(0.3, 0, 0.2, 0)
    toggle.Position = position
    toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    toggle.BackgroundTransparency = 0.3
    toggle.Parent = parent

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.Text = defaultState and "ON" or "OFF"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Parent = toggle

    button.MouseButton1Click:Connect(function()
        defaultState = not defaultState
        button.Text = defaultState and "ON" or "OFF"
        callback(defaultState)
    end)

    return toggle
end

return Toggle