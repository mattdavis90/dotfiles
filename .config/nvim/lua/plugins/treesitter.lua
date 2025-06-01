return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = "main",
        build = ':TSUpdate',
        config = function()
            local ensureInstalled = {
                "c",
                "cpp",
                "css",
                "go",
                "html",
                "javascript",
                "json",
                "python",
                "rust",
                "svelte",
                "typescript",
            }

            local alreadyInstalled = require("nvim-treesitter.config").installed_parsers()
            local parsersToInstall = vim.iter(ensureInstalled)
                :filter(function(parser) return not vim.tbl_contains(alreadyInstalled, parser) end)
                :totable()
            require("nvim-treesitter").install(parsersToInstall)

            vim.api.nvim_create_autocmd('FileType', {
                pattern = ensureInstalled,
                callback = function() vim.treesitter.start() end,
            })

            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        opts = {
            indent = {
                char = "│",
            },
            scope = {
                enabled = false,
            },
        },
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        event = { "BufReadPost" },
    },
}
