-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- Shapes and sepparators library
-- local pill = require("widgets.shapes").pill

-- Widgets

local poweroff = wibox.widget {
	{
		{
			text = "  ",
			valign = "center",
			align = "center",
			font = "SauceCodePro Nerd Font 12",
			widget = wibox.widget.textbox
		},
		left = 8,
		right = 20,
		widget = wibox.container.margin
	},
	fg = beautiful.accent,
	widget = wibox.container.background
}

poweroff:connect_signal("mouse::enter", function (c)
    c:set_fg(beautiful.white)
end)
poweroff:connect_signal("mouse::leave", function (c)
    c:set_fg(beautiful.accent)
end)
poweroff:connect_signal("button::press", function(c,_,_,button)
    -- if button == 1 then awful.util.spawn(util_dir .. [[prompt.sh "Do you want to shut down" "shutdown now"]]) end
    if button == 1 then awful.util.spawn(util_dir .. "logout.sh") end
end)

return poweroff
