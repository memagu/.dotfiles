return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  event = { "BufReadPost", "BufNewFile" },

  config = function()
    require("mason").setup()

    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              vim.fn.stdpath("data") .. "/lazy/snacks.nvim",
            },
          },
        },
      },
    })
    vim.lsp.config("denols", { root_markers = { "deno.json" } })
    vim.lsp.config("ts_ls", { root_markers = { "package.json" }, single_file_support = false })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "bashls", "fish_lsp" },
      automatic_enable = true,
    })
  end,
}
