function ColorMyPencils(color)
	color = color or "material"
	vim.cmd.colorscheme(color)
    vim.g.material_style = "darker"

	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" } )
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" } )
end

return {
    "marko-cerovac/material.nvim",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    lazy = false,
    priority = 1000,
    config = function()
        ColorMyPencils()
    end
}
