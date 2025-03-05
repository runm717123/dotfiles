vim.opt.cmdheight = 2 -- Increase command-line height
vim.g.python3_host_prog = "C:\\Windows\\py.exe"

if vim.g.neovide then
  vim.o.guifont = "InconsolataGo Nerd Font Mono" -- text below applies for VimScript
  vim.g.neovide_floating_blur_amount_x = 1.0
  vim.g.neovide_floating_blur_amount_y = 1.0

  vim.g.neovide_opacity = 0.8
  vim.g.neovide_normal_opacity = 0.8
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
