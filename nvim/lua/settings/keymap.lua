vim.g.mapleader = ','

vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help,
    { noremap = true, silent = true, desc = "Get function signature" })
vim.keymap.set('n', 'gn', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Goto next instance" })
vim.keymap.set('n', 'gp', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Goto previous instance" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Goto definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Goto declaration" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true, desc = "Show references" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Goto implementation" })
vim.keymap.set('n', 'ff', vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format file" })

vim.keymap.set('n', '<leader>p', ':setlocal paste!<cr>', { noremap = false, silent = true, desc = "Toggle paste mode" })

vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true, desc = "Unindent block" })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true, desc = "Indent block" })

vim.keymap.set('n', '<home>', '^', { noremap = false, silent = true, desc = "Goto start of line" })
vim.keymap.set('i', '<home>', '<C-O>^', { noremap = true, silent = true, desc = "Goto start of line" })
