local uiHandler = require "assets.lua.ui"

local pinnedX = 30
local pinnedY = 20
local offset = 20

local text1 = {
    text = "v-" .. VERSION, -- Game version
    x = pinnedX,
    y = pinnedY,
}
local text2 = {
    text =  _VERSION, -- Shows lua version
    x = pinnedX,
    y = pinnedY + (offset * 1),
}

local text3 = {
    text =  os.date("%Y-%m-%d"), -- Shows Date
    x = pinnedX,
    y = pinnedY + (offset * 2),
}

uiHandler.addUiobject({
    x = 100,
    y = 50,
    w = 100,
    h = 100,
    name = "Info",
    texts = {text1, text2, text3}
})