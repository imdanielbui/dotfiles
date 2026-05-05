-- Hop configuration (cursor jump)
local hop = require("hop")

hop.setup({
  keys = "asdfghjklqwertyuiopzxcvbnm",
  -- keys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  term_bias = nil,
  click_symbol = "⇉",
  click_symbol_ok = "✓",
  vertical_jump = false,
  horizontal_jump = false,
  hint = true,
  hint_position = "next",
  case_strategy = "smart",
  match_by_word_part = true,
  multi_window = false,
  multi_window_close = "left",
  line_jump = false,
  immediate_lsp = false,
  -- keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  -- keys = 'asdfghjkl;',
})

-- Hop keybindings
vim.keymap.set("n", "f", "<cmd>HopChar1<cr>", { desc = "Hop to char forward" })
vim.keymap.set("n", "F", "<cmd>HopChar2<cr>", { desc = "Hop to 2 chars forward" })
vim.keymap.set("n", "t", "<cmd>HopChar1<cr>", { desc = "Hop before char forward" })
vim.keymap.set("n", "T", "<cmd>HopChar2<cr>", { desc = "Hop before 2 chars forward" })
vim.keymap.set("n", ";", "<cmd>HopWord<cr>", { desc = "Hop to word" })