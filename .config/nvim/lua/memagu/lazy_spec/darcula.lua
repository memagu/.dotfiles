function ColorMyPencils(color)
	color = color or "darcula"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" } )
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" } )
end

return {
    "doums/darcula",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    lazy = false,
    priority = 1000,
    config = function()
        ColorMyPencils()
    end
}
