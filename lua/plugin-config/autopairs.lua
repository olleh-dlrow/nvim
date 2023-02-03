local cfg = require("global_configs").plugins.autopairs
local autopairs = require_plugin("nvim-autopairs")

local opts = {
    map_cr = cfg.map_cr,
    map_bs = cfg.map_bs,
}

autopairs.setup(opts)

