vim.opt.cmdheight = 2 -- Increase command-line height
vim.g.python3_host_prog = "C:\\Windows\\py.exe"

-- avoid eslint warning to insert "cr"
vim.cmd([[
 autocmd BufWritePre * :set fileformat=dos 
]])

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    vim.opt.fileformat = "dos"
  end,
})

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
