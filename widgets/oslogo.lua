-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")

-- OS logo
local OSlogo = wibox.widget {
    {
        {
            {
                {
                    text = "  ",
                    valign = "center",
                    align = "center",
                    font = "SauceCodePro Nerd Font 18",
                    widget = wibox.widget.textbox,
                },
                widget = wibox.container.rotate,
                direction = "south"
            },
            left = 34,
            right = 36,
            widget = wibox.container.margin
        },
        bg = beautiful.accent,
        fg = beautiful.bg,
        shape = gears.shape.rectangular_tag,
        shape_clip = true,
        widget = wibox.container.background,
    },
    widget = wibox.container.rotate,
    direction = "south",
}
OSlogo.widget:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.bg)
    c:set_fg(beautiful.accent)
end)
OSlogo.widget:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.accent)
    c:set_fg(beautiful.bg)
end)
OSlogo.widget:connect_signal("button::press", function(c,_,_,button)
        if button == 1 then awful.util.spawn("rofi -show drun")
        elseif button == 3 then require("awful.hotkeys_popup").show_help()
    end
end)

return OSlogo
