-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- Shapes and sepparators library
local powerArrow = require("widgets.sepparators").powerArrow

-- Widgets
local Logout = {}

Logout.sleep = wibox.widget {
    {
        {
            text = "  ",
            valign = "center",
            align = "center",
            font = "SauceCodePro Nerd Font 12",
            widget = wibox.widget.textbox
        },
        left = 20,
        right = 20,
        widget = wibox.container.margin
    },
    bg = beautiful.accent,
    fg = beautiful.bg,
    shape = powerArrow,
    shape_border_width = 1,
    shape_border_color = beautiful.accent,
    shape_clip = true,
    widget = wibox.container.background
}

Logout.sleep:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.bg)
    c:set_fg(beautiful.accent)
end)
Logout.sleep:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.accent)
    c:set_fg(beautiful.bg)
end)
Logout.sleep:connect_signal("button::press", function(c,_,_,button)
    if button == 1 then awful.util.spawn(beautiful.util_dir .. [[prompt.sh "Do you want to suspend" "systemctl suspend"]]) end
end)


Logout.poweroff = wibox.widget {
    {
        {
            text = "  ",
            valign = "center",
            align = "center",
            font = "SauceCodePro Nerd Font 12",
            widget = wibox.widget.textbox
        },
        left = 16,
        right = 12,
        widget = wibox.container.margin
    },
    bg = beautiful.accent,
    fg = beautiful.bg,
    shape = gears.shape.rectangular_tag,
    shape_border_width = 1,
    shape_border_color = beautiful.accent,
    shape_clip = true,
    widget = wibox.container.background
}

Logout.poweroff:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.bg)
    c:set_fg(beautiful.accent)
end)
Logout.poweroff:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.accent)
    c:set_fg(beautiful.bg)
end)
Logout.poweroff:connect_signal("button::press", function(c,_,_,button)
    if button == 1 then awful.util.spawn(beautiful.util_dir .. [[prompt.sh "Do you want to shut down" "shutdown now"]]) end
end)

return Logout
