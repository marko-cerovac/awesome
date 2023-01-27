-- define global key mappings table
local global_keys = {}

-- add global mappings to the table
require "mappings.control".create(global_keys)
require "mappings.launch".create(global_keys)
require "mappings.fn-keys".create(global_keys)

-- create global mouse mappings
require "mappings.mouse"

return global_keys
