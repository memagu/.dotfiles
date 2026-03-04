return {
  "spacedentist/resolve.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  keys = {
    { "<leader>gcd", function() require("resolve").detect_conflicts() end, desc = "Detect Git Conflicts" },
  },
}
