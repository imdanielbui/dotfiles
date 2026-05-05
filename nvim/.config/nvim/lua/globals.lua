-- Global settings and platform detection
-- Based on nvim-config by jdhao

-- Platform detection
vim.g.is_mac = vim.fn.has("mac") == 1
vim.g.is_linux = vim.fn.has("unix") == 1 and vim.fn.has("mac") == 0
vim.g.is_win = vim.fn.has("win32") == 1

-- Neovim version check
local expected_version = "0.11.0"
local actual_version = vim.version().minor
local actual_major = vim.version().major

if actual_major < 1 or (actual_major == 1 and actual_version < 11) then
  vim.notify("Neovim " .. expected_version .. "+ is recommended. Current: " .. vim.version().major .. "." .. actual_version, vim.log.levels.WARN)
end

-- Path separator
vim.g.path_sep = vim.fn.has("win32") == 1 and "\\" or "/"

-- Home directory
vim.g.home = vim.env.HOME