-- LSP Configuration
-- Includes Dart LSP support

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Diagnostic settings
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focus = false,
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- LSP keymaps
local function lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }
  local keymap = vim.keymap.set

  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
  keymap("n", "[d", vim.diagnostic.goto_prev, opts)
  keymap("n", "]d", vim.diagnostic.goto_next, opts)
end

-- LSP capabilities
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Common on_attach function
local function on_attach(client, bufnr)
  lsp_keymaps(bufnr)

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
    vim.api.nvim_clear_autocmds({
      group = "lsp_format_on_save",
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "lsp_format_on_save",
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

-- Dart LSP Configuration (NEW)
lspconfig.dartls.setup({
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  root_dir = lspconfig.util.root_pattern("pubspec.yaml", ".dart_tool", ".git"),
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = false,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- Dart-specific: enable flutter commands if available
    if vim.fn.executable("flutter") == 1 then
      vim.cmd("autocmd FileType dart command! FlutterRun lua require('flutter-tools').run()")
    end
  end,
})

-- Lua LSP
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- Python LSP (if installed)
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- TypeScript/JavaScript LSP
lspconfig.ts_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- JSON LSP
lspconfig.jsonls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- HTML/CSS LSP
lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Go LSP (if installed)
if vim.fn.executable("gopls") == 1 then
  lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Rust LSP (if installed)
if vim.fn.executable("rust-analyzer") == 1 then
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Show line diagnostics in virtual text
vim.api.nvim_create_autocmd("LspDiagnosticsChanged", {
  callback = function()
    vim.diagnostic.setloclist({ open = false })
  end,
})