vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_auto_ignore_ft = 'startify'
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = { unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
    folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" }
}

require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = true,
    open_on_tab         = true,
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    nvim_tree_follow = 1,
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
    view = {
        width = 30,
        side = 'left',
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {}
        }
    }
}

vim.cmd [[nnoremap <C-n> :NvimTreeToggle<CR>]]
