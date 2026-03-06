-- UI elements manager (buttons, textboxes, etc)
local Elements = {}

function Elements:CreateButton(parent, text, position, size, callback)
    local Button = require(game.ServerScriptService.LexarUI.Components.Button)
    return Button.new(parent, text, position, size, callback)
end

return Elements