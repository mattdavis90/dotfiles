return {
    {
        'nvim-treesitter/nvim-treesitter',
        version = false,
        build = ':TSUpdate',
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                context_commentstring = {
                    enable = true
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                },
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            char = "│",
            filetype_exclude = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
            },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        lazy = true,
    },
    {
        "SmiteshP/nvim-navic",
        lazy = true,
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {
            lsp = {
                auto_attach = true,
            },
        },
    },
}
