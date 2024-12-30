-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local cowboy = require("mine.cowboy")

cowboy() -- prevent bad behaviour

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = "Move Buffer Backward" })
vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = "Move Buffer Forward" })

vim.keymap.set("n", "te", ":tabedit")

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

local noRemapAndSilent = { noremap = true, silent = true }

-- delete word shortcut
vim.keymap.set("i", "<A-BS>", "<Esc>cc", noRemapAndSilent)
vim.keymap.set("i", "<C-h>", "<C-w>", noRemapAndSilent)

local copyRelativePathOptions =
  vim.tbl_extend("force", noRemapAndSilent, { desc = "Copy relative path of current file" })

vim.keymap.set("n", "<leader>cp", function()
  vim.notify("test executed", vim.log.levels.INFO) -- Log a notification
  local filepath = vim.fn.expand("%")
  vim.fn.setreg("+", filepath) -- Copies to system clipboard
  vim.notify("Copied relative path: " .. filepath)
end, copyRelativePathOptions)

local triggerAutoCompleteOptions = vim.tbl_extend("force", noRemapAndSilent, { desc = "Trigger autocomplete" })

vim.keymap.set("i", "<C-L>", function()
  local blink = require("blink-cmp")
  blink.show({
    providers = { "lsp" },
  })
end, triggerAutoCompleteOptions)

vim.keymap.set("n", "<leader>w\\", ":vsplit<CR>", noRemapAndSilent)
vim.keymap.set("n", "<leader>w-", ":split<CR>", noRemapAndSilent)
