local awful     = require "awful"
local wibox     = require "wibox"
local beautiful = require "beautiful"

local M = {}

M.brightness_level, M.brightness_timer = awful.widget.watch(
    scripts .. "brightness",
    90,
    function(widget, stdout)
        widget:set_markup(stdout:gsub("\n", ""))
        widget.align = "center"
    end
)

M.brightness_widget = wibox.widget {
    {
        {
            {
                wibox.widget.textbox(" "),
                M.brightness_level,
                layout = wibox.layout.align.horizontal
            },
            left = 16,
            right = 16,
            widget = wibox.container.margin
        },
        bg = beautiful.bg,
        fg = beautiful.brightness_fg,
        shape = require "util.pill_shape",
        widget = wibox.container.background
    },
    top = 4,
    bottom = 4,
    widget = wibox.container.margin
}

M.brightness_widget.widget:connect_signal("mouse::enter", function(c)
    c:set_bg(beautiful.bg_light)
end)
M.brightness_widget.widget:connect_signal("mouse::leave", function(c)
    c:set_bg(beautiful.bg)
end)
M.brightness_widget.widget:connect_signal("button::press", function(_, _, _, button)
    if button == 1 then
        M.brightness_timer:emit_signal "timeout"
    end
end)

return M
