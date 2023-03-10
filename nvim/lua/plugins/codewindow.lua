local codewindow = require('codewindow')
codewindow.setup({
    show_cursor = false
})
vim.api.nvim_set_keymap('n', '<leader>m', ":lua require('codewindow').toggle_minimap()<CR>",
    { noremap = true, silent = true, desc = "Toggle minimap" })
