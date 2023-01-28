-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.init({
    -- 关于snapshot的使用：
    -- PackerSnapshot v1.json 用于为当前的插件生成commits备份
    -- 当更新遇到bug时，可以使用PackerSnapshotRollback v1.json来进行恢复

    -- 锁定插件版本在snapshots目录
    snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
    -- 这里锁定插件版本在v1，不会继续更新插件
    snapshot = "v1.json",

    -- snapshot = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots") .. "/v1",

    -- 最大并发数
    max_jobs = 10,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    display = {
    -- 使用浮动窗口显示
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
    -- 预览哪些插件需要更新
    preview_updates = true,
})

packer.startup({
  function(use)
    -- Packer 可以升级自己
    use("wbthomason/packer.nvim")
    -------------------------- plugins -------------------------------------------
    -- use("lewis6991/impatient.nvim")
    -- use("nathom/filetype.nvim")

    -- nvim-tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugin-config.nvim-tree")
      end,
    })

    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
      config = function()
        require("plugin-config.bufferline")
      end,
    })

    -- lualine
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("plugin-config.lualine")
      end,
    })

    -- telescope
    -- Bug: https://github.com/nvim-telescope/telescope.nvim/issues/699
    -- Sol: use zx before zc or zo 
    -- Ref: see bug.
    use({
      "nvim-telescope/telescope.nvim",
      -- opt = true,
      -- cmd = "Telescope",
      requires = {
        -- telescope extensions
        { "LinArcX/telescope-env.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
      },
      config = function()
        require("plugin-config.telescope")
      end,
    })

    -- dashboard-nvim
    use({
      "glepnir/dashboard-nvim",
      -- warning: config has some changes after this version
      -- commit = "f7d623457d6621b25a1292b24e366fae40cb79ab",
      config = function()
        require("plugin-config.dashboard")
      end,
    })

    -- project
    use({
      "ahmedkhalf/project.nvim",
      config = function()
        require("plugin-config.project")
      end,
    })

    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        -- require("nvim-treesitter.install").update({ with_sync = true })
      end,
      requires = {
        { "p00f/nvim-ts-rainbow" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { "windwp/nvim-ts-autotag" },
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "nvim-treesitter/nvim-treesitter-textobjects" },
      },
      config = function()
        require("plugin-config.nvim-treesitter")
      end,
    })

    -- indent-blankline
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("plugin-config.indent-blankline")
      end,
    })
    --------------------- LSP --------------------
    -- installer
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- Snippet 引擎
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- UI 增强
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- 代码格式化
    -- use("mhartington/formatter.nvim")
    -- use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    -- TypeScript 增强
    -- use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    -- use("jose-elias-alvarez/typescript.nvim")

    -- Lua 增强
    use("folke/neodev.nvim")
    -- JSON 增强
    use("b0o/schemastore.nvim")
    -- Rust 增强
    use("simrat39/rust-tools.nvim")
    --------------------- colorschemes --------------------
    -- warning: 这里有个位置的问题，即如果使用config来require对应的主题，则无法
    -- 应用设置，暂时的解决办法是，在colorscheme.lua中使用require，此时能够正常
    -- 配置
    -- tokyonight
    use({
      "folke/tokyonight.nvim",
      -- config = function()
      --   require("plugin-config.tokyonight")
      -- end,
    })

    -- OceanicNext
    -- use({ "mhartington/oceanic-next", event = "VimEnter" })

    -- gruvbox
    -- use({
    --   "ellisonleao/gruvbox.nvim",
    --   requires = { "rktjmp/lush.nvim" },
    -- })

    -- zephyr
    -- use("glepnir/zephyr-nvim")

    -- nord
    -- use("shaunsingh/nord.nvim")

    -- onedark
    -- use("ful1e5/onedark.nvim")

    -- nightfox
    -- use("EdenEast/nightfox.nvim")

    -------------------------------------------------------
    -- vimspector
    -- Bug: vimspector unavailable: Requires Vim compiled with +python3
    -- Sol: pip(3) install neovim
    -- Ref: https://stackoverflow.com/questions/74036547/neovim-vimspector-unavailable-requires-vim-compiled-with-python3
--     use({
--       "puremourning/vimspector",
--       cmd = { "VimspectorInstall", "VimspectorUpdate" },
--       fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
--       config = function()
--         require("dap.vimspector")
--       end,
--     })
    ----------------------------------------------

    if paccker_bootstrap then
      packer.sync()
    end
  end,
    -- warning: use packer.init to Custom Initialization
    -- https://github.com/wbthomason/packer.nvim#custom-initialization
    -- config = {
    -- },
})
