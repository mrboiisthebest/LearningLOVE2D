local uiHandler = require "assets.lua.ui"


local text1 = {
    text = PLAYER_DATA.Streak,
    x = 800,
    y = 650
}

uiHandler.addUiobject({
    x = -1000,
    y = 0,
    w = 100,
    h = 100,
    name = "Streak",
    texts = {text1}
})
