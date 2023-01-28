local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"

local M = {}

M.create = function(screen)

    screen.mywibox = awful.wibar({
        position = "top",
        screen = screen,
        -- bg = beautiful.bar_bg,
        height = 36,
        shape = gears.shape.rounded_bar,
        border_width = 6
    })

    local launcher = require "bar.os_logo".launcher
    require "bar.layout".create(screen)
    require "bar.taglist".create(screen)
    require "bar.tasklist".create(screen)
    require "bar.run-prompt".create(screen)

    screen.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            -- left widgets
            layout = wibox.layout.fixed.horizontal,
            launcher,
            screen.taglist,
            screen.run_prompt,
        },
        -- middle widget
        screen.tasklist,
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            require "bar.keyboard_layout",
            wibox.widget.systray(),
            require "bar.clock",
            screen.layout_icon,
        },
    }
end

return M
