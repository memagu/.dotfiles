return {
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/cmp-nvim-lsp"
    },
    after = "nvim-lspconfig", -- Ensure LSP is configured first
    config = function()
      -- Replicate capabilities setup from lsp.lua
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      -- Metals configuration
      local metals_config = require("metals").bare_config()
      metals_config.capabilities = capabilities

      -- Define custom on_attach if needed
      metals_config.on_attach = function(client, bufnr)
        -- Additional custom LSP settings, keymaps, etc. for Scala
      end

      -- Auto-attach Metals to Scala files
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "sc" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  }
}
