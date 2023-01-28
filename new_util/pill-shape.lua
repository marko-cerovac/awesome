local gears = require "gears"

local pill_shape = function (cr, width, height)
    gears.shape.rounded_bar(cr, width, height)
end

return pill_shape
