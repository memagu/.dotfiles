return {
    "Shadorain/shadotheme",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    lazy = false,
    priority = 1337,
    config = function()
        vim.cmd.colorscheme("shado")
    end
}

