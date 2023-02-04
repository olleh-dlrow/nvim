local global_configs = require("global_configs")
local keys = global_configs.keys

-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",
local opt = {
  noremap = true,
  silent = true,
}
--------------------------------------------------------------------------

-- leader key 为空
vim.g.mapleader = keys.leader_key
vim.g.maplocalleader = keys.leader_key

local opts_remap = {
  remap = true,
  silent = false,
}

local opts_expr = {
  expr = true,
  silent = true,
}

-- 命令行下 Ctrl+j/k  上一个下一个
-- keymap("c", keys.c_next_item, "<C-n>", opts_remap)
-- keymap("c", keys.c_prev_item, "<C-p>", opts_remap)

-- save && quit
keymap("n", keys.n_save, ":w<CR>")
keymap("n", keys.n_save_quit, ":wq<CR>")
keymap("n", keys.n_save_all, ":wa<CR>")
keymap("n", keys.n_save_all_quit, ":wqa<CR>")
keymap("n", keys.n_force_quit, ":qa!<CR>")

-- reload nvim
keymap("n", keys.n_reload_nvim, ":source $MYVIMRC<CR>")
-- $跳到行尾不带空格 (交换$ 和 g_)
-- warning: 这会影响到visual block选择到行结尾的操作，建议不要替换
-- keymap({ "v", "n" }, "$", "g_")
-- keymap({ "v", "n" }, "g_", "$")

-- 上下滚动浏览
keymap({ "n", "v" }, keys.n_v_5j, "5j")
keymap({ "n", "v" }, keys.n_v_5k, "5k")

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
-- keymap({ "n", "v" }, keys.n_v_10j, "10j")
-- keymap({ "n", "v" }, keys.n_v_10k, "10k")

-- magic search
if global_configs.enable_magic_search then
  keymap({ "n", "v" }, "/", "/\\v", {
    remap = false,
    silent = false,
  })
else
  keymap({ "n", "v" }, "/", "/", {
    remap = false,
    silent = false,
  })
end

-------------------- fix ------------------------------

-- fix :set wrap
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", opts_expr)
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", opts_expr)

-- visual模式下缩进代码
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- 上下移动选中文本
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")

-- 在visual mode 里粘贴不要复制
keymap("x", "p", '"_dP')

------------------------------------------------------------------
-- s_windows 分屏快捷键
------------------------------------------------------------------
if keys.s_windows ~= nil and keys.s_windows.enable then
  local skey = keys.s_windows
  -- 取消 s 默认功能
  keymap("n", "s", "")
  keymap("n", skey.split_vertically, ":vsp<CR>")
  keymap("n", skey.split_horizontally, ":sp<CR>")
  -- 关闭当前
  keymap("n", skey.close, "<C-w>c")
  -- 关闭其他
  keymap("n", skey.close_others, "<C-w>o") -- close others
  -- <leader> + hjkl  窗口之间跳转
  keymap("n", skey.jump_left, "<C-w>h")
  keymap("n", skey.jump_down, "<C-w>j")
  keymap("n", skey.jump_up, "<C-w>k")
  keymap("n", skey.jump_right, "<C-w>l")
  -- 比例控制
  keymap("n", skey.width_decrease, ":vertical resize -2<CR>")
  keymap("n", skey.width_increase, ":vertical resize +2<CR>")
  keymap("n", skey.height_decrease, ":horizontal resize -2<CR>")
  keymap("n", skey.height_increase, ":horizontal resize +2<CR>")
  keymap("n", skey.size_equal, "<C-w>=")
end

if keys.s_tab ~= nil then
  local tkey = keys.s_tab
  keymap("n", tkey.split, "<CMD>tab split<CR>")
  keymap("n", tkey.close, "<CMD>tabclose<CR>")
  keymap("n", tkey.next, "<CMD>tabnext<CR>")
  keymap("n", tkey.prev, "<CMD>tabprev<CR>")
  keymap("n", tkey.first, "<CMD>tabfirst<CR>")
  keymap("n", tkey.last, "<CMD>tablast<CR>")
end

-- treesitter 折叠
-- keymap("n", keys.fold.open, ":foldopen<CR>")
-- keymap("n", keys.fold.close, ":foldclose<CR>")

