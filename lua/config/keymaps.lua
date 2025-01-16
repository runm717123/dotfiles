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

-- Disable the 'q' key in normal mode
vim.keymap.set("n", "q", "<Nop>", { desc = "Disable q key" })

-- Optionally map another key for recording macros
vim.keymap.set("n", "<Leader>r", "q", { desc = "Start/Stop recording a macro" })
vim.keymap.set("n", "Q", "@q", { desc = "Execute last recorded macro" })

-- quickfix
vim.keymap.set("n", "<leader>xc", ":cexpr []<CR>", { desc = "Clear Quickfix List" })
vim.keymap.set("n", "<leader>xa", function()
  vim.fn.setqflist({}, "a", { title = "Quickfix", items = { { filename = vim.fn.expand("%") } } })
  vim.notify("Added current file to Quickfix List", vim.log.levels.INFO)
end, { desc = "Add Current File to Quickfix List" })

-- Function to insert console.log under the cursor
local function add_console_log()
  local line_number = vim.api.nvim_win_get_cursor(0)[1]
  local var_name = vim.fn.expand("<cword>")
  local file_name = vim.fn.expand("%")
  -- Prepare the console.log statement
  local log_statement = string.format([[console.log(%s, "%s - %s:%d");]], var_name, var_name, file_name, line_number)
  -- Insert the line below the current line
  vim.api.nvim_buf_set_lines(0, line_number, line_number, false, { log_statement })
end

-- Keymap to trigger the console.log insertion
vim.keymap.set("n", "<leader>xd", add_console_log, { desc = "Add console.log under cursor" })
