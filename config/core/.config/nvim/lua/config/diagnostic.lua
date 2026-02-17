vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = true,
  float = { border = "rounded", style = "minimal", source = "if_many", header = "", prefix = "" },
  virtual_lines = { current_line = true },
  virtual_text = { source = "if_many", spacing = 4 },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
})
