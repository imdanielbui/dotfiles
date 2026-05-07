-- Bufferline configuration (buffer tabs)
local bufferline = require("bufferline")

bufferline.setup({
  options = {
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diag)
      local parts = {}
      if diag.error and diag.error > 0 then
        table.insert(parts, " " .. diag.error)
      end
      if diag.warning and diag.warning > 0 then
        table.insert(parts, " " .. diag.warning)
      end
      return table.concat(parts, " ")
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    separator_style = { "│", "│" },
    indicator = {
      style = "icon",
      icon = "▎",
    },
    buffer_close_icon = "󰅖",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
  },
})
