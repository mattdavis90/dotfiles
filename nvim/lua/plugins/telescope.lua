local telescope = require('telescope')

telescope.setup{
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

telescope.load_extension('fzy_native')
telescope.load_extension('project')
telescope.load_extension('neoclip')
telescope.load_extension("notify")
telescope.load_extension('lsp_handlers')

vim.cmd [[nnoremap <leader>ff <cmd>Telescope find_files<cr>]]
vim.cmd [[nnoremap <leader>fg <cmd>Telescope live_grep<cr>]]
vim.cmd [[nnoremap <leader>fb <cmd>Telescope buffers<cr>]]
vim.cmd [[nnoremap <leader>fh <cmd>Telescope help_tags<cr>]]
vim.cmd [[nnoremap <leader>fy <cmd>Telescope neoclip<cr>]]
