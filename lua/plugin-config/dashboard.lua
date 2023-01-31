local cfg = require("global_configs").plugins.dash_board
local dashboard = require_plugin('dashboard')

local hyper_opts = {
    theme = 'doom',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        {   desc = ' Update',
            group = '@property',
            action = 'PackerSync',
            key = 'u'
        },
        {
          desc = ' Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Global Config',
          group = 'DiagnosticHint',
          action = 'edit ~/.config/nvim/lua/global_configs.lua',
          key = 'a',
        },
        {
          desc = ' Edit zshrc',
          group = 'Number',
          action = 'edit ~/.zshrc',
          key = 'd',
        },
      },
        -- project = {
        --     limit = 8,
        --     icon = '  ',
        --     label = 'Recently Projects:',
        --     action = 'Telescope projects',
        -- },
        -- mru = {
        --     limit = 10,
        --     icon = '  ',
        --     label = 'Most Recent Files:',
        --     action = "Telescope oldfiles"
        -- },
    },
}

local doom_opts = {
  theme = 'doom',
  config = {
    header = {
  [[                               ]],
  [[                               ]],
  [[                               ]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
  [[⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ]],
  [[⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ]],
  [[⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ]],
  [[⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ]],
  [[⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ]],
  [[⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ]],
  [[⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ]],
  [[⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ]],
  [[⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ]],
  [[⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ]],
  [[⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ]],
  [[⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ]],
  [[⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
  [[                               ]],
  [[                               ]],
  [[                               ]],
  [[                               ]],
  [[                               ]],
}, --your header
    center = {
      {
        icon = '  ',
        -- icon_hl = 'Title',
        desc = 'Projects                            ',
        -- desc_hl = 'String',
        key = 'p',
        -- keymap = 'SPC f f',
        -- key_hl = 'Number',
        action = 'Telescope projects'
      },
      {
        icon = '  ',
        desc = 'Recently Files                      ',
        key = 'r',
        action = 'Telescope oldfiles'
      },
      {
        icon = "  ",
        desc = "Find file                           ",
        key = 'f',
        action = "Telescope find_files",
      },
      {
        icon = "  ",
        desc = "Global Config                       ",
        key = 'g',
        action = "edit ~/.config/nvim/lua/global_configs.lua",
      },
    },
    footer = { "Link Start! "}  --your footer
  }
}
dashboard.setup(doom_opts)

