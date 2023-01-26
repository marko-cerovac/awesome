local wibox     = require "wibox"
local beautiful = require "beautiful"

-- Create a textclock widget
local clock_widget = wibox.widget {
    {
        {
            {
                {
                    text = " ",
                    widget = wibox.widget.textbox
                },
                {
                    widget = wibox.widget.textclock
                },
                widget = wibox.layout.fixed.horizontal
            },
            left = 20,
            right = 12,
            widget = wibox.container.margin
        },
        fg = beautiful.clock_fg,
        bg = beautiful.bg,
        shape = require "util.pill_shape",
        widget = wibox.container.background
    },
    top = 4,
    bottom = 4,
    widget = wibox.container.margin
}

--[[ local clockTooltip = awful.tooltip {}
clockTooltip:add_to_object(clock_widget) ]]

clock_widget.widget:connect_signal("mouse::enter", function(c)
    c:set_bg(beautiful.bg_light)
    -- clockTooltip.text = os.date("Today is %A %B %d %Y\nThe time is %T")
end)
clock_widget.widget:connect_signal("mouse::leave", function(c)
    c:set_bg(beautiful.bg)
end)

return clock_widget
