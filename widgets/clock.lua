-- Widget and layout library
local wibox = require("wibox")
-- local awful = require("awful")

-- Themes library
local beautiful = require("beautiful")

-- Shapes and sepparators library
local powerArrow = require("widgets.sepparators").powerArrow

-- Create a textclock widget
local textclock = wibox.widget {
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
        right = 20,
        widget = wibox.container.margin
    },
    fg = beautiful.white,
    bg = beautiful.bg_alt,
    shape = powerArrow,
    widget = wibox.container.background
}

-- local clockTooltip = awful.tooltip {}
-- clockTooltip:add_to_object(textclock)

textclock:connect_signal("mouse::enter", function (c)
	c:set_bg(beautiful.active)
    -- clockTooltip.text = os.date("Today is %A %B %d %Y\nThe time is %T")
end)
textclock:connect_signal("mouse::leave", function (c)
	c:set_bg(beautiful.bg_alt)
end)

return textclock
