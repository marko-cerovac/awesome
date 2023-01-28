local awful = require "awful"
local wibox = require "wibox"
local beautiful = require "beautiful"

-- define the keyboard layout widget
local keyboard_layout = wibox.widget {
    {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.textbox(" "),
        awful.widget.keyboardlayout()
    },
    fg = beautiful.kb_widget_fg,
    bg = beautiful.bar_bg,
    widget = wibox.container.background
}

keyboard_layout.widget.connect_signal("mouse::enter", function(c)
    c:set_bg(beautiful.entered_bg)
end)
keyboard_layout.widget.connect_signal("mouse::leave", function(c)
    c:set_bg(beautiful.bar_bg)
end)
keyboard_layout.widget.widget:connect_signal("button::press", function (c,_,_,button)
    if button == 1 then
        awful.util.spawn(scripts .. "kbdswitch.sh")
    end
end)

return keyboard_layout
