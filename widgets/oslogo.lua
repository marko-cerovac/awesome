-- Standard awesome library
-- local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- OS logo
local OSlogo = wibox.widget {
	{
			{
				text = "  ",
				valign = "center",
				align = "center",
				font = "SauceCodePro Nerd Font 16",
				widget = wibox.widget.textbox,
			},
		left = 30,
		right = 10,
		widget = wibox.container.margin
	},
	bg = beautiful.bg,
	fg = beautiful.accent,
	widget = wibox.container.background,
}

OSlogo:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.bg)
    c:set_fg(beautiful.white)
end)
OSlogo:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.bg)
    c:set_fg(beautiful.accent)
end)
OSlogo.widget:connect_signal("button::press", function(c,_,_,button)
        if button == 1 then awful.util.spawn("rofi -show drun")
        elseif button == 3 then require("awful.hotkeys_popup").show_help()
    end
end)

return OSlogo
