local awful         = require "awful"
local beautiful     = require "beautiful"

local M = {}

M.launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu  = require "menu".main_menu
})

return M
