-- Nvim-hlslens configuration (search index display)
local hlslens = require("nvim-hlslens")

hlslens.setup({
  enable = true,
  priority = 100,
  exponent = 6,
  nearest_only = true,
  nearest_float_at_top = true,
  focus = false,
  debug = false,
  ignored_filetypes = { "qf", "lua" },
  ignored_buftypes = { "terminal", "nofile" },
})

-- Keybindings for search with lens
vim.keymap.set({ "n", "x" }, "n", function()
  if vim.v.hlsearch == 0 or vim.fn.mode() == "v" then
    return "n"
  end
  require("hlslens").start()
  return "n"
end, { expr = true })

vim.keymap.set({ "n", "x" }, "N", function()
  if vim.v.hlsearch == 0 or vim.fn.mode() == "v" then
    return "N"
  end
  require("hlslens").start()
  return "N"
end, { expr = true })

vim.keymap.set({ "n", "x" }, "*", function()
  require("hlslens").start()
  return "*"
end, { expr = true })

vim.keymap.set({ "n", "x" }, "#", function()
  require("hlslens").start()
  return "#"
end, { expr = true })

vim.keymap.set({ "n", "x" }, "g*", function()
  require("hlslens").start()
  return "g*"
end, { expr = true })

vim.keymap.set({ "n", "x" }, "g#", function()
  require("hlslens").start()
  return "g#"
end, { expr = true })