-- UI elements manager (buttons, textboxes, etc)

local Elements = {}
Elements.__index = Elements

function Elements:CreateButton(parent, text, position, size, callback)
    local Button = loadstring(game:HttpGet("https://raw.githubusercontent.com/LexarZ-lua/LexarZUI/main/Components/Button.lua"))()
    return Button.new(parent, text, position, size, callback)
end

function Elements:CreateDropdown(parent, position, options, callback)
    local Dropdown = loadstring(game:HttpGet("https://raw.githubusercontent.com/LexarZ-lua/LexarZUI/main/Components/Dropdown.lua"))()
    return Dropdown.new(parent, position, options, callback)
end

function Elements:CreateKeybind(parent, position, defaultKey, callback)
    local Keybind = loadstring(game:HttpGet("https://raw.githubusercontent.com/LexarZ-lua/LexarZUI/main/Components/Keybind.lua"))()
    return Keybind.new(parent, position, defaultKey, callback)
end

function Elements:CreateSlider(parent, position, minValue, maxValue, defaultValue, callback)
    local Slider = loadstring(game:HttpGet("https://raw.githubusercontent.com/LexarZ-lua/LexarZUI/main/Components/Slider.lua"))()
    return Slider.new(parent, position, minValue, maxValue, defaultValue, callback)
end

function Elements:CreateTextBox(parent, position, defaultText, callback)
    local TextBox = loadstring(game:HttpGet("https://raw.githubusercontent.com/LexarZ-lua/LexarZUI/main/Components/TextBox.lua"))()
    return TextBox.new(parent, position, defaultText, callback)
end

function Elements:CreateToggle(parent, position, defaultState, callback)
    local Toggle = loadstring(game:HttpGet("https://raw.githubusercontent.com/LexarZ-lua/LexarZUI/main/Components/Toggle.lua"))()
    return Toggle.new(parent, position, defaultState, callback)
end

function Elements:CreateColorPicker(parent, position)
    local ColorPicker = loadstring(game:HttpGet("https://raw.githubusercontent.com/LexarZ-lua/LexarZUI/main/Components/ColorPicker.lua"))()
    return ColorPicker.new(parent, position)
end

return Elements
