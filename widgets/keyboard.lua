-- Standard awesome library
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- Shapes and sepparators library
local pill = require("widgets.shapes").pill

-- Keyboard map indicator and switcher
local keyboardlayout = wibox.widget {
	{
		{
			{
				layout = wibox.layout.fixed.horizontal,
				-- wibox.widget.textbox(" "),
				wibox.widget.textbox(" "),
				awful.widget.keyboardlayout()
			},
			left = 20,
			right = 12,
			widget = wibox.container.margin
		},
		fg = beautiful.keyboard_fg,
		bg = beautiful.bg,
		shape = pill,
		widget = wibox.container.background
	},
	top = 4,
	bottom = 4,
	widget = wibox.container.margin
}

keyboardlayout.widget:connect_signal("mouse::enter", function (c)
	c:set_bg(beautiful.bg_light)
end)
keyboardlayout.widget:connect_signal("mouse::leave", function (c)
	c:set_bg(beautiful.bg)
end)

keyboardlayout.widget.widget:connect_signal("button::press", function (c,_,_,button)
    if button == 1 then awful.util.spawn(util_dir .. "kbdswitch.sh") end
end)

return keyboardlayout
