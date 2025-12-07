return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function(_, opts)
        -- ensure highlights exist after colorscheme overrides
        local hooks = require("ibl.hooks")
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "IblScope",  { fg = "#f280a1", bold = true })
            vim.api.nvim_set_hl(0, "IblIndent", { fg = "#9966cc" })
        end)

        require("ibl").setup(opts)
    end
}
