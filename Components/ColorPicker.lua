-- ColorPicker component for selecting colors
local ColorPicker = {}
ColorPicker.__index = ColorPicker

function ColorPicker.new(parent, position)
    local colorPicker = Instance.new("Frame")
    colorPicker.Size = UDim2.new(0.3, 0, 0.2, 0)
    colorPicker.Position = position
    colorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    colorPicker.BackgroundTransparency = 0.5
    colorPicker.Parent = parent

    return colorPicker
end

return ColorPicker