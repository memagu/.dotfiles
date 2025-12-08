return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 8008135,
    config = function()
        local transparent = require("transparent")

        transparent.setup({
            groups = {
                "Normal",
                "NormalNC",
                "NormalFloat",
                "Comment",
                "Constant",
                "Special",
                "Identifier",
                "Statement",
                "PreProc",
                "Type",
                "Underlined",
                "Todo",
                "String",
                "Function",
                "Conditional",
                "Repeat",
                "Operator",
                "Structure",
                "LineNr",
                "NonText",
                "SignColumn",
                "CursorLine",
                "CursorLineNr",
                "StatusLine",
                "StatusLineNC",
                "EndOfBuffer",
                "DiagnosticVirtualTextError",
                "DiagnosticVirtualTextWarn",
                "DiagnosticVirtualTextInfo",
                "DiagnosticVirtualTextHint",
                "DiagnosticSignError",
                "DiagnosticSignWarn",
                "DiagnosticSignInfo",
                "DiagnosticSignHint",
                "DiagnosticUnderlineError",
                "DiagnosticUnderlineWarn",
                "DiagnosticUnderlineInfo",
                "DiagnosticUnderlineHint"
            },
            extra_groups = {},
            exclude_groups = {}
        })
        transparent.toggle(true)
    end
}

