local awful     = require "awful"
local wibox     = require "wibox"
local beautiful = require "beautiful"
local naughty   = require "naughty"

local M = {}

M.battery_level, M.battery_timer = awful.widget.watch(
    scripts .. "battery",
    90,
    function (widget, stdout)
        -- get battery level and charging state
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

M.battery_widget = wibox.widget {
    {
        {
            {
                widget = M.battery_level
            },
            left = 10,
            right = 12,
            widget = wibox.container.margin
        },
        bg = beautiful.bg,
        fg = beautiful.battery_fg,
        widget = wibox.container.background
    },
    top = 4,
    bottom = 4,
    widget = wibox.container.margin
}

M.battery_widget.widget:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.bg_light)
    M.battery_timer:emit_signal "timeout"
end)

M.battery_widget.widget.connect_signal("mouse::leave", function(c)
    c:set_bg(beautiful.bg)
end)

return M
