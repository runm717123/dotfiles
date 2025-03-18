return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>ff",
      function() require("fzf-lua").files({ cwd = vim.fn.getcwd() }) end,
      desc = "Find Files (cwd)",
    },
    {
      "<leader>fF",
      function() require("fzf-lua").files() end,
      desc = "Find Files",
    },
  },
}
