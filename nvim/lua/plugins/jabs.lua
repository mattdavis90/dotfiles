require('jabs').setup({})
vim.keymap.set('n', '<leader>b', require('jabs').open, { noremap = true, silent = true, desc = "Show JABS" })
