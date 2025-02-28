return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 45, -- Set your desired default width
      mappings = {
        ["s"] = function()
          require("flash").jump() -- Call flash.nvim's jump functionality
        end,
      },
    },
  },
}
