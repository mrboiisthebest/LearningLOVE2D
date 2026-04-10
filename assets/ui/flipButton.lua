local uiHandler = require "assets.lua.ui"

local function onClcik(element)
    CURRENT_COIN:Flip()
end

local text1 = {
    text = "FLIP COIN",
    x = 400,
    y = 100,
}

uiHandler.addUiobject({
    x = 400,
    y = 100,
    w = 100,
    h = 50,
    name = "PlayButton",
    onClick = onClcik,
    texts = {text1}
})


