return {
    "lewis6991/gitsigns.nvim",
    opts = {
        word_diff = false,
        current_line_blame = false,
        current_line_blame_opts = {
            delay = 100,
        },
        on_attach = function(bufnr)
            vim.keymap.set("n", "<leader>uw", require("gitsigns").toggle_word_diff, {
                buffer = bufnr,
                desc = "Toggle Word Diff"
            })
            vim.keymap.set("n", "<leader>ub", require("gitsigns").toggle_current_line_blame, {
                buffer = bufnr,
                desc = "Toggle Git Blame Line"
            })
        end,
    },
}
