-- Plugin Configuration with Lazy.nvim
-- Selected plugins from nvim-config + Dart + Tmux-navigator

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Core & UI
  {
    "folke/lazy.nvim",
    event = "VeryLazy",
    opts = {
      rocks = {
        enabled = false,
        hererocks = false,
      },
      performance = {
        rtp = {
          reset = false,
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "BufRead",
    config = function()
      require("config.lualine")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = { "BufEnter" },
    config = function()
      require("config.bufferline")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    keys = { "<space>s" },
    config = function()
      require("config.nvim-tree")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "folke/which-key.nvim",
    version = "v3.8.0",
    event = "VeryLazy",
    config = function()
      require("config.which-key")
    end,
  },

  -- LSP & Completion
  {
    "neovim/nvim-lspconfig",
    version = "v1.5.0",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("config.nvim-cmp")
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },
  {
    "hrsh7th/cmp-path",
    lazy = true,
  },
  {
    "hrsh7th/cmp-buffer",
    lazy = true,
  },
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
  },

  -- Navigation & Search
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = { "<leader>ff", "<leader>fg", "<leader>fb" },
    config = function()
      require("config.telescope")
    end,
  },
  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    config = function()
      require("config.fzf-lua")
    end,
  },
  {
    "smoka7/hop.nvim",
    keys = { "f", "F" },
    config = function()
      require("config.hop")
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    keys = { "*", "#", "n", "N" },
    config = function()
      require("config.hlslens")
    end,
  },

  -- Git
  {
    "tpope/vim-fugitive",
    event = "User InGitRepo",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("config.gitsigns")
    end,
  },

  -- Editing Enhancements
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "tpope/vim-commentary",
    keys = { "gc" },
  },
  {
    "machakann/vim-sandwich",
    event = "VeryLazy",
  },
  {
    "nvim-zh/better-escape.vim",
    event = { "InsertEnter" },
  },

  -- Colorscheme - Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("config.catppuccin")
    end,
  },

  -- Tmux Navigator (NEW - CRITICAL)
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- Dart LSP is configured in lua/lsp.lua
}, {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "netrwPlugin",
      },
    },
  },
})