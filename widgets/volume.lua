
-- Standard awesome library
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

-- Markup and separators
local markup = lain.util.markup

-- Widgets
local Volume = {}

-- Volume timer
Volume.myvolume = lain.widget.pulse({
    timeout = 20,
    settings = function ()
        if volume_now.muted == "yes" then
            widget:set_markup(markup.font(beautiful.font," Muted"))
            return
        else
            widget:set_markup(markup.font(beautiful.font, " "  .. volume_now.right .. "% "))
        end
    end
})

-- Volume widget
Volume.volume = wibox.widget {
    {
        {
            Volume.myvolume.widget,
            layout = wibox.layout.align.horizontal
        },
        left = 18,
        right = 16,
        widget = wibox.container.margin
    },
    bg = beautiful.disabled,
    fg = beautiful.volume_fg,
    shape = powerArrow,
    widget = wibox.container.background
}
Volume.volume:connect_signal("mouse::enter", function (c)
    c:set_bg(beautiful.lines)
end)
Volume.volume:connect_signal("mouse::leave", function (c)
    c:set_bg(beautiful.disabled)
end)
Volume.volume:connect_signal("button::press", function(c,_,_,button)
        if button == 1 then awful.util.spawn("pavucontrol")
    end
end)

return Volume
