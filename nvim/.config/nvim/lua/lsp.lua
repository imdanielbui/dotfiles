-- LSP Configuration (minimal)

local cmp_nvim_lsp = require("cmp_nvim_lsp")

vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  underline = true,
  float = { border = "rounded" },
})

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config.dartls = {
  cmd = { "dart", "language-server" },
  filetypes = { "dart" },
  root_markers = { "pubspec.yaml", ".dart_tool" },
  capabilities = capabilities,
}

-- Don't call vim.lsp.start() - let it auto-start when file is opened