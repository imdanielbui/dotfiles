-- Which-key configuration (minimal - for debugging)
local wk = require("which-key")

wk.setup({
  ignore_missing = true,
})

-- Basic keybindings only
local opts = { silent = true, noremap = true }

-- File operations
wk.register({
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live grep" },
  ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Find buffer" },
}, opts)