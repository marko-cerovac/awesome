-- Standard awesome library
-- local gears = require("gears")
-- local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

local Hello = wibox.widget {
	{
		{
			{
				text = "Hello World",
				valign = "center",
				align = "center",
				font = "SauceCodePro Nerd Font 12",
				widget = wibox.widget.textbox,
			},
			left = 20,
			right = 20,
			widget = wibox.container.margin
		},
		bg = beautiful.active,
		fg = beautiful.accent,
		shape = require("widgets.shapes").pill,
		widget = wibox.container.background
	},
	left = 34,
	right = 36,
	top = 2,
	bottom = 3,
	widget = wibox.container.margin
}

return Hello
