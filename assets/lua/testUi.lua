local drawModule = require "assets.lua.draw"
local test = {}

function test.Init()
    print("Loaded Test Module")
    drawModule.AddToDraw("testUi.lua")
end

function test.Draw()
        love.graphics.clear(0.1, 0.1, 0.2) -- Dark blue background
        love.graphics.rectangle("fill", 10, 10, 50, 50)
        love.graphics.print("Ui Now Works!", 70, 10)
end

return test