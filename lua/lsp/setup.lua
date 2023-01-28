local status, mason = pcall(require, "mason")
if not status then
  vim.notify("没有找到 mason")
  return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("没有找到 mason-lspconfig")
  return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("没有找到 lspconfig")
  return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
mason.setup({
  ui = {
    icons = {
      package_installed     = "✓",
      package_pending       = "➜",
      package_uninstalled   = "✗",
    },
  },
})

function new_server_config(_server_name, _script_suffix)
  return {
    server_name   = _server_name,
    script_suffix = _script_suffix,
  }
end

server_cfgs = {
  new_server_config("sumneko_lua"   , "lua"           ), -- lua/lsp/config/lua.lua
  new_server_config("bashls"        , "bash"          ),
  new_server_config("pyright"       , "pyright"       ),
  new_server_config("jsonls"        , "json"          ),
  new_server_config("rust_analyzer" , "rust"          ),
  new_server_config("clangd"        , "clangd"        ),
  new_server_config("cmake"         , "cmake"         ),
--new_server_config("taplo"         , "taplo"         ), -- toml
--new_server_config("gopls"         , "gopls"         ),
--new_server_config("remark_ls"     , "markdown"      ),
--new_server_config("html"          , "html"          ),
--new_server_config("cssls"         , "css"           ),
--new_server_config("emmet_ls"      , "emmet"         ),
--new_server_config("tsserver"      , "typescript"    ),
--new_server_config("yamlls"        , "yamlls"        ),
--new_server_config("dockerls"      , "docker"        ),
--new_server_config("tailwindcss"   , "tailwindcss"   ),
}

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
local ensure_installed_list = {}
for i, cfg in pairs(server_cfgs) do
  ensure_installed_list[i] = cfg.server_name
end
mason_config.setup({
  ensure_installed = ensure_installed_list
})

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {}
for _, cfg in pairs(server_cfgs) do
  servers[cfg.server_name] = require("lsp.config." .. cfg.script_suffix)
end

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end

require("lsp.ui")

