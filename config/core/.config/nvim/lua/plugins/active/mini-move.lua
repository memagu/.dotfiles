return {
  "nvim-mini/mini.move",
  version = false,
  keys = {
    { "<M-h>", mode = { "n", "v" }, desc = "Move Left" },
    { "<M-j>", mode = { "n", "v" }, desc = "Move Down" },
    { "<M-k>", mode = { "n", "v" }, desc = "Move Up" },
    { "<M-l>", mode = { "n", "v" }, desc = "Move Right" },
  },
  opts = {
    mappings = {
      -- Move visual selection in Visual mode
      left = "<M-h>",
      right = "<M-l>",
      down = "<M-j>",
      up = "<M-k>",

      -- Move current line in Normal mode
      line_left = "<M-h>",
      line_right = "<M-l>",
      line_down = "<M-j>",
      line_up = "<M-k>",
    },
  },
}
