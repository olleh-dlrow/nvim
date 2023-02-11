local cfg = require("global_configs")
require_plugin("toggleterm").setup({

})

-- keymap({"n", "t"}, cfg.keys.terminal_toggle, "<cmd>ToggleTerm direction=vertical<cr>")
keymap({"n", "t"}, cfg.keys.terminal_toggle, '<cmd>exe v:count1 . "ToggleTerm"<cr>')

