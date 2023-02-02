-- Standard awesome library
local awful = require("awful")
local gears = require("gears")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- Widgets
local Network = {}

-- Network widget
Network.networkName, Network.networkTimer = awful.widget.watch(
 [[bash -c 'iwgetid | grep -o \".*']],
 -- [[bash -c 'iwctl station wlan0 show | grep -o Connected network.*']],
	30,
	function(widget, stdout)
		widget:set_markup(stdout:gsub([["]], ""))
		if widget.text == "" then
		 widget.text = "Disconnected"
	   end
		widget.align = "center"
	end)
Network.network = wibox.widget {
	{
		{
			{
				wibox.widget.textbox("  "),
				Network.networkName,
				layout = wibox.layout.align.horizontal
			},
			left = 18,
			right = 24,
			widget = wibox.container.margin
		},
		bg = beautiful.bg,
		fg = beautiful.network_fg,
		shape = gears.shape.rounded_bar,
		widget = wibox.container.background
	},
	top = 4,
	bottom = 4,
	widget = wibox.container.margin
}
Network.network.widget:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.bg_light)
	Network.networkTimer:emit_signal("timeout")
end)
Network.network.widget:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.bg)
end)
Network.network.widget:connect_signal("button::press", function(c,_,_,button)
	if button == 1 then
		awful.util.spawn("iwgtk")
		Network.networkTimer:emit_signal("timeout")
    end
end)

return Network
