return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  priority = 420,
  config = function()
    local transparent = require("transparent")

    transparent.setup({
      exclude_groups = {
        "NormalFloat",
      },
    })

    transparent.clear_prefix("TreesitterContext")

    transparent.toggle(true)
  end,
}
