-- Slider component for adjusting values
local Slider = {}
Slider.__index = Slider

function Slider.new(parent, position, minValue, maxValue, defaultValue, callback)
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(0.3, 0, 0.2, 0)
    slider.Position = position
    slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    slider.BackgroundTransparency = 0.3
    slider.Parent = parent

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, 0, 0.2, 0)
    bar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    bar.Parent = slider
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0.1, 0, 1, 0)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Parent = bar

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(1, 0, 0.2, 0)
    valueLabel.Text = tostring(defaultValue)
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Parent = slider

    local function updateValue()
        local knobPos = knob.Position.X.Offset
        local value = math.floor((knobPos / bar.Size.X.Offset) * (maxValue - minValue) + minValue)
        valueLabel.Text = tostring(value)
        callback(value)
    end

    knob.MouseDrag:Connect(function(input)
        local offset = math.clamp(input.Position.X - bar.Position.X.Offset, 0, bar.Size.X.Offset - knob.Size.X.Offset)
        knob.Position = UDim2.new(0, offset, 0, 0)
        updateValue()
    end)
    
    return slider
end

return Slider