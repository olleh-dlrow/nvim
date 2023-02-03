local M = {}

M.keyAttach = function(bufnr)
  local function buf_set_keymap(mode, lhs, rhs)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    keymap(mode, lhs, rhs, opts)
  end
  -- 绑定快捷键
  require("keybindings").mapLSP(buf_set_keymap)
end

-- 禁用格式化功能，交给专门插件插件处理
M.disableFormat = function(client)
  if vim.fn.has("nvim-0.8") == 1 then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

-- M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.flags = {
  debounce_text_changes = 150,
}

M.on_attach = function (client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        local navic = require_plugin("nvim-navic")
        if navic then
            navic.attach(client, bufnr)
        end
    else
        vim.notify("current server not support document symbol!")
    end
end

return M
