-- Standard awesome library
local awful = require("awful")
local gears = require("gears")

-- Widget and layout library
local wibox = require("wibox")


local make_tags = function (s)
	-- Each screen has its own tag table.
	local names = { "  ", "  ", " 爵 ", "  ", " 拾 " }
	local layouts = {
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1] }
	awful.tag(names, s, layouts)
end

-- Click to switch to workspace
local taglist_buttons = gears.table.join(
awful.button({ }, 1, function(t) t:view_only() end),
awful.button({ modkey }, 1, function(t) if client.focus then client.focus:move_to_tag(t) end end))


local taglist = function (s)
local list = awful.widget.taglist {
	screen = s,
	filter =  awful.widget.taglist.filter.all,
	style = { },
	layout = {
		spacing = -14,
		layout = wibox.layout.fixed.horizontal
	},
	widget_template = {
		{
			{
				{
					id = 'text_role',
					-- font = 'SauceCodePro Bold Nerd Font 19',
					widget = wibox.widget.textbox
				},
				layout = wibox.layout.fixed.horizontal,
			},
			left = 16,
				right = 16,
				widget = wibox.container.margin
			},
			id = 'background_role',
			widget = wibox.container.background,
		},
		buttons = taglist_buttons
	}

	return list
end

return {
	taglist = taglist,
	make_tags = make_tags
}
