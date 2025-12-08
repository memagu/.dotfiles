return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        { "L3MON4D3/LuaSnip", version = "v2.*" }
    },
    opts = {
        snippets = { preset = "luasnip" },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    }
}

