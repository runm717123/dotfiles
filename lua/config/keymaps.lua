-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local cowboy = require("mine.cowboy")

cowboy()

vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = "Move Buffer Backward" })
vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = "Move Buffer Forward" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

local noRemapAndSilent = { noremap = true, silent = true }

-- Ctrl+Backspace: Delete the current line
vim.keymap.set("i", "<C-h>", "<Esc>cc", opts) -- Insert mode
-- Alt+Backspace: Delete the previous word
vim.keymap.set("i", "<A-BS>", "<C-w>", opts) -- Insert mode
