require('telescope').setup{
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}


-- Optional Extensions
-- require('telescope').load_extension('octo')
require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('project')
require('telescope').load_extension('neoclip')
require("telescope").load_extension("notify")
-- require("telescope").load_extension("harpoon")


vim.cmd [[nnoremap <leader>ff <cmd>Telescope find_files<cr>]]
vim.cmd [[nnoremap <leader>fg <cmd>Telescope live_grep<cr>]]
vim.cmd [[nnoremap <leader>fb <cmd>Telescope buffers<cr>]]
vim.cmd [[nnoremap <leader>fh <cmd>Telescope help_tags<cr>]]

vim.cmd [[nnoremap <leader>fy <cmd>Telescope neoclip<cr>]]
