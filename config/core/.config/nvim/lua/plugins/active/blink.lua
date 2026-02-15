return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        cmdline = {
            keymap = { preset = "inherit" },
            completion = { menu = { auto_show = true } }
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    }
}

