-- Standard awesome library
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Notification library
local naughty = require("naughty")

-- Themes library
local beautiful = require("beautiful")

-- Shapes and sepparators library
local powerArrow = require("widgets.sepparators").powerArrow

-- Keyboard map indicator and switcher
local keyboardlayout = wibox.widget {
    {
        {
            layout = wibox.layout.fixed.horizontal,
            -- wibox.widget.textbox(" "),
            wibox.widget.textbox(" "),
            awful.widget.keyboardlayout()
        },
        left = 20,
        right = 22,
        widget = wibox.container.margin
    },
    fg = beautiful.white,
    bg = beautiful.bg_alt,
    shape = powerArrow,
    widget = wibox.container.background
}

keyboardlayout:connect_signal("mouse::enter", function (c)
	c:set_bg(beautiful.active)
end)
keyboardlayout:connect_signal("mouse::leave", function (c)
	c:set_bg(beautiful.bg_alt)
end)

keyboardlayout.widget:connect_signal("button::press", function (c,_,_,button)
    if button == 1 then awful.util.spawn(beautiful.util_dir .. "kbdswitch.sh") end
end)

return keyboardlayout
