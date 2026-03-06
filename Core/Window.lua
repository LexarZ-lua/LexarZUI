-- Window component for managing the main window UI
local Window = {}
Window.__index = Window

function Window.new(parent, position, size, title)
    local window = Instance.new("Frame")
    window.Size = size
    window.Position = position
    window.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    window.BackgroundTransparency = 0.3
    window.Parent = parent
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0.1, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.Parent = window

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 24
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = titleBar
    
    -- Content Area
    local contentArea = Instance.new("Frame")
    contentArea.Size = UDim2.new(1, 0, 0.9, 0)
    contentArea.Position = UDim2.new(0, 0, 0.1, 0)
    contentArea.BackgroundTransparency = 0.7
    contentArea.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    contentArea.Parent = window

    -- Make window draggable
    local dragging = false
    local dragStart, startPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = window.Position
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if dragging then
            local delta = input.Position - dragStart
            window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return {
        Window = window,
        SetContent = function(self, content)
            content.Parent = contentArea
        end
    }
end

return Window