local awful = require "awful"

return {
    -- Make current client fullscreen
    awful.key({ modkey }, "space", function(c)
        c.fullscreen = not c.fullscreen c:raise()
    end,
    {description = "toggle fullscreen", group = "client"}),

    -- Minimize current client
    awful.key({ modkey }, "m", function(c)
        c.minimized = true
    end ,
    {description = "minimize", group = "client"}),

    -- Maximize window
    awful.key({ modkey, "Shift" }, "space", function(c)
        c.maximized = not c.maximized c:raise()
    end ,
    {description = "(un)maximize", group = "client"}),

    -- Kill window
    awful.key({ modkey }, "q", function(c)
        c:kill()
    end,
    {description = "close", group = "client"}),

    -- Make window float
    awful.key({ modkey, "Control" }, "space", client.floating.toggle                     ,
    {description = "toggle floating", group = "client"}),

    -- Move window to master
    awful.key({ modkey }, "a", function(c)
        c:swap(client.getmaster()) end,
    {description = "move to master", group = "client"}),

    -- Move to screen
    awful.key({ modkey }, "o", function(c)
        c:move_to_screen()
    end,
    {description = "move to screen", group = "client"}),

    -- Pin on top
    awful.key({ modkey, "Shift" }, "t", function(c)
        c.ontop = not c.ontop
    end,
    {description = "toggle keep on top", group = "client"}),

	-- Restore minimized client
    awful.key({ modkey, "Shift" }, "m", function()
        local c = client.restore()
        if c then
            c:emit_signal( "request::activate", "key.unminimize", {raise = true})
        end
    end,
    {description = "restore minimized", group = "client"}),

    -- Increase window gap
    awful.key({ modkey }, "[", function()
        awful.tag.incgap(2)
    end,
    {description = "increase window gap", group = "layout"}),

    -- Decrease window gap
    awful.key({ modkey }, "]", function()
        awful.tag.incgap(-2)
    end,
    {description = "decrease window gap", group = "layout"})
}
