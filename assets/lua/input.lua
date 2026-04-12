local push = require "assets.libraries.push"


local Input = {}


function Input.Keypressed(key)
    
end

function Input.MousePressed(x, y, button)
    if button == 1 then
        -- Convert window coordinates to virtual screen coordinates
        -- This depends on your push setup
        local virtualX, virtualY = push:toGame(x, y)
        
        -- Query with the converted coordinates
        local items, len = world:queryPoint(virtualX, virtualY)
        if len > 0 then
            local clickedElement = items[1]
            if clickedElement.onClick then
                clickedElement.onClick(clickedElement)
            end
        end
    end
end

return Input