local gears  = require "gears"
local awful  = require "awful"
local popup  = require "awful.hotkeys_popup"
local modkey = "Mod4"

local M = {}

M.create = function(global_keys)
    global_keys = gears.table.join(global_keys,
        awful.key({ modkey, }, "s", popup.show_help,
            { description = "show help", group = "awesome" })
    )
end

return M
