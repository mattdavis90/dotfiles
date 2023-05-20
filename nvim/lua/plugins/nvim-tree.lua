vim.g.nvim_tree_auto_ignore_ft = 'startify'

require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_tab         = true,
    hijack_directories   = {
        enable = true,
        auto_open = true,
    },
    hijack_cursor       = false,
    update_cwd = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd  = false,
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
    view = {
        width = 30,
        side = 'left',
        mappings = {
            custom_only = false,
            list = {}
        }
    },
    renderer = {
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
}

vim.cmd [[nnoremap <C-n> :NvimTreeToggle<CR>]]

vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})
