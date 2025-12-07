return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        require("telescope").setup({})
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>f", builtin.find_files, {})
        vim.keymap.set("n", "<leader>g", function()
            builtin.grep_string({ search = vim.fn.input("grep > ") })
        end)
        vim.keymap.set("n", "<leader>F", builtin.git_files, {})
    end
}

