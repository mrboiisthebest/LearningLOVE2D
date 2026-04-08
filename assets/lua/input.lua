local Input = {}


function Input.Keypressed(key)
    print(key)
end

function Input.MousePressed(x, y, button) -- 1 = left click 2 = right click
    if button == 1 then
        local items, len = world:queryPoint(x, y)
        if len > 0 then
            local clickedElement = items[1]
            print("Clicked:", clickedElement.name)
            
            -- Call onClick callback if it exists
            if clickedElement.onClick then
                clickedElement.onClick(clickedElement)
            end
        end
    end
end

return Input