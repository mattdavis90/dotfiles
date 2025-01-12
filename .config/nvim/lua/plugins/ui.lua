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
            vim.g.sonokai_diagnostic_virtual_text = 'color'
            vim.cmd.colorscheme('sonokai')
        end
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },

    {
        'f-person/git-blame.nvim',
        event = "BufEnter",
        opts = {
            enabled = true,
            date_format = "%r (%c)",
        },
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
                lualine_b = { 'branch' },
                lualine_c = {},
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                        symbols = {
                            hint = '󰌵 ',
                            info = ' ',
                            warning = ' ',
                            error = ' ',
                        },
                        separator = { left = '' },
                        padding = { right = 2 }
                    },
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
        'Bekaboo/dropbar.nvim',
    },

    {
        'goolord/alpha-nvim',
        event = "VimEnter",
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")
            local fortune = require("alpha.fortune")

            dashboard.section.buttons.val = {
                dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
                dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("p", "  Find project", ":Telescope project <CR>"),
                dashboard.button("r", "󰄉  Recently used files", ":Telescope oldfiles <CR>"),
                dashboard.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
                dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
                dashboard.button("q", "󰩈  Quit Neovim", ":qa<CR>"),
            }

            local function get_footer()
                local datetime = os.date "%d-%m-%Y %H:%M:%S"
                local plugins_text = "     v"
                    .. vim.version().major
                    .. "."
                    .. vim.version().minor
                    .. "."
                    .. vim.version().patch
                    .. "  󰄛 "
                    .. datetime
                local quote = table.concat(fortune(), "\n")

                return plugins_text .. "\n" .. quote
            end

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local pad_footer = string.rep(" ", 8)
                    local footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    footer = footer .. "\n" .. pad_footer .. get_footer()

                    dashboard.section.footer.val = footer
                end,
            })

            dashboard.section.footer.opts.hl = "Type"
            dashboard.section.header.opts.hl = "Include"
            dashboard.section.buttons.opts.hl = "Keyword"
            dashboard.opts.opts.noautocmd = true

            alpha.setup(dashboard.opts)
        end
    },
}
