return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
    formatters = {
      ruff_format = {
        command = "ruff",
      },
      prettier = {},
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },

  config = function(_, opts)
    require("conform").setup(opts)
  end,
}
