local drawHandler = require "assets.lua.draw"

local uiHandler = {}
uiHandler.Elements = {}

function uiHandler.Init()
    drawHandler.AddToDraw("ui.lua")
end

function uiHandler.addUiobject(config)
    local element = {
        x = config.x,
        y = config.y,
        w = config.w,
        h = config.h,
        name = config.name,
        sprite = config.sprite or nil,
        texts = config.texts,
        onClick = config.onClick,
        state = config.state or "idle",
        rotation = config.rotation or 0
    }

    world:add(element, element.x, element.y, element.w, element.h)

    table.insert(uiHandler.Elements, element)

    return element
end

function uiHandler.Draw()
    for _, element in ipairs(uiHandler.Elements) do
        local rotation = element.rotation or 0
        local ox = element.w / 2
        local oy = element.h / 2
        
        if element.sprite == nil then
            love.graphics.setColor(0.2, 0.2, 0.8)
            love.graphics.push()
            love.graphics.translate(element.x + ox, element.y + oy)
            love.graphics.rotate(rotation)
            love.graphics.rectangle("fill", -ox, -oy, element.w, element.h)
            love.graphics.pop()
        else
            local scaleX = element.w / element.sprite:getWidth()
            local scaleY = element.h / element.sprite:getHeight()
            local imageOx = element.sprite:getWidth() / 2
            local imageOy = element.sprite:getHeight() / 2
            love.graphics.draw(element.sprite, element.x + ox, element.y + oy, rotation, scaleX, scaleY, imageOx, imageOy)
        end
        if element.texts then
            love.graphics.setColor(1, 1, 1)
            for i, v in ipairs(element.texts) do
                love.graphics.print(v.text, v.x, v.y)
            end
        end
    end
end



function uiHandler.Find(name)
    for i, v in ipairs(uiHandler.Elements) do
        if v.name == name then
            return uiHandler.Elements[i]
        end

    end
end

function uiHandler.Rotate(name, degree)
    local Element = uiHandler.Find(name)
    if Element then
        Element.rotation = math.rad(degree)
    end
end


return uiHandler