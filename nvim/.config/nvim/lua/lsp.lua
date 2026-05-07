local cmp_nvim_lsp = require("cmp_nvim_lsp")

vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 2 },
  underline = true,
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  signs = true,
})

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("dotfiles-lsp-attach", { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = false })
    end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
  end,
})

vim.lsp.config("dartls", {
  cmd = { "dart", "language-server" },
  filetypes = { "dart" },
  root_markers = { "pubspec.yaml", "analysis_options.yaml", ".git" },
})

local servers = {
  bashls = "bash-language-server",
  dartls = "dart",
  jsonls = "vscode-json-language-server",
  lua_ls = "lua-language-server",
  marksman = "marksman",
  taplo = "taplo",
  yamlls = "yaml-language-server",
}

for server, executable in pairs(servers) do
  if vim.fn.executable(executable) == 1 then
    vim.lsp.enable(server)
  end
end
