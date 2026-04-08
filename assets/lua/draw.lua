-- Modules
local Util = require "assets.lua.util"

local DrawHandler = {}
DrawHandler.active = {}


function DrawHandler.AddToDraw(moduleName)
    if not  Util.Contains(DrawHandler.active, moduleName) then
        table.insert(DrawHandler.active, moduleName)
    end
end

function DrawHandler.SendDrawEvents()
        for i, filename in ipairs(DrawHandler.active) do
        if  filename:match("%.lua$") then
            local moduleName = filename:gsub("%.lua$", "")
            local module = require("assets.lua." .. moduleName)
            if module and module.Draw then
                module.Draw()
            end
        end
    end
    
end

return DrawHandler