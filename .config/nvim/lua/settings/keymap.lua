vim.g.mapleader = ','

vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Get hover info" })
vim.keymap.set('n', '<leader>ln', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Goto next instance" })
vim.keymap.set('n', '<leader>lp', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Goto previous instance" })
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Goto definition" })
vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Goto declaration" })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, { noremap = true, silent = true, desc = "Show references" })
vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename variable" })
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Goto implementation" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format file" })
vim.keymap.set('n', '<leader>la', ":CodeActionMenu<cr>", { noremap = true, silent = true, desc = "Code Actions" })

vim.keymap.set('n', '<leader>p', ':setlocal paste!<cr>', { noremap = false, silent = true, desc = "Toggle paste mode" })

vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true, desc = "Unindent block" })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true, desc = "Indent block" })

vim.keymap.set('n', '<home>', '^', { noremap = false, silent = true, desc = "Goto start of line" })
vim.keymap.set('i', '<home>', '<C-O>^', { noremap = true, silent = true, desc = "Goto start of line" })
