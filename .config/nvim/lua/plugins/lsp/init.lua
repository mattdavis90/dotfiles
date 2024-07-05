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
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = {
            auto_close = true,
            modes = {
                cascade = {
                    mode = "diagnostics",
                    filter = function(items)
                        local severity = vim.diagnostic.severity.HINT
                        for _, item in ipairs(items) do
                            severity = math.min(severity, item.severity)
                        end
                        return vim.tbl_filter(function(item)
                            return item.severity == severity
                        end, items)
                    end,
                },
            },
        },
        keys = {
            { "<leader>t", "<cmd>Trouble cascade toggle<cr>", desc = "Toggle Trouble Diagnostics" },
        },
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
    },
}
