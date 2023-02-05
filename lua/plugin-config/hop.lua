local cfg = require("global_configs")
local hop = require_plugin('hop')
local directions = require_plugin('hop.hint').HintDirection

hop.setup {
    keys = 'etovxqpdygfblzhckisuran'
}

keymap('', cfg.keys.hop_hint_char1_after, function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
keymap('', cfg.keys.hop_hint_char1_before, function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
keymap('', cfg.keys.hop_hint_pre_char1_after, function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
keymap('', cfg.keys.hop_hint_pre_char1_before, function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})
keymap('', cfg.keys.hop_word, "<cmd>HopWord<CR>", {remap=true})
