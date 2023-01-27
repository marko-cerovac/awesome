-- Standard awesome library
local gears = require('gears')
local awful = require('awful')
-- local naughty = require("naughty")
-- local util_dir = require('beautiful').util_dir

modkey = "Mod4"

-- Popup keys
local hotkeys_popup = require("awful.hotkeys_popup")

-- Control widgets
local widgets = require("widgets")

-- Key mappings

-- Set Modkey
modkey = 'Mod4'

-- Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () widgets.menu.menu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

globalkeys = gears.table.join(

    -- Awesome

	-- Reload awesome
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
	-- Exit awesome
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    -- Show help screen
    awful.key({ modkey,           }, "s", hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

     -- Toggle bar
    awful.key({ modkey, "Shift" }, "b", function ()
		for s in screen do
			s.mywibox.visible = not s.mywibox.visible
		end
	end,
		{description = "toggle bar", group = "awesome"}),

    -- Window navigation and resizing

    -- Focus on next window
    awful.key({ modkey,           }, "k", function () awful.client.focus.byidx( 1) end,
        {description = "focus next by index", group = "client"}),

    -- Focus on previous window
    awful.key({ modkey,           }, "j", function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),

    -- Swap fucused client with next
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),

    -- Swap fucused client with previous
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    -- Focus on the next screen
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),

    -- Focus on the previous screen
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),

    -- Jump to urgent client
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    -- Increase master width
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),

    -- Decrease master width
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

    -- Increase the number of masters
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),

    -- Decrease the number of masters
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),

    -- Increase the number of columns
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),

    -- Decrease the number of columns
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),


    -- Layouts

    -- Next layout
    awful.key({ modkey,           }, "Tab", function () awful.layout.inc( 1)                end,
              {description = "next layout", group = "layout"}),

    -- Previous layout
    awful.key({ modkey, "Shift"   }, "Tab", function () awful.layout.inc(-1)                end,
              {description = "previous layout", group = "layout"}),


    -- Tags

    -- View previous tag
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),

    -- View next tag
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

    -- View previous tag
    awful.key({ modkey,           }, "d",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),

    -- View next tag
    awful.key({ modkey,           }, "f",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

    -- Restore tags
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),


    -- Launch mappings

	-- Show main menu
    awful.key({ modkey,           }, "w", function () widgets.menu.menu:show() end,
              {description = "show main menu", grup = "launcher"}),

    -- Terminal
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),

	-- St
    awful.key({ modkey },            "t",     function () awful.spawn("st") end,
              {description = "Launch st terminal", group = "launcher"}),

	-- VS Codium
    awful.key({ modkey },            "c",     function () awful.spawn("codium") end,
              {description = "Launch VS Codium", group = "launcher"}),

	-- NeoVide
    awful.key({ modkey },            "v",     function () awful.spawn("neovide") end,
              {description = "Launch NeoVide", group = "launcher"}),
	-- NeoVim
    -- awful.key({ modkey },            "v",     function () awful.spawn("alacritty -e nvim") end,
    --           {description = "Launch NeoVim", group = "launcher"}),

    -- Dmenu
    --[[ awful.key({ modkey },            "r",     function () awful.spawn("rofi -show drun", {
		placement = awful.placement.top_left,
		floating = true
	}) end, ]]
    awful.key({ modkey },            "r",     function () awful.spawn("j4-dmenu-desktop --dmenu='dmenu -c -l 10 -p Run:'") end,
              {description = "Launch Dmenu run prompt", group = "launcher"}),

    -- Dmenu
    awful.key({ modkey },            ";",     function () awful.spawn("dmenu_run -c -l 10 -p Run:") end,
              {description = "Launch Dmenu run prompt", group = "launcher"}),

    -- File manager
    awful.key({ modkey },            "e",     function () awful.spawn("alacritty -e ranger") end,
              {description = "Launch Ranger file manager", group = "launcher"}),

    -- Thunar
    awful.key({ modkey },            "n",     function () awful.spawn("thunar") end,
              {description = "Launch Thunar file manager", group = "launcher"}),

    -- Brave
    awful.key({ modkey },            "b",     function () awful.spawn("brave") end,
              {description = "Launch Brave browser", group = "launcher"}),
    awful.key({ modkey },            "i",     function () awful.spawn("brave --incognito") end,
              {description = "Launch Brave browser (incognito mode)", group = "launcher"}),

    -- Pavucontrol
    awful.key({ modkey },            "p",     function () awful.spawn("pavucontrol") end,
              {description = "Launch Pavucontrol volume control", group = "launcher"}),

    -- Change wallpaper
    -- awful.key({ modkey },            "y",     function () awful.util.spawn_with_shell("~/.config/awesome/util/chwall.sh") end,
    awful.key({ modkey },            "y",     function () awful.util.spawn_with_shell("~/.config/awesome/util/wallpaper-picker.sh") end,
              {description = "Change wallpaper", group = "launcher"}),

    -- Change keyboard layout
    awful.key({ modkey },            "0",     function () awful.util.spawn_with_shell("~/.config/awesome/util/kbdswitch.sh") end,
              {description = "Change keyboard layout", group = "launcher"}),

	-- Todo list
    awful.key({ modkey },            "9",     function () awful.spawn(util_dir .. "todo.sh") end,
              {description = "Open todo list", group = "launcher"}),

    --  Enable bluetooth
    awful.key({ modkey, "Control" }, "b", function ()
        awful.spawn("alacritty -e bluetooth on")
        awful.spawn("alacritty -e bluetoothctl")
    end,
              {description = "Turn on bluetooth", group = "control"}),

    -- Set keyboard delay and repeat rate
    awful.key({ modkey, "Shift"   }, "x", function () awful.spawn("xset r rate 150 30") end,
        {description = "Set keyboard speed", group = "control"}),

	-- Control keys

	-- Mute the volume
	awful.key({},	  "XF86AudioMute", function ()
		awful.spawn("pactl set-sink-mute 0 toggle")
		widgets.volume.volumeTimer:emit_signal("timeout")
		end,
			  {description = "Mute volume", group = "control"}),

	-- Raise the volume
	awful.key({},	  "XF86AudioRaiseVolume", function()
		awful.spawn("pactl set-sink-volume 0 +10%")
		widgets.volume.volumeTimer:emit_signal("timeout")
		end,
			  {description = "Raise volume", group = "control"}),

	-- Lower the volume
	awful.key({},	  "XF86AudioLowerVolume", function()
		awful.spawn("pactl set-sink-volume 0 -10%")
		widgets.volume.volumeTimer:emit_signal("timeout")
		end,
			  {description = "Lower volume", group = "control"}),

	-- Mute the microphone
	awful.key({},	  "XF86AudioMicMute", function ()
		awful.spawn("pactl set-source-mute 0 toggle")
		end,
			  {description = "Mute microphone", group = "control"}),

	-- Increase brightness by 5%
	awful.key({},	  "XF86MonBrightnessUp", function ()
		awful.spawn("brightnessctl -e --device='amdgpu_bl0' s +5%")
		widgets.brightness.brightnessTimer:emit_signal("timeout")
		end,
			  {description = "Increase brightness by 5%", group = "control"}),

	-- Decrease brightness by 5%
	awful.key({},	  "XF86MonBrightnessDown", function ()
		awful.spawn("brightnessctl -e --device='amdgpu_bl0' s 5%-")
		widgets.brightness.brightnessTimer:emit_signal("timeout")
		end,
			  {description = "Decrease brightness by 5%", group = "control"}),

	-- Capture screen
	awful.key({},	  "Print", function ()
		awful.util.spawn_with_shell([[scrot ~/Pictures/Screenshots/%Y-%m-%d-%T-screenshot.png; notify-send 'Scrot' 'Screen captured']])
		end,
			  {description = "Capture screen", group = "control"}),

	-- Lock screen
	-- awful.key({},	  "XF86Display", function () awful.spawn("dm-tool lock") end,
	awful.key({},	  "XF86Display", function () awful.spawn("slock") end,
			  {description = "Lock screen", group = "control"}),

    -- Poweroff
    awful.key({ modkey,         },       "x", function () awful.spawn(util_dir .. "logout.sh") end,
              {description = "Shut down", group = "awesome"})
)

clientkeys = gears.table.join(

    -- Make current client fullscreen
    awful.key({ modkey,           }, "space", function (c) c.fullscreen = not c.fullscreen c:raise() end,
        {description = "toggle fullscreen", group = "client"}),

    -- Minimize current client
    awful.key({ modkey,           }, "m", function (c) c.minimized = true end ,
        {description = "minimize", group = "client"}),

    -- Maximize window
    awful.key({ modkey, "Shift"   }, "space", function (c) c.maximized = not c.maximized c:raise() end ,
        {description = "(un)maximize", group = "client"}),

    -- Kill window
    awful.key({ modkey,           }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),

    -- Make window float
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),

    -- Move window to master
    awful.key({ modkey,         }, "a", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),

    -- Move to screen
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),

    -- Pin on top
    awful.key({ modkey, "Shift"   }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),

	-- Restore minimized client
    awful.key({ modkey, "Shift"   }, "m",
    function ()
        local c = awful.client.restore()
        if c then
            c:emit_signal( "request::activate", "key.unminimize", {raise = true})
        end
    end,
        {description = "restore minimized", group = "client"}),

    -- Increase window gap
    awful.key({ modkey,           }, "[", function () awful.tag.incgap(2)                end,
              {description = "increase window gap", group = "layout"}),

    -- Decrease window gap
    awful.key({ modkey,           }, "]", function () awful.tag.incgap(-2)                end,
              {description = "decrease window gap", group = "layout"})
)

-- Workspace mappings
for i = 1, 7 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- Mouse bindings
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

root.keys(globalkeys)
