local uiHandler = require "assets.lua.ui"

local coin = {}
coin.Coins = {}

local __index = coin

function coin.Init()
    CURRENT_COIN = coin.Create({
    Value = 0.25,
    Sprite = nil,
    Multi = 1,
    Chance = 50,
    UiElement = uiHandler.Find("Coin")
    })
end


function coin.Create(config)
    local data = setmetatable({}, {__index = __index})

    data.Value = config.Value or 0.25
    data.Sprite = config.Sprite or nil -- will add default sprite
    data.Multi = config.Multi or 1
    data.Chance = config.Chance or 50 -- Used out of 100 for heads 
    data.UiElement = config.UiElement or uiHandler.Find("Coin")

    table.insert(coin.Coins, data)
    return data
end

function coin:Flip()
    local rolled = math.random(0, 100)
    local Heads = rolled <= self.Chance
    
    

end

return coin