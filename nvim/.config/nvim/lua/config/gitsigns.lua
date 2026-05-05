-- Gitsigns configuration (git signs)
local gitsigns = require("gitsigns")

gitsigns.setup({
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = " <author>, <author_time> - <summary>",
  on_attach = function(buffer)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then return "]c" end
      vim.schedule(function() gs.next_hunk() end)
      return "<Ignore>"
    end, "Next hunk")

    map("n", "[c", function()
      if vim.wo.diff then return "[c" end
      vim.schedule(function() gs.prev_hunk() end)
      return "<Ignore>"
    end, "Prev hunk")

    -- Actions
    map("n", "ghs", gs.stage_hunk, "Stage hunk")
    map("n", "ghr", gs.reset_hunk, "Reset hunk")
    map("v", "ghs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Stage hunk")
    map("v", "ghr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Reset hunk")
    map("n", "ghS", gs.stage_buffer, "Stage buffer")
    map("n", "ghu", gs.undo_stage_hunk, "Undo stage hunk")
    map("n", "ghR", gs.reset_buffer, "Reset buffer")
    map("n", "ghp", gs.preview_hunk, "Preview hunk")
    map("n", "ghb", function() require("gitsigns").blame_line({ full = true }) end, "Blame line")
    map("n", "ghd", gs.diffthis, "Diff this")
    map("n", "ghD", function() gs.diffthis("~") end, "Diff this ~")
    map("n", "ghtd", gs.toggle_deleted, "Toggle deleted")

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Git hunk"),
  end,
})