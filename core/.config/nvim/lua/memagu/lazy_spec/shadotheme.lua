function ColorMyPencils(color)
	color = color or "shado"
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal",         { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat",    { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr",         { bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr",   { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn",     { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FoldColumn",     { bg = "NONE" })
    vim.api.nvim_set_hl(0, "StatusLine",   { bg = "NONE", fg = "#f280a1" })
    vim.api.nvim_set_hl(0, "StatusLineNC",   { bg = "NONE", fg = "#9966cc" })
end

return {
    "Shadorain/shadotheme",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    lazy = false,
    priority = 1000,
    config = function()
        ColorMyPencils()
    end
}

