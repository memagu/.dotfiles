vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#f280a1" })
    vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#9966cc" })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
  end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "DiagnosticChanged" }, {
  desc = "Disable diagnostic.virtual_text on any line affected by the diagnostic",
  group = vim.api.nvim_create_augroup("diagnostic_virt_text_hide", { clear = true }),
  callback = function(ev)
    local cursor_lnum = vim.api.nvim_win_get_cursor(0)[1]
    cursor_lnum = cursor_lnum - 1

    -- Always show diagnostics first, then selectively remove
    vim.diagnostic.show(nil, ev.buf)

    for _, diagnostic in ipairs(vim.diagnostic.get(ev.buf)) do
      local start_line = diagnostic.lnum
      local end_line = diagnostic.end_lnum or start_line
      if cursor_lnum >= start_line and cursor_lnum <= end_line then
        for _, namespace in pairs(vim.diagnostic.get_namespaces()) do
          local ns_id = namespace.user_data.virt_text_ns
          if ns_id then
            local extmarks = vim.api.nvim_buf_get_extmarks(ev.buf, ns_id, { start_line, 0 }, { end_line, -1 }, {})
            for _, extmark in pairs(extmarks) do
              vim.api.nvim_buf_del_extmark(ev.buf, ns_id, extmark[1])
            end
          end
        end
      end
    end
  end,
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
