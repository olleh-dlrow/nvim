local cfg = require("global_configs")
local autopairs = require_plugin("nvim-autopairs")

local remap = vim.api.nvim_set_keymap

local opts = {
    map_cr = true,
    map_bs = true,
}

autopairs.setup(opts)

-- -- skip it, if you use another global object
-- _G.MUtils= {}
--
-- -- old version
-- -- MUtils.completion_confirm=function()
--   -- if vim.fn["coc#pum#visible"]() ~= 0 then
--     -- return vim.fn["coc#_select_confirm"]()
--   -- else
--     -- return npairs.autopairs_cr()
--   -- end
-- -- end
--
-- -- new version for custom pum
-- MUtils.completion_confirm=function()
--     if vim.fn["coc#pum#visible"]() ~= 0 then
--         return vim.fn["coc#pum#confirm"]()
--     else
--         return autopairs.autopairs_cr()
--     end
-- end
--
-- -- MUtils.completion_refresh_on_backspace=function ()
-- --     
-- -- end
--
-- remap('i', cfg.keys.cmp_confirm, 'v:lua.MUtils.completion_confirm()', {silent = true, expr = true , noremap = true})
--
