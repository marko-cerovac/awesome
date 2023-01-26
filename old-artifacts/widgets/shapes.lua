local gears = require("gears")

local Shapes = {}

Shapes.pill = function (cr, width, height)
	gears.shape.rounded_bar(cr, width, height)
end

return Shapes
