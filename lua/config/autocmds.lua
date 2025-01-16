-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- File: ~/.config/nvim/init.lua or ~/.config/nvim/lua/plugins/custom_config.lua
vim.api.nvim_create_augroup("HighlightCurrentLine", { clear = true })

-- vim.api.nvim_set_hl(0, "CustomCursorLine", { bg = "#FFD700", fg = "NONE" })

vim.api.nvim_create_autocmd("WinEnter", {
  group = "HighlightCurrentLine",
  callback = function()
    vim.cmd("set cursorline")
    -- vim.api.nvim_set_hl(0, "CursorLine", { link = "CustomCursorLine" })
    vim.defer_fn(function()
      vim.cmd("set nocursorline")
      -- vim.api.nvim_set_hl(0, "CursorLine", {})
    end, 1000)
  end,
})
