return {
  "Wansmer/treesj",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "L",
      function()
        require("treesj").toggle({ split = {
          reqursive = false,
        } })
      end,
      desc = "Toggle Line Split",
      mode = { "n", "x" },
    },
  },
  opts = {
    use_default_keymaps = false,
    max_join_length = 8008135,
  },
}
