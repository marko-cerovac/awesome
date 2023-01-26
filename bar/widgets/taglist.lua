local awful     = require "awful"
local gears     = require "gears"
local wibox     = require "wibox"
local beautiful = require "beautiful"

local M = {}

M.create_tags = function(screen)
    -- Each screen has its own tag table.
    local names = { "  ", "  ", "  ", "  ", " 拾 ", "  ", " 漣 " }
    local layouts = {
        awful.layout.layouts[1],
        awful.layout.layouts[1],
        awful.layout.layouts[1],
        awful.layout.layouts[1],
        awful.layout.layouts[1],
        awful.layout.layouts[1],
        awful.layout.layouts[1]
    }
    awful.tag(names, screen, layouts)
end

-- Click to switch to workspace
local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t)
        t:view_only()
    end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end)
)

M.taglist = function(screen)
    local list = awful.widget.taglist {
        screen = screen,
        filter = awful.widget.taglist.filter.all,
        style = {},
        layout = {
            spacing = -14,
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        id = "text_role",
                        -- font = "SauceCodePro Bold Nerd Font 19",
                        widget = wibox.widget.textbox
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left = 16,
                right = 16,
                widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background,
        },
        buttons = taglist_buttons
    }

    return list
end

M.create_taglist_widget = function(screen)
    -- create the tags for the taglist
    M.taglist.make_tags(screen)

    screen.taglist_widget = wibox.widget {
        {
            {
                {
                    widget = M.taglist.taglist(screen)
                },
                left = 8,
                right = 8,
                -- top = 4,
                -- bottom = 4,
                widget = wibox.container.margin
            },
            bg = beautiful.taglist_bg_empty,
            shape = require "util.pill_shape",
            widget = wibox.container.background
        },
        top = 4,
        bottom = 4,
        widget = wibox.container.margin
    }

    return screen.taglist_widget
end

return M
