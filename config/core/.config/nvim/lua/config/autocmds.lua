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

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
  callback = function(event)
    local bufnr = event.buf
    local ft = vim.bo[bufnr].filetype
    local lang = vim.treesitter.language.get_lang(ft) or ft

    local ok, parsers = pcall(require, "nvim-treesitter.parsers")
    if not ok or not parsers[lang] then
      return
    end

    local ok, treesitter = pcall(require, "nvim-treesitter")
    if not ok then
      return
    end

    treesitter.install({ lang }):await(function(err)
      if err then
        vim.notify("Treesitter failed to install parser for filetype:  " .. ft .. ". " .. err)
        return
      end
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end

      vim.treesitter.start(bufnr, lang)
      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[0][0].foldmethod = "expr"
      vim.wo[0][0].foldlevel = 1337
      vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end)
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
