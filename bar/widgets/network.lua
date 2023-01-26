local awful     = require "awful"
local wibox     = require "wibox"
local beautiful = require "beautiful"

local M = {}

-- Network widget
M.network_name, M.network_timer = awful.widget.watch(
    [[bash -c 'iwgetid | grep -o \".*']],
    10,
    function(widget, stdout)
        widget:set_markup(stdout:gsub("\"", ""))

        if widget.text == "" then
            widget.text = "Disconnected"
        end

        widget.align = "center"
    end
)

M.network_widget = wibox.widget {
    {
        {
            {
                wibox.widget.textbox("  "),
                M.network_name,
                layout = wibox.layout.align.horizontal
            },
            left = 18,
            right = 24,
            widget = wibox.container.margin
        },
        bg = beautiful.bg,
        fg = beautiful.network_fg,
        shape = require "util.pill_shape",
        widget = wibox.container.background
    },
    top = 4,
    bottom = 4,
    widget = wibox.container.margin
}

M.network_widget.widget:connect_signal("mouse::enter", function(c)
    c:set_bg(beautiful.bg_light)
    M.network_timer:emit_signal "timeout"
end)

M.network_widget.widget:connect_signal("mouse::leave", function(c)
    c:set_bg(beautiful.bg)
end)

M.network_widget.widget:connect_signal("button::press", function(_, _, _, button)
    if button == 1 then
        awful.util.spawn "iwgtk"
        M.network_timer:emit_signal "timeout"
    end
end)

return M
