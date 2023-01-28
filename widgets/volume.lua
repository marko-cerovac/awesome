-- Standard awesome library
local awful = require("awful")
local gears = require("gears")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

local Volume = {}

Volume.volumeLevel, Volume.volumeTimer = awful.widget.watch(
	util_dir .. "volume.sh",
	60,
	function(widget, stdout)
        widget.align = "center"
		if stdout:sub(1, 1) == "M" then
			widget:set_markup(" Muted")
		else
			local level = tonumber(stdout)
			widget:set_markup(" " .. level .. "%")
		end
	end
)

-- Volume widget
Volume.volume = wibox.widget {
	{
		{
			{
				widget = Volume.volumeLevel
			},
			left = 16,
			right = 16,
			widget = wibox.container.margin
		},
		bg = beautiful.bg,
		fg = beautiful.volume_fg,
		-- shape = powerArrow,
		shape = gears.shape.rounded_bar,
		widget = wibox.container.background
	},
	top = 4,
	bottom = 4,
	widget = wibox.container.margin
}
Volume.volume.widget:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.bg_light)
end)
Volume.volume.widget:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.bg)
end)
Volume.volume.widget:connect_signal("button::press", function(c,_,_,button)
        if button == 1 then awful.util.spawn("pavucontrol")
    end
end)

return Volume
