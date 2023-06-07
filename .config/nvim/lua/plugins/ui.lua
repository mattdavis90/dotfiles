return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "folke/which-key.nvim",
            "rcarriga/nvim-notify",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
            },
        },
    },
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme sonokai]]
        end
    },
    {
        'kyazdani42/nvim-web-devicons',
        lazy = true,
    },
    {
        'ryanoasis/vim-devicons',
        lazy = true,
    },
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = {
            "SmiteshP/nvim-navic",
        },
        opts = {
            options = {
                component_separators = '•',
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
                globalstatus = true,
                icons_enabled = true,
                section_separators = { left = '', right = '' },
                theme = 'sonokai',
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { right = '' } },
                },
                lualine_b = { 'branch', 'filename' },
                lualine_c = {
                    {
                        function()
                            return require("nvim-navic").get_location()
                        end,
                        cond = function()
                            return require("nvim-navic").is_available()
                        end
                    },
                },
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                        separator = { left = '' },
                        padding = { right = 2 }
                    },
                    'filetype',
                },
                lualine_y = { 'progress' },
                lualine_z = {
                    { 'location', separator = { left = '' } },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { 'nvim-tree', 'fzf', 'quickfix', 'toggleterm', "lazy" },
        },
    },
    {
        'goolord/alpha-nvim',
        event = "VimEnter",
    },
}
