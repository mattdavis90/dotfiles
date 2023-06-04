require("trouble").setup {}

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
