-- Animations system for UI transitions
local Animations = {}

function Animations:TweenSize(obj, size, easingStyle, easingDirection, duration)
    obj:TweenSize(size, easingStyle, easingDirection, duration, true)
end

return Animations