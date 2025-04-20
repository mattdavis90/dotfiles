return {
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
        keys = {
            { "<leader>la", "<cmd>CodeActionMenu<cr>", desc = "Code actions" },
        },
    },
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
            {
                'saghen/blink.cmp',
                dependencies = {
                    'rafamadriz/friendly-snippets',
                },
                version = 'v0.*',
                opts = {
                    keymap = {
                        preset = "default",
                        ['<Up>'] = { 'select_prev', 'fallback' },
                        ['<Down>'] = { 'select_next', 'fallback' },
                    },
                    appearance = {
                        use_nvim_cmp_as_default = true,
                        nerd_font_variant = 'normal',
                    },
                    completion = {
                        menu = {
                            draw = {
                                columns = {
                                    { "label",     "label_description", gap = 1 },
                                    { "kind_icon", "kind" },
                                },
                            },
                        },
                        documentation = { auto_show = true, auto_show_delay_ms = 500 },
                    },
                    sources = {
                        default = { 'lsp', 'path', 'snippets', 'buffer' },
                    },
                }
            },
        },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            --- @type { [string]: vim.lsp.Config }
            local servers = {
                eslint = {},
                gdscript = {},
                glsl_analyzer = {},
                gopls = {},
                helm_ls = {
                    settings = {
                        ['helm-ls'] = {
                            yamlls = {
                                enabled = true,
                                diagnosticsLimit = 50,
                                showDiagnosticsDirectly = false,
                                path = "yaml-language-server",
                                config = {
                                    schemas = {
                                        ["http://127.0.0.1:8000/all.json"] = "templates/**",
                                    },
                                    completion = true,
                                    hover = true,
                                }
                            },
                        },
                    },
                },
                html = {},
                jdtls = {},
                jsonls = {},
                lemminx = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = {
                                version = 'LuaJIT',
                            },
                            diagnostics = {
                                globals = { 'vim' },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },
                nil_ls = {},
                pyright = {},
                rust_analyzer = {},
                svelte = {},
                ts_ls = {
                    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
                },
                yamlls = {},
            }

            local mason_exclude = { "gdscript" }
            local ensure_installed = {}
            for server, settings in pairs(servers) do
                vim.lsp.config(server, settings)
                vim.lsp.enable(server)
                if mason_exclude[server] ~= nil then
                    table.insert(ensure_installed, server)
                end
            end

            require("mason").setup()
            require("mason-lspconfig").setup({
                automatic_installation = {
                    exlude = mason_exclude,
                },
                ensure_installed = ensure_installed,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- Diagnostics symbols for display in the sign column.
            vim.diagnostic.config({
                virtual_text = false,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.INFO] = "",
                        [vim.diagnostic.severity.HINT] = "󰌵",
                    },
                },
            })

            vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')
        end
    },
}
