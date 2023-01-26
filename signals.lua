local awful     = require "awful"
local beautiful = require "beautiful"

-- signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

	-- Rounded corners
	c.shape = function(cr,w,h)
 		require("gears").shape.rounded_rect(cr,w,h,10)
	end
end)

-- signal function to execute when focusing on a client
client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)

-- signal function to execute when unfocusing a client
client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

-- re-set wallpaper when a screen's geometry changes
screen.connect_signal("property::geometry",
    require "util.wallpaper".set_wallpaper
)

-- signal function to execute when moving clients
screen.connect_signal("arrange", function (s)
    local max = s.selected_tag.layout.name == "max"
    -- use tiled_clients so that other floating windows don't affect the count
    local only_one = #s.tiled_clients == 1
    -- but iterate over clients instead of tiled_clients as tiled_clients doesn't include maximized windows
    for _, c in pairs(s.clients) do
        if (max or only_one) and not c.floating or c.maximized then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width
        end
    end
end)
