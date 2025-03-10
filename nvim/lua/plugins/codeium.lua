return {
  {
    enabled = false,
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
    end,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "Exafunction/codeium.vim", "saghen/blink.compat" },
    keymap = {
      preset = "enter",
      ["<CR>"] = { "select_and_accept" },
    },
    opts = {
      sources = {
        compat = { "codeium" },
        providers = {
          codeium = {
            kind = "Codeium",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}
