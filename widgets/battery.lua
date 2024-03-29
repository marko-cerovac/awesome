-- Standard awesome library
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")

-- Shapes and sepparators library
local pill = require("widgets.shapes").pill

local Battery = {}
 -- The battery program returns the charging state and the battery capacity
 -- ( For example: B10 or C52 ) where B is for battery power and C is for charging
Battery.batteryLevel, Battery.batteryTimer = awful.widget.watch(
	util_dir .. "battery",
	90,
	function(widget, stdout)
		local level = tonumber(stdout:sub(2))
        local state = stdout:sub(1, 1)
        widget.align = "center"
        if state == "C" then
            widget:set_markup(" " .. level .. "% (Charging)")
			if level == 80 then
				naughty.notify({
					title = " Battery charged 80%",
					text = "Disconnect the charger",
					timeout = 10,
					bg = beautiful.notification_bg,
					fg = beautiful.green,
				})
			end
		elseif level <= 5 then
            widget:set_markup("  " .. level .. "% ")
			naughty.notify({
				title = " Battery critical",
				text = "Battery level critically low: " .. level .. "%",
				timeout = 5,
				bg = beautiful.notification_bg,
				fg = beautiful.red,
                border_color = beautiful.red,
			})
		elseif level == 10 then
			widget:set_markup("  " .. level .. "% ")
			naughty.notify({
				title = " Battery low",
				text = "The battery level is low: " .. level .. "%",
				timeout = 10
			})
		elseif level == 15 then
            widget:set_markup("  " .. level .. "% ")
			naughty.notify({
				title = " Battery low",
				text = "The battery level is low: " .. level .. "%",
				timeout = 10
			})
        elseif level <= 30 then
            widget:set_markup("  " .. level .. "% ")
        elseif level <= 60 then
            widget:set_markup("  " .. level .. "% ")
        elseif level <= 80 then
            widget:set_markup("  " .. level .. "% ")
        elseif level <= 100 then
            widget:set_markup("  " .. level .. "% ")
		end
	end
)

Battery.battery = wibox.widget {
	{
		{
			{
				widget = Battery.batteryLevel,
			},
			left = 10,
			right = 12,
			widget = wibox.container.margin
		},
		bg = beautiful.highlight,
		fg = beautiful.battery_fg,
		shape = pill,
		widget = wibox.container.background
	},
	top = 4,
	bottom = 4,
	widget = wibox.container.margin
}
Battery.battery.widget:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.bg_alt)
	Battery.batteryTimer:emit_signal("timeout")
end)
Battery.battery.widget:connect_signal("mouse::leave", function (c)
	c:set_bg(beautiful.highlight)
end)
Battery.battery.widget:connect_signal("button::press", function(c,_,_,button)
	if button == 1 then
		awful.util.spawn("tlpui")
        Battery.batteryTimer:emit_signal("timeout")
    end
end)

return Battery