-- Esc 回 Normal 模式
keymap("t", keys.terminal_to_normal, "<C-\\><C-n>")
-- Terminal相关
-- map("n", "st", ":sp | terminal<CR>", opt)
-- map("n", "stv", ":vsp | terminal<CR>", opt)
-- map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
-- map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
-- map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
-- map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
-- map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
-- map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
-- map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
-- map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)

--------------------------------------------------------------------
-- 插件快捷键
local plugin_keys = {}

-- lsp 回调函数快捷键设置
local lsp = global_configs.lsp

local nvim_map = function(mapbuf)
  -- rename
  mapbuf("n", lsp.rename, "<cmd>lua vim.lsp.buf.rename()<CR>")

  -- code action
  mapbuf("n", lsp.code_action, "<cmd>lua vim.lsp.buf.code_action()<CR>")

  -- go xx
  -- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", lsp.definition, function()
    require("telescope.builtin").lsp_definitions({
      initial_mode = "normal",
      -- ignore_filename = false,
    })
  end)

  -- hover
  mapbuf("n", lsp.hover, "<cmd>lua vim.lsp.buf.hover()<CR>")

  -- references
  -- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  mapbuf(
    "n",
    lsp.references,
    "<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy())<CR>"
  )

  -- format
  if vim.fn.has("nvim-0.8") == 1 then
    mapbuf("n", lsp.format, "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
  else
    mapbuf("n", lsp.format, "<cmd>lua vim.lsp.buf.formatting()<CR>")
  end

  -- diagnostic
  mapbuf("n", lsp.open_flow, "<cmd>lua vim.diagnostic.open_float()<CR>")
  mapbuf("n", lsp.goto_next, "<cmd>lua vim.diagnostic.goto_next()<CR>")
  mapbuf("n", lsp.goto_prev, "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  -- 未用
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

local lspsaga_map = function (mapbuf)
    -- LSP finder - Find the symbol's definition
    -- If there is no definition, it will instead be hidden
    -- When you use an action in finder like "open vsplit",
    -- you can use <C-t> to jump back
    mapbuf("n", lsp.references, "<cmd>Lspsaga lsp_finder<CR>")

    -- Code action
    mapbuf({"n","v"}, lsp.code_action, "<cmd>Lspsaga code_action<CR>")

    -- Rename all occurrences of the hovered word for the entire file
    -- mapbuf("n", lsp.rename, "<cmd>Lspsaga rename<CR>")

    -- Rename all occurrences of the hovered word for the selected files
    mapbuf("n", lsp.rename, "<cmd>Lspsaga rename ++project<CR>")

    -- Peek definition
    -- You can edit the file containing the definition in the floating window
    -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
    -- It also supports tagstack
    -- Use <C-t> to jump back
    mapbuf("n", lsp.peek_definition, "<cmd>Lspsaga peek_definition<CR>")

    -- Go to definition
    -- warning: has bug, can't use this
    mapbuf("n",lsp.definition, "<cmd>Lspsaga goto_definition<CR>")

    -- Show line diagnostics
    -- You can pass argument ++unfocus to
    -- unfocus the show_line_diagnostics floating window
    mapbuf("n", lsp.open_flow, "<cmd>Lspsaga show_line_diagnostics<CR>")

    -- Show cursor diagnostics
    -- Like show_line_diagnostics, it supports passing the ++unfocus argument
    -- mapbuf("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

    -- Show buffer diagnostics
    -- mapbuf("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

    -- Diagnostic jump
    -- You can use <C-o> to jump back to your previous location
    mapbuf("n", lsp.goto_prev, "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    mapbuf("n", lsp.goto_next, "<cmd>Lspsaga diagnostic_jump_next<CR>")

    -- Diagnostic jump with filters such as only jumping to an error
    mapbuf("n", lsp.goto_prev_error, function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
    mapbuf("n", lsp.goto_next_error, function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)

    -- Toggle outline
    mapbuf("n", lsp.toggle_outline, "<cmd>Lspsaga outline<CR>")

    -- Hover Doc
    -- If there is no hover doc,
    -- there will be a notification stating that
    -- there is no information available.
    -- To disable it just use ":Lspsaga hover_doc ++quiet"
    -- Pressing the key twice will enter the hover window
    mapbuf("n", lsp.hover, "<cmd>Lspsaga hover_doc<CR>")

    -- If you want to keep the hover window in the top right hand corner,
    -- you can pass the ++keep argument
    -- Note that if you use hover with ++keep, pressing this key again will
    -- close the hover window. If you want to jump to the hover window
    -- you should use the wincmd command "<C-w>w"
    -- mapbuf("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

    -- Call hierarchy
    mapbuf("n", lsp.incoming_calls, "<cmd>Lspsaga incoming_calls<CR>")
    mapbuf("n", lsp.outgoing_calls, "<cmd>Lspsaga outgoing_calls<CR>")

    -- Floating terminal
    -- mapbuf({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
end

if lsp.ui_mode == "lspsaga" then
    plugin_keys.mapLSP = lspsaga_map
elseif lsp.ui_mode == "nvim" then
    plugin_keys.mapLSP = nvim_map
else
    plugin_keys.mapLSP = nil
end

-- -- typescript 快捷键
-- plugin_keys.mapTsLSP = function(bufnr)
--   local bufopts = { noremap = true, silent = true, buffer = bufnr }
--   keymap("n", lsp.ts_organize, ":TSLspOrganize<CR>", bufopts)
--   keymap("n", lsp.ts_rename_file, ":TSLspRenameFile<CR>", bufopts)
--   keymap("n", lsp.ts_add_missing_import, ":TSLspImportAll<CR>", bufopts)
-- end
--
-- -- nvim-dap
-- plugin_keys.mapDAP = function()
--   -- 开始
--   map("n", "<leader>dd", ":RustDebuggables<CR>", opt)
--   -- 结束
--   map(
--     "n",
--     "<leader>de",
--     ":lua require'dap'.close()<CR>"
--       .. ":lua require'dap'.terminate()<CR>"
--       .. ":lua require'dap.repl'.close()<CR>"
--       .. ":lua require'dapui'.close()<CR>"
--       .. ":lua require('dap').clear_breakpoints()<CR>"
--       .. "<C-w>o<CR>",
--     opt
--   )
--   -- 继续
--   map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opt)
--   -- 设置断点
--   map("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>", opt)
--   map("n", "<leader>dT", ":lua require('dap').clear_breakpoints()<CR>", opt)
--   --  stepOver, stepOut, stepInto
--   map("n", "<leader>dj", ":lua require'dap'.step_over()<CR>", opt)
--   map("n", "<leader>dk", ":lua require'dap'.step_out()<CR>", opt)
--   map("n", "<leader>dl", ":lua require'dap'.step_into()<CR>", opt)
--   -- 弹窗
--   map("n", "<leader>dh", ":lua require'dapui'.eval()<CR>", opt)
-- end
--
-- -- vimspector
-- plugin_keys.mapVimspector = function()
--   -- 开始
--   map("n", "<leader>dd", ":call vimspector#Launch()<CR>", opt)
--   -- 结束
--   map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
--   -- 继续
--   map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
--   -- 设置断点
--   map("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opt)
--   map("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opt)
--   --  stepOver, stepOut, stepInto
--   map("n", "<leader>dj", "<Plug>VimspectorStepOver", opt)
--   map("n", "<leader>dk", "<Plug>VimspectorStepOut", opt)
--   map("n", "<leader>dl", "<Plug>VimspectorStepInto", opt)
-- end

-- gitsigns
plugin_keys.gitsigns_on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation
  map("n", "<leader>gj", function()
    if vim.wo.diff then
      return "]c"
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return "<Ignore>"
  end, {
    expr = true,
  })

  map("n", "<leader>gk", function()
    if vim.wo.diff then
      return "[c"
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return "<Ignore>"
  end, {
    expr = true,
  })

  map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
  map("n", "<leader>gS", gs.stage_buffer)
  map("n", "<leader>gu", gs.undo_stage_hunk)
  map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
  map("n", "<leader>gR", gs.reset_buffer)
  map("n", "<leader>gp", gs.preview_hunk)
  map("n", "<leader>gb", function()
    gs.blame_line({
      full = true,
    })
  end)
  map("n", "<leader>gd", gs.diffthis)
  map("n", "<leader>gD", function()
    gs.diffthis("~")
  end)
  -- toggle
  map("n", "<leader>gtd", gs.toggle_deleted)
  map("n", "<leader>gtb", gs.toggle_current_line_blame)
  -- Text object
  map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
end

return plugin_keys
