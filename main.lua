-- Force terminal output for WSL
io.stdout:setvbuf("no")

-- Libraries
local push = require "push"
local moonshine = require "moonshine"

-- Ressulution
local VIRTUAL_WIDTH = 1280
local VIRTUAL_HEIGHT = 720

-- Window Size
local WINDOW_WIDTH = 1280
local WINDOW_HEIGHT = 720

-- Effect chain (will be initialized in love.load)
local effect

function love.load()
    love.graphics.setDefaultFilter('linear', 'linear')
    
    -- Initialize Push
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        pixelperfect = false,
        highdpi = true
    })

    -- Create effect chain using standard moonshine API
    effect = moonshine(moonshine.effects.crt)
                      .chain(moonshine.effects.vignette)
                        .chain(moonshine.effects.scanlines)
end

-- Window resizing automatically
function love.resize(w, h)
    push:resize(w, h)
end

function love.draw()
    push:start()

    -- Apply shaders and draw everything
    effect(function()
        love.graphics.clear(0.1, 0.1, 0.2) -- Dark blue background
        love.graphics.rectangle("fill", 10, 10, 50, 50)
        love.graphics.print("Scaling is now handled!", 70, 10)
    end)

    push:finish()
end