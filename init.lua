local cfg = require("global_configs")
require("utils.global")
require("basic")
require("keybindings")
-- plugins
require("plugins")
-- warning: 插件需要在主题设置之前加载需要的主题
require("colorscheme")
require("autocmds")

-- lsp
if cfg.lsp.manager == "mason" then
    require("lsp.setup")
    require("cmp.setup")
elseif cfg.lsp.manager == "coc" then
    require("coc.setup")
end

