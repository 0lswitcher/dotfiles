-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>h", Snacks.dashboard.open, { desc = "Open the start dashboard" })
vim.keymap.set("n", "<Esc>", Snacks.dashboard.open, { desc = "Open the start dashboard" })
