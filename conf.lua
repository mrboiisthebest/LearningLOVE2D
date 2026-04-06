function love.conf(t)
    t.identity = "LearningLOVE2D"    -- The name of the save folder in ~/.local/share/love/
    t.version = "11.5"               -- Ensures you're using the right LÖVE version
    
    -- IMPORTANT FOR WSL:
    -- On Windows, t.console = true opens a CMD window.
    -- In WSL, this does nothing. Always use io.stdout:setvbuf("no") 
    -- at the top of main.lua instead to see your prints!
    t.console = false 

    -- Configs
    t.window.title = "Learning Love2d"    -- The title at the top of the window
    t.window.width = 1280             -- Standard 720p width
    t.window.height = 720             -- Standard 720p height
    t.window.resizable = true         -- Let users resize the window
    t.window.minwidth = 800           -- Don't let it get too tiny
    t.window.minheight = 600
    t.window.vsync = 1                -- 1 = On, 0 = Off. Keeps movement smooth
    t.window.highdpi = true
    t.window.msaa = 2 -- This makes rotated objects look MUCH smoother

    -- Unused Modules of Love2d
    t.modules.physics = false         -- Only enable if using love.physics
    t.modules.joystick = true         -- Keep true if you want controller support
    t.modules.touch = false           -- Usually false for desktop games
end