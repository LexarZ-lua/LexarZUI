-- Signals component for event handling and listeners
local Signals = {}
Signals.__index = Signals

-- Create a new signal
function Signals.new()
    local self = setmetatable({}, Signals)
    self._listeners = {}
    return self
end

-- Connect a listener to the signal
function Signals:Connect(callback)
    table.insert(self._listeners, callback)
end

-- Fire the signal, calling all connected listeners
function Signals:Fire(...)
    for _, listener in ipairs(self._listeners) do
        listener(...)
    end
end

-- Disconnect a listener from the signal
function Signals:Disconnect(callback)
    for i, listener in ipairs(self._listeners) do
        if listener == callback then
            table.remove(self._listeners, i)
            break
        end
    end
end

return Signals