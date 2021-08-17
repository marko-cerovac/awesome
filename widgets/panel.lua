-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Widgets
-- local widgets = require("widgets")

-- Themes library
local beautiful = require("beautiful")

local Panel = {}

Panel.panel = awful.popup {
	widget = {
		{
			{
				text = "Hello World",
				widget = wibox.widget.textbox
			},
			{
				{
					text = "Another hello world",
					widget = wibox.widget.textbox
				},
				bg = beautiful.red,
				clip = true,
				shape = gears.shape.rounded_bar,
				widget = wibox.widget.background
			},
			{
				value = 0.5,
				forced_width = 100,
				forced_height = 30,
				widget = wibox.widget.progressbar
			},
			layout = wibox.layout.fixed.vertical,
		},
		margins = 10,
		widget = wibox.container.margin
	},
	border_color = beautiful.accent,
	border_width = 3,
	placement = awful.placement.top_left,
	shape = gears.shape.rounded_rect,
	visible = true
}

return Panel
