local cfg = require("global_configs")
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
-- 自定义图标
vim.diagnostic.config({
  virtual_text = true,
  -- virtual_text = {
  --   prefix = 'x', -- Could be '■', '●', '▎', 'x',
  -- },
  signs = true,
  update_in_insert = false,
  underline = true,
  show_header = false,
  severity_sort = true,
  float = {
    source = "always",
    border = "rounded",
    style = "minimal",
    header = "",
    -- prefix = " ",
    -- max_width = 100,
    -- width = 60,
    -- height = 20,
  },
})

local signs = { Error = cfg.icons.error, Warn = cfg.icons.warn, Hint = cfg.icons.hint, Info = cfg.icons.info }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- :h vim.lsp.diagnostic.on_publish_diagnostics()
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = {
--             prefix = '●',
--         }
--     }
-- )
