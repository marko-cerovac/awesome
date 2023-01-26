local gears = require "gears"

modkey = "Mod4"

globalkeys = gears.table.join(
    require "mappings.control",
    require "mappings.launch",
    require "mappings.fn-keys"
)

clientkeys = gears.table.join(
    require "mappings.client"
)

clientbuttons = gears.table.join(
    require "mappings.mouse"
)
