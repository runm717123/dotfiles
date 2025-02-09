return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 75, -- Set your desired default width
      mappings = {
        ["s"] = function()
          require("flash").jump() -- Call flash.nvim's jump functionality
        end,
        ["P"] = {
          "toggle_preview",
          config = {
            use_float = false,
            title = "Neo-tree Preview",
          },
        },
      },
    },
  },
}
