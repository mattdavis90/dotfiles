require 'toggleterm'.setup {
    open_mapping = [[<leader>/]],
    direction = 'float',
}

-- Simulate LazyGit
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    shade_terminals = false,
    float_opts = {
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})
function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
