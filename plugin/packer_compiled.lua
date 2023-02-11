-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/shuwenchen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/shuwenchen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/shuwenchen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/shuwenchen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/shuwenchen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Colorizer = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/Colorizer",
    url = "https://github.com/chrisbra/Colorizer"
  },
  ["Comment.nvim"] = {
    config = { 'require_plugin("plugin-config.comment")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { 'require_plugin("plugin-config.bufferline")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-dictionary"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-nvim-lsp"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { 'require_plugin("plugin-config.dashboard")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["fidget.nvim"] = {
    config = { 'require_plugin("plugin-config.fidget")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["hop.nvim"] = {
    config = { 'require_plugin("plugin-config.hop")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require_plugin("plugin-config.indent-blankline")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { 'require_plugin("lsp.lspsaga")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine-lsp-progress"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { 'require_plugin("plugin-config.lualine")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require_plugin("plugin-config.autopairs")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-file-operations"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-lsp-file-operations",
    url = "https://github.com/antosha417/nvim-lsp-file-operations"
  },
  ["nvim-lspconfig"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    config = { 'require_plugin("plugin-config.navic")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-surround"] = {
    config = { 'require_plugin("plugin-config.surround")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { 'require_plugin("plugin-config.nvim-tree")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require_plugin("plugin-config.nvim-treesitter")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { 'require_plugin("plugin-config.project")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["schemastore.nvim"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { 'require_plugin("plugin-config.symbols_outline")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-env.nvim"] = {
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/telescope-env.nvim",
    url = "https://github.com/LinArcX/telescope-env.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require_plugin("plugin-config.telescope")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { 'require_plugin("plugin-config.toggleterm")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { 'require_plugin("plugin-config.trouble")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-visual-multi"] = {
    config = { 'require_plugin("plugin-config.multi_cursor")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-wakatime"] = {
    config = { "" },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["which-key.nvim"] = {
    config = { 'require_plugin("plugin-config.which_key")' },
    loaded = true,
    path = "/Users/shuwenchen/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)

time([[Config for mason-lspconfig.nvim]], false)
-- Config for: vim-wakatime
time([[Config for vim-wakatime]], true)

time([[Config for vim-wakatime]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require_plugin("plugin-config.which_key")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require_plugin("plugin-config.autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)

time([[Config for nvim-cmp]], false)
-- Config for: nvim-lsp-file-operations
time([[Config for nvim-lsp-file-operations]], true)

time([[Config for nvim-lsp-file-operations]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)

time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
require_plugin("plugin-config.surround")
time([[Config for nvim-surround]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require_plugin("plugin-config.nvim-tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require_plugin("plugin-config.nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-navic
time([[Config for nvim-navic]], true)
require_plugin("plugin-config.navic")
time([[Config for nvim-navic]], false)
-- Config for: Colorizer
time([[Config for Colorizer]], true)

time([[Config for Colorizer]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require_plugin("plugin-config.comment")
time([[Config for Comment.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)

time([[Config for LuaSnip]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require_plugin("plugin-config.bufferline")
time([[Config for bufferline.nvim]], false)
-- Config for: cmp-buffer
time([[Config for cmp-buffer]], true)

time([[Config for cmp-buffer]], false)
-- Config for: cmp_luasnip
time([[Config for cmp_luasnip]], true)

time([[Config for cmp_luasnip]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)

time([[Config for nvim-web-devicons]], false)
-- Config for: cmp-dictionary
time([[Config for cmp-dictionary]], true)

time([[Config for cmp-dictionary]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
require_plugin("plugin-config.project")
time([[Config for project.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)

time([[Config for mason.nvim]], false)
-- Config for: schemastore.nvim
time([[Config for schemastore.nvim]], true)

time([[Config for schemastore.nvim]], false)
-- Config for: cmp-nvim-lsp
time([[Config for cmp-nvim-lsp]], true)

time([[Config for cmp-nvim-lsp]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)

time([[Config for rust-tools.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
require_plugin("plugin-config.symbols_outline")
time([[Config for symbols-outline.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
require_plugin("plugin-config.fidget")
time([[Config for fidget.nvim]], false)
-- Config for: cmp-nvim-lsp-signature-help
time([[Config for cmp-nvim-lsp-signature-help]], true)

time([[Config for cmp-nvim-lsp-signature-help]], false)
-- Config for: friendly-snippets
time([[Config for friendly-snippets]], true)

time([[Config for friendly-snippets]], false)
-- Config for: cmp-cmdline
time([[Config for cmp-cmdline]], true)

time([[Config for cmp-cmdline]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
require_plugin("plugin-config.hop")
time([[Config for hop.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require_plugin("plugin-config.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require_plugin("plugin-config.indent-blankline")
time([[Config for indent-blankline.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require_plugin("plugin-config.toggleterm")
time([[Config for toggleterm.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)

time([[Config for lspkind-nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)

time([[Config for tokyonight.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require_plugin("lsp.lspsaga")
time([[Config for lspsaga.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require_plugin("plugin-config.trouble")
time([[Config for trouble.nvim]], false)
-- Config for: lualine-lsp-progress
time([[Config for lualine-lsp-progress]], true)

time([[Config for lualine-lsp-progress]], false)
-- Config for: neodev.nvim
time([[Config for neodev.nvim]], true)

time([[Config for neodev.nvim]], false)
-- Config for: cmp-path
time([[Config for cmp-path]], true)

time([[Config for cmp-path]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require_plugin("plugin-config.lualine")
time([[Config for lualine.nvim]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
require_plugin("plugin-config.multi_cursor")
time([[Config for vim-visual-multi]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'dashboard-nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
