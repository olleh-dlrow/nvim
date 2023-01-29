local cfg = require("global_configs").plugins.surround

local status, surround = pcall(require, "nvim-surround")
if not status then
    vim.notify("没有找到 nvim-surround")
    return
end

local opts = {
}

surround.setup(opts)

