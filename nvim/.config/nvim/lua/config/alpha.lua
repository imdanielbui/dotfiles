local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
  " ████╗  ██║██║   ██║██║████╗ ████║",
  " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
  " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

dashboard.section.buttons.val = {
  dashboard.button("f", "Find file", "<leader>ff"),
  dashboard.button("g", "Live grep", "<leader>fg"),
  dashboard.button("n", "New file", "<cmd>ene<cr>"),
  dashboard.button("c", "Edit config", "<cmd>edit ~/.config/nvim/init.lua<cr>"),
  dashboard.button("q", "Quit", "<cmd>qa<cr>"),
}

dashboard.section.footer.val = "Space to see mappings, q to quit, f to search"

alpha.setup(dashboard.config)

if vim.fn.argc() == 0 then
  vim.cmd.Alpha()
end
