require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- "all" or "maintained"
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    context_commentstring = {
        enable = true
    }
}
