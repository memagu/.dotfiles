vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#f280a1" })
    vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#9966cc" })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf, remap = false }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
  end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "DiagnosticChanged" }, {
  desc = "Disable diagnostic.virtual_text on cursor line",
  group = vim.api.nvim_create_augroup("diagnostic_virtual_text_hide", { clear = true }),
  callback = function(event) require("utils.diagnostic").update_diag_hover(event.buf) end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(event)
    local actions = vim.tbl_get(event, "data", "actions")
    if not actions then
      return
    end

    for _, action in ipairs(actions) do
      if action.type == "move" then
        Snacks.rename.on_rename_file(action.src_url, action.dest_url)
      end
    end
  end,
})
