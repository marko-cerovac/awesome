local awful     = require "awful"
local gears     = require "gears"
local beautiful = require "beautiful"

-- re-set wallpaper when a screen's geometry changes
screen.connect_signal("property::geometry", function()
    gears.wallpaper.maximized(
        gears.filestystem.get_configuration_dir() .. "util/" .. "wallpaper",
        screen,
        true)
end)

-- signal function to execute when a new client appears
client.connect_signal("manage", function (c)
    -- set new clients as slaves
    if not awesome.startup then
        awful.client.setslave(c)
    end

    -- prevent clients from being unreachable after screen count changes.
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

-- focued client
client.connect_signal("focus", function(client)
    client.border_color = beautiful.border_focus
end)

-- unfocused client
client.connect_signal("unfocus", function(client)
    client.border_color = beautiful.border_normal
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
--[[ client.connect_signal("request::titlebars", function(client)
    require "titlebar".create_titlebar(client)
end) ]]

-- enable sloppy focus, so that focus follows mouse.
--[[ client.connect_signal("mouse::enter", function(client)
    client:emit_signal("request::activate", "mouse_enter", {raise = false})
end) ]]
