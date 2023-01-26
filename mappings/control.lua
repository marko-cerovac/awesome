local awful         = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"

return {
	-- Reload awesome
    awful.key({ modkey, "Control" }, "r", awesome.restart,
    {description = "reload awesome", group = "awesome"}),

	-- Exit awesome
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
    {description = "quit awesome", group = "awesome"}),

    -- Show help screen
    awful.key({ modkey }, "s", hotkeys_popup.show_help,
    {description="show help", group="awesome"}),

     -- Toggle bar
    awful.key({ modkey, "Shift" }, "b", function()
		for s in screen do
			s.mywibox.visible = not s.mywibox.visible
		end
	end,
    {description = "toggle bar", group = "awesome"}),

    -- Focus on next window
    awful.key({ modkey }, "k", function()
        client.focus.byidx( 1)
    end,
    {description = "focus next by index", group = "client"}),

    -- Focus on previous window
    awful.key({ modkey }, "j", function()
        client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}),

    -- Swap fucused client with next
    awful.key({ modkey, "Shift" }, "j", function()
        client.swap.byidx(  1)
    end,
    {description = "swap with next client by index", group = "client"}),

    -- Swap fucused client with previous
    awful.key({ modkey, "Shift" }, "k", function()
        client.swap.byidx( -1)
    end,
    {description = "swap with previous client by index", group = "client"}),

    -- Focus on the next screen
    awful.key({ modkey, "Control" }, "j", function()
        awful.screen.focus_relative( 1)
    end,
    {description = "focus the next screen", group = "screen"}),

    -- Focus on the previous screen
    awful.key({ modkey, "Control" }, "k", function()
        awful.screen.focus_relative(-1)
    end,
    {description = "focus the previous screen", group = "screen"}),

    -- Jump to urgent client
    awful.key({ modkey }, "u",
        client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}),

    -- Increase master width
    awful.key({ modkey }, "l", function()
        awful.tag.incmwfact( 0.05)
    end,
    {description = "increase master width factor", group = "layout"}),

    -- Decrease master width
    awful.key({ modkey }, "h", function()
        awful.tag.incmwfact(-0.05)
    end,
    {description = "decrease master width factor", group = "layout"}),

    -- Increase the number of masters
    awful.key({ modkey, "Shift" }, "h", function()
        awful.tag.incnmaster( 1, nil, true)
    end,
    {description = "increase the number of master clients", group = "layout"}),

    -- Decrease the number of masters
    awful.key({ modkey, "Shift" }, "l", function()
        awful.tag.incnmaster(-1, nil, true)
    end,
    {description = "decrease the number of master clients", group = "layout"}),

    -- Increase the number of columns
    awful.key({ modkey, "Control" }, "h", function()
        awful.tag.incncol( 1, nil, true)
    end,
    {description = "increase the number of columns", group = "layout"}),

    -- Decrease the number of columns
    awful.key({ modkey, "Control" }, "l", function()
        awful.tag.incncol(-1, nil, true)
    end,
    {description = "decrease the number of columns", group = "layout"}),

    -- Next layout
    awful.key({ modkey }, "Tab", function()
        awful.layout.inc( 1)
    end,
    {description = "next layout", group = "layout"}),

    -- Previous layout
    awful.key({ modkey, "Shift" }, "Tab", function()
        awful.layout.inc(-1)
    end,
    {description = "previous layout", group = "layout"}),

    -- View previous tag
    awful.key({ modkey }, "Left", awful.tag.viewprev,
    {description = "view previous", group = "tag"}),

    -- View next tag
    awful.key({ modkey }, "Right", awful.tag.viewnext,
    {description = "view next", group = "tag"}),

    -- View previous tag
    awful.key({ modkey }, "d", awful.tag.viewprev,
    {description = "view previous", group = "tag"}),

    -- View next tag
    awful.key({ modkey }, "f", awful.tag.viewnext,
    {description = "view next", group = "tag"}),

    -- Restore tags
    awful.key({ modkey }, "Escape", awful.tag.history.restore,
    {description = "go back", group = "tag"}),
}
