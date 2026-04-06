function love.SOMETHING

these are importan and heres afew of them
(need to google them? Serach for love Callbacks)

# LÖVE2D Essential Callbacks Cheat Sheet

## The Big Three (The Game Loop)


* **`love.load()`** Runs **once** at the very start. Use this to load images, sounds, and set your starting variables.
* **`love.update(dt)`** Runs **constantly** (60+ times per second). This is for "thinking"—moving players, calculating physics, and timers. `dt` is "delta time" (the time since the last frame).
* **`love.draw()`** Runs **constantly** (right after update). This is for "showing"—drawing images, text, and shapes.  
    > **Note:** Only drawing functions should go here; don't put heavy math or logic in this function!

---

## Input Callbacks (Reacting to the User)
* **`love.keypressed(key)`** Runs once the **instant** a key is pressed. Perfect for things like jumping or opening a menu.
* **`love.keyreleased(key)`** Runs the instant a user lets go of a key.
* **`love.mousepressed(x, y, button)`** Runs when a mouse button is clicked. It tells you exactly where the mouse was (`x, y`) and which button was used.
* **`love.wheelmoved(x, y)`** Used for detecting the mouse scroll wheel movement.

---

## System Callbacks
* **`love.conf(t)`** Used in a special file called `conf.lua`. This is where you set the window size, title, and if the game is fullscreen.
* **`love.quit()`** Runs right before the game closes. You can use this to save the player's progress automatically.
* **`love.focus(f)`** Runs when the user clicks away from the window or clicks back into it (good for auto-pausing).
