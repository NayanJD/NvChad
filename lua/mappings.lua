require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })

map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "Debug go test" })

map("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end, { desc = "Debug last go test" })

-- Navigation
map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    gitsigns.nav_hunk "next"
  end
end)

map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    gitsigns.nav_hunk "prev"
  end
end)

-- Actions
map("n", "<leader>hs", gitsigns.stage_hunk)
map("n", "<leader>hr", gitsigns.reset_hunk)

map("v", "<leader>hs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end)

map("v", "<leader>hr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end)

map("n", "<leader>hS", gitsigns.stage_buffer)
map("n", "<leader>hR", gitsigns.reset_buffer)
map("n", "<leader>hp", gitsigns.preview_hunk)
map("n", "<leader>hi", gitsigns.preview_hunk_inline)

map("n", "<leader>hb", function()
  gitsigns.blame_line { full = true }
end)

map("n", "<leader>hd", gitsigns.diffthis)

map("n", "<leader>hD", function()
  gitsigns.diffthis "~"
end)

map("n", "<leader>hQ", function()
  gitsigns.setqflist "all"
end)
map("n", "<leader>hq", gitsigns.setqflist)

-- Toggles
map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
map("n", "<leader>td", gitsigns.toggle_deleted)
map("n", "<leader>tw", gitsigns.toggle_word_diff)

-- Text object
map({ "o", "x" }, "ih", gitsigns.select_hunk)
