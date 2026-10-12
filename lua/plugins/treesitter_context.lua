return {
  "nvim-treesitter/nvim-treesitter-context",
  opts = {
    enable = true,
    max_lines = 0, -- No limit
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = "outer",
    mode = "cursor", -- or "topline"
    separator = nil,
    zindex = 20,
  },
  keys = {
    {
      "[f",
      function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end,
      desc = "Go to context",
    },
  },
}
