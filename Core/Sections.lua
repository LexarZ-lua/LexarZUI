-- Manage sections in the UI (e.g., settings, themes)
local Sections = {}

function Sections:CreateSection(parent, title, position, size)
    local section = Instance.new("Frame")
    section.Size = size
    section.Position = position
    section.BackgroundTransparency = 0.5
    section.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    section.Parent = parent

    local label = Instance.new("TextLabel")
    label.Text = title
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Parent = section

    return section
end

return Sections