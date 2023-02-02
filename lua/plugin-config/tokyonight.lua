local tokyonight = require_plugin("tokyonight")
vim.o.showtabline=0

tokyonight.setup({
    style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = ( vim.g.transparent_enabled and true ) or false, -- Enable this to disable setting the background color
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = ( vim.g.transparent_enabled and "transparent" ) or "dark", -- style for sidebars, see below
        floats = ( vim.g.transparent_enabled and "transparent" ) or "dark", -- style for floating windows
    },
    -- warning: 这里设置StatusLine和WinBar的颜色时失效，主要是被on_colors覆盖了
    on_highlights = function(hl, c)
        hl.NvimTreeRootFolder = {bold = false}
    end,
    on_colors = function(colors)
        colors.border = colors.green2
        colors.bg_statusline = ( vim.g.transparent_enabled and colors.none ) or colors.bg_statusline
    end
})

