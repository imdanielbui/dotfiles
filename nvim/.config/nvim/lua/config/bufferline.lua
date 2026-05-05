-- Bufferline configuration (buffer tabs)
local bufferline = require("bufferline")

bufferline.setup({
  options = {
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diag)
      local icons = require("ui.icons").diagnostics
      return (diag.error and icons.Error .. diag.error .. " " or "") .. (diag.warning and icons.Warn .. diag.warning or "")
    end,
    offsets = {
      {
        filetype = "neo-tree",
        text = "Neo-tree",
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