-- Standard awesome library
local awful = require("awful")

-- Widgets
-- local widgets = require("widgets")

-- Themes library
local beautiful = require("beautiful")

-- Notification library
local hotkeys_popup = require("awful.hotkeys_popup")

local Menu = {}

-- Create a launcher widget and a main menu
local awesomemenu = {
   { " hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   -- { "manual", terminal .. " -e man awesome" },
   { " edit config", editor_cmd .. " " .. awesome.conffile },
   { " restart", awesome.restart },
   { " quit", function() awesome.quit() end },
}

local control = {
	{ "直 network", "st -e iwctl" },
	{ "墳 volume", "pavucontrol"},
	{ " battery", "tlpui"},
	{ " cleaning", "bleachbit"},
}

-- Create menu
Menu.menu = awful.menu({ items = { { " awesome", awesomemenu, beautiful.awesome_icon },
                                    { "漣 control settings", control },
                                    { " open terminal", terminal },
                                    { " open file explorer", "thunar" },
                                    { " open run prompt", "dmenu_run -l 10 -c" },
                                    { " open visual editor", "neovide" },
                                    { " open office suite", "libreoffice" },
                                    { "爵 open browser", "brave" },
                                    { " open task manager", "st -e htop" }
                                  }
                        })
Menu.launcher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = Menu.menu })

return Menu
