-- Standard awesome library
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- Shapes and sepparators library
local pill = require("widgets.shapes").pill

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
		bg = beautiful.highlight,
		fg = beautiful.volume_fg,
		-- shape = powerArrow,
		shape = pill,
		widget = wibox.container.background
	},
	top = 4,
	bottom = 4,
	widget = wibox.container.margin
}
Volume.volume.widget:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.bg_alt)
end)
Volume.volume.widget:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.highlight)
end)
Volume.volume.widget:connect_signal("button::press", function(c,_,_,button)
        if button == 1 then awful.util.spawn("pavucontrol")
    end
end)

return Volume
