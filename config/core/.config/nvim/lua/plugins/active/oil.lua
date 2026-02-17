return {
  "stevearc/oil.nvim",
  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },
  lazy = false,
  opts = {
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
    view_options = {
      show_hidden = true,
    },
  },
}
