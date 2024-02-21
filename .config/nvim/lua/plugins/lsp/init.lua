return {
    {
        'neovim/nvim-lspconfig',
        keys = {
            { '<leader>lh', vim.lsp.buf.hover, desc = "Get hover info" },
            { '<leader>ln', vim.diagnostic.goto_prev, desc = "Goto next instance" },
            { '<leader>lp', vim.diagnostic.goto_next, desc = "Goto previous instance" },
            { '<leader>ld', vim.lsp.buf.definition, desc = "Goto definition" },
            { '<leader>lD', vim.lsp.buf.declaration, desc = "Goto declaration" },
            { '<leader>lr', vim.lsp.buf.references, desc = "Show references" },
            { '<leader>lR', vim.lsp.buf.rename, desc = "Rename variable" },
            { '<leader>li', vim.lsp.buf.implementation, desc = "Goto implementation" },
            { '<leader>lf', vim.lsp.buf.format, desc = "Format file" },
        },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
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
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
        keys = {
            { "<leader>t", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
        },
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
    }
}
