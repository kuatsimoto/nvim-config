return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- Select blink version
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
      documentation = { auto_show = false },
      -- Reduce typing lag by delaying completion popup
      trigger = {
        show_on_insert_on_trigger_character = false,
      },
    },

    sources = {
      -- Remove 'buffer' source which scans all files in large projects
      default = { 'lsp', 'path', 'snippets' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
