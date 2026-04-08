local Modules = love.filesystem.getDirectoryItems("assets/lua")
local UiElements = love.filesystem.getDirectoryItems("assets/ui")

local Loader = {}

function Loader.LoadModules()
    for i, filename in ipairs(Modules) do
        if filename ~= "loader.lua" and filename:match("%.lua$") then
            local moduleName = filename:gsub("%.lua$", "")
            local module = require("assets.lua." .. moduleName)
            if module and module.Init then
                module.Init()
                print("Loaded " .. filename.. "'s Init")
            end
        end
    end
end

function Loader.LoadUi(path)
    local items = love.filesystem.getDirectoryItems(path)
    
    for i, item in ipairs(items) do
        local fullPath = path .. "/" .. item
        local info = love.filesystem.getInfo(fullPath)
        
        if info and info.type == "directory" then
            Loader.LoadUi(fullPath)  -- Recurse
        elseif info and info.type == "file" and string.sub(item, -4) == ".lua" then
            require(fullPath:gsub("/", "."):gsub(".lua", ""))
        end
    end
end


return Loader