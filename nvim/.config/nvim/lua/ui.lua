-- UI Settings
-- Colorscheme and general UI configuration

-- Setup catppuccin
local catppuccin = require("catppuccin")
catppuccin.setup({
  flavour = "mocha",
  transparent_background = false,
  show_end_of_buffer = false,
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  integrations = {
    telescope = true,
    notify = true,
    mini = {
      enabled = true,
      indentscope_color = "overlay",
    },
    fidget = true,
  },
})

-- Load colorscheme using the correct method for catppuccin
vim.cmd.colorscheme("catppuccin")

-- Set transparent background for some terminals
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("transparent_background", { clear = true }),
  callback = function()
    vim.opt_local.background = "dark"
  end,
})