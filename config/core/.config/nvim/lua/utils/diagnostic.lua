local M = {}

M.enhanced = false
local base_opts = {
  severity_sort = true,
  update_in_insert = true,
  float = { border = "rounded", style = "minimal", source = "if_many", header = "", prefix = "" },
  virtual_text = { source = "if_many", spacing = 4 },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
}
local profile_standard = vim.tbl_deep_extend("force", base_opts, { virtual_lines = false })
local profile_enhanced = vim.tbl_deep_extend("force", base_opts, { virtual_lines = { current_line = true } })

function M.update_diag_hover(bufnr)
  vim.diagnostic.show(nil, bufnr)

  if not M.enhanced then
    return
  end

  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(bufnr)
  local namespaces = vim.diagnostic.get_namespaces()

  for _, diag in ipairs(diagnostics) do
    local start_row = diag.lnum
    local end_row = diag.end_lnum or start_row
    if not (start_row <= row and row <= end_row) then
      goto next_diag
    end

    for _, ns in pairs(namespaces) do
      local ns_id = ns.user_data.virt_text_ns
      if not ns_id then
        goto next_ns
      end

      local extmarks = vim.api.nvim_buf_get_extmarks(bufnr, ns_id, { start_row, 0 }, { end_row, -1 }, {})
      for _, extmark in pairs(extmarks) do
        local extmark_id = extmark[1]
        vim.api.nvim_buf_del_extmark(bufnr, ns_id, extmark_id)
      end

      ::next_ns::
    end

    ::next_diag::
  end
end

function M.toggle_enhanced()
  M.enhanced = not M.enhanced
  if M.enhanced then
    vim.diagnostic.config(profile_enhanced)
  else
    vim.diagnostic.config(profile_standard)
  end
  M.update_diag_hover(0)
end

function M.setup(opts)
  local defaults = {
    start_enhanced = false,
  }
  local config = vim.tbl_deep_extend("force", defaults, opts or {})
  local profile = config.start_enhanced and profile_enhanced or profile_standard

  vim.diagnostic.config(profile)
end

return M
