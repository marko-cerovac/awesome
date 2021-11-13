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

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
       awful.button({ }, 1, function () awful.layout.inc( 1) end),
       awful.button({ }, 3, function () awful.layout.inc(-1) end)))

    s.mylayout = wibox.container.margin(
		wibox.container.background(
			wibox.container.margin( s.mylayoutbox, 26, 26),
			beautiful.highlight,
			widgets.shapes.pill
		),
		8, 8, 4, 4
	)

	-- create the tags for the taglist
	widgets.taglist.make_tags(s)

	s.mytaglist = wibox.widget {
		{
			{
				{
					widget = widgets.taglist.taglist(s)
				},
				left = 8,
				right = 8,
				-- top = 4,
				-- bottom = 4,
				widget = wibox.container.margin
			},
			bg = beautiful.taglist_bg_empty,
			shape = widgets.shapes.pill,
			widget = wibox.container.background
		},
		top = 4,
		bottom = 4,
		widget = wibox.container.margin
	}


    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
		style = {
			shape_border_color_focus = beautiful.tasklist_border_focus,
			shape = widgets.shapes.pill,
			disable_icon = true,
		},
		layout = {
			spacing = 2,
			spacing_widget = {
				{
					-- forced_width = 2,
					-- shape = gears.shape.powerline,
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
					left  = 14,
					right = 14,
					widget = wibox.container.margin
				},
				id     = 'background_role',
                forced_width = 130,
				widget = wibox.container.background,
			},
			top = 4,
			bottom = 4,
			widget = wibox.container.margin
		}
    }

    -- Create the wibox
    -- s.mywibox = awful.wibar({ position = "top", screen = s, bg = beautiful.bg_normal .. "A0" })
    s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		bg = beautiful.bg,
		height = 32
	})

    -- Add widgets
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        -- layout = wibox.layout.flex.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 6,
            widgets.oslogo,
            s.mytaglist,
            s.mylayout,
            -- mylauncher,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 12,
			widgets.volume.volume,
			widgets.brightness.brightness,
			widgets.battery.battery,
			widgets.network.network,
            widgets.keyboard,
            widgets.clock,
            -- widgets.logout.sleep,
			widgets.logout.poweroff,
        },
    }
end)

