local diag = require("utils.diagnostic")

diag.setup()
vim.keymap.set(
  { "n", "v" },
  "<leader>ud",
  function() diag.toggle_enhanced() end,
  { desc = "Diagnostic: Toggle Virtual Lines (Smart Hide)" }
)
