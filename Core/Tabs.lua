-- Tabs component for managing tabbed navigation
local Tabs = {}
Tabs.__index = Tabs

function Tabs.new(parent, position, tabs, callback)
    local tabsFrame = Instance.new("Frame")
    tabsFrame.Size = UDim2.new(1, 0, 0.3, 0)
    tabsFrame.Position = position
    tabsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabsFrame.BackgroundTransparency = 0.3
    tabsFrame.Parent = parent
    
    local tabButtonsFrame = Instance.new("Frame")
    tabButtonsFrame.Size = UDim2.new(1, 0, 0.2, 0)
    tabButtonsFrame.BackgroundTransparency = 1
    tabButtonsFrame.Parent = tabsFrame
    
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 0.8, 0)
    contentFrame.Position = UDim2.new(0, 0, 0.2, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = tabsFrame

    local tabButtons = {}
    for i, tabName in ipairs(tabs) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1 / #tabs, 0, 1, 0)
        button.Position = UDim2.new((i - 1) / #tabs, 0, 0, 0)
        button.Text = tabName
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        button.Parent = tabButtonsFrame

        button.MouseButton1Click:Connect(function()
            callback(tabName)
            for _, btn in ipairs(tabButtons) do
                btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        end)

        table.insert(tabButtons, button)
    end

    return {
        Frame = tabsFrame,
        SetActiveTab = function(self, tabName)
            for i, button in ipairs(tabButtons) do
                if button.Text == tabName then
                    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    callback(tabName)
                else
                    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                end
            end
        end
    }
end

return Tabs