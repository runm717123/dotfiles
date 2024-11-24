vim.opt.cmdheight = 2 -- Increase command-line height
vim.g.python3_host_prog = "C:\\Windows\\py.exe"

vim.o.fileformats = "dos"
vim.opt.fileformats = { "dos", "unix" } -- Accept both CRLF and LF

-- avoid eslint warning to insert "cr"
vim.cmd([[
  autocmd BufWritePre * :set fileformat=unix
]])

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
