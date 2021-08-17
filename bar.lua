-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Widgets
-- local widgets = require("widgets")

-- Themes library
local beautiful = require("beautiful")

-- Notification library
local menubar = require("menubar")
-- local hotkeys_popup = require("awful.hotkeys_popup")

local widgets = require("widgets")

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

-- Click to switch to workspace
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t) if client.focus then client.focus:move_to_tag(t) end end))

-- Click to switch to client
local tasklist_buttons = gears.table.join(
     awful.button({ }, 1, function (c)
                              if c == client.focus then c.minimized = true
                              else c:emit_signal( "request::activate", "tasklist", {raise = true})
                              end
                          end),
     awful.button({ }, 3, function()
                              awful.menu.client_list({ theme = { width = 250 } })
                          end))


local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
	local names = { "  ", "  ", " 爵 ", "  ", " 拾 " }
	local layouts = {
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1] }
	awful.tag(names, s, layouts)

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
       awful.button({ }, 1, function () awful.layout.inc( 1) end),
       awful.button({ }, 3, function () awful.layout.inc(-1) end)))

    s.mylayout = wibox.container.background(
        wibox.container.margin( s.mylayoutbox, 26, 26),
        beautiful.disabled,
        gears.shape.powerline
    )

    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter =  awful.widget.taglist.filter.all,
        style = {
            shape = gears.shape.powerline
        },
        layout = {
            spacing = -14,
            forced_width = 230,
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left = 16,
                right = 16,
                widget = wibox.container.margin
            },
            id = 'background_role',
			shape = gears.shape.powerline,
            widget = wibox.container.background,
        },
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
		style = {
			shape_border_width = 1,
			shape_border_color = beautiful.tasklist_border,
			shape_border_color_focus = beautiful.tasklist_border_focus,
			shape = gears.shape.powerline,
			disable_icon = true,
		},
		layout = {
			spacing = -2,
			spacing_widget = {
				{
					-- forced_width = 2,
					shape = gears.shape.powerline,
					widget = wibox.widget.separator
				},
				valign = "center",
				halign = "center",
			},
			-- layout = wibox.layout.flex.horizontal
			layout = wibox.layout.fixed.horizontal
		},
		 widget_template = {
				{
					{
						{
							{
								id     = 'icon_role',
								widget = wibox.widget.imagebox,
							},
							margins = 2,
							widget  = wibox.container.margin,
						},
						{
							id     = 'text_role',
							widget = wibox.widget.textbox,
						},
						layout = wibox.layout.fixed.horizontal,
					},
					left  = 20,
					right = 10,
					widget = wibox.container.margin
				},
				id     = 'background_role',
                forced_width = 160,
				widget = wibox.container.background,
		},
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, bg = beautiful.bg_normal .. "A0" })

    -- Add widgets
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = -20,
            widgets.oslogo,
            s.mytaglist,
            s.mylayout,
            -- mylauncher,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = -14,
			{
				layout = wibox.layout.fixed.horizontal,
				spacing = -14,
				widgets.volume.volume,
				widgets.sepparators.arrowLeft({bg = beautiful.disabled, fg = beautiful.accent}),
				widgets.brightness.brightness,
				widgets.sepparators.arrowLeft({bg = beautiful.disabled, fg = beautiful.accent}),
				widgets.battery.battery,
				widgets.sepparators.arrowLeft({bg = beautiful.disabled, fg = beautiful.accent}),
				widgets.network.network
			},
            widgets.clock,
			widgets.sepparators.arrowLeft({bg = beautiful.bg_alt, fg = beautiful.accent}),
            widgets.keyboard,
            widgets.logout.sleep,
			widgets.sepparators.arrowLeft({bg = beautiful.accent, fg = beautiful.bg_alt}),
			widgets.logout.poweroff,
        },
    }
end)

