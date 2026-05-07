local wk = require("which-key")

wk.setup({
  delay = 300,
})

wk.add({
  { "<leader>f", group = "find/format" },
  { "<leader>g", group = "git" },
  { "<leader>c", group = "code" },
  { "<leader>r", group = "rename/run" },
  { "<leader>x", group = "diagnostics" },
})
