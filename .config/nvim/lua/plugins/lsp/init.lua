return {
    {
        'neovim/nvim-lspconfig',
        keys = {
            { '<leader>lh', vim.lsp.buf.hover,                                                desc = "Get hover info" },
            { '<leader>ln', function() vim.diagnostic.jump({ count = 1, float = true }) end,  desc = "Goto next instance" },
            { '<leader>lp', function() vim.diagnostic.jump({ count = -1, float = true }) end, desc = "Goto previous instance" },
            { '<leader>ld', vim.lsp.buf.definition,                                           desc = "Goto definition" },
            { '<leader>lD', vim.lsp.buf.declaration,                                          desc = "Goto declaration" },
            { '<leader>lr', vim.lsp.buf.references,                                           desc = "Show references" },
            { '<leader>lR', vim.lsp.buf.rename,                                               desc = "Rename variable" },
            { '<leader>li', vim.lsp.buf.implementation,                                       desc = "Goto implementation" },
            { '<leader>lf', vim.lsp.buf.format,                                               desc = "Format file" },
        },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
            require("plugins.lsp.servers")
        end
    },
    {
        'onsails/lspkind-nvim',
        lazy = true,
        config = function()
            require('lspkind').init({
                symbol_map = {
                    Text = '',
                    Method = 'ƒ',
                    Function = '',
                    Constructor = '',
                    Variable = '',
                    Class = '',
                    Interface = 'ﰮ',
                    Module = '',
                    Property = '',
                    Unit = '',
                    Value = '',
                    Enum = '了',
                    Keyword = '',
                    Snippet = '',
                    Color = '',
                    File = '',
                    Folder = '',
                    EnumMember = '',
                    Constant = '',
                    Struct = ''
                },
            })
        end
    },
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
        keys = {
            { "<leader>la", "<cmd>CodeActionMenu<cr>", desc = "Code actions" },
        },
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
    },
}
