return {
  "saghen/blink.pairs",
  version = "*",
  dependencies = "saghen/blink.download",
  event = "BufReadPost",
  opts = {
    mappings = {
      enabled = false,
    },
  },
}
