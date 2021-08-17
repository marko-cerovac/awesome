-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")
local lain = require("lain")

-- Themes library
local beautiful = require("beautiful")

-- Shapes and sepparators library
local powerArrow = require("widgets.sepparators").powerArrow

-- Notification library
-- local menubar = require("menubar")
-- local hotkeys_popup = require("awful.hotkeys_popup")

local Battery = {}

-- Markup and separators
local markup = lain.util.markup
-- Battey widget
Battery.mybattery = lain.widget.bat({
    timeout = 30,
    battery = "BAT0",
    ac = "AC",
    settings = function ()
        if bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(beautiful.font, " " .. bat_now.perc .. "% (Charging)"))
                return
            elseif tonumber(bat_now.perc) <= 5 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            elseif tonumber(bat_now.perc) <= 15 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            elseif tonumber(bat_now.perc) <= 30 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            elseif tonumber(bat_now.perc) <= 50 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            elseif tonumber(bat_now.perc) <= 90 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            elseif tonumber(bat_now.perc) <= 100 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            end
        else
            widget:set_markup()
        end
        bat_notification_charged_preset.timeout = 300
        bat_notification_charged_preset.title = " Battery full"
        -- bat_notification_charged_preset.position = "bottom_right"
        bat_notification_charged_preset.bg = beautiful.notification_bg
        bat_notification_charged_preset.fg = beautiful.notification_fg
        bat_notification_low_preset.timeout = 300
        bat_notification_low_preset.title = " Battery low"
        -- bat_notification_low_preset.position = "bottom_right"
        bat_notification_low_preset.bg = beautiful.notification_bg
        bat_notification_low_preset.fg = beautiful.notification_fg
        bat_notification_critical_preset.timeout = 120
        bat_notification_critical_preset.title = " Battery critical"
        -- bat_notification_critical_preset.position = "bottom_right"
        bat_notification_critical_preset.bg = beautiful.notification_bg
        bat_notification_critical_preset.fg = beautiful.red
    end,
})
Battery.battery = wibox.widget {
    {
        {
            Battery.mybattery.widget,
            layout = wibox.layout.align.horizontal
        },
        left = 10,
        right = 16,
        widget = wibox.container.margin
    },
    bg = beautiful.disabled,
    fg = beautiful.battery_fg,
    shape = powerArrow,
    widget = wibox.container.background
}
Battery.battery:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.lines)
	Battery.mybattery.update()
end)
Battery.battery:connect_signal("mouse::leave", function (c)
	c:set_bg(beautiful.disabled)
end)
Battery.battery:connect_signal("button::press", function(c,_,_,button)
	if button == 1 then
		awful.util.spawn("tlpui")
		Battery.mybattery.update()
    end
end)

return Battery
