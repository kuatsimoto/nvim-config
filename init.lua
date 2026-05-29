-- Ensure Neovim bundled tree-sitter is used
package.loaded["tree-sitter"] = nil
package.loaded["tree-sitter.parsers"] = nil

-- Enable project-local configuration files (.nvim.lua, .exrc, etc.)
vim.o.exrc = true

require("config.lazy")
require("vim-options")


-- WSL Clipboard integration using win32yank for better performance
vim.g.clipboard = {
  name = 'Win32yank',
  copy = {
    ['+'] = 'win32yank.exe -i --crlf',
    ['*'] = 'win32yank.exe -i --crlf',
  },
  paste = {
    ['+'] = 'win32yank.exe -o --lf',
    ['*'] = 'win32yank.exe -o --lf',
  },
  cache_enabled = 0,
}
vim.opt.clipboard = 'unnamedplus'
vim.opt.ambiwidth = "single"
vim.opt.termguicolors = true
