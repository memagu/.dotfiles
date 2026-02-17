return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 420,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_fix" },
        rust = { "rustfmt" },
        go = { "goimports", "gofmt" },
        sh = { "shfmt" },
        fish = { "fish_indent" },
      },
    })
  end,
}
