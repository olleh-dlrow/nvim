-- https://github.com/ahmedkhalf/project.nvim
-- 输出保存目录
-- :lua print(require("project_nvim.utils.path").historyfile)
-- 我的文件在
--  ~/.local/share/nvim/project_nvim/project_history
local project = require_plugin("project_nvim")

-- vim.g.nvim_tree_respect_buf_cwd = 1
project.setup({
  detection_methods = { "pattern" },
  patterns = {
    "README.md",
    "Cargo.toml",
    "package.json",
    "*.sln",
    ".git",
    "_darcs",
    ".hg",
    ".bzr",
    ".svn",
    "Makefile",
  },
})

local telescope = require_plugin("telescope")
pcall(telescope.load_extension, "projects")

