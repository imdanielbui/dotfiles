-- Key Mappings
-- Keep user's current mappings + add from nvim-config

local keymap = vim.keymap.set

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save key strokes - use ; instead of :
keymap({ "n", "x" }, ";", ":")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Save & Quit
keymap("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "Save buffer" })
keymap("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "Quit current window" })
keymap("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "Quit all" })

-- Clear search highlight
keymap("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Move lines up/down
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Escape from insert mode (quick)
keymap("i", "jk", "<Esc>", { desc = "Escape insert mode" })
keymap("i", "kj", "<Esc>", { desc = "Escape insert mode" })

-- Better indenting
keymap("x", "<", "<gv")
keymap("x", ">", ">gv")

-- Move around wrapped lines
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Telescope (fuzzy finder)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help tags" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })

-- Fzf-lua (alternative fast search)
keymap("n", "<leader>fa", "<cmd>FzfLua files<cr>", { desc = "Fzf files" })
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep_native<cr>", { desc = "Fzf grep" })

-- Git (fugitive)
keymap("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
keymap("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Git add file" })
keymap("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git commit" })
keymap("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Git push" })
keymap("n", "<leader>gl", "<cmd>Git pull<cr>", { desc = "Git pull" })
keymap("v", "<leader>gb", ":Git blame<cr>", { desc = "Git blame" })

-- LSP keymaps
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })

-- Hop (cursor jump)
keymap("n", "f", "<cmd>HopChar1<cr>", { desc = "Jump to char" })
keymap("n", "F", "<cmd>HopChar2<cr>", { desc = "Jump to 2 chars" })

-- Nvim-tree
keymap("n", "<space>s", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })

-- Copy entire buffer
keymap("n", "<leader>y", "<cmd>%yank<cr>", { desc = "Yank entire buffer" })

-- Change directory to current file
keymap("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", { desc = "Change cwd" })