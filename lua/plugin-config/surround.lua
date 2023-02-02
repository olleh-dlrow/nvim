local cfg = require("global_configs").plugins.surround
local surround = require_plugin("nvim-surround")

local opts = {
    keymaps = {
        insert = "",
        insert_line = "",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
    }
}

surround.setup(opts)

