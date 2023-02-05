if not vim.g.vscode then
    local cfg = require("global_configs")
    require("utils.global")
    require("basic")
    require("keybindings")
    require("colorscheme")
    -- plugins
    require("plugins")
    require("autocmds")

    -- lsp
    if cfg.lsp.manager == "mason" then
        require("lsp.setup")
        require("cmp.setup")
    elseif cfg.lsp.manager == "coc" then
        require("coc.setup")
    end
else

end
