return {

    {
        'nvim-tree/nvim-tree.lua',
        version = false,
        cmd = "NvimTreeToggle",
        keys = {
            { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle nvim-tree" }
        },
        config = function()
            require("nvim-tree").setup({
                disable_netrw       = true,
                hijack_netrw        = true,
                open_on_tab         = true,
                hijack_directories  = {
                    enable = true,
                    auto_open = true,
                },
                hijack_cursor       = false,
                update_cwd          = true,
                diagnostics         = {
                    enable = true,
                    icons = {
                        hint = '󰌵',
                        info = '',
                        warning = '',
                        error = '',
                    },
                },
                update_focused_file = {
                    enable     = true,
                    update_cwd = false,
                },
                actions             = {
                    open_file = {
                        resize_window = true,
                    },
                },
                view                = {
                    width = 30,
                    side = 'left',
                },
                renderer            = {
                    group_empty = true,
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                        glyphs = {
                            default = '',
                            symlink = '',
                            git = { unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
                            folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" }
                        },
                    },
                },
            })
            vim.api.nvim_create_autocmd("BufEnter", {
                group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
                callback = function()
                    local layout = vim.api.nvim_call_function("winlayout", {})
                    if layout[1] == "leaf" and
                        vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(layout[2]) }) == "NvimTree" and
                        layout[3] == nil then
                        vim.cmd("quit")
                    end
                end
            })
        end
    },

    -- Git
    {
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        opts = {}
    },

    -- Start where you left off
    {
        'ethanholz/nvim-lastplace',
        event = "BufEnter",
        opts = {},
    },

    -- Floating terminal and LazyGit
    {
        'akinsho/toggleterm.nvim',
        keys = {
            { "<leader>g", "<cmd>lua LazygitToggle()<CR>", desc = "Toggle LazyGit" },
            { "<leader>/", "<cmd>ToggleTerm<CR>",          desc = "ToggleTerm" },
        },
        config = function()
            require("toggleterm").setup(
                {
                    open_mapping = [[<leader>/]],
                    insert_mappings = false,
                    direction = 'float',
                    shade_terminals = false,
                    float_opts = {
                        winblend = 0,
                        highlights = {
                            border = "Normal",
                            background = "Normal",
                        },
                    },
                }
            )
            local Terminal = require('toggleterm.terminal').Terminal
            local lazygit  = Terminal:new({
                cmd = "lazygit",
                hidden = true,
            })
            function LazygitToggle()
                lazygit:toggle()
            end
        end
    },

    -- Peek at lines
    {
        'nacro90/numb.nvim',
        event = "CmdlineEnter",
        opts = {
            show_numbers = true,
            show_cursorline = true
        }
    },

    {
        'echasnovski/mini.comment',
        version = false,
        keys = {
            { "gc", desc = "Toggle comments" },
            { "gc", mode = "v",              desc = "Toggle comments" },
        },
        opts = {},
    },

    -- Change root directory to working directory (typically .git)
    {
        'airblade/vim-rooter',
        event = "VimEnter",
        init = function()
            vim.g.rooter_silent_chdir = 1
            vim.g.rooter_cd_cmd = 'lcd'
            vim.g.rooter_resolve_links = 1
            vim.g.rooter_patterns = { '.git', '.git/' }
        end
    },

    -- Toggle between absolute and relative numbering automatically
    {
        'jeffkreeftmeijer/vim-numbertoggle',
        event = "BufEnter",
    },

    -- Highlight Todo and similar comments
    {
        'folke/todo-comments.nvim',
        event = "BufEnter",
    },

    -- Highlight instances of the current word
    {
        'nyngwang/murmur.lua',
        event = "BufEnter",
        opts = {},
    },

    -- Display a hint for the keyboard shortcuts
    {
        'folke/which-key.nvim',
        lazy = "VeryLazy",
        opts = {
            plugins = {
                spelling = {
                    enabled = true,
                },
            },
        },
    },

    -- Display a scrollbar with position and errors
    {
        'petertriho/nvim-scrollbar',
        event = "BufEnter",
        opts = {
            handlers = {
                cursor = false,
                diagnostic = true,
                gitsigns = true,
                handle = true,
                search = false,
            },
            show_in_active_only = true
        }
    },

    -- Search plugin with N/M annotion - hooks into scrollbar
    {
        'kevinhwang91/nvim-hlslens',
        dependencies = {
            "nvim-scrollbar",
        },
        keys = {
            { 'n',  "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>" },
            { 'N',  "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>" },
            { '*',  "*<Cmd>lua require('hlslens').start()<CR>" },
            { '#',  "#<Cmd>lua require('hlslens').start()<CR>" },
            { 'g*', "g*<Cmd>lua require('hlslens').start()<CR>" },
            { 'g#', "g#<Cmd>lua require('hlslens').start()<CR>" },
        },
        opts = {},
    },

    -- Code minimap
    {
        'gorbit99/codewindow.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        keys = {
            { '<leader>m', "<cmd>lua require('codewindow').toggle_minimap()<cr>", desc = "Toggle minimap" },
        },
        opts = {
            exclude_filetypes = { "NvimTree" },
            use_lsp = true,
            use_treesitter = true,
            use_git = true,
            show_cursor = true,
        },
    },

    {
        'nyngwang/NeoZoom.lua',
        keys = {
            { '<leader>z', "<cmd>NeoZoomToggle<cr>", desc = "Toggle zoom" },
        },
        opts = {
            winopts = {
                offset = {
                    width = 0.95,
                    height = 0.95,
                },
                border = 'thicc',
            },
        }
    },

    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        event = "bufEnter",
        init = function()
            vim.keymap.set("", "<Leader>le", require("lsp_lines").toggle, { desc = "Toggle LSP Diagnostic Lines" })
        end
    },
}
