---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font          = "SauceCodePro Nerd Font 10"

-- Material Deep Ocean color theme
theme.bg	    = "#0F111A"
theme.bg_alt	    = "#090B10"
theme.fg	    = "#8F93A2"
theme.active        = "#1A1C25"
theme.highlight     = "#1F2233"
theme.text          = "#717CB4"
theme.disabled	    = "#464B5D"
theme.lines	    = "#3B3F51"

theme.white         = "#EEFFFF"
theme.red           = "#F07178"
theme.yellow        = "#FFCB6B"
theme.green         = "#C3E88D"
theme.purple        = "#C792EA"
theme.blue          = "#82AAFF"
theme.paleblue      = "#B0C9FF"
theme.accent        = "#84FFFF"

theme.bg_normal     = theme.highlight
theme.bg_focus      = theme.bg
theme.bg_urgent     = theme.bg
theme.bg_minimize   = theme.bg
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.fg
theme.fg_focus      = theme.fg
theme.fg_urgent     = theme.red
theme.fg_minimize   = theme.disabled

-- Client borders
theme.useless_gap   = dpi(6)
theme.border_width  = dpi(1)
theme.border_normal = theme.bg
theme.border_focus  = theme.accent
theme.border_marked = theme.red

-- Taglist colors
theme.taglist_bg_focus = theme.bg_alt
theme.taglist_bg_empty = theme.bg_alt
theme.taglist_bg_occupied = theme.bg_alt
theme.taglist_bg_urgent = theme.bg_alt

theme.taglist_fg_focus = theme.accent
theme.taglist_fg_empty = theme.white
theme.taglist_fg_occupied = theme.disabled
theme.taglist_fg_urgent = theme.red

-- Tasklist colors
theme.tasklist_bg_focus = theme.bg

-- Hotkeys popup
theme.hotkeys_opacity = 0.8
theme.hotkeys_bg = theme.bg
theme.hotkeys_fg = theme.fg
theme.hotkeys_border_width = 2
theme.hotkeys_border_color = theme.bg
theme.hotkeys_modifiers_fg = theme.accent
theme.hotkeys_label_fg = theme.green
theme.hotkeys_font = "SauceCodePro Nerd Font 10"
theme.hotkeys_description_font = "SauceCodePro Nerd Font 10"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.notification_font = "SauceCodePro Nerd Font 12"
theme.notification_bg = theme.bg_alt
theme.notification_fg = theme.fg
theme.notification_opacity = 0.8

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.wallpaper = "/home/marko/.config/awesome/wallpaper.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
--[[ theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
) ]]

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
