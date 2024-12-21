return {
    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.*',
        opts = {
            keymap = {
                preset = "default",
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'normal',
            },
        }
    },
    {
        'andymass/vim-matchup',
        event = "InsertEnter",
        init = function()
            vim.g.matchup_matchparen_offscreen = { method = 'popup' }
        end
    },
}
