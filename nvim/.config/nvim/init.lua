-- Neovim Configuration Entry Point
-- Modular structure based on nvim-config (jdhao)

-- Enable Lua module loader
vim.loader.enable()

-- Global settings
require("globals")

-- Neovim options
require("options")

-- Key mappings
require("keymaps")

-- Autocommands
require("autocmds")

-- Plugin configuration (Lazy.nvim)
require("plugins")

-- LSP configuration
require("lsp")

-- UI settings (colorscheme, statusline)
require("ui")