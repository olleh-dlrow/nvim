-- vim.o.background = "dark"
-- vim.g.tokyonight_style = "storm" -- day / night
-- 半透明
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
local colorscheme = "tokyonight"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
local status, _ = require("plugin-config." .. colorscheme)
if not status then
  vim.notify(colorscheme .. "没有找到！")
  return
end

pcall(vim.cmd, "colorscheme " .. colorscheme)

-- https://stackoverflow.com/questions/33936915/how-to-underline-rather-than-highlight-the-current-line-in-vim
-- vim.cmd[[hi clear CursorLine]]
-- vim.cmd[[hi CursorLine cterm=underline gui=underline]]
--
