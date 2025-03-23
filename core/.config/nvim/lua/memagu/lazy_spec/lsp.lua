-- Load the nvim-lspconfig plugin
return {
  "neovim/nvim-lspconfig",

  -- List of dependencies required for this configuration
  dependencies = {
    "williamboman/mason.nvim", -- Plugin manager for installing LSP servers
    "williamboman/mason-lspconfig.nvim", -- Helper for configuring LSP servers
    "hrsh7th/cmp-nvim-lsp", -- Completion engine for LSP
    "hrsh7th/cmp-buffer", -- Completion engine for buffer contents
    "hrsh7th/cmp-path", -- Completion engine for path names
    "hrsh7th/cmp-cmdline", -- Completion engine for command line mode
    "hrsh7th/nvim-cmp", -- Wrapper around various completion engines
    "L3MON4D3/LuaSnip", -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Integration between nvim-cmp and LuaSnip
    "j-hui/fidget.nvim", -- Progress bar for long-running LSP operations
  },

  -- Main configuration function
  config = function()
    -- Require necessary modules
    local cmp = require("cmp") -- nvim-cmp module
    local cmp_lsp = require("cmp_nvim_lsp") -- Module for nvim-cmp integration with LSP
    local capabilities = vim.tbl_deep_extend( -- Extend default LSP capabilities
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(), -- Default LSP capabilities
      cmp_lsp.default_capabilities() -- Additional capabilities required by cmp_nvim_lsp
    )

    -- Setup fidget.nvim for progress bars
    require("fidget").setup({})

    -- Setup mason.nvim for managing LSP servers
    require("mason").setup()

    -- Configure LSP servers using mason-lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "lua_ls",
        "remark_ls",
        "pyright"
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
      }
    })

    -- Custom on_attach
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>wd", vim.lsp.buf.document_symbol, opts)
      end,
    })

    -- Define select behavior for completion items
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    -- Setup nvim-cmp for autocompletion
    cmp.setup({
      snippet = { -- Snippet expansion settings
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- Expand snippets using LuaSnip
        end,
      },
      mapping = cmp.mapping.preset.insert({ -- Key mappings for completion
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- Move to previous item
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- Move to next item
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
      }),
      sources = cmp.config.sources({ -- Sources for autocompletion
        { name = 'nvim_lsp' }, -- LSP-based completions
        { name = 'luasnip' }, -- Snippets
      }, {
        { name = 'buffer' }, -- Buffer completions
      })
    })

    -- Configure diagnostic display settings
    vim.diagnostic.config({
      float = { -- Settings for floating window diagnostics
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}

