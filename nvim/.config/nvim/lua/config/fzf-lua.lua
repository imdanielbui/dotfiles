-- Fzf-lua configuration (fast fuzzy finder)
local fzf_lua = require("fzf-lua")

fzf_lua.setup({
  winopts = {
    height = 0.70,
    width = 0.80,
    row = 0.35,
    col = 0.50,
    border = "rounded",
  },
  fzf_opts = {
    ["--ansi"] = "",
    ["--height"] = "70%",
    ["--layout"] = "reverse-list",
    ["--info"] = "inline",
    ["--no-scrollbar"] = "",
  },
  preview = {
    border = "border",
    wrap = "wrap",
  },
  defaults = {
    file_icons = true,
    color_icons = true,
    git_icons = true,
    exec_icons = false,
    path_format = "tail",
  },
  files = {
    previewer = "bat",
    prompt = "Files> ",
    git_icons = true,
    no_ignore = false,
    show_hide = false,
    -- Use rg instead of find for macOS
    fd_opts = "--hidden --type f --exclude .git",
  },
  grep = {
    previewer = "bat",
    prompt = "Grep> ",
    grep_opts = "--binary-files=without-match --line-number",
    rg_opts = "--hidden --column --line-number --no-heading --color=always",
  },
  lsp = {
    symbols = {
      "function",
      "method",
      "var",
      "constant",
      "parameter",
    },
  },
  quickfix = {
    previewer = "bat",
  },
})

-- Keybindings for fzf-lua
vim.keymap.set("n", "<leader>fa", "<cmd>FzfLua files<cr>", { desc = "Fzf find all files" })
vim.keymap.set("n", "<leader>fz", "<cmd>FzfLua live_grep<cr>", { desc = "Fzf live grep" })
