return {
    "marko-cerovac/material.nvim",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    lazy = false,
    priority = 1337,
    config = function()
        vim.cmd.colorscheme("material")
        vim.g.material_style = "darker"
    end
}
