return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TodoTrouble", "TodoTelescope", "TodoSnacks", "TodoLocList", "TodoQuickFix" },
  opts = {
    highlight = {
      comments_only = true,
    },
  },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>st", "<cmd>TodoSnacks<cr>", desc = "Todo (Snacks)" },
  },
}
