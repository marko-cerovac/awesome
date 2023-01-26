local theme_assets = require "beautiful.theme_assets"
local xresources   = require "beautiful.xresources"
local gfs          = require "gears.filesystem"
local dpi          = xresources.apply_dpi
local themes_path  = gfs.get_themes_dir
-- local gears = require "gears"

local M = {}

local colorscheme = require "colorthemes.material-deep-ocean"
-- local colorscheme = require "colorthemes.material-oceanic"

for key, value in pairs(colorscheme) do
    M[key] = value
end

M.font          = "SauceCodePro Nerd Font 10"

M.bg_normal     = M.bg_light
M.bg_focus      = M.bg
M.bg_urgent     = M.bg
M.bg_minimize   = M.bg
M.bg_systray    = M.bg_normal

M.fg_normal     = M.fg
M.fg_focus      = M.fg
M.fg_urgent     = M.red
M.fg_minimize   = M.disabled

-- Client borders
M.useless_gap   = dpi(6)
M.border_width  = dpi(1)
-- theme.border_normal = theme.bg
-- theme.border_focus  = theme.paleblue
M.border_normal = M.bg
M.border_focus  = M.accent
M.border_marked = M.red

-- Taglist colors
M.taglist_bg_focus    = M.bg
M.taglist_bg_empty    = M.bg
M.taglist_bg_occupied = M.bg
M.taglist_bg_urgent   = M.bg

M.taglist_fg_focus    = M.white
M.taglist_fg_empty    = M.disabled
M.taglist_fg_occupied = M.paleblue
M.taglist_fg_urgent   = M.red

-- Tasklist colors
M.tasklist_bg_normal    = M.bg
M.tasklist_fg_normal    = M.disabled
M.tasklist_bg_focus     = M.bg
M.tasklist_fg_focus     = M.fg
M.tasklist_border       = M.selected
M.tasklist_border_focus = M.accent

-- Widgets colors
M.widgets_shape = require "util.pill_shape"
M.battery_fg    = M.green
M.brightness_fg = M.blue
M.volume_fg     = M.purple
M.network_fg    = M.red
M.keyboard_fg   = M.orange
M.clock_fg      = M.yellow

-- Hotkeys popup
M.hotkeys_opacity          = 1
M.hotkeys_bg               = M.bg_dark .. "D0"
M.hotkeys_fg               = M.fg
-- theme.hotkeys_border_width     = 0
-- theme.hotkeys_border_color     = theme.accent
M.hotkeys_modifiers_fg     = M.paleblue
M.hotkeys_label_fg         = M.bg_dark
M.hotkeys_font             = M.font
M.hotkeys_description_font = M.font
M.hotkeys_group_margin     = 28

-- Add utilities directory

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
M.titlebar_bg_normal = M.bg
M.titlebar_bg_focus  = M.bg
M.titlebar_fg_normal = M.disabled
M.titlebar_fg_focus  = M.fg

-- Generate taglist squares:
local taglist_square_size = dpi(4)
M.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, M.fg_normal
)
M.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, M.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
M.notification_font         = "SauceCodePro Nerd Font 12"
M.notification_bg           = M.bg
M.notification_fg           = M.fg
-- theme.notification_border_color = theme.accent
M.notification_border_width = 0
-- theme.notification_opacity      = 0.8

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
M.menu_submenu_icon = themes_path.."default/submenu.png"
M.menu_height       = dpi(20)
M.menu_width        = dpi(240)
-- theme.menu_border_color = theme.accent
M.bg_normal         = M.bg_dark .. "C0"
M.fg_normal         = M.fg
M.bg_focus          = M.selected .. "C0"
M.fg_focus          = M.accent
M.menu_font         = "SauceCodePro Nerd Font 12"

-- Define the image to load
M.wallpaper = "/home/marko/.config/awesome/util/wallpaper.jpg"

-- You can use your own layout icons like this:
-- theme.layout_fairh      = themes_path.."default/layouts/fairhw.png"
M.layout_fairv      = themes_path.."default/layouts/fairvw.png"
M.layout_floating   = themes_path.."default/layouts/floatingw.png"
M.layout_magnifier  = themes_path.."default/layouts/magnifierw.png"
M.layout_max        = themes_path.."default/layouts/maxw.png"
-- theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
M.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
-- theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
M.layout_tile       = themes_path.."default/layouts/tilew.png"
-- theme.layout_tiletop    = themes_path.."default/layouts/tiletopw.png"
-- theme.layout_spiral     = themes_path.."default/layouts/spiralw.png"
M.layout_dwindle    = themes_path.."default/layouts/dwindlew.png"
M.layout_cornernw   = themes_path.."default/layouts/cornernww.png"
-- theme.layout_cornerne   = themes_path.."default/layouts/cornernew.png"
-- theme.layout_cornersw   = themes_path.."default/layouts/cornersww.png"
-- theme.layout_cornerse   = themes_path.."default/layouts/cornersew.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
M.icon_theme = "Sweet-Blue"

return M
