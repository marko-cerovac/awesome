local awful     = require "awful"
local wibox     = require "wibox"
local beautiful = require "beautiful"

local M = {}

M.create_layout_widget = function (s)
    s.layout_icon = awful.widget.layoutbox(s)

    s.layout_icon:buttons(gears.table.join(
        awful.button({ }, 1, function()
            awful.layout.inc(1)
        end),
        awful.button({ }, 3, function()
            awful.layout.inc(-1)
        end)
    ))

    s.layout_widget = wibox.container.margin(
        wibox.container.background(
            wibox.container.margin(s.layout_icon, 26, 26),
            beautiful.bg,
            require "util.pill_shape"
        ),
        8, 8, 4, 4
    )

    return s.layout_widget
end

return M
