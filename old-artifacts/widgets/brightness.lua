-- Standard awesome library
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- Shapes and sepparators library
-- local powerArrow = require("widgets.sepparators").powerArrow

local pill = require("widgets.shapes").pill

local Brightness = {}

-- Brightness timer
Brightness.brightnessLevel, Brightness.brightnessTimer = awful.widget.watch(
    util_dir .. 'brightness',
    60,
    function(widget, stdout)
        widget:set_markup(stdout:gsub("\n", ""))
        widget.align = "center"
    end)

-- Brightness widget
Brightness.brightness = wibox.widget {
	{
		{
			{
				-- wibox.widget.textbox(" "),
				wibox.widget.textbox(" "),
				Brightness.brightnessLevel,
				layout = wibox.layout.align.horizontal
			},
			left = 16,
			right = 16,
			widget = wibox.container.margin
		},
		bg = beautiful.bg,
		fg = beautiful.brightness_fg,
		shape = pill,
		widget = wibox.container.background
	},
	top = 4,
	bottom = 4,
	widget = wibox.container.margin
}

Brightness.brightness.widget:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.highlight)
end)
Brightness.brightness.widget:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.bg)
end)
Brightness.brightness.widget:connect_signal("button::press", function(c,_,_,button)
        if button == 1 then
            Brightness.brightnessTimer:emit_signal("timeout")
    end
end)

return Brightness
