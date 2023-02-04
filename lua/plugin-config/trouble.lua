local cfg = require("global_configs")
require_plugin("trouble").setup({

})

keymap("n", cfg.keys.toggle_quickfix, "<cmd>TroubleToggle quickfix<cr>")
keymap("n", cfg.keys.toggle_loclist, "<cmd>TroubleToggle loclist<cr>")
keymap("n", cfg.keys.toggle_close, "<cmd>TroubleToggle<cr>")

