return {
  "saghen/blink.pairs",
  version = "*",
  dependencies = "saghen/blink.lib",
  build = function() require("blink.pairs").download():pwait(60000) end,
  lazy = false,
  config = function()
    require("vim._core.ui2").enable({})
    require("blink.pairs").setup({
      mappings = {
        enabled = false,
      },
    })
  end,
}
