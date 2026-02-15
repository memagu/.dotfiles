return {
    "nvim-mini/mini.surround",
    version = false,
    opts = function()
        local sr = require("mini.surround")
        local sr_ts = sr.gen_spec.input.treesitter

        return {
            n_lines = 500,
            respect_selection_type = true,
            mappings = {
                add = "gs",
                delete = "ds",
                replace = "cs",
                highlight = "",
                find = "",
                find_left = "",
            },
            custom_surroundings = {
                b = {
                    input = { { "%b()", "%b[]", "%b{}" }, "^.%s*().-()%s*.$" },
                    output = { left = "(", right = ")" },
                },
                B = {
                    input = { { "%b()", "%b[]", "%b{}" }, "^.().*().$" },
                    output = { left = "{ ", right = " }" },
                },
                F = { input = sr_ts({ outer = "@function.outer", inner = "@function.inner" }) },
                o = { input = sr_ts({ outer = "@block.outer", inner = "@block.inner" }) },
                c = { input = sr_ts({ outer = "@class.outer", inner = "@class.inner" }) },
            },
        }
    end,
}
