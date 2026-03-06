-- TextBox component for user input
local TextBox = {}
TextBox.__index = TextBox

function TextBox.new(parent, position, defaultText, callback)
    local textBox = Instance.new("Frame")
    textBox.Size = UDim2.new(0.3, 0, 0.2, 0)
    textBox.Position = position
    textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    textBox.BackgroundTransparency = 0.3
    textBox.Parent = parent

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, 0, 1, 0)
    input.Text = defaultText
    input.TextColor3 = Color3.fromRGB(255, 255, 255)
    input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    input.Parent = textBox

    input.FocusLost:Connect(function()
        callback(input.Text)
    end)

    return textBox
end

return TextBox