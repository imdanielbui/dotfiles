-- Which-key configuration (keybinding helper)
local wk = require("which-key")

wk.setup({
  win = {
    border = "single",
    padding = { 1, 2, 1, 2 },
    position = "bottom",
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
  },
  keys = {
    ["<leader>"] = { name = "Leader", mode = { "n", "v" } },
    ["g"] = { name = "Go", mode = "n" },
    ["gs"] = { name = "Git", mode = "n" },
    ["z"] = { name = "Fold", mode = "n" },
    ["["] = { name = "Previous", mode = "n" },
    ["]"] = { name = "Next", mode = "n" },
    ["<leader><leader>"] = { name = "Leader Twice", mode = { "n", "v" } },
  },
})

-- Register keybindings with which-key
local opts = { noremap = true, silent = true }

-- File operations
wk.register({
  ["<leader>f"] = { name = "Find" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live grep" },
  ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Find buffer" },
  ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help tags" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
}, opts)

-- Git
wk.register({
  ["<leader>g"] = { name = "Git" },
  ["<leader>gs"] = { "<cmd>Git<cr>", "Status" },
  ["<leader>gw"] = { "<cmd>Gwrite<cr>", "Add file" },
  ["<leader>gc"] = { "<cmd>Git commit<cr>", "Commit" },
  ["<leader>gp"] = { "<cmd>Git push<cr>", "Push" },
  ["<leader>gl"] = { "<cmd>Git pull<cr>", "Pull" },
}, opts)

-- Window/Split operations
wk.register({
  ["<leader>w"] = { "<cmd>update<cr>", "Save" },
  ["<leader>q"] = { "<cmd>x<cr>", "Quit" },
  ["<leader>Q"] = { "<cmd>qa!<cr>", "Quit all" },
  ["<leader>h"] = { ":nohlsearch<CR>", "Clear search" },
}, opts)

-- LSP
wk.register({
  ["<leader>c"] = { name = "Code" },
  ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
  ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
}, opts)