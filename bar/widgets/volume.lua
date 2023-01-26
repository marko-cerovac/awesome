local awful     = require "awful"
local wibox     = require "wibox"
local beautiful = require "beautiful"

local M = {}

M.volume_level, M.volume_timer = awful.widget.watch(
    [[amixer sget Master |
    grep -e 'Front Left:' |
    sed 's/[^\[]*\[\([0-9]\{1,3\}\).*\(on\|off\).*/\2 \1/' |
    sed 's/off /M/' |
    sed 's/on //']],
    -- utils .. "volume.sh",
    90,
    function(widget, stdout)
        widget.align = "center"
        if stdout:sub(1, 1) == "M" then
            widget:set_markupr " Muted"
        else
			local level = tonumber(stdout)
			widget:set_markup(" " .. level .. "%")
        end
    end
)

M.volume_widget = wibox.widget {
    {
        {
            {
                widget = M.volume_level
            },
            left = 16,
            right = 16,
            widget = wibox.container.margin
        },
        bg = beautiful.bg,
        fg = beautiful.volume_fg,
        shape = require "util.pill_shape",
        widget = wibox.container.background
    },
    top = 4,
    bottom = 4,
    widget = wibox.container.margin
}

M.volume_widget.widget:connect_signal("mouse::enter", function(c)
    c:set_bg(beautiful.bg_light)
end)
M.volume_widget.widget:connect_signal("mouse::leave", function(c)
    c:set_bg(beautiful.bg)
end)
M.volume_widget.widget:connect_signal("button::press", function(_,_,_,button)
    if button == 1 then
        awful.spawn "pactl set-sink-mute 0 toggle"
    end
end)

return M
