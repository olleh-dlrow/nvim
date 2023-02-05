vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.api.nvim_buf_line_count(0) > 10000 then
            vim.b.navic_lazy_update_context = true
        end
    end,
})
