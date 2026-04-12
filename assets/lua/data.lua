local uiHandler = require "assets.lua.ui"

local data = {}

function data.Setup()
    data= {
        Money = 0,
        Flips = 0,
        Streak = 0,
    }

    return data
end

local function valueUpdate(name)
    if name == "Streak" then
        local element = uiHandler.Find("Streak")
        if element.texts then

            element.texts[1].text = PLAYER_DATA.Streak
        end
    end
end

function  data.UpdateValue(name, value)
    for i, _ in pairs(PLAYER_DATA) do
        if i == name then
            PLAYER_DATA[i] = value
            valueUpdate(i)
        end
    end
    
end

return data