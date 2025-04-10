-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- escape from i mode to n mode
vim.keymap.set("i", "jj", "<ESC>")
-- escape from terminal mode to n mode
vim.keymap.set("t", "<C-\\><C-\\>", "<C-\\><C-N>")

vim.keymap.set("n", "<c-/>", function()
  Snacks.terminal(nil, { win = { position = "float" } })
end, { desc = "Terminal (Root Dir)" })
