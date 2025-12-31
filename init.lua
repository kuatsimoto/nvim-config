-- Ensure Neovim bundled tree-sitter is used
package.loaded["tree-sitter"] = nil
package.loaded["tree-sitter.parsers"] = nil

require("config.lazy")
require("vim-options")


vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("\r", ""))',
    ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("\r", ""))',
  },
  cache_enabled = 0,
}
vim.opt.clipboard = 'unnamedplus'   -- Optional: Use system clipboard by default
