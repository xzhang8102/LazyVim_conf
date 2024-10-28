-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<c-h>")
vim.keymap.del("n", "<c-l>")
vim.keymap.del("t", "<c-h>")
vim.keymap.del("t", "<c-j>")
vim.keymap.del("t", "<c-k>")
vim.keymap.del("t", "<c-l>")
