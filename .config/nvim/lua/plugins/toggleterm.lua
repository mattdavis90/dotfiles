require 'toggleterm'.setup {
    open_mapping = [[<leader>/]],
    insert_mappings = false,
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
function LazygitToggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua LazygitToggle()<CR>", {noremap = true, silent = true})
