vim.g.mapleader = ','

-- nnoremap <silent> K     :Lspsaga hover_doc<CR>
-- inoremap <silent> <C-k> :Lspsaga signature_help<CR>
-- nnoremap <silent> gn :Lspsaga diagnostic_jump_next<CR>
-- nnoremap <silent> gp :Lspsaga diagnostic_jump_prev<CR>
-- nnoremap <silent> gD :lua vim.lsp.buf.definition()<CR>
-- nnoremap <silent> gd :Lspsaga preview_definition<CR>

vim.api.nvim_set_keymap('n', 'ff', ':lua vim.lsp.buf.formatting()<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<leader>ev', ':e $MYVIMRC<CR>', {noremap=false, silent=true})
vim.api.nvim_set_keymap('n', '<leader>sv', ':so $MYVIMRC<CR>', {noremap=false, silent=true})

vim.api.nvim_set_keymap('n', '<leader>p', ':setlocal paste!<cr>', {noremap=false, silent=true})

vim.api.nvim_set_keymap('v', '<', '<gv', {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<home>', '^', {noremap=false, silent=true})
vim.api.nvim_set_keymap('i', '<home>', '<C-O>^', {noremap=true, silent=true})
