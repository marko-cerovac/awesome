local awful     = require "awful"
local beautiful = require "beautiful"

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen },
    },
    -- Floating clients.
    { rule_any = {
        instance = {
          -- "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
		  "iwgtk",
          -- "Blueman-manager",
          -- "Gpick",
          -- "Galculator",
		  "gnome-calculator",
		  "Iwgtk",
          -- "Kruler",
          -- "MessageWin",  -- kalarm.
          -- "Sxiv",
          "LibreOffice",
          -- "Wpa_gui",
          -- "Pcmanfm",
		  -- "Thunar",
          -- "veromix",
          -- "xtightvncviewer"
        },
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          -- "AlarmWindow",  -- Thunderbird's calendar.
          -- "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

	-- { rule_any = {
	-- 	type = {
	-- 		"normal",
	-- 		"dialog"
	-- 	}
	-- 	}, properties = { titlebars_enabled = true }
	-- },
}
