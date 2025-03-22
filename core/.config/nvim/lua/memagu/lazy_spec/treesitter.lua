return { 
    "nvim-treesitter/nvim-treesitter",
    build = require("nvim-treesitter.install").update({ with_sync = true }),
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}
