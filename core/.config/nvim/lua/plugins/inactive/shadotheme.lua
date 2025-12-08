return {
    "Shadorain/shadotheme",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    lazy = false,
    priority = 1337,
    config = function()
        vim.cmd.colorscheme("shado")

        vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#f280a1" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#9966cc" })
    end
}

