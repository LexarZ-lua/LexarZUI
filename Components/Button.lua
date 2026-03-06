-- Button component for creating buttons in the UI
local Button = {}
Button.__index = Button

function Button.new(parent, text, position, size, callback)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.BackgroundTransparency = 0.3
    button.Parent = parent

    button.MouseButton1Click:Connect(callback)
    return button
end

return Button