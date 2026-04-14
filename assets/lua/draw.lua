-- Modules
local Util = require "assets.lua.util"

local DrawHandler = {}
DrawHandler.active = {}
DrawHandler.cachedModules = {}


function DrawHandler.AddToDraw(moduleName)
    if not  Util.Contains(DrawHandler.active, moduleName) then
        table.insert(DrawHandler.active, moduleName)
    end
end

function DrawHandler.CacheModules()
    for i, v in ipairs(DrawHandler.active) do
            if v:match("%.lua$") then
            local moduleName = v:gsub("%.lua$", "")
            DrawHandler.cachedModules[moduleName] = require("assets.lua." .. moduleName)
        end
    end
end

function DrawHandler.SendDrawEvents()
    for moduleName, module in pairs(DrawHandler.cachedModules) do
        if module and module.Draw then
            module.Draw()
        end
    end
end

return DrawHandler