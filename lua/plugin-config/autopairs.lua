local cfg = require("global_configs").plugins.autopairs

local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
    vim.notify("没有找到 autopairs")
    return
end

local opts = {}

autopairs.setup(opts)
