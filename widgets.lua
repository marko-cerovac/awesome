
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")
local lain = require("lain")

-- Widgets
-- local widgets = require("widgets")

-- Themes library
local beautiful = require("beautiful")

-- Notification library
local menubar = require("menubar")
-- local hotkeys_popup = require("awful.hotkeys_popup")

-- Markup and separators
local markup = lain.util.markup

-- Widgets
local widgets = {}

-- Arrow right sepparator
widgets.arrowRight = function(args)

    local arrowBg = args.bg or beautiful.bg_alt
    local arrowFg = args.fg or beautiful.accent
    local padding = args.padding or 5

    local arrow = wibox.widget {
        {
            {
                {
                    shape = gears.shape.powerline,
                    color = arrowFg,
                    forced_width = 12,
                    widget = wibox.widget.separator
                },
                top = padding,
                bottom = padding,
                widget = wibox.container.margin
            },
            layout = wibox.layout.fixed.horizontal
        },
        bg = arrowBg,
        shape = gears.shape.powerline,
        widget = wibox.container.background
    }
    return arrow
end

-- Arrow left sepparator
widgets.arrowLeft = function(args)

    local arrowBg = args.bg or beautiful.bg_alt
    local arrowFg = args.fg or beautiful.accent
    local padding = args.padding or 5

    local arrow = wibox.widget {
        {
            {
                {
                    {
                        shape = gears.shape.powerline,
                        color = arrowFg,
                        forced_width = 15,
                        widget = wibox.widget.separator
                    },
                    top = padding,
                    bottom = padding,
                    widget = wibox.container.margin
                },
                layout = wibox.layout.fixed.horizontal
            },
            bg = arrowBg,
            shape = gears.shape.powerline,
            widget = wibox.container.background
        },
        direction = "south",
        widget = wibox.container.rotate
    }
    return arrow
end

-- Keyboard map indicator and switcher
widgets.keyboardlayout = wibox.widget {
    {
        {
            {
                {
                    layout = wibox.layout.fixed.horizontal,
                    -- wibox.widget.textbox(" "),
                    wibox.widget.textbox(" "),
                    awful.widget.keyboardlayout()
                },
                direction = "south",
                widget = wibox.container.rotate
            },
            left = 20,
            right = 22,
            widget = wibox.container.margin
        },
        fg = beautiful.white,
        bg = beautiful.bg_alt,
        shape = gears.shape.powerline,
        widget = wibox.container.background
    },
    direction = "south",
    widget = wibox.container.rotate
}

-- Create a textclock widget
widgets.textclock = wibox.widget {
    {
        {
            {
                {
                    {
                        text = " ",
                        widget = wibox.widget.textbox
                    },
                    {
                        widget = wibox.widget.textclock
                    },
                    widget = wibox.layout.fixed.horizontal
                },
                direction = "south",
                widget = wibox.container.rotate
            },
            left = 20,
            right = 20,
            widget = wibox.container.margin
        },
        fg = beautiful.white,
        bg = beautiful.bg_alt,
        shape = gears.shape.powerline,
        widget = wibox.container.background
    },
    direction = "south",
    widget = wibox.container.rotate
}

-- OS logo
widgets.OSlogo = wibox.widget {
    {
        {
            {
                {
                    text = "  ",
                    valign = "center",
                    align = "center",
                    font = "SauceCodePro Nerd Font 18",
                    -- forced_width = 100,
                    widget = wibox.widget.textbox,
                },
                widget = wibox.container.rotate,
                direction = "south"
            },
            left = 34,
            right = 36,
            widget = wibox.container.margin
        },
        bg = beautiful.accent,
        fg = beautiful.bg,
        shape = gears.shape.rectangular_tag,
        shape_clip = true,
        widget = wibox.container.background,
    },
    widget = wibox.container.rotate,
    direction = "south",
}

widgets.sleep = wibox.widget {
    {
        {
            text = "  ",
            valign = "center",
            align = "center",
            font = "SauceCodePro Nerd Font 12",
            widget = wibox.widget.textbox
        },
        left = 20,
        right = 20,
        widget = wibox.container.margin
    },
    bg = beautiful.accent,
    fg = beautiful.bg,
    shape = gears.shape.rectangular_tag,
    shape_clip = true,
    widget = wibox.container.background
}

