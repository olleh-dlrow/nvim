local cfg = require("global_configs")
require("lspsaga").setup({
    lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = false,
        sign_priority = 40,
        virtual_text = true,
    },
})

-- floating terminal
keymap({"n", "t"}, cfg.keys.terminal_toggle, "<cmd>Lspsaga term_toggle<CR>")

