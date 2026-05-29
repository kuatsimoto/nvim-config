return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "gopls", "vtsls", "pyright", "rust_analyzer" },
    },
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Set shared capabilities for ALL LSP servers via wildcard config
      -- Individual servers inherit these unless they explicitly override
      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      -- Configure standard servers with new API (capabilities inherited from '*')
      vim.lsp.config('lua_ls', {})
      vim.lsp.config('gopls', {})
      vim.lsp.config('pyright', {})
      vim.lsp.config('rust_analyzer', {
        settings = {
          ['rust-analyzer'] = {},
        },
      })

      -- Enable standard servers
      vim.lsp.enable({ 'lua_ls', 'gopls', 'pyright', 'rust_analyzer' })

      -- vtsls - Uses lspconfig.setup() instead of vim.lsp.config() because:
      -- 1. Custom yarn command requires proper PnP-aware invocation
      -- 2. vim.lsp.config() + vim.lsp.enable() doesn't attach with custom commands
      -- 3. This approach works reliably and produces only one deprecation warning
      -- Using 'yarn run --binaries-only' instead of 'yarn dlx' for 3x faster startup
      local lspconfig = require("lspconfig")
      lspconfig.vtsls.setup({
        capabilities = capabilities,
        cmd = { "yarn", "run", "--binaries-only", "vtsls", "--stdio" },
        root_dir = function(fname)
          return vim.fs.root(fname, { ".git", "package.json", ".yarnrc.yml" })
        end,
        settings = {
          typescript = {
            -- Reduce typing lag by limiting diagnostics during typing
            updateImportsOnFileMove = { enabled = "never" },
            suggest = {
              completeFunctionCalls = false,
            },
            inlayHints = {
              parameterNames = { enabled = "none" },
              parameterTypes = { enabled = false },
              variableTypes = { enabled = false },
              propertyDeclarationTypes = { enabled = false },
              functionLikeReturnTypes = { enabled = false },
              enumMemberValues = { enabled = false },
            },
          },
          javascript = {
            updateImportsOnFileMove = { enabled = "never" },
            suggest = {
              completeFunctionCalls = false,
            },
            inlayHints = {
              parameterNames = { enabled = "none" },
              parameterTypes = { enabled = false },
              variableTypes = { enabled = false },
              propertyDeclarationTypes = { enabled = false },
              functionLikeReturnTypes = { enabled = false },
              enumMemberValues = { enabled = false },
            },
          },
          vtsls = {
            -- Performance: Use faster semantic checking
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = false,
              },
            },
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = {
          prefix = "■", -- You can change this to "■", "▶", "◆", etc.
          spacing = 2,
          source = "if_many", -- show source if multiple LSPs
        },
        signs = true, -- signs in the gutter
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
