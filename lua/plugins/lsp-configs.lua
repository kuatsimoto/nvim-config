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
      ensure_installed = {"lua_ls","gopls","ts_ls","pyright"},
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
      local lspconfig = require("lspconfig")
      local capabilities = require('blink.cmp').get_lsp_capabilities() 

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      -- vim.lsp.configs.lua_ls.setup({})
      lspconfig.gopls.setup({})
      -- vim.lsp.configs.gopls.setup({})
      lspconfig.pyright.setup({})
      -- vim.lsp.configs.pyright.setup({})
      lspconfig.ts_ls.setup({})
      -- vim.lsp.configs.ts_ls.setup({})
      vim.diagnostic.config({
        virtual_text = {
          prefix = "■",   -- You can change this to "■", "▶", "◆", etc.
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
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
