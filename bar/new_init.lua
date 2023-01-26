local awful     = require "awful"
local wibox     = require "wibox"
local widgets   = require "widgets"
local beautiful = require "beautiful"

local M = {}

M.create_wibar = function (screen)
    screen.wibar = awful.wibar({
        position = "top",
        screen = screen,
        bg = beautiful.bg,
        height = 36,
        shape = widgets.shapes.pill,
        border_width = 6,
    })

    screen.wibar:setup({
        layout = wibox.layout.align.horizontal,
        { -- left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 6,
            widgets.oslogo,
            widgets.layout.create_layout_widget(screen),
        },
        widgets.layout.create_layout_widget(screen),
        { -- right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 12,
            widgets.volume.volume_widget,
            widgets.brightness.brightness_widget,
            widgets.battery.battery_widget,
            widgets.network.network_widget,
            widgets.kb_layout,
            widgets.clock,
            -- widgets.logout,
        }
    })
end

return M
