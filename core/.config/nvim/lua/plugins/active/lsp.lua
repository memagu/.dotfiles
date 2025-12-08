return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "Saghen/blink.cmp",
        "j-hui/fidget.nvim"
    },

    config = function()
        require("fidget").setup()
        require("mason").setup()

        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "fish_lsp",
                "lua_ls",
            },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({ capabilities = capabilities })
                end,
                lua_ls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end
            }
        })
    end
}

