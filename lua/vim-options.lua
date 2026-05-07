vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.cmd("set number")
vim.g.diagnostics_active = true
vim.opt.scrolloff = 10

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

local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end)

vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)

vim.keymap.set('n', '<leader>er', vim.diagnostic.open_float, { desc = '[E]xpand diagnostic message' })

vim.keymap.set('n', '<leader>mt', "<CMD>Markview<CR>", { desc = 'Toggle markdown view in buffer'})
vim.keymap.set('n', '<leader>mp', "<CMD>MarkdownPreview<CR>", { desc = 'Start browser markdown preview'})
vim.keymap.set('n', '<leader>ms', "<CMD>MarkdownPreviewStop<CR>", { desc = 'Stop browser markdown preview'})
