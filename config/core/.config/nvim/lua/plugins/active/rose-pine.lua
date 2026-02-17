return {
  "rose-pine/neovim",
  name = "rose-pine",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  lazy = false,
  priority = 1337,
  config = function() vim.cmd.colorscheme("rose-pine") end,
}
