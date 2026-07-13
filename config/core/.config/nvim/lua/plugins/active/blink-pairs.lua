return {
  "saghen/blink.pairs",
  -- version = "*", -- uncomment and switch to `download()` when fix is released
  dependencies = "saghen/blink.lib",
  build = function() require("blink.pairs").build():pwait(60000) end, -- use `download()` instead of `build()` when fix is released
  event = "BufReadPost",
  config = function()
    require("vim._core.ui2").enable({})
    require("blink.pairs").setup({
      mappings = {
        enabled = false,
      },
    })
  end,
}
