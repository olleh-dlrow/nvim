local lualine = require_plugin("lualine")
-- see: https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_storm.lua
-- see: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/theme.lua
-- to config the concrate items
local colors = require_plugin("tokyonight.colors").setup()
lualine.setup({
  options = {
    -- 指定皮肤
    -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
    theme = "tokyonight",
    -- 分割线
    component_separators = {
      left = "|",
      right = "|",
    },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = {
      left = " ",
      right = "",
    },
    globalstatus = true,
    always_divide_middle = false,
  },
  extensions = { "nvim-tree" },
  sections = {
    lualine_c = {
        {
            "filename",
            path = 1,
            color = { gui='bold' },
        },
        {
            --  arkav/lualine-lsp-progress
            "lsp_progress",
            spinner_symbols = { " ", " ", " ", " ", " ", " " },
        },
    },
    -- lualine_c = {
    --   "filename",
    --   {
    -----  arkav/lualine-lsp-progress
    --     "lsp_progress",
    --     spinner_symbols = { " ", " ", " ", " ", " ", " " },
    --   },
    -- },
    lualine_x = {
      {
        "filesize",
      },
      {
        "fileformat",
        -- symbols = {
        --   unix = '', -- e712
        --   dos = '', -- e70f
        --   mac = '', -- e711
        -- },
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
      "encoding",
      "filetype",
    },

  },
    winbar = {
        lualine_a = {},
        lualine_b = {
            -- {'filetype', icon_only = true, color = {bg = colors.bg_statusline}},
            {'filename', path = 1, color = {bg = colors.fg_gutter, fg = colors.cyan, gui = 'bold'}, separator = {right = ' '}--[[ {left=' ', right=' '} ]]},
            {'diagnostics', color = {bg = colors.fg_gutter}, separator = {right = ' '}},
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },

    inactive_winbar = {
        lualine_a = {},
        lualine_b = {
            -- {'filetype', icon_only = true, color = {bg = colors.bg_statusline}, },
            {'filename', path = 1, separator = {right = ' '}},
            {'diagnostics', separator = {right = ' '}},
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
})
