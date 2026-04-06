local Modules = love.filesystem.getDirectoryItems("assets/lua")

local Loader = {}

function Loader.LoadModules()
    for i, filename in ipairs(Modules) do
        if filename ~= "loader.lua" and filename:match("%.lua$") then
            local moduleName = filename:gsub("%.lua$", "")
            local module = require("assets.lua." .. moduleName)
            if module and module.Init then
                module.Init()
            end
        end
    end
end


return Loader