local uiHandler = require "assets.lua.ui"

local text1 = {
    text = "v-0.0.3",
    x = 70,
    y = 50,
}

uiHandler.addUiobject({
    x = 100,
    y = 50,
    w = 100,
    h = 100,
    name = "Info",
    texts = {text1}
})