-- Lualine configuration (statusline)
local lualine = require("lualine")

local function get_diagnostics()
  local count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }))
  return count > 0 and " diag: " .. count or ""
end

lualine.setup({
  options = {
    theme = "catppuccin",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "alpha", "starter" },
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
        update_in_insert = false,
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "[No Name]" } },
    },
    lualine_x = {
      { get_diagnostics, color = { fg = "#f38ba8" } },
      {
        function()
          return require("lazy.status").updates()
        end,
        cond = require("lazy.status").has_updates,
        color = { fg = "#fab387" },
      },
      {
        "diff",
        symbols = { added = " ", modified = "󰝤 ", removed = " " },
      },
    },
    lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
    lualine_z = {
      function()
        return " " .. os.date("%R")
      end,
    },
  },
  extensions = { "neo-tree", "lazy" },
})