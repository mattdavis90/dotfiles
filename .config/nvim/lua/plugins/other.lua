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
                        hint = '',
                        info = '',
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
                    mappings = {
                        custom_only = false,
                        list = {}
                    }
                },
                renderer            = {
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

        end
    },

    -- Git
    {
        'lewis6991/gitsigns.nvim',
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            keymaps = {
                -- Default keymap options
                noremap = true,

                ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
                ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },

                ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
                ['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
                ['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
                ['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
                ['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
                ['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
                ['n <leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
                ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
                ['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
                ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

                -- Text objects
                ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
                ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
            },
        }
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
        },
        opts = {
            open_mapping = [[<leader>/]],
            insert_mappings = false,
            direction = 'float',
        },
        config = function()
            local Terminal = require('toggleterm.terminal').Terminal
            local lazygit  = Terminal:new({
                cmd = "lazygit",
                hidden = true,
                shade_terminals = false,
                float_opts = {
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
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
            { "gc", mode = "v", desc = "Toggle comments" },
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

    -- Create REST calls from HTTP files
    {
        'NTBBloodbath/rest.nvim',
        ft = "http",
    },

    -- Highlight instances of the current word
    {
        'RRethy/vim-illuminate',
        event = "BufEnter",
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
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
        end
    },

    -- Display a scrollbar with position and errors
    {
        'petertriho/nvim-scrollbar',
        dependencies = {
            "gitsigns.nvim",
        },
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
            { 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>" },
            { 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>" },
            { '*', "*<Cmd>lua require('hlslens').start()<CR>" },
            { '#', "#<Cmd>lua require('hlslens').start()<CR>" },
            { 'g*', "g*<Cmd>lua require('hlslens').start()<CR>" },
            { 'g#', "g#<Cmd>lua require('hlslens').start()<CR>" },
        },
        config = function()
            require("scrollbar.handlers.search").setup()
        end
    },

    -- Smart list of buffers
    {
        'matbme/JABS.nvim',
        version = false,
        keys = {
            { '<leader>b', "<cmd>lua require('jabs').open()<cr>", desc = "Show JABS" },
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

}
