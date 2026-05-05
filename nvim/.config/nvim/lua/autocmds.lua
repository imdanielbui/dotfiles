-- Autocommands
-- Based on nvim-config

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General settings group
local general = augroup("General", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Auto-resize splits on window resize
autocmd("VimResized", {
  group = general,
  command = "wincmd =",
})

-- Go to last location when opening a buffer
autocmd("BufReadPost", {
  group = general,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Enable spell checking for certain file types
autocmd("FileType", {
  group = general,
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Close certain filetypes with q
autocmd("FileType", {
  group = general,
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- LSP settings group
local lsp_group = augroup("LSP", { clear = true })

-- Show line diagnostics automatically in hover window
autocmd("CursorHold", {
  group = lsp_group,
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- Format on save for certain languages
autocmd("BufWritePre", {
  group = lsp_group,
  pattern = { "*.go", "*.rs", "*.ts", "*.tsx" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Terminal settings
autocmd("TermOpen", {
  group = general,
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})