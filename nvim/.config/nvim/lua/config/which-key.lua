-- Which-key configuration (updated spec)
local wk = require("which-key")

wk.setup({})

-- Keybindings with new spec format
wk.register({
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files", remap = false },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep", remap = false },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer", remap = false },
}, { silent = true, noremap = true })