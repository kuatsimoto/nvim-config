-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -- Add lazy.nvim plugins to package.path
-- local lazy_root = vim.fn.stdpath("data") .. "/lazy"
-- local handle = vim.loop.fs_scandir(lazy_root)
-- if handle then
--   while true do
--     local name, typ = vim.loop.fs_scandir_next(handle)
--     if not name then break end
--     if typ == "directory" then
--       local lua_path = string.format("%s/%s/lua/?.lua;%s/%s/lua/?/init.lua;", lazy_root, name, lazy_root, name)
--       package.path = lua_path .. package.path
--       local lua_cpath = string.format("%s/%s/lua/?.so;", lazy_root, name)
--       package.cpath = lua_cpath .. package.cpath
--     end end end

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
