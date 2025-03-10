return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      nix = { "alejandra" }, -- or "nixpkgs_fmt"
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
  },
}
