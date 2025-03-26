-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.winbar = "%=%m %f"
vim.opt.wrap = true

vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

--- Disable hiding of markup
vim.opt.conceallevel = 0

--- Copy the indent of the current line when inserting a new line
vim.opt.autoindent = true

--- Disable the inlay hints (additional information about types and parameters names) because it clutters my view
vim.g.lazyvim_no_inlay_hints = true
