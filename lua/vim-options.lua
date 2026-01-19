vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.cmd("set number")
vim.g.diagnostics_active = true
vim.opt.scrolloff = 20

-- Keymaps
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], {noremap = true, silent = true})
vim.keymap.set('n', '<leader>th', function()
  vim.cmd("split | terminal")
  vim.cmd("wincmd J")
end, { desc = "Open terminal at at the bottem as split"}
)
vim.keymap.set("n", "<leader>r", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative line numbers"})
