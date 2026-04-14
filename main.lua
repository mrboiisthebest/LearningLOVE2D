-- Force terminal output for WSL
io.stdout:setvbuf("no")

-- Modules
local push = require "assets.libraries.push"
local moonshine = require "assets.libraries.moonshine"
local bump = require "assets.libraries.bump.bump"
local flux = require "assets.libraries.flux.flux"

local loader = require "assets.lua.loader"
local drawHandler = require "assets.lua.draw"
local inputHandler = require "assets.lua.input"
local uiHandler = require "assets.lua.ui"
local coin = require "assets.lua.coin"
local data = require "assets.lua.data"

-- Ressulution
local VIRTUAL_WIDTH = 1280
local VIRTUAL_HEIGHT = 720

-- Window Size
local WINDOW_WIDTH = 1280
local WINDOW_HEIGHT = 720

-- Globals
world = bump.newWorld(50)
VERSION = "0.0.10"
PLAYER_DATA = data.Setup()


-- Effect chain (will be initialized in love.load)
local effect

function love.load()
    loader.LoadUi("assets/ui")
    loader.LoadModules()
    drawHandler.CacheModules()

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
                    .chain(moonshine.effects.pixelate)
end

-- Window resizing automatically
function love.resize(w, h)
    push:resize(w, h)
end

function love.draw()
    push:start()

    -- Apply shaders and draw everything
    effect(function()
        drawHandler.SendDrawEvents()
    end)

    push:finish()
end

function love.update(dt)

   flux.update(dt)
   coin.Update(dt)
end


function love.keypressed(key)
    inputHandler.Keypressed(key)
end

function love.mousepressed(x, y, button)
    inputHandler.MousePressed(x, y, button)
end