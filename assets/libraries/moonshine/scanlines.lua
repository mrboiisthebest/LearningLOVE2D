local scanlinesEffect = require "assets.libraries.moonshine.effects.scanlines"

return function(moonshine)
    local effect = scanlinesEffect(moonshine)
    
    -- Set custom defaults here
    effect.width = 4
    effect.thickness = 1.5
    effect.opacity = 0.05
    effect.color = {255, 255, 255}
    
    return effect
end