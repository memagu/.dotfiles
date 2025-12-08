return {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim" },
    after = "nvim-lspconfig",
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        local metals_config = require("metals").bare_config()
        metals_config.capabilities = capabilities

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

