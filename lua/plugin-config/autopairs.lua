local cfg = require("global_configs")
local autopairs = require_plugin("nvim-autopairs")

local remap = vim.api.nvim_set_keymap

local opts = {
    map_cr = true,
    map_bs = true,
}

autopairs.setup(opts)

