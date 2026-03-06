-- Loader.lua
-- Bu loader, modülleri GitHub üzerinden raw olarak çeker ve çalıştırır.

local HttpService = game:GetService("HttpService")

-- ⭐ GitHub raw base URL
local BASE_URL = "https://raw.githubusercontent.com/LexarZ-lua/LexarZUI/main/"

-- Utility: GitHub’dan modül çek ve return et
local function import(path)
    -- Debug: Dosya çekilmeden önce konsola yazdır
    print("Çekilen dosya URL: " .. BASE_URL .. path)

    -- URL üzerinden dosyayı al
    local raw
    local success, errorMessage = pcall(function()
        raw = HttpService:GetAsync(BASE_URL .. path, true)
    end)

    -- Hata durumunda hata mesajını yazdır
    if not success then
        warn("Hata oluştu: " .. errorMessage)
        return nil
    end
    
    -- Debug: Dosya içeriğini konsola yazdır (isteğe bağlı)
    print("Dosya içeriği başarıyla alındı.")

    return loadstring(raw)()
end

-- Import modüller
print("Modüller yükleniyor...")

local Signals    = import("Utils/Signals.lua")
local Drag       = import("Utils/Drag.lua")

local Elements   = import("Core/Elements.lua")
local Animations = import("Core/Animations.lua")
local Tabs       = import("Core/Tabs.lua")
local Window     = import("Core/Window.lua")

local Button     = import("Components/Button.lua")
local Dropdown   = import("Components/Dropdown.lua")
local Keybind    = import("Components/Keybind.lua")
local Slider     = import("Components/Slider.lua")
local TextBox    = import("Components/TextBox.lua")
local Toggle     = import("Components/Toggle.lua")
local ColorPicker= import("Components/ColorPicker.lua") -- efekt için örnek

-- Create ScreenGui
print("ScreenGui oluşturuluyor...")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Window
print("Window oluşturuluyor...")
local window = Window.new(screenGui,
    UDim2.new(0.25, 0, 0.25, 0),
    UDim2.new(0.5, 0, 0.5, 0),
    "LexarZ UI"
)

-- Make window draggable
Drag:MakeDraggable(window.Window)

-- Create Tabs
print("Tabs oluşturuluyor...")
local tabs = Tabs.new(screenGui,
    UDim2.new(0.25, 0, 0.1, 0),
    {"Home","Settings","About"},
    function(name)
        print("Active Tab:", name)
    end
)

-- Example content for first tab
local tab1content = Instance.new("Frame")
tab1content.Size = UDim2.new(1,0,1,0)
tab1content.BackgroundTransparency = 1
window:SetContent(tab1content)

-- Example: Add UI elements
Button.new(tab1content, "Click Me", UDim2.new(0.1,0,0.2,0), UDim2.new(0,120,0,40), function()
    print("Button Pressed!")
end)

-- Dropdown example
Dropdown.new(tab1content, UDim2.new(0.1,0,0.4,0),
    {"Option A","Option B","Option C"},
    function(selected) print("Selected:", selected) end
)

-- Slider example
Slider.new(tab1content, UDim2.new(0.1,0,0.6,0),
    0,100,50, function(v) print("Slider:", v) end
)

-- Test TextBox
TextBox.new(tab1content, UDim2.new(0.1,0,0.8,0), "Enter text", function(text)
    print("Text entered:", text)
end)

-- Test Toggle
Toggle.new(tab1content, UDim2.new(0.1,0,1,0), true, function(state)
    print("Toggle state:", state)
end)

-- Final Debug Message
print("LexarZUI başarıyla yüklendi!")
