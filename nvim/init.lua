vim.opt.cmdheight = 2 -- Increase command-line height

if vim.g.neovide then
  vim.o.guifont = "InconsolataGo Nerd Font Mono" -- text below applies for VimScript
  vim.g.neovide_floating_blur_amount_x = 1.0
  vim.g.neovide_floating_blur_amount_y = 1.0

  vim.g.neovide_opacity = 0.85
  vim.g.neovide_normal_opacity = 0.85

  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.15)
  end)
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
