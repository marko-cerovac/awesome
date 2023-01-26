local awful     = require "awful"
local wibox     = require "wibox"
local beautiful = require "beautiful"

local keyboard_layout = wibox.widget {
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
        shape = require "util.pill_shape",
		widget = wibox.container.background
	},
	top = 4,
	bottom = 4,
	widget = wibox.container.margin
}

keyboard_layout.widget:connect_signal("mouse::enter", function (c)
	c:set_bg(beautiful.bg_light)
end)

keyboard_layout.widget:connect_signal("mouse::leave", function (c)
	c:set_bg(beautiful.bg)
end)

keyboard_layout.widget.widget:connect_signal("button::press", function (_,_,_,button)
    if button == 1 then
        awful.util.spawn(scripts .. "kbdswitch.sh")
    end
end)

return keyboard_layout