widgets.poweroff = wibox.widget {
    {
        {
            text = "  ",
            valign = "center",
            align = "center",
            font = "SauceCodePro Nerd Font 12",
            widget = wibox.widget.textbox
        },
        left = 16,
        right = 12,
        widget = wibox.container.margin
    },
    bg = beautiful.accent,
    fg = beautiful.bg,
    shape = gears.shape.rectangular_tag,
    shape_clip = true,
    widget = wibox.container.background
}

-- Volume widget
widgets.myvolume = lain.widget.pulse({
    timeout = 20,
    settings = function ()
        if volume_now.muted == "yes" then
            widget:set_markup(markup.font(beautiful.font," Muted"))
            return
        else
            widget:set_markup(markup.font(beautiful.font, " "  .. volume_now.right .. "% "))
        end
    end
})
widgets.volume = wibox.widget {
    {
        {
            {
                {
                    widgets.myvolume.widget,
                    layout = wibox.layout.align.horizontal
                },
                left = 20,
                right = 20,
                widget = wibox.container.margin
            },
            direction = "south",
            widget = wibox.container.rotate

        },
        bg = beautiful.disabled,
        fg = beautiful.purple,
        shape = gears.shape.powerline,
        widget = wibox.container.background
    },
    direction = "south",
    widget = wibox.container.rotate
}

-- Brightness widget
widgets.brightnessLevel, widgets.brightnessTimer = awful.widget.watch(
    'brightness',
    60,
    function(widget, stdout)
        widget:set_markup(stdout:gsub("\n", ""))
        widget.align = "center"
    end)
widgets.brightness = wibox.widget {
    {
        {
            wibox.widget.textbox(" "),
            widgets.brightnessLevel,
            layout = wibox.layout.align.horizontal
        },
        left = 20,
        right = 20,
        widget = wibox.container.margin
    },
    bg = beautiful.red,
    fg = beautiful.bg_alt,
    shape = gears.shape.powerline,
    forced_width = 200,
    widget = wibox.container.background
}

-- Battey widget
widgets.mybattery = lain.widget.bat({
    timeout = 30,
    battery = "BAT0",
    ac = "AC",
    settings = function ()
        if bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(beautiful.font, " " .. bat_now.perc .. "% (Charging)"))
                return
            elseif tonumber(bat_now.perc) <= 5 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            elseif tonumber(bat_now.perc) <= 15 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            elseif tonumber(bat_now.perc) <= 30 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            elseif tonumber(bat_now.perc) <= 50 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            elseif tonumber(bat_now.perc) <= 90 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            elseif tonumber(bat_now.perc) <= 100 then
                widget:set_markup(markup.font(beautiful.font,"  " .. bat_now.perc .. "% "))
            end
        else
            widget:set_markup()
        end
        bat_notification_charged_preset.timeout = 120
        bat_notification_charged_preset.title = " Battery full"
        bat_notification_charged_preset.bg = beautiful.bg_alt
        bat_notification_charged_preset.fg = beautiful.white
        bat_notification_low_preset.timeout = 120
        bat_notification_low_preset.title = " Battery low"
        bat_notification_low_preset.bg = beautiful.bg_alt
        bat_notification_low_preset.fg = beautiful.white
        bat_notification_critical_preset.timeout = 30
        bat_notification_critical_preset.title = " Battery critical"
        bat_notification_critical_preset.bg = beautiful.bg_alt
        bat_notification_critical_preset.fg = beautiful.red
    end,
})
widgets.battery = wibox.widget {
    {
        {
            {
                {
                    widgets.mybattery.widget,
                    layout = wibox.layout.align.horizontal
                },
                left = 20,
                right = 20,
                widget = wibox.container.margin
            },
            direction = "south",
            widget = wibox.container.rotate
        },
        bg = beautiful.disabled,
        fg = beautiful.green,
        shape = gears.shape.powerline,
        widget = wibox.container.background
    },
    direction = "south",
    widget = wibox.container.rotate
}


return widgets
