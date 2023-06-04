local codewindow = require('codewindow')
codewindow.setup({
    exclude_filetypes = {"NvimTree"},
    show_cursor = true,
})
vim.api.nvim_set_keymap('n', '<leader>m', ":lua require('codewindow').toggle_minimap()<CR>",
    { noremap = true, silent = true, desc = "Toggle minimap" })
