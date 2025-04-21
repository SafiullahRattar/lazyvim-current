-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>m", "a{}<Esc>i<CR><Esc>O", { desc = "Curly brace around" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Code Companion Chat" })
vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanionActions<cr>", { desc = "Code Companion Actions" })
