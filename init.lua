vim.opt.cmdheight = 2 -- Increase command-line height
vim.g.python3_host_prog = "C:\\Windows\\py.exe"

vim.o.fileformats = "dos"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
