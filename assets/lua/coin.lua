local uiHandler = require "assets.lua.ui"
local flux = require "assets.libraries.flux.flux"


local Flip_Duration = 1 -- seconds


local coin = {}
coin.Coins = {}

local __index = coin

function coin.Init()
    CURRENT_COIN = coin.Create({
    Value = 0.25,
    Sprite = nil,
    Multi = 1,
    Chance = 50,
    UiElement = uiHandler.Find("Coin"),
    Name = "Quater"
    })
end


function coin.Create(config)
    local data = setmetatable({}, {__index = __index})

    data.Value = config.Value or 0.25
    data.Sprite = config.Sprite or nil -- will add default sprite
    data.Multi = config.Multi or 1
    data.Chance = config.Chance or 50 -- Used out of 100 for heads 
    data.UiElement = config.UiElement or uiHandler.Find("Coin")
    data.Name = config.Name or nil

    table.insert(coin.Coins, data)
    return data
end

function coin.SetAsActive(coin)
    CURRENT_COIN = coin
end

function coin.Update(dt)
       for _, v in ipairs(coin.Coins) do
        if v.Name == CURRENT_COIN.Name then
            -- Decrease cooldown
            if v.flipCooldown and v.flipCooldown > 0 then
                v.flipCooldown = v.flipCooldown - dt
            end
        end
    end
end

function coin:Flip()
    local rolled = math.random(0, 100)
    local Heads = rolled <= self.Chance

    if self.flipCooldown and self.flipCooldown > 0 then
        return  
    end

    local element = uiHandler.Find("Coin")
    if element then
        -- Smooth up movement
        flux.to(element, (Flip_Duration / 2), {y = element.y - 100})
            :ease("quadout")
            :oncomplete(function()
                -- Smooth down movement
                flux.to(element, (Flip_Duration / 2), {y = element.y + 100})
                    :ease("quadin")
            end)
    end
    self.flipCooldown = Flip_Duration + 0.05
end

return coin