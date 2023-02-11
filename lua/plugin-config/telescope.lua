local cfg = require("global_configs").plugins.telescope
local telescope = require_plugin("telescope")
local action_layout = require("telescope.actions.layout")

if vim.fn.executable("rg") ~= 1 then
    vim.notify("not find ripgrep, please install it to use telescope")
    return
end

-- preview wrap
vim.cmd[[autocmd User TelescopePreviewerLoaded setlocal wrap]]

local opts = {
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "normal",
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
        [cfg.toggle_preview] = action_layout.toggle_preview,        -- 关闭窗口
        -- ["<esc>"] = actions.close,
        -- [cfg.close] = "close",
        -- 预览窗口上下滚动
        -- [cfg.preview_scrolling_up] = "preview_scrolling_up",
        -- [cfg.preview_scrolling_down] = "preview_scrolling_down",
      },
      n = {
        [cfg.cycle_history_next] = "cycle_history_next",
        [cfg.cycle_history_prev] = "cycle_history_prev",
        [cfg.toggle_preview] = action_layout.toggle_preview,        -- 关闭窗口
      }
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
    },
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- 可选参数： dropdown, cursor, ivy
        find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }, -- Remove ./ from fd results
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
}
-- local actions = require("telescope.actions")
telescope.setup(opts)

keymap("n", cfg.find_files, ":Telescope find_files<CR>")
keymap("n", cfg.live_grep, ":Telescope live_grep<CR>")
keymap("n", cfg.buffers, ":Telescope buffers<CR>")
keymap("n", cfg.help_tags, ":Telescope help_tags<CR>")
keymap("n", cfg.oldfiles, ":Telescope oldfiles<CR>")

keymap("n", cfg.help_tags, ":Telescope help_tags<CR>")
pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
