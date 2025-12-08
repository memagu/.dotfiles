return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 8008135,
    config = function()
        local transparent = require("transparent")

        transparent.setup({
            -- extra_groups = {},
            exclude_groups = {
                "NormalFloat"
            }
        })

        transparent.toggle(true)
    end
}

