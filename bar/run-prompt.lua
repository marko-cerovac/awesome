local awful = require "awful"

local M = {}

M.create = function (screen)
    screen.run_prompt = awful.widget.prompt()
    return screen.run_prompt
end

return M
