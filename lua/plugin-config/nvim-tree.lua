-- https://github.com/kyazdani42/nvim-tree.lua
-- local nvim_tree = require'nvim-tree'
local cfg = require("global_configs").plugins.nvim_tree

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("没有找到 nvim-tree")
  return
end

keymap("n", cfg.toggle, ":NvimTreeToggle<CR>")

-- 列表操作快捷键
local list_keys = { -- 打开文件或文件夹
  {
    key = cfg.edit,
    action = "edit",
  },
  {
    key = cfg.system_open,
    action = "system_open",
  }, -- v分屏打开文件
  {
    key = cfg.vsplit,
    action = "vsplit",
  }, -- h分屏打开文件
  {
    key = cfg.split,
    action = "split",
  }, -- gitignore
  {
    key = cfg.toggle_git_ignored,
    action = "toggle_git_ignored",
  }, -- Hide (dotfiles)
  {
    key = cfg.toggle_dotfiles,
    action = "toggle_dotfiles",
  }, -- toggle filters > custom
  {
    key = cfg.toggle_custom,
    action = "toggle_custom",
  },
  {
    key = cfg.refresh,
    action = "refresh",
  }, -- 文件操作
  {
    key = cfg.create,
    action = "create",
  },
  {
    key = cfg.remove,
    action = "remove",
  },
  {
    key = cfg.rename,
    action = "rename",
  },
  {
    key = cfg.copy,
    action = "copy",
  },
  {
    key = cfg.cut,
    action = "cut",
  },
  {
    key = cfg.paste,
    action = "paste",
  },
  {
    key = cfg.copy_name,
    action = "copy_name",
  },
  {
    key = cfg.copy_path,
    action = "copy_path",
  },
  {
    key = cfg.copy_absolute_path,
    action = "copy_absolute_path",
  },
  {
    key = cfg.toggle_file_info,
    action = "toggle_file_info",
  },
  {
    key = cfg.tabnew,
    action = "tabnew",
  }, -- 进入下一级
  {
    key = cfg.cd,
    action = "cd",
  }, -- 进入上一级
  {
    key = cfg.dir_up,
    action = "dir_up",
  },
}

nvim_tree.setup({
  open_on_setup = false,
  -- 完全禁止内置netrw
  disable_netrw = true,
  -- 不显示 git 状态图标
  git = {
    enable = true,
    ignore = true,
  },
  update_cwd = false,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  filters = {
    -- 隐藏 .文件
    dotfiles = true,
    -- 隐藏 node_modules 文件夹
    -- custom = { "node_modules" },
  },
  view = {
    -- 宽度
    width = 25,
    -- 也可以 'right'
    side = "left",
    -- 隐藏根目录
    hide_root_folder = false,
    -- 自定义列表中快捷键
    mappings = {
      -- 只用内置快捷键
      custom_only = true,
      list = list_keys,
    },
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = "yes",
  },
  actions = {
    open_file = {
      -- 首次打开大小适配
      resize_window = true,
      -- 打开文件时关闭 tree
      quit_on_open = false,
    },
  },
  -- wsl install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  system_open = {
    -- mac
    cmd = "open",
    -- windows
    -- cmd = "wsl-open",
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
    },
  },
})
