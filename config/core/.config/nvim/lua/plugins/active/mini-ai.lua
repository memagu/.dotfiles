return {
    "nvim-mini/mini.ai",
    version = false,
    opts = function()
        local ai = require("mini.ai")
        local ai_ts = ai.gen_spec.treesitter

        return {
            custom_textobjects = {
                b = { { '%b()', '%b[]', '%b{}' }, '^.%s*().-()%s*.$' },
                B = { { '%b()', '%b[]', '%b{}' }, '^.().*().$' },
                F = ai_ts({ a = '@function.outer', i = '@function.inner' }),
                o = ai_ts({ a = '@block.outer', i = '@block.inner' }),
                c = ai_ts({ a = '@class.outer', i = '@class.inner' }),
            },
        }
    end,
}

