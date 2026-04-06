local vignetteEffect = require "moonshine.effects.vignette"

return function(moonshine)
    local effect = vignetteEffect(moonshine)
    
    -- Set custom defaults here
    effect.radius = 0.7
    effect.softness = 0.6
    effect.opacity = 0.4
    effect.color = {0, 0, 0}
    
    return effect
end