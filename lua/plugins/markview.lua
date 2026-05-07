return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- Completeion for `blink.cmp`
  dependencies = { "saghen/blink.cmp" },
  config = function()
    require("markview").setup({
      tables = {
        enable = true,
        -- use_virt_lines = true,
        col_min_width = 5,
        block_decorator = true,
        parts = {
          top = true,
          header = true,
          separator = true,
          body = true,
          bottom = true,
        }
      }
    })
  end
}
