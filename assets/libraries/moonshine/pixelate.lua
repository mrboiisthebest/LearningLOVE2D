local pixelEffect = require "assets.libraries.moonshine.effects.pixelate"

return function(moonshine)
    local effect = pixelEffect(moonshine)
    
    -- size: pixel block size {width, height}. Higher = less pixelation. Default: {5,5}
    -- feedback: 0-1 blend between pixelated and original. 0 = full pixelation. Default: 0
    effect.setters.size({0.75, 0.75})
    effect.setters.feedback(0)
    
    return effect
end