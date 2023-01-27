-- check if luarocks and dependencies are installed
pcall(require, "luarocks.loader")

-- import libraries:
local gears     = require "gears"
local awful     = require "awful"
local beautiful = require "beautiful"
local naughty   = require "naughty"
require "awful.autofocus"

-- enable autofocus
require "awful.autofocus"

-- if there are errors during startup, use the default config
if awesome.startup_errors then
    naughty.notify {
        preset = naughty.config.presets.critical,
        title  = "Oops, there were errors during startup!",
        text   = awesome.startup_errors
    }
end

-- handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- make sure we don't go into an endless error loop
        if in_error then
            return
        end
        in_error = true

        naughty.notify {
            preset = naughty.config.presets.critical,
            title  = "Oops, an error happened!",
            text   = tostring(err)
        }
        in_error = false
    end)
end

-- set default variables
terminal   = "alacritty"
editor     = os.getenv "editor" or "vi"
editor_cmd = terminal .. " -e " .. editor
utils      = gears.filestystem.get_configuration_dir() .. "util/"
scripts    = utils .. "scripts/"

-- load the theme file
beautiful.init(
    gears.filesystem.get_configuration_dir() .. "theme.lua"
)

-- execute the autostart script
awful.spawn.once(
    scripts .. "/autostart.sh"
)

-- select layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    awful.layout.suit.max,
    awful.layout.suit.corner.nw,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.floating,
    awful.layout.suit.magnifier,
    awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

awful.screen.connect_for_each_screen(function(screen)
    -- set the wallpaper
    gears.wallpaper.maximized(utils .. "wallpaper", screen, true)

    -- each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" },
        screen,
        awful.layout.layouts[1])

    -- create the bar
    require "bar".create(screen)
end)

-- add client rules
require "rules"

-- add signals
require "signals"
