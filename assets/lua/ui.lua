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
        state = "idle",
    }

    world:add(element, element.x, element.y, element.w, element.h)

    table.insert(uiHandler.Elements, element)

    return element
end

function uiHandler.Draw()
    for i, element in ipairs(uiHandler.Elements) do
        if element.sprite == nil then
            love.graphics.setColor(0.2, 0.2, 0.8)
            love.graphics.rectangle("fill", element.x, element.y, element.w, element.h)
        else
        love.graphics.draw(element.sprite, element.x, element.y)
        end
        if element.texts then
              love.graphics.setColor(1, 1, 1)
              for i, v in ipairs(element.texts) do
                love.graphics.print(v.text, v.x, v.y)
              end

        end
    end
end


return uiHandler