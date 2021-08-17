-- Standard awesome library
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- Shapes and sepparators library
local powerArrow = require("widgets.sepparators").powerArrow

local Brightness = {}

-- Brightness timer
Brightness.brightnessLevel, Brightness.brightnessTimer = awful.widget.watch(
    beautiful.util_dir .. 'brightness',
    60,
    function(widget, stdout)
        widget:set_markup(stdout:gsub("\n", ""))
        widget.align = "center"
    end)

-- Brightness widget
Brightness.brightness = wibox.widget {
    {
        {
            wibox.widget.textbox(" "),
            Brightness.brightnessLevel,
            layout = wibox.layout.align.horizontal
        },
        left = 18,
        right = 24,
        widget = wibox.container.margin
    },
    bg = beautiful.disabled,
    fg = beautiful.brightness_fg,
    shape = powerArrow,
    widget = wibox.container.background
}
Brightness.brightness:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.lines)
end)
Brightness.brightness:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.disabled)
end)
Brightness.brightness:connect_signal("button::press", function(c,_,_,button)
        if button == 1 then
            Brightness.brightnessTimer:emit_signal("timeout")
    end
end)

return Brightness
