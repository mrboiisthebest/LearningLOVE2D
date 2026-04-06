local crtEffect = require "moonshine.effects.crt"

return function(moonshine)
    local effect = crtEffect(moonshine)
    
    -- Set custom defaults here
    effect.distortionFactor = {1.02, 1.02}
    effect.feather = 0.05
    effect.scaleFactor = 0.96
    
    return effect
end