return {
  "scalameta/nvim-metals",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "scala", "sbt", "sc" },
  config = function()
    local metals = require("metals")
    local config = metals.bare_config()

    config.settings = {
      showImplicitArguments = true,
      superMethodLensesEnabled = true,
    }

    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "sc" },
      callback = function() metals.initialize_or_attach(config) end,
      group = nvim_metals_group,
    })
  end,
}
