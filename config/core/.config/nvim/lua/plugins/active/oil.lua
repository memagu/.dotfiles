return {
  "stevearc/oil.nvim",
  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },
  lazy = false,
  keys = {
    { "<leader>e", function() require("oil").open() end, desc = "Open Parent Directory" },
  },
  opts = {
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
    view_options = {
      show_hidden = true,
    },
  },
}
