-- Dropdown component for selecting from a list of options
local Dropdown = {}
Dropdown.__index = Dropdown

function Dropdown.new(parent, position, options, callback)
    local dropdown = Instance.new("Frame")
    dropdown.Size = UDim2.new(0.3, 0, 0.2, 0)
    dropdown.Position = position
    dropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    dropdown.BackgroundTransparency = 0.3
    dropdown.Parent = parent
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0.2, 0)
    button.Text = "Select an Option"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Parent = dropdown
    
    local optionsFrame = Instance.new("Frame")
    optionsFrame.Size = UDim2.new(1, 0, 1, 0)
    optionsFrame.Position = UDim2.new(0, 0, 0.2, 0)
    optionsFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    optionsFrame.BackgroundTransparency = 0.5
    optionsFrame.Visible = false
    optionsFrame.Parent = dropdown
    
    -- Add options to dropdown
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Size = UDim2.new(1, 0, 0.2, 0)
        optionButton.Text = option
        optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        optionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        optionButton.Position = UDim2.new(0, 0, (i - 1) * 0.2, 0)
        optionButton.Parent = optionsFrame

        optionButton.MouseButton1Click:Connect(function()
            button.Text = option
            optionsFrame.Visible = false
            callback(option)
        end)
    end
    
    -- Toggle the options visibility
    button.MouseButton1Click:Connect(function()
        optionsFrame.Visible = not optionsFrame.Visible
    end)
    
    return dropdown
end

return Dropdown