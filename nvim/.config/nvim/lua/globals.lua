-- Global settings and platform detection
-- Based on nvim-config by jdhao

-- Platform detection
vim.g.is_mac = vim.fn.has("mac") == 1
vim.g.is_linux = vim.fn.has("unix") == 1 and vim.fn.has("mac") == 0
vim.g.is_win = vim.fn.has("win32") == 1

-- Neovim version check
local expected_version = "0.11.0"
local version = vim.version()

if version.major == 0 and version.minor < 11 then
  vim.notify(
    "Neovim " .. expected_version .. "+ is recommended. Current: " .. version.major .. "." .. version.minor,
    vim.log.levels.WARN
  )
end

-- Path separator
vim.g.path_sep = vim.fn.has("win32") == 1 and "\\" or "/"

-- Home directory
vim.g.home = vim.env.HOME
