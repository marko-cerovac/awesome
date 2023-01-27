local awful         = require "awful"
local beautiful     = require "beautiful"
local hotkeys_popup = require "awful.hotkeys_popup"

local M = {}

local awesome_menu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

M.main_menu = awful.menu({
    items = {
        { "awesome", awesome_menu, beautiful.awesome_icon },
        { "open terminal", terminal },
    }
})

M.launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu  = M.main_menu
})

return M
