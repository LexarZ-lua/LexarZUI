-- Tween utility to manage animations for UI transitions
local Tween = {}

function Tween:CreateTween(obj, size, easingStyle, easingDirection, duration)
    obj:TweenSize(size, easingStyle, easingDirection, duration, true)
end

return Tween