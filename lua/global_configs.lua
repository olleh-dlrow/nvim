-- warning: packer.use.config可以设置为string或function，之后使用loadstring进行程序加载
-- 问题在于，如果使用function作为入参，那么通过某个变量传入就可能出问题，因此这里使用string解析

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
        -- c_history_next = "<C-n>",
        -- c_history_prev = "<C-p>",
        -- normal 模式
        n_reload_nvim = "<leader>sv",
        n_save = "", -- :w
        n_save_quit = "", --:wq
        n_save_all = "", -- :wa
        -- n_save_all_quit = "<leader>qa", -- :wqa
        n_force_quit = "", -- :qa!
        n_v_5j = "<C-j>",
        n_v_5k = "<C-k>",

        n_v_10k = "<C-u>",
        n_v_10j = "<C-d>",

        -- cmp 快捷键
        cmp_complete = "<A-.>",
        cmp_abort = "<C-e>",
        cmp_confirm = "<TAB>",
        cmp_scroll_doc_up = "<C-u>",
        cmp_scroll_doc_down = "<C-d>",
        cmp_select_prev_item = "<C-k>",
        cmp_select_next_item = "<C-j>",

        -- luasnip
        snip_jump_next = "<TAB>", -- same with cmp_confirm
        snip_jump_prev = "<S-TAB>",
        -- snip_next_choice = "<C-j>",
        -- snip_prev_choice = "<C-k>",

        -- quickfix
        quickfix_next = "<F8>",
        quickfix_prev = "<F7>",

        -- trouble toggle
        toggle_quickfix = "<leader>xq",
        toggle_loclist = "<leader>xl",
        toggle_close = "<leader>xx",
        -- hop
        hop_word = "<leader>w",
        hop_hint_char1_after = "f",
        hop_hint_char1_before = "F",
        hop_hint_pre_char1_after = "t",
        hop_hint_pre_char1_before = "T",
        -- 窗口设置
        -- window settings
        s_windows = {

            enable = false,

            -- 窗口开关
            split_vertically = "<C-w>v",
            split_horizontally = "<C-w>x",
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

            -- 窗口比例控制, x轴正方向右，y轴正方向上
            width_decrease = "{",
            width_increase = "}",
            height_decrease = "-",
            height_increase = "+",
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

        -- fold = {
        --   open = "Z",
        --   close = "zz",
        -- },

        -- terminal
        terminal_to_normal = "<Esc>",

        -- lspsaga terminal
        terminal_toggle = "<C-t>",
    },

    -- 插件设置
    -- plugin settings
    plugins = {
        nvim_tree = {
            rel_url = "kyazdani42/nvim-tree.lua",
            req_tbl = { "kyazdani42/nvim-web-devicons" },
            cfg_lua = "plugin-config.nvim-tree",

            -- toggle = "<A-m>",
            toggle = "<leader>m",
            -- edit = { "o", "<2-LeftMouse>" },
            -- close = "<ESC>",
            -- system_open = "<CR>",
            -- -- v分屏打开文件
            -- vsplit = "<C-w>v",
            -- -- h分屏打开文件
            -- split = "<C-w>s",
            -- -- toggle .gitignore (git enable)
            -- toggle_git_ignored = "i",
            -- -- Hide (dotfiles)
            -- toggle_dotfiles = ".",
            -- -- togglle custom config
            -- toggle_custom = "u",
            --
            -- refresh = "R",
            --
            -- collapse_all = "H",
            -- close_node = "h",
            --
            -- -- 文件操作
            -- create = "a",
            -- remove = "d",
            -- rename = "r",
            -- cut = "x",
            -- copy = "c",
            -- paste = "p",
            -- copy_name = "y",
            -- copy_path = "Y",
            -- copy_absolute_path = "gy",
            -- toggle_file_info = "I",
            -- tabnew = "t",
            -- -- 进入下一级
            -- cd = "]",
            -- -- 进入上一级
            -- dir_up = "[",
        },

        nvim_web_devicons = {
            rel_url = "kyazdani42/nvim-web-devicons",
        },

        nvim_lsp_file_operations = {

            rel_url = 'antosha417/nvim-lsp-file-operations',
            req_tbl = {
                { "nvim-lua/plenary.nvim" },
                { "kyazdani42/nvim-tree.lua" },
            },
        },

        buffer_line = {
            disable = false,
            rel_url = "akinsho/bufferline.nvim",
            req_tbl = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
            cfg_lua = "plugin-config.bufferline",

            prev = "<C-h>",
            next = "<C-l>",
            close = "<C-c>",
            -- close = "<leader>bc",
            close_left = "<leader>bh",
            close_right = "<leader>bl",
            close_others = "<leader>bo",
            close_pick = "<leader>bp",
        },

        lua_line = {
            disable = false,
            rel_url = "nvim-lualine/lualine.nvim",
            req_tbl = {
                "kyazdani42/nvim-web-devicons",
                "folke/tokyonight.nvim",
                'arkav/lualine-lsp-progress'
            },
            cfg_lua = "plugin-config.lualine"
        },


        tree_sitter = {
            disable = false,
            rel_url = "nvim-treesitter/nvim-treesitter",
            req_tbl = {
                { "p00f/nvim-ts-rainbow" },
                { "JoosepAlviste/nvim-ts-context-commentstring" },
                { "windwp/nvim-ts-autotag" },
                { "nvim-treesitter/nvim-treesitter-refactor" },
                { "nvim-treesitter/nvim-treesitter-textobjects" },
            },
            cfg_lua = "plugin-config.nvim-treesitter"
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
            cfg_lua = "plugin-config.telescope",

            find_files = "<leader>ff",
            live_grep  = "<leader>fg",
            buffers    = "<leader>fb",
            help_tags  = "<leader>fh",
            oldfiles   = "<leader>fo",

            -- 上下移动
            move_selection_next = "<C-j>",
            move_selection_previous = "<C-k>",
            -- 历史记录
            cycle_history_next = "<C-n>",
            cycle_history_prev = "<C-p>",
            toggle_preview = "<M-p>",
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
            req_tbl = { { "nvim-tree/nvim-web-devicons" } },
            cfg_lua = "plugin-config.dashboard",
            event = "VimEnter",
        },

        project = {

            rel_url = "ahmedkhalf/project.nvim",
            cfg_lua = "plugin-config.project",
        },

        indent_blankline = {
            rel_url = "lukas-reineke/indent-blankline.nvim",
            cfg_lua = "plugin-config.indent-blankline",
        },

        comment = {

            rel_url = "numToStr/Comment.nvim",
            cfg_lua = "plugin-config.comment",

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

            rel_url = "kylechui/nvim-surround",
            req_tbl = {
                { "nvim-treesitter/nvim-treesitter" },
                { "nvim-treesitter/nvim-treesitter-textobjects" }
            },
            cfg_lua = "plugin-config.surround",
        },

        autopairs = {
            uninstall = false,
            rel_url = "windwp/nvim-autopairs",
            cfg_lua = "plugin-config.autopairs",
            map_cr = true,
            -- warning: confict with vim-visual-multi, but it's not a very important function, just unuse it :)
            -- https://github.com/jiangmiao/auto-pairs/issues/326
            -- https://github.com/mg979/vim-visual-multi/issues/172
            map_bs = true,
        },

        colorizer = {
            rel_url = "chrisbra/Colorizer",
        },

        wakatime = {
            rel_url = 'wakatime/vim-wakatime',
        },

        which_key = {
            rel_url = "folke/which-key.nvim",
            cfg_lua = "plugin-config.which_key",
        },

        trouble = {
            rel_url = "folke/trouble.nvim",
            cfg_lua = "plugin-config.trouble",
            req_tbl = { "nvim-tree/nvim-web-devicons" },
        },

        hop = {
            rel_url = 'phaazon/hop.nvim',
            branch = "v2",
            cfg_lua = "plugin-config.hop",
        },

        multi_cursor = {
            disable = false,
            rel_url = 'mg979/vim-visual-multi',
            cfg_lua = "plugin-config.multi_cursor",
        },

        toggleterm = {
            rel_url = "akinsho/toggleterm.nvim",
            cfg_lua = "plugin-config.toggleterm",

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

        -- better UI for lsp oeprations
        lspsaga = {
            uninstall = false,
            rel_url = "glepnir/lspsaga.nvim",
            cfg_lua = "lsp.lspsaga",
            req_tbl = { { "nvim-tree/nvim-web-devicons" } },
        },

        -- help for neo lua api
        neodev = {
            uninstall = false,
            rel_url = "folke/neodev.nvim",
        },

        -- json schemas
        schemastore = {
            uninstall = false,
            rel_url = "b0o/schemastore.nvim",
        },

        rust_tools = {
            uninstall = false,
            rel_url = "simrat39/rust-tools.nvim",
        },

        omnisharp_vim = {
            uninstall = true,
            rel_url = "OmniSharp/omnisharp-vim",
        },

        nvim_navic = {
            rel_url = "SmiteshP/nvim-navic",
            req_tbl = { "neovim/nvim-lspconfig" },
            cfg_lua = "plugin-config.navic"
        },

        lualine_lsp_progress = {
            disable = false,
            rel_url = 'arkav/lualine-lsp-progress',
        },

        fidget = {
            rel_url = 'j-hui/fidget.nvim',
            cfg_lua = 'plugin-config.fidget'
        },

        symbols_outline = {
            rel_url = 'simrat39/symbols-outline.nvim',
            cfg_lua = 'plugin-config.symbols_outline'
        },

        -- null_ls = {
        --     rel_url = "jose-elias-alvarez/null-ls.nvim",
        --     cfg_lua = "plugin-config.null_ls",
        --     req_tbl = { "nvim-lua/plenary.nvim" },
        -- },
        --------------------------------------
        --------------- cmp ------------------
        --------------------------------------

        cmp_nvim_lsp = {
            uninstall = false,
            rel_url = "hrsh7th/cmp-nvim-lsp",
        },

        nvim_cmp = {
            uninstall = false,
            rel_url = "hrsh7th/nvim-cmp",
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

        lspkind_nvim = {
            uninstall = false,
            rel_url = "onsails/lspkind-nvim",
        },

        cmp_dictionary = {
            rel_url = 'uga-rosa/cmp-dictionary',
        },
        -- snippets
        -- TODO: 学习各种snippets的使用
        -- https://github.com/L3MON4D3/LuaSnip
        lua_snip = {
            uninstall = false,
            rel_url = "L3MON4D3/LuaSnip",
        },

        cmp_luasnip = {
            uninstall = false,
            rel_url = "saadparwaiz1/cmp_luasnip",
        },
        -- Set of preconfigured snippets for different languages.
        friendly_snippets = {
            uninstall = false,
            rel_url = "rafamadriz/friendly-snippets",
        },

        coc = {
            uninstall = true,
            rel_url = "neoclide/coc.nvim",
            branch = "release",
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



        -- venn = {
        --     -- toggle keymappings for venn using <leader>v
        --
        --     -- venn.nvim: enable or disable keymappings
        --     toggle = "<leader>v",
        --     -- draw a box by pressing "f" with visual selection
        --     draw_box = "f",
        -- },
    },

    lsp = {
        manager = "mason", -- ["mason", "coc", nil]
        ui_mode = "lspsaga", -- ["nvim", "lspsaga", nil]
        rename = "<leader>rn",
        code_action = "<leader>ca",
        format = "<leader>fm",
        peek_definition = "gd",
        definition = "gD",
        finder = "gr",
        references = "gR",
        hover = "K",
        -- diagnostic
        open_flow = "gp",
        goto_next = "]e",
        goto_prev = "[e",
        goto_next_error = "]E",
        goto_prev_error = "[E",


        toggle_outline = "<leader>O",
        toggle_symbols_tree_outline = "<leader>o",
        incoming_calls = "<leader>ci",
        outgoing_calls = "<leader>co",

        toggle_workspace_diagnostics = "<leader>xw",
        toggle_document_diagnostics = "<leader>xd",
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
