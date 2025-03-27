return {
  "MagicDuck/grug-far.nvim",
  opts = { headerMaxWidth = 80 },
  cmd = "GrugFar",
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            filesFilter = (ext == "js" or ext == "ts" or ext == "tsx") and "*.{ts,tsx,js}\n!*.test.*"
              or (ext and ext ~= "" and "*." .. ext or nil),
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
  },
}
