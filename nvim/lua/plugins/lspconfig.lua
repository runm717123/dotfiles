return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        settings = {
          typescript = {
            preferences = {
              preferTypeOnlyAutoImports = true, -- Enable type-only auto imports
            },
          },
        },
      },
    },
  },
}
