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
-- neovide
vim.keymap.set("i", "<C-BS>", "<C-w>", noRemapAndSilent)
-- nvim
vim.keymap.set("i", "<C-h>", "<C-w>", noRemapAndSilent)

local copyRelativePathOptions =
    vim.tbl_extend("force", noRemapAndSilent, { desc = "Copy relative path of current file" })

vim.keymap.set("n", "<leader>cp", function()
  local filepath = vim.fn.expand("%")
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

  if git_root then
    local relative_path = filepath:gsub("^" .. vim.pesc(git_root .. "/"), "")
    vim.fn.setreg("+", "./" .. relative_path)
    vim.notify("Copied relative path: ./" .. relative_path)
  else
    local filepath = vim.fn.expand("%")
    vim.fn.setreg("+", filepath)
    vim.notify("Copied path without git: " .. filepath)
  end
end, copyRelativePathOptions)

local triggerAutoCompleteOptions = vim.tbl_extend("force", noRemapAndSilent, { desc = "Trigger autocomplete" })

vim.keymap.set("i", "<C-L>", function()
  local blink = require("blink-cmp")
  blink.show({
    providers = { "lsp" },
  })
end, triggerAutoCompleteOptions)


vim.keymap.set("n", "Q", "@q", { desc = "Execute last recorded macro" })

-- quickfix
vim.keymap.set("n", "<leader>xc", ":cexpr []<CR>", { desc = "Clear Quickfix List" })
vim.keymap.set("n", "<F1>", function()
  vim.fn.setqflist({}, "a", { title = "Quickfix", items = { { filename = vim.fn.expand("%") } } })
  vim.notify("Added current file to Quickfix List", vim.log.levels.INFO)
end, { desc = "Add Current File to Quickfix List" })
-- add opened buffers
vim.keymap.set("n", "<leader>xb", function()
  local bufs = vim.api.nvim_list_bufs()
  local qf_list = {}

  for _, buf in ipairs(bufs) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
      local bufname = vim.api.nvim_buf_get_name(buf)
      if bufname ~= "" then
        table.insert(qf_list, { filename = bufname, lnum = 1, col = 1, text = "Buffer: " .. bufname })
      end
    end
  end

  vim.fn.setqflist(qf_list, "r")
  vim.cmd("copen")
end, { desc = "Add Open Buffers to Quickfix List" })

-- Function to insert console.log under the cursor
local function add_console_log()
  local line_number = vim.api.nvim_win_get_cursor(0)[1]
  local var_name = vim.fn.expand("<cword>")
  -- Get the current file name (without the full path)
  local file_name = vim.fn.expand("%:t")
  -- Prepare the console.log statement
  local log_statement = string.format([[console.log("%s:%d -> %s", %s);]], file_name, line_number, var_name, var_name)
  -- Insert the line below the current line
  vim.api.nvim_buf_set_lines(0, line_number, line_number, false, { log_statement })
end

-- Keymap to trigger the console.log insertion
vim.keymap.set("n", "<leader>xd", add_console_log, { desc = "Add console.log under cursor" })
