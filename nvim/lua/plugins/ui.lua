return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "buffers",
        separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
    keys = {
      {
        "L",
        function()
          vim.cmd("bnext " .. vim.v.count1)
        end,
        desc = "Next buffer",
      },
      {
        "H",
        function()
          vim.cmd("bprev " .. vim.v.count1)
        end,
        desc = "Previous buffer",
      },
      {
        "]b",
        function()
          vim.cmd("bnext " .. vim.v.count1)
        end,
        desc = "Next buffer",
      },
      {
        "[b",
        function()
          vim.cmd("bprev " .. vim.v.count1)
        end,
        desc = "Previous buffer",
      },
    },
  },
}
