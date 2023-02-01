-- warning: packer.use.config可以设置为string或function，之后使用loadstring进行程序加载
-- 问题在于，如果使用function作为入参，那么通过某个变量传入就可能出问题，因此这里使用string解析
local function get_load_string(script_name)
    -- local cmd = "local status, _ = pcall(require, \"" .. script_name .. "\")\n"
    --             ..  "if not status then\n"
    --             ..      "vim.notify(\"not find " .. script_name .. "\")\n"
    --             ..      "return\n"
    --             ..  "end\n"
    return 'require_plugin("' .. script_name .. '")'
end

local M = {
    icons = {
        error = " ",
        warn  = " ",
        hint  = " ",
        info  = " ",
    },

    config_path = vim.fn.stdpath("config"),
    enable_magic_search = true,

    -- 按键设置
    -- key settings
    keys = {
      leader_key = " ",
      -- : 模式
      c_next_item = "<C-j>",
      c_prev_item = "<C-k>",
      -- normal 模式
      n_save = "<leader>w", -- :w
      n_save_quit = "<leader>wq", --:wq
      n_save_all = "<leader>wa", -- :wa
      -- n_save_all_quit = "<leader>qa", -- :wqa
      n_force_quit = "<leader>q", -- :qa!
      n_v_5j = "<C-j>",
      n_v_5k = "<C-k>",

      n_v_10k = "<C-u>",
      n_v_10j = "<C-d>",

      -- cmp 快捷键
      cmp_complete = "<A-.>",
      cmp_abort = "<A-,>",
      cmp_confirm = "<CR>",
      cmp_scroll_doc_up = "<C-u>",
      cmp_scroll_doc_down = "<C-d>",
      cmp_select_prev_item = "<C-k>",
      cmp_select_next_item = "<C-j>",

      -- luasnip
      snip_jump_next = "<C-l>",
      snip_jump_prev = "<C-h>",
      snip_next_choice = "<C-j>",
      snip_prev_choice = "<C-k>",

      -- 窗口设置
      -- window settings
      s_windows = {

        enable = true,

        -- 窗口开关
        split_vertically = "sv",
        split_horizontally = "sh",
        close = "sc",
        close_others = "so",

        -- 窗口跳转
        -- jump_left = "<A-h>",
        -- jump_right = "<A-l>",
        -- jump_up = "<A-k>",
        -- jump_down = "<A-j>",

        -- <leader> + hjkl 窗口之间跳转
        jump_left = "<leader>h",
        jump_right = "<leader>l",
        jump_up = "<leader>k",
        jump_down = "<leader>j",

        -- 窗口比例控制
        width_decrease = "s,",
        width_increase = "s.",
        height_decrease = "sj",
        height_increase = "sk",
        size_equal = "s=",
      },

      s_tab = {
        split = "ts",
        prev = "th",
        next = "tl",
        first = "tj",
        last = "tk",
        close = "tc",
      },

      fold = {
        open = "Z",
        close = "zz",
      },

      format = "<leader>f",

      terminal_to_normal = "<Esc>",
    },

    -- 插件设置
    -- plugin settings
    plugins = {
        nvim_tree = {
            rel_url = "kyazdani42/nvim-tree.lua",
            req_tbl = {"kyazdani42/nvim-web-devicons"},
            cfg_lua = get_load_string("plugin-config.nvim-tree"),

            -- toggle = "<A-m>",
            toggle = "<leader>m",
            edit = { "o", "<2-LeftMouse>" },
            close = "<ESC>",
            system_open = "<CR>",
            -- v分屏打开文件
            vsplit = "sv",
            -- h分屏打开文件
            split = "sh",
            -- toggle .gitignore (git enable)
            toggle_git_ignored = "i",
            -- Hide (dotfiles)
            toggle_dotfiles = ".",
            -- togglle custom config
            toggle_custom = "u",

            refresh = "R",

            collapse_all = "H",
            close_node = "h",

            -- 文件操作
            create = "a",
            remove = "d",
            rename = "r",
            cut = "x",
            copy = "c",
            paste = "p",
            copy_name = "y",
            copy_path = "Y",
            copy_absolute_path = "gy",
            toggle_file_info = "I",
            tabnew = "t",
            -- 进入下一级
            cd = "]",
            -- 进入上一级
            dir_up = "[",
        },

        nvim_lsp_file_operations = {

            rel_url = 'antosha417/nvim-lsp-file-operations',
            req_tbl = {
                { "nvim-lua/plenary.nvim" },
                { "kyazdani42/nvim-tree.lua" },
            },
        },

        buffer_line = {

            rel_url = "akinsho/bufferline.nvim",
            req_tbl = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
            cfg_lua = get_load_string("plugin-config.bufferline"),

            prev = "<C-h>",
            next = "<C-l>",
            close = "<C-w>",
            -- close = "<leader>bc",
            close_left = "<leader>bh",
            close_right = "<leader>bl",
            close_others = "<leader>bo",
            close_pick = "<leader>bp",
        },

        lua_line = {
            rel_url = "nvim-lualine/lualine.nvim",
            req_tbl = { "kyazdani42/nvim-web-devicons" },
            cfg_lua = get_load_string("plugin-config.lualine")
        },

        tree_sitter = {

            rel_url = "nvim-treesitter/nvim-treesitter",
            req_tbl = {
				{ "p00f/nvim-ts-rainbow" },
				{ "JoosepAlviste/nvim-ts-context-commentstring" },
				{ "windwp/nvim-ts-autotag" },
				{ "nvim-treesitter/nvim-treesitter-refactor" },
				{ "nvim-treesitter/nvim-treesitter-textobjects" },
			},
            cfg_lua = get_load_string("plugin-config.nvim-treesitter")
        },

		-- Bug: https://github.com/nvim-telescope/telescope.nvim/issues/699
		-- Sol: use zx before zc or zo 
		-- Ref: see bug.
        telescope = {

            rel_url = "nvim-telescope/telescope.nvim",
            req_tbl = {
                -- telescope extensions
				{ "LinArcX/telescope-env.nvim" },
				{ "nvim-telescope/telescope-ui-select.nvim" },
                { "nvim-lua/plenary.nvim" },
			},
            cfg_lua = get_load_string("plugin-config.telescope"),

            find_files = "<C-p>",
            live_grep = "<C-f>",

            -- 上下移动
            move_selection_next = "<C-j>",
            move_selection_previous = "<C-k>",
            -- move_selection_next = "<C-n>",
            -- move_selection_previous = "<C-p>",
            -- 历史记录
            cycle_history_next = "<Down>",
            cycle_history_prev = "<Up>",
            -- 关闭窗口
            -- close = "<C-c>",
            close = "<esc>",
            -- 预览窗口上下滚动
            preview_scrolling_up = "<C-u>",
            preview_scrolling_down = "<C-d>",
        },

        -- warning: config has some changes after this version
        -- commit = "f7d623457d6621b25a1292b24e366fae40cb79ab",
        dash_board = {
            -- uninstall = true,

            rel_url = "glepnir/dashboard-nvim",
            req_tbl = {{"nvim-tree/nvim-web-devicons"}},
            cfg_lua = get_load_string("plugin-config.dashboard"),
            event = "VimEnter",
        },

        project = {

            rel_url = "ahmedkhalf/project.nvim",
            cfg_lua = get_load_string("plugin-config.project"),
        },

        inline_blankline = {

            rel_url = "lukas-reineke/indent-blankline.nvim",
            cfg_lua = get_load_string("plugin-config.indent-blankline"),
        },

        comment = {

            rel_url = "numToStr/Comment.nvim",
            cfg_lua = get_load_string("plugin-config.comment"),

            -- Normal 模式快捷键
            toggler = {
                line = "gcc", -- 行注释
                block = "gbc", -- 块注释
            },
            -- Visual 模式
            opleader = {
                line = "gc",
                bock = "gb",
            },
        },

        -- warning: some errors with <c-g>s in insert mode
        surround = {

            rel_url ="kylechui/nvim-surround",
            req_tbl = {
                { "nvim-treesitter/nvim-treesitter" },
                {  "nvim-treesitter/nvim-treesitter-textobjects" }
            },
            cfg_lua = get_load_string("plugin-config.surround"),
        },

        autopairs = {
            uninstall = false,

            rel_url = "windwp/nvim-autopairs",
            cfg_lua = get_load_string("plugin-config.autopairs"),
        },

        -- css_color = {
        --
        --     rel_url = "ap/vim-css-color"
        -- },

        colorizer = {

            rel_url = "chrisbra/Colorizer",
        },
        --------------------------------------
        --------------- lsp ------------------
        --------------------------------------

        mason = {
            uninstall = false,

            rel_url = "williamboman/mason.nvim",
        },

        mason_lspconfig = {
            uninstall = false,

            rel_url = "williamboman/mason-lspconfig.nvim",
        },

        nvim_lspconfig = {
            uninstall = false,

            rel_url = "neovim/nvim-lspconfig",
        },

        nvim_cmp = {
            uninstall = false,

            rel_url = "hrsh7th/nvim-cmp",
        },

        lua_snip = {
            uninstall = false,

            rel_url = "L3MON4D3/LuaSnip",
        },

        cmp_luasnip = {
            uninstall = false,

            rel_url = "saadparwaiz1/cmp_luasnip",
        },

        cmp_vsnip = {
            uninstall = false,

            rel_url = "hrsh7th/cmp-vsnip",
        },

        cmp_nvim_lsp = {
            uninstall = false,

            rel_url = "hrsh7th/cmp-nvim-lsp",
        },

        cmp_buffer = {
            uninstall = false,

            rel_url = "hrsh7th/cmp-buffer",
        },

        cmp_path = {
            uninstall = false,

            rel_url = "hrsh7th/cmp-path",
        },

        cmp_cmdline = {
            uninstall = false,

            rel_url = "hrsh7th/cmp-cmdline",
        },

        cmp_nvim_lsp_signature_help = {
            uninstall = false,

            rel_url = "hrsh7th/cmp-nvim-lsp-signature-help",
        },

        friendly_snippets = {
            uninstall = false,

            rel_url = "rafamadriz/friendly-snippets",
        },

        lspkind_nvim = {
            uninstall = false,

            rel_url = "onsails/lspkind-nvim",
        },

        lspsaga = {
            uninstall = false,

            rel_url = "tami5/lspsaga.nvim",
        },

        neodev = {
            uninstall = false,

            rel_url = "folke/neodev.nvim",
        },

        schemastore = {
            uninstall = false,

            rel_url = "b0o/schemastore.nvim",
        },

        rust_tools = {
            uninstall = false,

            rel_url = "simrat39/rust-tools.nvim",
        },

        coc = {
            uninstall = true,

            rel_url = "neoclide/coc.nvim",
            branch = "release",
        },

        omnisharp_vim = {
            uninstall = true,

            rel_url = "OmniSharp/omnisharp-vim",
        },
        --------------------------------------
        ----------- colorscheme --------------
        --------------------------------------
		-- warning: 这里有个位置的问题，即如果使用config来require对应的主题，则无法
		-- 应用设置，暂时的解决办法是，在colorscheme.lua中使用require，此时能够正常
		-- 配置
		-- tokyonight
        tokyonight = {

            rel_url = "folke/tokyonight.nvim",
        },

        -- mkdnflow = {
        --
        --     next_link = "gn",
        --     prev_link = "gp",
        --     next_heading = "gj",
        --     prev_heading = "gk",
        --     go_back = "<C-o>",
        --     follow_link = "gd",
        --     toggle_item = "tt",
        -- },


        -- toggleterm = {
        --

        --     -- <leader>ta 浮动命令行窗口
        --     toggle_window_A = "<leader>ta",
        --     -- <leader>tb 右侧命令行窗口
        --     toggle_window_B = "<leader>tb",
        --     -- <leader>tc 下方命令行窗口
        --     toggle_window_C = "<leader>tc",
        -- },

        -- venn = {
        --     -- toggle keymappings for venn using <leader>v
        --
        --     -- venn.nvim: enable or disable keymappings
        --     toggle = "<leader>v",
        --     -- draw a box by pressing "f" with visual selection
        --     draw_box = "f",
        -- },

        -- zen = {
        --
        --     toggle = "<leader>z",
        -- },
    },

    lsp = {
        manager = "mason", -- ["mason", "coc", nil]
        rename = "<leader>rn",
        code_action = "<leader>ca",
        format = "<leader>f",
        definition = "gd",
        references = "gr",
        hover = "gh",
        -- diagnostic
        open_flow = "gp",
        goto_next = "gj",
        goto_prev = "gk",
        -- typescript
        -- ts_organize = "gs",
        -- ts_rename_file = "gR",
        -- ts_add_missing_import = "gi",
        -- ts_remove_unused = "gu",
        -- ts_fix_all = "gf",
        -- ts_goto_source = "gD",
    },
}

return M
