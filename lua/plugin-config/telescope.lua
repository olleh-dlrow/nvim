local cfg = require("global_configs").plugins.telescope
local telescope = require_plugin("telescope")

-- local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    -- vertical , center , cursor
    layout_strategy = "horizontal",
    -- 窗口内快捷键
    mappings = {
      i = {
        -- 上下移动
        [cfg.move_selection_next] = "move_selection_next",
        [cfg.move_selection_previous] = "move_selection_previous",
        -- 历史记录
        [cfg.cycle_history_next] = "cycle_history_next",
        [cfg.cycle_history_prev] = "cycle_history_prev",
        -- 关闭窗口
        -- ["<esc>"] = actions.close,
        [cfg.close] = "close",
        -- 预览窗口上下滚动
        [cfg.preview_scrolling_up] = "preview_scrolling_up",
        [cfg.preview_scrolling_down] = "preview_scrolling_down",
      },
    },
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- 可选参数： dropdown, cursor, ivy
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        -- even more opts
        initial_mode = "normal",
      }),
    },
  },
})

keymap("n", cfg.find_files, ":Telescope find_files<CR>")
keymap("n", cfg.live_grep, ":Telescope live_grep<CR>")

pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
