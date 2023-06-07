return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzy-native.nvim',
            'nvim-telescope/telescope-project.nvim',
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files (telescope)" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep (telescope)" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffer (telescope)" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags (telescope)" },
        },
        opts = {
            extensions = {
                fzy_native = {
                    override_generic_sorter = false,
                    override_file_sorter = true,
                }
            }
        },
        config = function()
            local telescope = require('telescope')
            telescope.load_extension('fzy_native')
            telescope.load_extension('project')
            telescope.load_extension("notify")
        end
    },
}
