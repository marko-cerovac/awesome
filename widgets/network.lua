-- Standard awesome library
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- Shapes and sepparators library
local powerArrow = require("widgets.sepparators").powerArrow

-- Widgets
local Network = {}

-- Network widget
Network.networkName, Network.networkTimer = awful.widget.watch(
 [[bash -c 'iwgetid | grep -o \".*']],
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
            wibox.widget.textbox("  "),
            Network.networkName,
            layout = wibox.layout.align.horizontal
        },
        left = 18,
        right = 24,
        widget = wibox.container.margin
    },
    bg = beautiful.disabled,
    fg = beautiful.network_fg,
    shape = powerArrow,
    widget = wibox.container.background
}
Network.network:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.lines)
	Network.networkTimer:emit_signal("timeout")
end)
Network.network:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.disabled)
end)
Network.network:connect_signal("button::press", function(c,_,_,button)
	if button == 1 then
		awful.util.spawn("alacritty -e iwctl")
		Network.networkTimer:emit_signal("timeout")
    end
end)

return Network
