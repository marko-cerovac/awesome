local awful   = require "awful"
local gears   = require "gears"
local hotkeys = require "awful.hotkeys_popup"
local widgets = require "bar.widgets"

modkey = "Mod4"


globalkeys = gears.table.join(
    require "mappings.control",
    require "mappings.launch",
    require "mappings.fn-keys"
)

clientkeys = gears.table.join(
    require "mappings.client",
    require "mappings.workspace"
)

require "mappings.mouse"
