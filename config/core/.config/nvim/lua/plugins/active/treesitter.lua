return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function() require("nvim-treesitter").install({ "query", "lua", "vim", "vimdoc", "bash" }) end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      enable = true,
      line_numbers = true,
      multiline_threshold = 20,
      mode = "cursor",
    },
  },
}
