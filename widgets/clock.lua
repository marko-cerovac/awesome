-- Widget and layout library
local wibox = require("wibox")
local gears = require("gears")
-- local awful = require("awful")

-- Themes library
local beautiful = require("beautiful")

-- Create a textclock widget
local textclock = wibox.widget {
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
		shape = gears.shape.rounded_bar,
		widget = wibox.container.background
	},
	top = 4,
	bottom = 4,
	widget = wibox.container.margin
}

-- local clockTooltip = awful.tooltip {}
-- clockTooltip:add_to_object(textclock)

textclock.widget:connect_signal("mouse::enter", function (c)
	c:set_bg(beautiful.bg_light)
    -- clockTooltip.text = os.date("Today is %A %B %d %Y\nThe time is %T")
end)
textclock.widget:connect_signal("mouse::leave", function (c)
	c:set_bg(beautiful.bg)
end)

return textclock
