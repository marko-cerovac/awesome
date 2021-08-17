-- Standard awesome library
local gears = require("gears")

-- Widget and layout library
local wibox = require("wibox")

-- Themes library
local beautiful = require("beautiful")


-- Define the powerline arrow shape pointing left
local powerArrow = function (cr, width, height)
    gears.shape.powerline(cr, width, height, -height/2)
end

-- Arrow right sepparator
local arrowRight = function(args)

    local arrowBg = args.bg or beautiful.bg_alt
    local arrowFg = args.fg or beautiful.accent
    local padding = args.padding or 5

    local arrow = wibox.widget {
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
    }
    return arrow
end

-- Arrow left sepparator
local arrowLeft = function(args)

    local arrowBg = args.bg or beautiful.bg_alt
    local arrowFg = args.fg or beautiful.accent
    local padding = args.padding or 5

    local arrow = wibox.widget {
        {
            {
                {
                    shape = powerArrow,
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
        shape = powerArrow,
        widget = wibox.container.background
    }
    return arrow
end

return {
	powerArrow = powerArrow,
	arrowRight = arrowRight,
	arrowLeft = arrowLeft
}

