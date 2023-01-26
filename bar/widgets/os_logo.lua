local awful     = require "awful"
local wibox     = require "wibox"
local beautiful = require "beautiful"

local os_logo = wibox.widget {
    {
        {
            text = "  ",
            valign = "center",
            align = "center",
            font = "SauceCodePro Nerd Font 16",
            widget = wibox.widget.textbox,
        },
        left = 30,
        right = 10,
        widget = wibox.container.margin
    },
    bg = beautiful.bg_alt,
    fg = beautiful.accent,
    widget = wibox.container.background,
}

os_logo:connect_signal("mouse::enter", function(c)
    c:set_fg(beautiful.white)
end)

os_logo:connect_signal("mouse::leave", function(c)
    c:set_fg(beautiful.accent)
end)

os_logo.widget:connect_signal("button::press", function(_, _, _, button)
    if button == 1 then
        awful.util.spawn "dmenu_run -c -l 10 -p Run:"
    elseif button == 3 then
        require "awful.hotkeys_popup".show_help()
    end
end)

return os_logo
