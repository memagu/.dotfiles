return {
  "gbprod/substitute.nvim",
  dependencies = { "rachartier/tiny-glimmer.nvim" },
  opts = {
    on_substitute = function() require("tiny-glimmer.support.substitute").substitute_cb() end,
    highlight_substituted_text = { enabled = false },
  },
  keys = {
    { "s", function() require("substitute").operator() end, noremap = true },
    { "S", function() require("substitute").eol() end, noremap = true },
    { "ss", function() require("substitute").line() end, noremap = true },
    { "s", function() require("substitute").visual() end, noremap = true, mode = "x" },
    { "sx", function() require("substitute.exchange").operator() end, noremap = true },
    { "sxx", function() require("substitute.exchange").line() end, noremap = true },
    { "X", function() require("substitute.exchange").visual() end, noremap = true, mode = "x" },
  },
}
